class NodeModel
  include Mongoid::Document

  field :label, type: String
  field :related_graphs, type: Array, default: []

  embeds_many :node_properties
end
