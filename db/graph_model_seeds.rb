GraphModel.delete_all
[
  {
    label: "Company",
    node_instances: [
      {
        label: "Company"
      },
      {
        label: "City"
      }
    ],
    graph_instances: [],
    relationships: [
      {
        start: {
          node: 0
        },
        end: {
          node: 1
        },
        type: "is located in"
      }
    ]
  },
  {
    label: "Part",
    node_instances: [
      {
        label: "Part"
      }
    ],
    graph_instances: [
      {
        label: "Company"
      }
    ],
    relationships: [
      {
        start: {
          node: 0
        },
        end: {
          graph: {
            index: 0,
            node: 0
          }
        },
        type: "is manufactured by"
      }
    ]
  },
  {
    label: "Sample",
    node_instances: [
      {
        label: "Sample"
      }
    ],
    graph_instances: [
      {
        type: "Lot",
        optional: true
      },
      {
        type: "Container",
        optional: true
      }
    ],
    relationships: [
      {
        start: {
          node: 0
        },
        end: {
          graph: {
            index: 0,
            node: 0
          }
        },
        type: "is a sample of"
      },
      {
        start: {
          node: 0
        },
        end: {
          graph: {
            index: 1,
            node: 0
          }
        },
        type: "is contained in"
      }
    ]
  },
  {
    label: "pH Probe",
    node_instances: [
      {
        label: "pH Probe"
      }
    ],
    graph_instances: [
      {
        label: "Part"
      }
    ],
    relationships: [
      {
        start: {
          node: 0
        },
        end: {
          graph: {
            index: 0,
            node: 0
          }
        },
        type: "child of"
      }
    ]
  },
  {
    label: "pH Measurement",
    type: "Measurement",
    node_instances: [
      {
        label: "pH Measurement"
      }
    ],
    graph_instances: [
      {
        label: "Sample"
      },
      {
        label: "pH Probe"
      }
    ],
    relationships: [
      {
        start: {
          node: 0
        },
        end: {
          graph: {
            index: 1,
            node: 0
          }
        },
        type: "was measured with"
      },
      {
        start: {
          graph: {
            index: 0,
            node: 0
          }
        },
        end: {
          node: 0
        },
        type: "has pH measurement"
      }
    ]
  }
].each do |graph|
  new_graph = GraphModel.create(graph)
  graph[:graph_instances].each do |graph_instance|
    related = GraphModel.find_by(label: graph_instance[:label])
    related.related_graphs << graph[:label]
  end
  # graph[:relationships].each do |relationship|
  #   if relationship[:start][:node] && relationship[:end][:graph]
  #     # this doesnt account for multiple instances of the same node
  #     start_node = NodeModel.find_by(label: new_graph[:node_instances][relationship[:start][:node]][:label])
  #     start_node.related_graphs << new_graph[:graph_instances][relationship[:end][:graph][:index]][:label]
  #     start_node.save
  #
  #   elsif relationship[:start][:graph] && relationship[:end][:node]
  #     end_node = NodeModel.find_by(label: new_graph[:node_instances][relationship[:end][:node]][:label])
  #     end_node.related_graphs << new_graph[:graph_instances][relationship[:start][:graph][:index]][:label]
  #     end_node.save
  #   end
  # end
end
