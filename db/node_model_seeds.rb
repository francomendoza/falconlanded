NodeModel.delete_all
[
  {
    label: "Sample",
    properties: [
      {
        name: "Barcode",
        type: "text",
        value: nil
      },
      {
        name: "Alias",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "pH Measurement",
    properties: [
      {
        name: "Value",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "pH Probe",
    properties: [
      {
        name: "Alias",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "Part",
    properties: [
      {
        name: "Alias",
        type: "text",
        value: nil
      },
      {
        name: "Part Number",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "Company",
    properties: [
      {
        name: "Name",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "City",
    properties: [
      {
        name: "Name",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "Lot",
    properties: [
      {
        name: "Number",
        type: "text",
        value: nil
      }
    ]
  },
  {
    label: "Antibody",
    properties: [
      {
        name: "Name",
        type: "text",
        value: nil
      }
    ]
  }
].each do |node|
  new_node = NodeModel.create(label: node[:label])
  node[:properties].each do |property|
    new_node.node_properties.create(property)
  end
end
