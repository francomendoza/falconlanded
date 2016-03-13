class GraphModel
  include Mongoid::Document

  field :label, type: String
  field :node_instances, type: Array, default: []
  field :graph_instances, type: Array, default: []
  field :relationships, type: Array, default: []
  
end
