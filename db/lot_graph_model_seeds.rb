[
  {
    label: "Generic Part Lot",
    type: "Lot",
    node_instances: [
      {
        label: "Lot"
      }
    ],
    graph_instances: [
      {
        label: "Part" #type?
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
        type: "is lot of"
      }
    ]
  },
  {
    label: "Antibody Lot",
    type: "Lot",
    node_instances: [
      {
        label: "Lot"
      },
      {
        label: "Antibody"
      }
    ],
    graph_instances: [],
    relationships: []
  },
  {
    label: "Life Sciences 5M NaCl Lot",
    type: "Lot",
    node_instances: [
      {
        label: "Lot"
      }
    ],
    graph_instances: [
      {
        label: "Part",
        graphId: 300
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
        type: "is lot of"
      }
    ]
  }
].each do |graph|
  new_graph = GraphModel.create(graph)
end
