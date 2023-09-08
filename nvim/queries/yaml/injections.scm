;; NamespaceConfig resources
(document
  (block_node
	(block_mapping
	  (block_mapping_pair
		key: (flow_node) @spec (#eq? @spec "spec")
		value: (block_node
				 (block_mapping
				   (block_mapping_pair
					 key: (flow_node) @templates (#eq? @templates "templates")
					 value: (block_node
							  (block_sequence
								(block_sequence_item
								  (block_node
									(block_mapping
									  (block_mapping_pair
										key: (flow_node) @objecttemplate (#eq? @objecttemplate "objectTemplate")
										value: (block_node
												 (block_scalar) @injection.content
										(#set! injection.language "gotmpl"))
										(#offset! @injection.content 0 1 0 0))
										)
									  )
									)
								  )
								)
							  )
					 ))))))
