class NodeProperty
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :value, type: String

  embedded_in :template
end
