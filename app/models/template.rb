class Template
  include Mongoid::Document
  field :node_label, type: String

  embeds_many :node_properties
  embeds_many :related_nodes

end
