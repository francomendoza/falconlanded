# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[{
    template_id: 1,
    node_label: "Container",
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
    template_id: 2,
    node_label: "Location",
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
        related_nodes: []
},
{
    template_id: 3,
    node_label: "Company",
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
            relationship: "located",
            required: true,
            entity_id: nil
        }
    ]
},
{
    template_id: 4,
    node_label: "PartNumber",
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
            relationship: "child_of",
            required: true,
            entity_id: nil # entity_instance
        }
    ]
},
{
    template_id: 5,
    node_label: "Flask",
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
            relationship: "child_of",
            required: true,
            entity_id: nil #(n:Container {name: "Flask"})
        },
        {
            template_id: 4,
            relationship: "has_part_number",
            required: true,
            entity_id: nil
        }
    ]
},
{
        template_id: 6,
        node_label: "Plate",
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
                relationship: "child_of",
                required: true,
                entity_id: nil
            },
            {
                template_id: 3,
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
{
    template_id: 7,
    node_label: "Box",
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
            relationship: "child_of",
            required: true,
            entity_id: nil
        },
        {
            template_id: 4,
            relationship: "has_part_number",
            required: true,
            entity_id: nil
        }
    ]
},
{
    template_id: 8,
    node_label: "Equipment",
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
    template_id: 9,
    node_label: "Refrigerator",
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
            relationship: "child_of",
            required: true,
            entity_id: nil
        },
        {
            template_id: 8,
            relationship: "child_of",
            required: true,
            entity_id: nil
        },
        {
            template_id: 4,
            relationship: "has_part_number",
            required: true,
            entity_id: nil
        }
    ]
},
{
    template_id: 10,
    node_label: "Freezer",
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
            relationship: "child_of",
            required: true,
            entity_id: nil
        },
        {
            template_id: 8,
            relationship: "child_of",
            required: true,
            entity_id: nil
        },
        {
            template_id: 4,
            relationship: "has_part_number",
            required: true,
            entity_id: nil
        }
    ]
},
{
        template_id: 11,
        node_label: "Vial",
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
                relationship: "child_of",
                required: true,
                entity_id: nil
            },
            {
                template_id: 3,
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
{
        template_id: 12,
        node_label: "Bottle",
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
                relationship: "child_of",
                required: true,
                entity_id: nil
            },
            {
                template_id: 3,
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 13,
        node_label: "Bag",
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
                relationship: "child_of",
                required: true,
                entity_id: nil
            },
            {
                template_id: 3,
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 14,
        node_label: "Compound",
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
        template_id: 15,
        node_label: "Salt",
        node_properties: [
        {
            name: "name",
            type: "text",
            value: nil
        },
        {
            name: "formula",
            type: "text",
            value: nil
        }
        ],
            related_nodes: [
            {
                template_id: 14,
                relationship: "child_of",
                required: true,
                entity_id: nil
            },
            {
                template_id: 3,
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 16,
        node_label: "Solution",
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
                relationship: "has_part_number",
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 17,
        node_label: "Person",
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
            related_nodes: []
    },
    {
        template_id: 18,
        node_label: "Year",
        node_properties: [
        {
            name: 'year',
            type: 'text',
            type: nil
        }
        ],
            related_nodes: []
    },
    {
        template_id: 19,
        node_label: "Month",
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
                relationship: 'of_year',
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 20,
        node_label: "Day",
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
                relationship: 'of_month',
                required: true,
                entity_id: nil
            }
        ]
    },
    {
        template_id: 21,
        node_label: "Time",
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
                relationship: 'of_day',
                required: true,
                entity_id: nil
            }
        ]
    }].each do |temp|
      temptemp = Template.create(node_label: temp[:node_label])
      temp[:node_properties].each do |node_props|
        temptemp.node_properties.create(node_props)
      end
      temp[:related_nodes].each do |rel_node|
        temptemp.related_nodes.create(template_id: Template.all[rel_node[:template_id]-1].id, relationship: rel_node[:relationship], required: rel_node[:required], entity_id: nil)
      end
    end