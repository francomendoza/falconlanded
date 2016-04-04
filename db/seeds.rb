
Template.delete_all
NodeModel.delete_all
[
    {
        template_id: 1,
        node_label: ["Container"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [],
        children_templates: []
    },
    {
        node_label: ["Sampleable"],
        node_properties: [],
        related_nodes: [],
        children_templates: []
    },
    {
        node_label: ["Element"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "symbol",
                type: "text",
                value: nil
            },
            {
                name: "atomic number",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [],
        children_templates: []
    },
    {
        template_id: 2,
        node_label: ["Country"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [],
        children_templates: []
    },
    {
        template_id: 2,
        node_label: ["State"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
          {
            template_id: 2,
            node_label: "Country",
            relationship: "in_country",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          },
        ],
        children_templates: []
    },
    {
        template_id: 2,
        node_label: ["City"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
          {
            template_id: 2,
            node_label: "Country",
            relationship: "in_country",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          },
          {
            template_id: 2,
            node_label: "State",
            relationship: "in_state",
            required: false,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          }
        ],
        children_templates: []
    },
    {
        template_id: 2,
        node_label: ["Building"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "address",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
          {
            template_id: 2,
            node_label: "City",
            relationship: "in_city",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          }
        ],
        children_templates: []
    },
    {
        template_id: 2,
        node_label: ["Room"],
        node_properties: [
            {
                name: "name/number",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
          {
            template_id: 2,
            node_label: "Building",
            relationship: "in_building",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          }
        ],
        children_templates: []
    },
    {
        template_id: 3,
        node_label: ["Company"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 2,
                node_label: "City",
                relationship: "located",
                required: true,
                entity_id: nil,
                count_limit: -1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 4,
        node_label: ["PartNumber"],
        node_properties: [
            {
                name: "part_number",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 3, # entity_type == template
                node_label: "Company",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact" # entity_instance
            }
        ],
        children_templates: []
    },
    {
        template_id: 5,
        node_label: ["Flask"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "max_volume",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact", #(n:Container {name: "Flask"})
                instructions: [
                  #{
                    #type: 'node_property',
                    #index: 0,
                    #replace_with: {
                      #value: 'Flask',
                      #readonly: true
                    #}
                  #},
                  {
                    type: "node_property",
                    binding: true,
                    index: 0,
                    bind_to: 'node_properties[0]',
                    key: 'value'
                  }
                ]
            },
            {
                template_id: 4,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact",
                instructions: [
                  {
                    type: 'related_node',
                    binding: true,
                    index: 0,
                    bind_to: 'related_nodes[0]',
                    key: 'entity_id'
                  }
                ]
            }
        ],
        children_templates: []
    },
    {
        template_id: 5,
        node_label: ["FlaskLot"],
        node_properties: [
            {
                name: "Lot Number",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Flask",
                relationship: "lot_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                node_label: "Sampleable",
                relationship: "child_of",
                required: false, #maybe true and provide an entity_id
                entity_id: nil, #node: Sampleable
                count_limit: 1,
                match_type: "exact",
                visible: false
            }
        ],
        children_templates: []
    },
    {
        template_id: 6,
        node_label: ["Plate"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "well_volume",
                type: "text",
                value: nil
            },
            {
                name: "number_of_wells",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 7,
        node_label: ["Box"],
        node_properties: [
        {
            name: "name",
            type: "text",
            value: nil
        },
        {
            name: "max_quantity",
            type: "text",
            value: nil
        }
        ],
            related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 4,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 8,
        node_label: ["Equipment"],
        node_properties: [
        {
            name: "name",
            type: "text",
            value: nil
        }
        ],
            related_nodes: []
    },
    {
        node_label: ["pH Probe"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Equipment",
                relationship: "child_of",
                required: true,
                entity_id: nil, #Equipment:pH Probe
                count_limit: 1,
                match_type: "exact"
            },
            {
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                node_label: "Room",
                relationship: "located_in",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 9,
        node_label: ["Refrigerator"],
        node_properties: [
        {
            name: "name",
            type: "text",
            value: nil
        },
        {
            name: "size",
            type: "text",
            value: nil
        },
        {
            name: "temperature",
            type: "text",
            value: nil
        }
        ],
        related_nodes: [
          {
            template_id: 1,
            node_label: "Container",
            relationship: "child_of",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          },
          {
            template_id: 8,
            node_label: "Equipment",
            relationship: "child_of",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          },
          {
            node_label: "PartNumber",
            relationship: "has_part_number",
            required: true,
            entity_id: nil,
            count_limit: 1,
            match_type: "exact"
          }
        ],
        children_templates: []
    },
    {
        template_id: 10,
        node_label: ["Freezer"],
        node_properties: [
        {
            name: "name",
            type: "text",
            value: nil
        },
        {
            name: "size",
            type: "text",
            value: nil
        },
        {
            name: "temperature",
            type: "text",
            value: nil
        }
        ],
            related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 8,
                node_label: "Equipment",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 4,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 11,
        node_label: ["Vial"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "volume",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
            match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 12,
        node_label: ["Bottle"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "volume",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
            match_type: "exact"
            },
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
            match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 13,
        node_label: ["Bag"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            },
            {
                name: "volume",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 1,
                node_label: "Container",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 14,
        node_label: ["Compound"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Element",
                relationship: "has_element",
                required: true,
                entity_id: nil,
                count_limit: -1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 15,
        node_label: ["Vendored NaCl"],
        node_properties: [
          {
            name: "name",
            type: "text",
            value: nil
          }
        ],
        related_nodes: [
            {
                template_id: 14,
                node_label: "Compound",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            },
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        node_label: ["Vendored NaCl Lot"],
        node_properties: [
            {
                name: "Lot Number",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Sampleable",
                relationship: "child_of",
                required: false, #maybe true and provide an entity_id
                entity_id: nil, #node: Sampleable
                count_limit: 1,
                match_type: "exact",
                visible: false
            },
            {
                node_label: "Vendored NaCl",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 16,
        node_label: ["Solution"],
        node_properties: [
            {
                name: "name",
                type: "text",
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 3,
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 17,
        node_label: ["Person"],
        node_properties: [
            {
                name: "first_name",
                type: "text",
                value: nil
            },
            {
                name: "last_name",
                type: "text",
                value: nil
            },
            {
                name: 'email',
                type: "text",
                value: nil
            }
        ],
        related_nodes: [],
        children_templates: []
    },
    {
        template_id: 18,
        node_label: ["Year"],
        node_properties: [
            {
                name: 'year',
                type: 'text',
                type: nil
            }
        ],
        related_nodes: [],
        children_templates: []
    },
    {
        template_id: 19,
        node_label: ["Month"],
        node_properties: [
            {
                name: 'month',
                type: 'text',
                type: nil
            }
        ],
        related_nodes: [
            {
                template_id: 18,
                node_label: "Year",
                relationship: 'of_year',
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 20,
        node_label: ["Day"],
        node_properties: [
            {
                name: 'day',
                type: 'text',
                type: nil
            }
        ],
        related_nodes: [
            {
                template_id: 19,
                node_label: "Month",
                relationship: 'of_month',
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 21,
        node_label: ["Hour"],
        node_properties: [
            {
                name: 'time',
                type: 'text',
                type: nil
            }
        ],
        related_nodes: [
            {
                template_id: 20,
                node_label: "Day",
                relationship: 'of_day',
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 21,
        node_label: ["Minute"],
        node_properties: [
            {
                name: 'time',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 20,
                node_label: "Hour",
                relationship: 'of_hour',
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 21,
        node_label: ["Second"],
        node_properties: [
            {
                name: 'time',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 20,
                node_label: "Minute",
                relationship: 'of_minute',
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ],
        children_templates: []
    },
    {
        template_id: 22,
        node_label: ["Instrument"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                template_id: 8,
                node_label: 'Equipment',
                relationship: 'child_of',
                required: true,
                entity_id: nil,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
   {
      template_id: 23,
      node_label: ["Measurement"],
      node_properties: [
        {
          name: 'alias',
          type: 'text',
          value: nil
        },
        {
          name: 'type',
          type: 'text',
          value: nil
        },
        {
          name: 'value',
          type: 'text',
          value: nil
        },
        {
          name: 'unit',
          type: 'text',
          value: nil
        }
      ],
      related_nodes: [
        {
          template_id: 22,
          node_label: "Equipment",
          relationship: 'measured_by',
          entity_id: nil,
          required: true,
          match_type: 'child',
          count_limit: 1
        }#,
        # {
        #   node_label: "Sample",
        #   relationship: 'has_measurement',
        #   entity_id: nil,
        #   required: true,
        #   match_type: 'exact',
        #   count_limit: 1,
        #   direction: 'in'
        # }
      ]
    },
    {
      template_id: 24,
      node_label: ["Sample"],
      node_properties: [
        {
          name: 'name',
          type: 'text',
          value: nil
        },
        {
          name: 'description',
          type: 'text',
          value: nil
        }
      ],
      related_nodes: [
        {
          node_label: "Sampleable",
          required: true,
          relationship: 'is_a_sample_of',
          entity_id: nil,
          match_type: 'child',
          count_limit: 1
        },
        {
          node_label: "Sampleable",
          required: true,
          relationship: 'child_of',
          entity_id: nil,
          match_type: 'exact',
          count_limit: 1,
          visible: false
        },
        {
          node_label: "Measurement",
          required: false,
          relationship: 'has_measurement',
          entity_id: nil,
          match_type: 'exact',
          count_limit: -1
        },
        {
          node_label: 'Container',
          required: true,
          relationship: 'contained_in',
          entity_id: nil,
          match_type: 'child',
          count_limit: 1
        }
      ]
    },
    {
        node_label: ["1M NaCl"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Solution",
                relationship: 'child_of',
                entity_id: nil, #solution for 1M NaCl?
                required: true,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
    {
        node_label: ["1M NaCl Lot"],
        node_properties: [
            {
                name: 'Lot Number',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Sampleable",
                required: true,
                relationship: 'child_of',
                entity_id: nil,
                match_type: 'exact',
                count_limit: 1,
                visible: false
            },
            {
                node_label: "1M NaCl",
                relationship: 'child_of',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
    {
        node_label: ["1M_NaCl_Transformer"],
        node_properties: [
            {
                name: 'description',
                type: 'text',
                value: nil
            },
            {
                name: 'desired amount',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Sample",
                relationship: 'has_input',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in',
                instructions: [
                    {
                        type: 'node_property',
                        index: 1,
                        replace_with: {
                            value: "NaCl"
                        }
                    }
                ]
            },
            {
                node_label: "Sample",
                relationship: 'has_input',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in',
                instructions: [
                    {
                        type: 'node_property',
                        index: 1,
                        replace_with: {
                            value: "RODI"
                        }
                    }
                ]
            },
            {
                node_label: "Sample",
                relationship: 'has_output',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'out',
                instructions: [
                    {
                        type: 'node_property',
                        index: 1,
                        replace_with: {
                            value: "1M NaCl"
                        }
                    },
                    {
                        type: "related_node",
                        index: 0,
                        replace_with: {
                            default_child: "1M NaCl Lot",
                            instructions: [
                                {
                                    type: 'node_property',
                                    index: 0,
                                    replace_with: {
                                        value: "New Lots"
                                    }
                                }
                            ]
                        }
                    }
                ]
            },
            {
                node_label: "Equipment",
                relationship: 'uses',
                entity_id: nil,
                required: false,
                match_type: 'child',
                count_limit: -1,
                direction: 'in'
            }
        ]
    },
    {
        node_label: ["Resin Type"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [

        ]
    },
    {
        node_label: ["Vendored Resin"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Resin Type",
                relationship: 'has_type',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            },
            {
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ]
    },
    {
        node_label: ["Vendored Resin Lot"],
        node_properties: [
            {
                name: 'Lot Number',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Vendored Resin",
                relationship: 'lot_of',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            },
            {
                node_label: "Sampleable",
                relationship: "child_of",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact",
                visible: false
            }
        ]
    },
    {
        node_label: ["Column Housing"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            },
            {
                name: 'maximum bed height',
                type: 'text',
                value: nil
            },
            {
                name: 'diameter',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "PartNumber",
                relationship: "has_part_number",
                required: true,
                entity_id: nil,
                count_limit: 1,
                match_type: "exact"
            }
        ]
    },
    {
        node_label: ["Packed Column"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            },
            {
                name: 'initial bed height',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Column Housing",
                relationship: 'uses_housing',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            },
            {
                node_label: "Sample",
                relationship: 'uses_resin',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
    {
        node_label: ["Packed Column State"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Packed Column",
                relationship: 'time_of',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            },
            {
                node_label: "Sample",
                relationship: 'uses_resin',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
    {
        node_label: ["Chromatography Step"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            },
            {
                name: 'description',
                type: 'text',
                value: nil
            },
            {
              name: 'linear_velocity',
              type: 'text',
              value: nil
            },
            {
              name: 'column_volumes',
              type: 'text',
              value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Sample",
                relationship: 'has_input',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in'
            },
            {
                node_label: "Sample",
                relationship: 'has_input',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in'
            },
            {
                node_label: "Sample",
                relationship: 'has_output',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'out'
            },
            {
                node_label: "Sample",
                relationship: 'has_output',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'out'
            },
            {
                node_label: "Equipment",
                relationship: 'uses',
                entity_id: nil,
                required: false,
                match_type: 'child',
                count_limit: -1,
                direction: 'in'
            },
            {
                node_label: "Packed Column State",
                relationship: 'uses',
                entity_id: nil,
                required: false,
                match_type: 'exact',
                count_limit: 1
            }
        ]
    },
    {
        node_label: ["Chromatography Transformation"],
        node_properties: [
            {
                name: 'name',
                type: 'text',
                value: nil
            },
            {
                name: 'description',
                type: 'text',
                value: nil
            },
            {
                name: 'linear_velocity',
                type: 'text',
                value: nil
            }
        ],
        related_nodes: [
            {
                node_label: "Chromatography Step",
                view_label: "Pre-Equilibration Step",
                relationship: 'is_sub_transformer_of',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in',
                instructions: [
                    {
                        type: 'node_property',
                        index: 0,
                        replace_with: {
                            value: 'Pre-Equilibration'
                        }
                    },
                    {
                        type: 'node_property',
                        binding: true,
                        bind_to: 'node_properties[2]',
                        index: 2,
                        key: 'value',
                        replace_with: {
                            readonly: true
                        }
                    },
                    {
                        type: 'node_property',
                        index: 3,
                        replace_with: {
                            value: '2'
                        }
                    },
                    {
                        type: 'related_node',
                        index: 0,
                        replace_with: {
                            view_label: "Input Resin",
                            instructions: [
                                {
                                    type: 'related_node',
                                    index: 0,
                                    replace_with: {
                                        default_child: 'Vendored Resin Lot'
                                    }
                                },
                                {
                                    type: 'related_node',
                                    index: 4,
                                    replace_with: {
                                        template_label: ["Packed Column State"],
                                        relationship: 'uses',
                                        entity_id: nil,
                                        required: false,
                                        match_type: 'exact',
                                        count_limit: 1
                                    }
                                }
                            ]
                        }
                    },
                    {
                        type: 'related_node',
                        index: 1,
                        replace_with: {
                            view_label: "Input Buffer"
                        }
                    },
                    {
                        type: 'related_node',
                        index: 2,
                        replace_with: {
                            view_label: "Output Resin"
                        }
                    },
                    {
                        type: 'related_node',
                        index: 3,
                        replace_with: {
                            view_label: "Output Buffer"
                        }
                    }
                ]
            },
            {
                node_label: "Chromatography Step",
                relationship: 'is_sub_transformer_of',
                entity_id: nil,
                required: true,
                match_type: 'exact',
                count_limit: 1,
                direction: 'in',
                instructions: [
                    {
                        type: 'node_property',
                        index: 0,
                        replace_with: {
                            value: 'Equilibration'
                        }
                    },
                    {
                        type: 'node_property',
                        binding: true,
                        bind_to: 'node_properties[2]',
                        index: 2,
                        key: 'value',
                        replace_with: {
                            readonly: true
                        }
                    },
                    {
                        type: 'node_property',
                        index: 3,
                        replace_with: {
                            value: '2'
                        }
                    },
                    {
                        type: 'related_nodes',
                        binding: true,
                        bind_to: 'related_nodes[0].related_nodes[2]',
                        index: 0,
                        key: 'entity_id',
                        replace_with: {
                            view_label: "Input Resin"
                        }
                    },
                    {
                        type: 'related_node',
                        index: 1,
                        replace_with: {
                            view_label: "Input Buffer"
                        }
                    },
                    {
                        type: 'related_node',
                        index: 2,
                        replace_with: {
                            view_label: "Output Resin"
                        }
                    },
                    {
                        type: 'related_node',
                        index: 3,
                        replace_with: {
                            view_label: "Output Buffer"
                        }
                    }
                ]
            }
        ]
    }
].each do |temp|
    # binding.pry
  temptemp = Template.create(node_label: temp[:node_label], children_templates: temp[:children_templates])
  # temptemp2 = NodeModel.create(label: temp[:node_label][0])
  temp[:node_properties].each do |node_props|
    temptemp.node_properties.create(node_props)
    # temptemp2.node_properties.create(node_props)
  end
  temptemp.related_nodes << temp[:related_nodes].map do |rel_node|
    related_template = Template.find_by(node_label: rel_node[:node_label])

    # temptemp2.related << rel_node[:node_label]
    # temptemp2.related.uniq!
    # temptemp2.save

    # related_node_model = NodeModel.find_by(label: rel_node[:node_label])
    # related_node_model.related << temp[:node_label][0]
    # related_node_model.related.uniq!
    # related_node_model.save

    if rel_node[:relationship] == "child_of"
        if related_template.children_templates == nil
            related_template.children_templates = []
            related_template.children_templates << temptemp.node_label.first.to_s
            related_template.save
        else
            related_template.children_templates << temptemp.node_label.first.to_s
            related_template.save
        end
    end

    RelatedNode.new(template_id: related_template.id.to_s,
                    relationship: rel_node[:relationship],
                    required: rel_node[:required],
                    entity_id: rel_node[:entity_id],
                    count_limit: rel_node[:count_limit],
                    match_type: rel_node[:match_type],
                    template_label: [rel_node[:node_label]],
                    direction: rel_node[:direction] || "out",
                    instructions: rel_node[:instructions] || [],
                    view_label: rel_node[:view_label],
                    visible: (rel_node[:visible] == false ? rel_node[:visible] : true)
                   )
  end
end

load './db/node_model_seeds.rb'
load './db/graph_model_seeds.rb'
load './db/location_graph_model_seeds.rb'
load './db/lot_graph_model_seeds.rb'
