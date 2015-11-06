class Template
  include Mongoid::Document
  field :node_label, type: Array
  field :children_templates, type: Array, default: []

  embeds_many :node_properties
  embeds_many :related_nodes

end
