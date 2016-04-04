GraphModel.delete_all
[
  {
    # type: "Entity",
    label: "Company",
    node_instances: [
      {
        label: "Company"
      }
    ],
    graph_instances: [
      {
        type: "Location"
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
        type: "is located in"
      }
    ]
  },
  {
    # type: "Entity",
    label: "Equipment Type",
    node_instances: [
      {
        label: "Equipment Type"
      }
    ],
    graph_instances: [],
    relationships: []
  },
  {
    # type: "Entity",
    label: "Equipment Part",
    node_instances: [
      {
        label: "Part"
      }
    ],
    graph_instances: [
      {
        label: "Company"
      },
      {
        label: "Equipment Type"
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
        type: "is a kind of"
      }
    ]
  },
  {
    label: "Sample",
    node_instances: [
      {
        label: "Sample",
        default_new: true
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
    # type: "pH Probe",
    label: "pH Probe",
    node_instances: [
      {
        label: "pH Probe"
      }
    ],
    graph_instances: [
      {
        label: "Equipment Part"
      },
      {
        type: "Location"
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
        type: "located in"
      }
    ]
  },
  {
    type: "Measurement",
    label: "pH Measurement",
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
  # graph[:graph_instances].each do |graph_instance|
  #   related = GraphModel.find_by(label: graph_instance[:label])
  #   related.related_graphs << graph[:label]
  # end
end
