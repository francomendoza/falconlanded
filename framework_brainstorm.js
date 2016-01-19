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
},
{
  node_label: "Chrom Step Transformer",
  node_properties: [
    {
        name: "name",
        type: "text",
        value: null,
        readonly: false
    },
    {
        name: "linear velocity",
        type: "text",
        value: null,
        readonly: false
    }
  ],
  related_nodes: [
    {
      node_label: "Sample",
      relationship: "has_output",
      required: true,
      entity_id: nil,
      count_limit: -1,
      match_type: "exact"
    }
  ]
},



{
  node_label: "AEX Transformer",
  node_properties: [
    {
        name: "linear velocity",
        type: "text",
        value: null,
        readonly: false
    }
  ],
  related_nodes: [
    {
      template_label: "Chrom Step Transformer",
      relationship: "sub_transformer_of",
      required: true,
      entity_id: null,
      count_limit: -1,
      match_type: "exact",
      instructions: [
        {
          type: "node_properties",
          index: 0, //name property
          replace_with: {
            value: "PreEquilibration",
            readonly: true
          }
        },
        {
          type: "node_properties",
          index: 1, //linear flowrate property
          replace_with: {
            value: parent.node_properties[0].value // preferably some variable we bind
          }
        },
        {
          type: "related_nodes",
          index: 0,
          replace_with: {
            instructions: [
              {

              }
            ]
          }
        }
      ]
    },
    {
      template_label: "Chrom Step Transformer", //Equilibration
      relationship: "sub_transformer_of",
      required: true,
      entity_id: null,
      count_limit: -1,
      match_type: "exact",
      instructions: [
        {
          type: "node_properties",
          index: 0, //name property
          replace_with: {
            value: "Equilibration",
            readonly: true
          }
        },
        {
          type: "node_properties",
          index: 1, //linear flowrate property
          replace_with: {
            value: "200cm/hr" // preferably some variable we bind
          }
        },
        {
          type: "related_nodes",
          binding: true,
          index: 0, // sample input from
          bind_to: parent.related_nodes,
          key: 'entity_id'
          //replace_with: {
            
            //entity_id: parent.related_nodes[0].related_nodes[3].entity_id, // AEX's 1st related node (AKA PreEq) 1st related node (AKA Sample Out Resin)
            // or
            {
              databind: {
                type: "related_nodes",
                index: 0,

              }
            }
            //
          }
        }
      ]
    }
  ]
}

// NodeModelDecorator
{
  name: 'lot',
  node_properties: [
    "lot_number"
  ]
}


// NodeModel
{
  node_model_id: 1235,
  node_label: "vendored salt",
  node_properties: [
    {
      "name"
    }
  ]
},
{
  node_model_id: 1234,
  node_label: "vendored salt lot",
  node_properties: [
    {
      "lot number"
    }
  ] 
}


// Tyler the Creator // Workflow // CreationTemplate
{
  to_create_node: 1234,
  node_types: [ // what nodes are used and they should be created
    {
      node_model_id: 1234 //vendored salt lot
    },
    {
      node_model_id: 1235 //vendored salt
    }
  ],
  relationships: [
    {
      1234
      1235
      direction: forward
      relationship: "is lot of"
    }
  ],
  sections: [ // define workflow and what UI looks like
    {
      inputs: [
        {
          type: search,
          1235,
          creatable: true
        },
        {
          type: text,
          node: 1234
          node_property: 'lot number'
        }
      ]
    }
  ]
}

{
  node_model_id: 1,
  node_label: "1M NaCl Transformer",
  node_properties: [
    {
      name: "desired amount",
      type: "number_with_unit"
    }
  ]
},
{
  node_model_id: 2,
  node_label: "Sample",
  node_properties: [
    {
      name: "desired amount",
      type: "number_with_unit"
    }
  ]
},
{
  node_model_id: 3,
  node_label: 'RODI Tap',
  node_properties: [
    {
      name: 'name',
      type: 'text'
    }
  ]
},
{
  node_model_id: 4,
  node_label: 'Lot',
  node_properties: [
    {
      name: 'lot_number',
      type: 'text'
    }
  ]
},
{
  node_model_id: 5,
  node_label: 'Vendored 5M NaCl',
  node_properties: [
  ]
},
{
  node_model_id: 6,
  node_label: '1M NaCl',
  node_properties: []
},
{
  node_model_id: 7,
  node_label: '1M NaCl lot',
  node_properties: []
},
{
  node_model_id: 8,
  node_label: 'Measurement',
  node_properties: [
    {  // potentially another node
      name: 'type',
      type: 'text'
    },
    {
      name: 'value',
      type: 'number_with_unit'
    }
  ]
}

{
  to_create_node: 1,
  node_instances: [
    {
      node_model_id: 1 //buffer transformer
      action: "create"
    },
    // RODI
    {
      node_model_id: 2, // rodi input sample
      // source means that the sample will be related to an node with label 'RODI Tap'
      //source: 'RODI Tap' dont think we need to define this
      action: "create"
    },
    {
      node_model_id: 3 // rodi tap needs to be found
      action: "find_or_create"
    },
    {
      node_model_id: 8, //measurement on rodi sample
      node_properties: [
        {name: 'type', value: 'volume'}
      ],
      action: "create"
    },
    {
      node_model_id: 2, // sample of nacl lot
      action: "find_or_create"
    },
    {
      node_model_id: 2, // nacl sample
      // lot means that the sample will be related to a node with label 'Sample' related to a node w/ label 'Lot' that's related to a node with label 'Vendored 5M NaCl'
      //lot_sample: 'Vendored 5M NaCl' //perhaps replaced by relationship
      action: "create"
    },
    {
      node_model_id: 8, //measurement on nacl sample
      node_properties: [{name: 'type', value: 'volume'}]
      action: "create"
    },
    {
      node_model_id: 2 // final buffer sample
      action: "create"
    },
    {
      node_model_id: 8, //measurement on buffer sample
      node_properties: [{name: 'type', value: 'pH'}]
      action: "create"
    },
    {
      node_model_id: 8, //measurement on buffer sample
      node_properties: [{name: 'type', value: 'Conductivity'}]
      action: "create"
    },
    {
      node_model_id: 7 //new lot of buffer
      action: "create"
    }
  ],
  relationships: [
    {
      start_node: {node_instance_index: 0},
      end_node: {node_instance_index: 5},
      type: "has_output"
    },
    {
      start_node: {node_instance_index: 1},
      end_node: {node_instance_index: 0},
      type: "is_input_for"
    },
    {
      start_node: {node_instance_index: 3},
      end_node: {node_instance_index: 0},
      type: "is_input_for"
    },
    {
      start_node: {node_instance_index: 1},
      end_node: {node_instance_index: 2},
      type: "has_measurement"
    },
    {
      start_node: {node_instance_index: 3},
      end_node: {node_instance_index: 4},
      type: "has_measurement"
    },
    {
      start_node: {node_instance_index: 5},
      end_node: {node_instance_index: 6},
      type: "has_measurement"
    },
    {
      start_node: {node_instance_index: 5},
      end_node: {node_instance_index: 7},
      type: "has_measurement"
    },
    {
      start_node: {node_instance_index: 2},
      end_node: {query: "Match (n:Sample)-->(l:Lot)-->(c:Concept) where id(c) = 222 return n"},
      type: "is subsample of"
    },
    {
      start_node: {node_instance_index: 1},
      end_node: {node_instance_index: 2},
      type: "is sample of"
    },
    {
      //created lot
      start_node: {node_instance_index: 6},
      end_node: {node_instance_index: 9},
      type: "sample of"
    },
    {
      //created sample
      start_node: {node_instance_index: 9},
      end_node: {node_id: 229}, // node id for 1M NaCl Solution
      type: "lot of"
    }
  ]
}



{
  sections: [
    {
      title: 'Define desired amount'
      inputs: [
        {
          type: 'number_with_unit',
          label: 'Desired Amount',
          node_instance_index: 0,
          property: 'desired_amount'
        }
      ]
    },
    {
      title: '',
      inputs: [
        {
          type: 'number_with_unit',
          label: 'Amount of RODI',
          node_instance_index: 3,
          property: 'value'
        },
        {
          type: 'search',
          label: 'Source (RODI Tap)',
          node_instance_index: 2
        },
        {
          type: 'number_with_unit',
          label: 'Amount of 5M NaCl',
          node_instance_index: 5,
          property: 'value'
        },
        {
          type: 'search',
          label: 'Lot of 5M NaCl',
          node_instance_index: 4
        },

      ]
    }
  ]
}







