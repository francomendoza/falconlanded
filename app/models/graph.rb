class Graph

  attr_accessor :elastic_id, :label, :node_instances, :graph_instances, :relationships

  class << self

    def create graph
      new_graph = Graph.new(graph)
      if new_graph.save
        new_graph
      end
    end

    def find id
      response = elasticsearch.get_source(
        index: 'graphs',
        id: id
      )
      if response
        # source only returns source data but not ID so add it
        response["elastic_id"] = id
        Graph.new(response)
      else
        false
      end
    end

    def elasticsearch
      @elasticsearch ||= Elasticsearch::Client.new log: true
    end

  end

  def initialize obj
    obj = obj.with_indifferent_access
    @elastic_id = obj[:elastic_id]
    @label = obj[:label]
    @node_instances = obj[:node_instances]
    # for now lets just shove all these nodes into a single array
    obj[:graph_instances].each do |arrayOfNodes|
      @node_instances.concat(arrayOfNodes)
    end
    # @graph_instances = obj[:graph_instances]
    @graph_instances = []
    @relationships = obj[:relationships]
  end

  def save
    # write it to elastic search
    response = elasticsearch.index index: 'graphs', type: @label, id: @elastic_id, body: { label: @label, node_instances: @node_instances, graph_instances: @graph_instances, relationships: @relationships }
    # add created ID to object
    @elastic_id = response["_id"]

    true
  end

  def to_hash
    {
      elastic_id: self.elastic_id,
      label: self.label,
      node_instances: self.node_instances,
      graph_instances: self.graph_instances,
      relationships: self.relationships
    }
  end

  private

  def elasticsearch
    @elasticsearch ||= Elasticsearch::Client.new log: true
  end

end
