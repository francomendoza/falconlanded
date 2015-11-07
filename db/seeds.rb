# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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
    template_id: 2,
    node_label: ["Location"],
    node_properties: [
        {
            name: "city",
            type: "text",
            value: nil
        },
        {
            name: "country",
            type: "text",
            value: nil
        }
    ],
    related_nodes: [],
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
            node_label: "Location",
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
            match_type: "exact" #(n:Container {name: "Flask"})
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
        related_nodes: [],
    children_templates: []
    },
    {
        template_id: 15,
        node_label: ["Salt", "Sampleable"],
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
    
    
                                        # {
                                        #     node_label: "Sample",
                                        #     node_type: "Sample",
                                        #     node_properties: [
                                        #         {
                                        #             name: "description",
                                        #             type: "text",
                                        #             value: nil
                                        #         }
                                        #     ],
                                        #     related_nodes: [
                                        #         {
                                        #             node_type: "Lot",
                                        #             relationship: "sample_of",
                                        #             required: false,
                                        #             entity_id: nil
                                        #         },
                                        #         {
                                        #             node_type: "Transformation",
                                        #             relationship: "created_from",
                                        #             required: false,
                                        #             entity_id: nil
                                        #         }
                                        #     ]    
                                        # },
                                        # {
                                        #     node_description: "Buffer Mix",
                                        #     node_type: "Transformation",
                                        #     node_properties: [
                                        #         {
                                        #             name: "Buffer Name",
                                        #             type: "text",
                                        #             value: nil
                                        #         }
                                        #     ],
                                        #     incoming_nodes: [
                                        #         {
                                        #             node_type: "Sample",
                                        #             relationship: "incoming_sample",
                                        #             required: true,
                                        #             node_id: 570 #
                                        #         }
                                        #     ]
                                        # },
    {
        template_id: 16,
        node_label: ["Solution", "Sampleable"],
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
      node_properties: [{
        name: 'name',
        type: 'text',
        value: nil
      }],
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
          name: 'value',
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
        }
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
          match_type: 'exact',
          count_limit: 1
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
          match_type: 'leaves',
          count_limit: 1
        }
      ]
    }
].each do |temp|
    # binding.pry
  temptemp = Template.create(node_label: temp[:node_label], children_templates: temp[:children_templates])
  temp[:node_properties].each do |node_props|
    temptemp.node_properties.create(node_props)
  end
  temptemp.related_nodes << temp[:related_nodes].map do |rel_node|
    related_template = Template.find_by(node_label: rel_node[:node_label])
    if rel_node[:relationship] == "child_of"
        if related_template.children_templates == nil
            related_template.children_templates = []
            related_template.children_templates << temptemp.id.to_s
            related_template.save
        else
            related_template.children_templates << temptemp.id.to_s
            related_template.save
        end
    end
    RelatedNode.new(template_id: related_template.id.to_s, relationship: rel_node[:relationship], required: rel_node[:required], entity_id: rel_node[:entity_id], count_limit: rel_node[:count_limit], match_type: rel_node[:match_type])
  end
end
