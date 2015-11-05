// Transformation Template (a.k.a. recipe?)
{
  inputs: [
    {
      sample_node_id: , //to-be-chosen: actual sample id
      decendent_of: //defined-in-template: entity node id - e.g. any sample under NaCl Salt
      required_measurements: [
        //defined-in-template: list of sample property types/sample property templates
        "mass"
      ]
    },
  ],
  outputs: [
    {
      sample_node_id:
      decendent_of:
    }
  ]
}

// Scenarios for choosing input samples:
// 1. Exact sample used in transformation exists
// 2. User needs to sample existing sample
// 3. RARE: New sample needs to be registered (and even sampled?) e.g. vendor salt just arrived and is not registered

//Sample

{
  node_properties:
  [description: ,]
  related_nodes:
  // measurements: [
    //list of sample property nodes
  // ],
  [
    { 
      template_id: //measurement
      node_label: "Measurement",
      relationship: 'has_measurement',
      required: false,
      entity_id:
      match: 'decendent',
      count: -1
    },
    {
      template_id: 1,
      match/scope/entity_scope: 'exact', 'decendent', 'child', 'leaf',
      // child would have to search through all templates and return any template where child of: parent
      // or everytime you create a template and define its related node child of, the parent is updated with that child in an array
      node_label: "Container",
      relationship: "contained_in",
      required: true,
      entity_id: nil,
      count_limit: 1 // -1 is infinite
    }
    {
      template_id: x,
      node_label: "Sampleable",
      match: 'exact',
      // or you look for the leaves of entity master node?
    }
  ]
  container: ,
  parent_node_id: //search through all entity nodes
}

//Sample Properties
pH: {
  value: 5.0,
  instrument_node_id: //pH probe or pH paper?
}
volume: {
  value:
  instrument_node_id: //could be container!
}
mass: {
  value: 
  instrument_node_id: //scale
}
weight: {

}
concentration: {

}
absorbance
etc.