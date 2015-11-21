class Entity
  # node_label == template name
  # template id
  # properties
  # relationships
  # dirty tracking?
  attr_reader :id, :label

  class << self
    def all
      all_nodes = neo.execute_query('match (n) return n;')
      all_nodes['data'].map do |node|
        Entity.new(
          id: node.first['metadata']['id'],
          label: node.first['metadata']['labels'].first,
          properties: node.first['data']
        )
      end
    end

    def find(id)
      neo.get_node(id)
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
            prefix: {
              _all: term
            }
          }
        }
      )
      response['hits']['hits'].map do |hit|
        Entity.new(id: hit['_id'], properties: hit['_source']['properties'], label: hit['_type'])
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
        Entity.new(id: hit['_id'], properties: hit['_source']['properties'], label: hit['_type'])
      end
    end

    def neo
      @neo ||= Neography::Rest.new
    end

    def elasticsearch
      @elasticsearch ||= Elasticsearch::Client.new log: true
    end
  end


  def initialize(id:, label:, properties:)
    @id = id
    @label = label
    @properties = properties
  end

  def save
    new_node = neo.create_node(self.properties)
    self.label.each do |node_label|
      neo.add_label(new_node, node_label)
    end
    @id = new_node["metadata"]["id"]
    @label.each do |label|
      elasticsearch.index index: 'entities', type: label, id: @id, body: {properties: @properties }
    end
    true
  end

  def to_hash
    {
      entity_id: self.id,
      node_label: self.label,
      node_properties: self.properties_as_frontend
    }
  end

  def properties
    @properties
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
