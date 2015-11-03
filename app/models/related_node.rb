class RelatedNode
  include Mongoid::Document

  field :template_id, type: String
  field :relationship, type: String
  field :required, type: Boolean
  field :entity_id, type: Integer
  field :count_limit, type: Integer, default: 1

  embedded_in :template
end
