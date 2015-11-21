// Transformation Template (a.k.a. recipe?)
{
  targets: [
    {linear_velocity: {target: '20', units: 'cm/hr'}}
  ],
  calculated_properties: [
    flowrate: {calculation: 'linear_velocity*pi*column.diameter/2'}
  ]
}
{
  targets: [
    //starts out as nil, but user fills in...
    {amount: {value: 1, unit: 'L'}},
  ],
  inputs: [
    {
      sample_node_id: , //to-be-chosen: actual sample id
      decendent_of: 'H2O'//defined-in-template: entity node id - e.g. any sample under NaCl Salt
      relationship_requirements: [
        {
          node_label: 'Measurement',
          name: 'mass'
          property: 'amount',
          target:  0.990,
          tolerance: 0.01,
          unit: 'L',
          target_unit: 'L'
        }
        //defined-in-template: list of sample property types/sample property templates
        {mass: {min: 0.990, max: 0.995, unit: 'L', target_unit: 'L'}}
      ]
    },
    {
      sample_node_id: , //to-be-chosen: actual sample id
      decendent_of: 'NaCl'//defined-in-template: entity node id - e.g. any sample under NaCl Salt
      required_measurements: [
        //defined-in-template: list of sample property types/sample property templates
        {mass: {min: 116, max: 116.1, unit: 'g', target_unit: 'L', calculation: 'this_amount*target_amount'}}
      ]
    },
  ],
  outputs: [
    {
      sample_node_id:
      decendent_of:
      required_measurements: [
        {amount: }
      ]
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


{
  node_label: "Equilibration"
  related_nodes: [
    {
      template_label: "Transformation" //or child_of AEX? probably not because this can be used widely, PERHAPS childof chromatography step trans...
      relationship: "child_of"
    }
  ]
}

{
  node_label: "AEX",
  related_nodes: [
    {
      template_label
    }
  ]
}

