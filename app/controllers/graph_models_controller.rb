class GraphModelsController < ApplicationController

  def templates_by_label
    graphs = GraphModel.where(label: /#{params[:label]}/i).to_a
    graphs = graphs.map do |graph|
      graph[:label]
    end
    respond_to do |format|
      format.json { render json: graphs }
    end
  end

  def templates_by_type
    graphs = GraphModel.where(type: params[:type]).to_a
    graphs = graphs.map do |graph|
      graph[:label]
    end
    respond_to do |format|
      format.json { render json: graphs }
    end
  end

  def template
    graph = GraphModel.find_by(label: params[:label])
    graph.node_instances = graph.node_instances.map do |node_instance|
      NodeModel.find_by(label: node_instance[:label])
    end

    graph.graph_instances.each do |graph_instance|
      graph_instance[:id] = nil
    end

    respond_to do |format|
      format.json { render json: graph }
    end
  end

  def node_finder obj, graph
    if obj[:node]
      return graph[:node_instances][obj[:node]]
    else
      graphInstanceIndex = obj[:graph][:index]
      graphInstance =
      graph = GraphModel.find(graphInstance[:id])
    end
  end

end
