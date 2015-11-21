class EntityForm
  def initialize(entity_params)
    @id = nil
    @label = entity_params[:node_label]
    @properties = initialize_properties(entity_params[:node_properties]).merge(template_id: entity_params["_id"]["$oid"])
  end

  def data
    {
      id: @id,
      label: @label,
      properties: @properties,
    }
  end

  private

  def initialize_properties(properties_hash)
    properties_hash.each_with_object({}) do |node_property, obj|
      obj[node_property[:name]] = node_property[:value]
    end
  end
end
