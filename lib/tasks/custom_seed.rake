namespace :custom_seed do
  desc 'Seed all entities'
  task :entities => :environment do
    Entity.delete_all
    `curl -XDELETE http://localhost:9200/entities`
    seed_hash = {
      "96": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb000006"
        },
        "children_templates": [],
        "node_label": [
          "Country"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000007"
            },
            "name": "name",
            "type": "text",
            "value": "United States of America"
          }
        ]
      },
      "97": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb000008"
        },
        "children_templates": [],
        "node_label": [
          "State"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000009"
            },
            "name": "name",
            "type": "text",
            "value": "New York"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb00000a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "96"
            ],
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb000006",
            "template_label": [
              "Country"
            ]
          }
        ]
      },
      "98": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb00000b"
        },
        "children_templates": [],
        "node_label": [
          "City"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb00000c"
            },
            "name": "name",
            "type": "text",
            "value": "Tarrytown"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb00000d"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb000006",
            "template_label": [
              "Country"
            ]
          },
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb00000e"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "97"
            ],
            "match_type": "exact",
            "relationship": "in_state",
            "required": false,
            "template_id": "56567cee3bdc4d7ddb000008",
            "template_label": [
              "State"
            ]
          }
        ]
      },
      "99": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb00000f"
        },
        "children_templates": [],
        "node_label": [
          "Building"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000010"
            },
            "name": "name",
            "type": "text",
            "value": "Building 6"
          },
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000011"
            },
            "name": "address",
            "type": "text",
            "value": "666 Old Saw Mill River Road"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000012"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "98"
            ],
            "match_type": "exact",
            "relationship": "in_city",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "100": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb000013"
        },
        "children_templates": [],
        "node_label": [
          "Room"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000014"
            },
            "name": "name",
            "type": "text",
            "value": "61-123"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000015"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "99"
            ],
            "match_type": "exact",
            "relationship": "in_building",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb00000f",
            "template_label": [
              "Building"
            ]
          }
        ]
      },
      "101": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb00000f"
        },
        "children_templates": [],
        "node_label": [
          "Building"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000010"
            },
            "name": "name",
            "type": "text",
            "value": "Building 7"
          },
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000011"
            },
            "name": "address",
            "type": "text",
            "value": "777 Old Saw Mill River Road"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000012"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "98"
            ],
            "match_type": "exact",
            "relationship": "in_city",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "102": {
        "_id": {
          "$oid": "56567cee3bdc4d7ddb000013"
        },
        "children_templates": [],
        "node_label": [
          "Room"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000014"
            },
            "name": "name",
            "type": "text",
            "value": "71-123"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "56567cee3bdc4d7ddb000015"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "101"
            ],
            "match_type": "exact",
            "relationship": "in_building",
            "required": true,
            "template_id": "56567cee3bdc4d7ddb00000f",
            "template_label": [
              "Building"
            ]
          }
        ]
      },
      "131": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00002c"
        },
        "children_templates": [
          "pH Probe",
          "Refrigerator",
          "Freezer",
          "Instrument"
        ],
        "node_label": [
          "Equipment"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00002d"
            },
            "name": "name",
            "type": "text",
            "value": "pH Probe"
          }
        ]
      },
      "103": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000008"
        },
        "children_templates": [],
        "node_label": [
          "State"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000009"
            },
            "name": "name",
            "type": "text",
            "value": "Ohio"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "96"
            ],
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          }
        ]
      },
      "104": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00000b"
        },
        "children_templates": [],
        "node_label": [
          "City"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000c"
            },
            "name": "name",
            "type": "text",
            "value": "Columbus"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000d"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000e"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "103"
            ],
            "match_type": "exact",
            "relationship": "in_state",
            "required": false,
            "template_id": "5658a4b5ab28c6016e000008",
            "template_label": [
              "State"
            ]
          }
        ]
      },
      "105": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000016"
        },
        "children_templates": [
          "PartNumber"
        ],
        "node_label": [
          "Company"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000017"
            },
            "name": "name",
            "type": "text",
            "value": "Mettler Toledo"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000018"
            },
            "count_limit": -1,
            "direction": "out",
            "entity_id": [
              "104"
            ],
            "match_type": "exact",
            "relationship": "located",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "106": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000019"
        },
        "children_templates": [],
        "node_label": [
          "PartNumber"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001a"
            },
            "name": "part_number",
            "type": "text",
            "value": "2323J34"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001b"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "105"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000016",
            "template_label": [
              "Company"
            ]
          }
        ]
      },
      "107": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00002e"
        },
        "children_templates": [],
        "node_label": [
          "pH Probe"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00002f"
            },
            "name": "name",
            "type": "text",
            "value": "SuperfastJellyfish"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000030"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "131"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00002c",
            "template_label": [
              "Equipment"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000031"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "106"
            ],
            "match_type": "exact",
            "relationship": "has_part_number",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000019",
            "template_label": [
              "PartNumber"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000032"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "102"
            ],
            "match_type": "exact",
            "relationship": "located_in",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000013",
            "template_label": [
              "Room"
            ]
          }
        ]
      },
      "108": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000008"
        },
        "children_templates": [],
        "node_label": [
          "State"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000009"
            },
            "name": "name",
            "type": "text",
            "value": "Massachusetts"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "96"
            ],
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          }
        ]
      },
      "109": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00000b"
        },
        "children_templates": [],
        "node_label": [
          "City"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000c"
            },
            "name": "name",
            "type": "text",
            "value": "Walthum"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000d"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000e"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "108"
            ],
            "match_type": "exact",
            "relationship": "in_state",
            "required": false,
            "template_id": "5658a4b5ab28c6016e000008",
            "template_label": [
              "State"
            ]
          }
        ]
      },
      "110": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000016"
        },
        "children_templates": [
          "PartNumber"
        ],
        "node_label": [
          "Company"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000017"
            },
            "name": "name",
            "type": "text",
            "value": "ThermoFisher Scientific"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000018"
            },
            "count_limit": -1,
            "direction": "out",
            "entity_id": [
              "109"
            ],
            "match_type": "exact",
            "relationship": "located",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "111": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000019"
        },
        "children_templates": [],
        "node_label": [
          "PartNumber"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001a"
            },
            "name": "part_number",
            "type": "text",
            "value": "5E157PJ"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001b"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "110"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000016",
            "template_label": [
              "Company"
            ]
          }
        ]
      },
      "112": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00002e"
        },
        "children_templates": [],
        "node_label": [
          "pH Probe"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00002f"
            },
            "name": "name",
            "type": "text",
            "value": "FastFred"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000030"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "131"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00002c",
            "template_label": [
              "Equipment"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000031"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "111"
            ],
            "match_type": "exact",
            "relationship": "has_part_number",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000019",
            "template_label": [
              "PartNumber"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000032"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "100"
            ],
            "match_type": "exact",
            "relationship": "located_in",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000013",
            "template_label": [
              "Room"
            ]
          }
        ]
      },
      "113": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000002"
        },
        "children_templates": [],
        "node_label": [
          "Element"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000003"
            },
            "name": "name",
            "type": "text",
            "value": "Sodium"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000004"
            },
            "name": "symbol",
            "type": "text",
            "value": "Na"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000005"
            },
            "name": "atomic number",
            "type": "text",
            "value": "11"
          }
        ]
      },
      "114": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000002"
        },
        "children_templates": [],
        "node_label": [
          "Element"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000003"
            },
            "name": "name",
            "type": "text",
            "value": "Chlorine"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000004"
            },
            "name": "symbol",
            "type": "text",
            "value": "Cl"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000005"
            },
            "name": "atomic number",
            "type": "text",
            "value": "17"
          }
        ]
      },
      "115": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000050"
        },
        "children_templates": [
          "Salt"
        ],
        "node_label": [
          "Compound"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000051"
            },
            "name": "name",
            "type": "text",
            "value": "NaCl"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000052"
            },
            "count_limit": -1,
            "direction": "out",
            "entity_id": [
              "113",
              "114"
            ],
            "match_type": "exact",
            "relationship": "has_element",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000002",
            "template_label": [
              "Element"
            ]
          }
        ]
      },
      "116": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000008"
        },
        "children_templates": [],
        "node_label": [
          "State"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000009"
            },
            "name": "name",
            "type": "text",
            "value": "Pennsylvania"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "96"
            ],
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          }
        ]
      },
      "117": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00000b"
        },
        "children_templates": [],
        "node_label": [
          "City"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000c"
            },
            "name": "name",
            "type": "text",
            "value": "Center Valley"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000d"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000e"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "116"
            ],
            "match_type": "exact",
            "relationship": "in_state",
            "required": false,
            "template_id": "5658a4b5ab28c6016e000008",
            "template_label": [
              "State"
            ]
          }
        ]
      },
      "118": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000016"
        },
        "children_templates": [
          "PartNumber"
        ],
        "node_label": [
          "Company"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000017"
            },
            "name": "name",
            "type": "text",
            "value": "JT Baker"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000018"
            },
            "count_limit": -1,
            "direction": "out",
            "entity_id": [
              "117"
            ],
            "match_type": "exact",
            "relationship": "located",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "119": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000019"
        },
        "children_templates": [],
        "node_label": [
          "PartNumber"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001a"
            },
            "name": "part_number",
            "type": "text",
            "value": "JTSUX69"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001b"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "118"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000016",
            "template_label": [
              "Company"
            ]
          }
        ]
      },
      "120": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000054"
        },
        "children_templates": [],
        "node_label": [
          "Salt"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000055"
            },
            "name": "name",
            "type": "text",
            "value": "Granular NaCl"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000056"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "child_of",
            "required": false,
            "template_id": "5658a4b5ab28c6016e000053",
            "template_label": [
              "Sampleable"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000057"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "115"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000050",
            "template_label": [
              "Compound"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000058"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "119"
            ],
            "match_type": "exact",
            "relationship": "has_part_number",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000019",
            "template_label": [
              "PartNumber"
            ]
          }
        ]
      },
      "121": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000000"
        },
        "children_templates": [
          "Flask",
          "Plate",
          "Box",
          "Refrigerator",
          "Freezer",
          "Vial",
          "Bottle",
          "Bag"
        ],
        "node_label": [
          "Container"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000001"
            },
            "name": "name",
            "type": "text",
            "value": "Bottle"
          }
        ]
      },
      "122": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e00000b"
        },
        "children_templates": [],
        "node_label": [
          "City"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000c"
            },
            "name": "name",
            "type": "text",
            "value": "Rochester"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000d"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "exact",
            "relationship": "in_country",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000006",
            "template_label": [
              "Country"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00000e"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "96"
            ],
            "match_type": "exact",
            "relationship": "in_state",
            "required": false,
            "template_id": "5658a4b5ab28c6016e000008",
            "template_label": [
              "State"
            ]
          }
        ]
      },
      "123": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000016"
        },
        "children_templates": [
          "PartNumber"
        ],
        "node_label": [
          "Company"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000017"
            },
            "name": "name",
            "type": "text",
            "value": "Nalgene"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000018"
            },
            "count_limit": -1,
            "direction": "out",
            "entity_id": [
              "122"
            ],
            "match_type": "exact",
            "relationship": "located",
            "required": true,
            "template_id": "5658a4b5ab28c6016e00000b",
            "template_label": [
              "City"
            ]
          }
        ]
      },
      "124": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000019"
        },
        "children_templates": [],
        "node_label": [
          "PartNumber"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001a"
            },
            "name": "part_number",
            "type": "text",
            "value": "BOT84357"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001b"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "123"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000016",
            "template_label": [
              "Company"
            ]
          }
        ]
      },
      "125": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000046"
        },
        "children_templates": [],
        "node_label": [
          "Bottle"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000047"
            },
            "name": "name",
            "type": "text",
            "value": "Nalgene 250 mL"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000048"
            },
            "name": "volume",
            "type": "text",
            "value": "250 mL"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000049"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "121"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000000",
            "template_label": [
              "Container"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00004a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "124"
            ],
            "match_type": "exact",
            "relationship": "has_part_number",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000019",
            "template_label": [
              "PartNumber"
            ]
          }
        ]
      },
      "126": {
        "_id": {
          "$oid": "5658a4b6ab28c6016e000075"
        },
        "children_templates": [],
        "node_label": [
          "Sample"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000076"
            },
            "name": "name",
            "type": "text",
            "value": "SampleOfNaCl"
          },
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000077"
            },
            "name": "description",
            "type": "text",
            "value": "Using to make awesome buffer"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000078"
            },
            "children_templates": [
              "Salt",
              "Solution"
            ],
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "120"
            ],
            "match_type": "child",
            "relationship": "is_a_sample_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000053",
            "template_label": [
              "Sampleable"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000079"
            },
            "children_templates": [
              "Flask",
              "Plate",
              "Box",
              "Refrigerator",
              "Freezer",
              "Vial",
              "Bottle",
              "Bag"
            ],
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "125"
            ],
            "match_type": "child",
            "relationship": "contained_in",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000000",
            "template_label": [
              "Container"
            ]
          }
        ]
      },
      "128": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000019"
        },
        "children_templates": [],
        "node_label": [
          "PartNumber"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001a"
            },
            "name": "part_number",
            "type": "text",
            "value": "BOT1111"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00001b"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "123"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000016",
            "template_label": [
              "Company"
            ]
          }
        ]
      },
      "129": {
        "_id": {
          "$oid": "5658a4b5ab28c6016e000046"
        },
        "children_templates": [],
        "node_label": [
          "Bottle"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000047"
            },
            "name": "name",
            "type": "text",
            "value": "1 L Nalgene Bottle"
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000048"
            },
            "name": "volume",
            "type": "text",
            "value": "1 L"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e000049"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "121"
            ],
            "match_type": "exact",
            "relationship": "child_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000000",
            "template_label": [
              "Container"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b5ab28c6016e00004a"
            },
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "128"
            ],
            "match_type": "exact",
            "relationship": "has_part_number",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000019",
            "template_label": [
              "PartNumber"
            ]
          }
        ]
      },
      "130": {
        "_id": {
          "$oid": "5658a4b6ab28c6016e000075"
        },
        "children_templates": [],
        "node_label": [
          "Sample"
        ],
        "node_properties": [
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000076"
            },
            "name": "name",
            "type": "text",
            "value": "My RODI Sample"
          },
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000077"
            },
            "name": "description",
            "type": "text",
            "value": "Used to make bufffff"
          }
        ],
        "related_nodes": [
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000078"
            },
            "children_templates": [
              "Salt",
              "Solution"
            ],
            "count_limit": 1,
            "direction": "out",
            "entity_id": nil,
            "match_type": "child",
            "relationship": "is_a_sample_of",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000053",
            "template_label": [
              "Sampleable"
            ]
          },
          {
            "_id": {
              "$oid": "5658a4b6ab28c6016e000079"
            },
            "children_templates": [
              "Flask",
              "Plate",
              "Box",
              "Refrigerator",
              "Freezer",
              "Vial",
              "Bottle",
              "Bag"
            ],
            "count_limit": 1,
            "direction": "out",
            "entity_id": [
              "129"
            ],
            "match_type": "child",
            "relationship": "contained_in",
            "required": true,
            "template_id": "5658a4b5ab28c6016e000000",
            "template_label": [
              "Container"
            ]
          }
        ]
      }
    }
    seed_hash.each do |id, hash|
      puts "Creating #{hash[:node_label]}"
      hash[:_id][:$oid] = Template.find_by(node_label: hash[:node_label].first).id.to_s
      ef = EntityForm.new(hash)
      new_entity = Entity.new(ef.data)
      new_entity.save
      (hash[:related_nodes] || []).each do |related_node|
        related_node[:entity_id].each do |old_entity_id|
          node_data = seed_hash[old_entity_id.to_sym]
          existing_entity = Entity.find_node(node_data[:node_label].first, {node_data[:node_properties].first[:name] => node_data[:node_properties].first[:value]})
          new_entity.create_rel(existing_entity.id, related_node[:relationship], related_node[:direction])
        end if related_node[:entity_id].present?
      end
    end
  end
end