[
  {
    type: "Location",
    label: "Country",
    node_instances: [
      {
        label: "Country"
      }
    ],
    graph_instances: [],
    relationships: []
  },
  {
    type: "Location",
    label: "State",
    node_instances: [
      {
        label: "State"
      }
    ],
    graph_instances: [
      {
        label: "Country"
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
        type: "is a state in"
      }
    ]
  },
  {
    type: "Location",
    label: "City",
    node_instances: [
      {
        label: "City"
      }
    ],
    graph_instances: [
      {
        label: "State"
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
        type: "is a city in"
      }
    ]
  },
  {
    type: "Location",
    label: "Building",
    node_instances: [
      {
        label: "Building"
      }
    ],
    graph_instances: [
      {
        label: "City"
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
        type: "is a building in"
      }
    ]
  },
  {
    type: "Location",
    label: "Room",
    node_instances: [
      {
        label: "Room"
      }
    ],
    graph_instances: [
      {
        label: "Building"
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
        type: "is a room in"
      }
    ]
  }
].each do |graph|
  new_graph = GraphModel.create(graph)
end
