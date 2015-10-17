class EntitiesController < ApplicationController
  def create
    @neo = Neography::Rest.new
    node_properties = params[:node_properties].each_with_object({}) do |node_property, obj|
      obj[node_property[:name]] = node_property[:value]
    end
    new_node =  @neo.create_node(node_properties)
    @neo.add_label(new_node, params[:node_label])
    respond_to do |format|
      format.json do
        render json: {success: true}
      end
    end
  end
end
