;; NamespaceConfig resources
(block_mapping
  (block_mapping_pair
	key: (flow_node) @objecttemplate (#eq? @objecttemplate "objectTemplate")
	value: (block_node
			 (block_scalar) @injection.content
			 (#set! injection.language "gotmpl"))
	(#offset! @injection.content 0 1 0 0)))
