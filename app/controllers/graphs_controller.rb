class GraphsController < ApplicationController

  def search
    params[:label] = "Antibody Lot"
    results = Graph.search_by_label(params[:label], params[:term])

    respond_to do |format|
      format.json { render json: results }
    end
  end

  def create
    # binding.pry
    if !params[:graph_instances]
      params[:graph_instances] = []
    end

    if !params[:relationships]
      params[:relationships] = []
    end
    # iterate through nodes and create each in Neo and Elastic
    params[:node_instances] = params[:node_instances].map do |node_instance|
      entity_form = EntityForm.new(node_instance)
      new_entity = Entity.create(entity_form.data).to_hash
      # add neo id to the node_instance maybe elasticsearch id?
      # node_instance[:id] = new_entity.id # may not be necessary if mapping the newly created objects
    end

    # now all node instances, and graph instances have IDs associated, so save this new graph to
    params[:graph_instances] = params[:graph_instances].map do |graph_instance|
      Graph.find(graph_instance[:id])[:node_instances]
    end

    Graph.create(params)

    params[:relationships].each do |relationship|
      if relationship[:start][:node]
        start_id = params[:node_instances][relationship[:start][:node]][:id]
      else
        graph = GraphModel.find(params[:graph_instances][relationship[:start][:graph][:index]][:id])
        graph.node_instances[params[:graph_instances][relationship[:start][:graph][:node]]]
      end
    end
    # iterate through each relationship and create it
  end

end
