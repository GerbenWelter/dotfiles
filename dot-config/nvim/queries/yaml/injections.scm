;; NamespaceConfig resources
; (block_mapping
;   (block_mapping_pair
; 	key: (flow_node) @objecttemplate (#eq? @objecttemplate "objectTemplate")
; 	value: (block_node
; 			 (block_scalar) @injection.content
; 			 (#set! injection.language "gotmpl"))
; 	(#offset! @injection.content 1 -22 0 0)
; 	))

;; ConfigMaps with *.json files
; (document
;   (block_node
; 	(block_mapping
; 	  (block_mapping_pair
; 		key: (flow_node) @_data (#eq? @_data "data")
; 		value: (block_node
; 				 (block_mapping
; 				   (block_mapping_pair
; 					 key: (flow_node) @_json_file
; 					 (#eq? @_json_file "config.json")
; 					 value: (block_node
; 							  (block_scalar) @injection.content
; 							  (#set! injection.language "json")
; 							  ; block_scalar must use offset which is relative to the '|'
; 							  (#offset! @injection.content 1 -15 0 0)
; 					 ))))))))

; (block_mapping_pair
;   value: [
;     (block_node (block_scalar) @injection.content)
;     (flow_node (single_quote_scalar) @injection.content)
;   ]
;   (#set! injection.language "gotmpl")
;   (#contains? @injection.content "{{")
; )

(block_mapping
  (block_mapping_pair
	key: (flow_node) @key (#match? @key "\\.yaml$")
	value: (block_node (block_scalar) @injection.content
             (#set! injection.language "yaml")
             (#set! injection.include-children)
           )
	(#offset! @injection.content 1 -13 0 0)
  )
)
