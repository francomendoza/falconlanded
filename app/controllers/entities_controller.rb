class EntitiesController < ApplicationController
  def create
    @neo = Neography::Rest.new
    node_properties = params[:node_properties].each_with_object({}) do |node_property, obj|
      obj[node_property[:name]] = node_property[:value]
    end
    new_node =  @neo.create_node(node_properties)
    puts new_node
    @neo.add_label(new_node, params[:node_label])
    respond_to do |format|
      format.json do
        render json: {
          entity_id: new_node["metadata"]["id"],
          node_label: params[:node_label],
          node_properties: params[:node_properties],
          node_properties: params[:node_properties]
        }
      end
    end
  end
end
