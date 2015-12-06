namespace :custom_seed do
	desc 'Seed all entities'
	task :entities => :environment do
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
		        "name": "name/number",
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
		        "name": "name/number",
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