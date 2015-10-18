require 'active_support'
class Entity
  # node_label == template name
  # template id
  # properties
  # relationships
  # dirty tracking?
  
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

    def after_save(one, two)

    end

    def after_destroy(one, two)

    end

    def neo
      @neo ||= Neography::Rest.new
    end
  end

  include ActiveModel::Model
  include Searchkick::Model
  extend Searchkick::Model
  searchkick

  attr_reader :id, :label

  def initialize(id:, label:, properties:)
    @id = id
    @label = label
    @properties = properties
  end

  def save
    new_node = neo.create_node(self.properties)
    neo.add_label(new_node, self.label)
    @id = new_node["metadata"]["id"]
    true
  end

  def properties
    @properties
  end


  private

  def neo
    @neo ||= Neography::Rest.new
  end

  def initialize_properties(properties_hash)
    @properties = properties_hash.each_with_object({}) do |node_property, obj|
      obj[node_property[:name]] = node_property[:value]
    end
  end
end
