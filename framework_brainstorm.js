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
  description: ,
  measurements: [
    //list of sample property nodes
  ],
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