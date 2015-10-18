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

  def entities_by_template_id
    node_label = Template.find(params[:template_id]).node_label
    @neo = Neography::Rest.new
    query = @neo.execute_query("match (n:#{node_label}) return n")
    response = query["data"].map do |node|
      node[0]["metadata"].merge(node[0]["data"])
    end 
    respond_to do |format|
      format.json { render json: response }
    end
  end
end
