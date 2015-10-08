class RelatedNode
  include Mongoid::Document

  field :relationship, type: String
  field :required, type: Boolean
  field :entity_id, type: Integer

  has_one :template
end
