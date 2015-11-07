class RelatedNode
  include Mongoid::Document

  field :template_id, type: String
  field :relationship, type: String
  field :required, type: Boolean
  field :entity_id, type: Integer
  field :count_limit, type: Integer, default: 1
  field :match_type, type: String
  field :direction, type: String, default: 'out'

  embedded_in :template
end
