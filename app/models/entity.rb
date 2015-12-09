class Entity
  # node_label == template name
  # template id
  # properties
  # relationships
  # dirty tracking?
  attr_reader :id, :labels, :properties

  class << self
    def all
      all_nodes = neo.execute_query('match (n) return n;')
      all_nodes['data'].map do |node|
        Entity.new(
          id: node.first['metadata']['id'],
          labels: node.first['metadata']['labels'],
          properties: node.first['data']
        )
      end
    end

    def find(id)
      neo.get_node(id)
    end

    def find_node(label, properties)
      all_nodes = neo.execute_query("match (n:#{label} {#{properties.keys.first}: '#{properties.values.first}'}) return n;")
      all_nodes['data'].map do |node|
        Entity.new(
          id: node.first['metadata']['id'],
          labels: node.first['metadata']['labels'],
          properties: node.first['data']
        )
      end.first
    end

    def create(template_instance_hash)
      new_entity = Entity.new(template_instance_hash)
      if new_entity.save
        new_entity
      end
    end

    def search(term)
      response = elasticsearch.search(
        index: 'entities',
        body: {
          query: {
            "match_phrase_prefix": {
              "_all": term.downcase
            }
          }
        }
      )
      if response['hits']['total'] == 0
        new_response = elasticsearch.search(
          index: 'entities',
          body: {
            query: {
              "multi_match": {
                "fields":  "_all",
                "query": term.downcase,
                "fuzziness": "AUTO"
              }
            }
          }
        )
        new_response['hits']['hits'].map do |hit|
          Entity.new(id: hit['_id'], properties: hit['_source']['properties'], labels: hit['_type'])
        end
      else
        response['hits']['hits'].map do |hit|
          Entity.new(id: hit['_id'], properties: hit['_source']['properties'], labels: hit['_type'])
        end
      end
    end

    def search_by_label(types, term)
      or_types = types.map do |type|
        {type: {value: type}}
      end
      response = elasticsearch.search(
        index: 'entities',
        body: {
          query: {
            prefix: {
              _all: term
            }
          },
          filter: {
            or: or_types
          }
        }
      )
      response['hits']['hits'].map do |hit|
        Entity.new(id: hit['_id'], properties: hit['_source']['properties'], labels: hit['_type'])
      end
    end

    def delete_all
      neo.execute_query 'match (n)-[r]-(m) delete r,n,m;'
      neo.execute_query 'match (n) delete n;'
    end

    def neo
      @neo ||= Neography::Rest.new
    end

    def elasticsearch
      @elasticsearch ||= Elasticsearch::Client.new log: true
    end
  end


  def initialize(options = {})
    o = options.with_indifferent_access
    @id = o[:id]
    @labels = o[:labels]
    @properties = o[:properties]
  end

  def save
    new_node = neo.create_node(self.properties)
    self.labels.each do |node_label|
      neo.add_label(new_node, node_label)
    end
    @id = new_node["metadata"]["id"]
    @labels.each do |label|
      elasticsearch.index index: 'entities', type: label, id: @id, body: {properties: @properties, label: label }
    end
    true
  end

  def to_hash
    {
      entity_id: self.id,
      node_label: self.labels,
      node_properties: self.properties_as_frontend
    }
  end


  def properties_as_frontend
    @properties.each.with_object([]) do |(key, value), obj|
      obj << {name: key.to_s, value: value, type: 'text'}
    end
  end

  def create_rel(entity_id, relationship, direction)
    if direction == 'in'
      neo.create_relationship(relationship, Entity.find(entity_id), Entity.find(self.id))
    elsif direction == 'out'
      neo.create_relationship(relationship, Entity.find(self.id), Entity.find(entity_id))
    else
      throw "You're an idiot - directions can only be in or out"
    end
  end

  private

  def neo
    @neo ||= Neography::Rest.new
  end

  def elasticsearch
    @elasticsearch ||= Elasticsearch::Client.new log: true
  end

  def initialize_properties(properties_hash)
    @properties = properties_hash.each_with_object({}) do |node_property, obj|
      obj[node_property[:name]] = node_property[:value]
    end
  end
end
