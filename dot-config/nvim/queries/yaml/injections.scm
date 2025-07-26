; the offset predicates are needed to skip the '|' or '>' which
; otherwise gets passed to the formatter for the injected
; content.
;
; TODO: if possible also account for newline stripping and indentation.
;       see: https://yaml-multiline.info

; inject bash into multiline yaml
(block_node
  (block_mapping
	(block_mapping_pair
	  key: (flow_node) @key (#match? @key "\.sh$")
	  value: (block_node
				 (block_scalar) @injection.content)
      (#offset! @injection.content 0 1 0 1000)
	  (#set! injection.language "bash")
	  )
   )
 )

; inject json into multiline yaml
(block_node
  (block_mapping
	(block_mapping_pair
	  key: (flow_node) @key (#match? @key "\.json$")
	  value: (block_node
		       (block_scalar) @injection.content)
      (#offset! @injection.content 0 1 0 1000)
	  (#set! injection.language "json")
	  )
   )
 )

; inject yaml into multiline yaml
(block_node
  (block_mapping
	(block_mapping_pair
	  key: (flow_node) @key (#match? @key "\.ya?ml$")
	  value: (block_node
		       (block_scalar) @injection.content)
      (#offset! @injection.content 0 1 0 1000)
	  (#set! injection.language "yaml")
	  )
   )
 )

; inject helm into multiline yaml when '{{ whatever }}' is found
(block_node
  (block_mapping
	(block_mapping_pair
	  key: (flow_node)
	  value: (block_node
		       (block_scalar) @injection.content)
	  (#match? @injection.content "\\{\\{.+\\}\\}")
      (#offset! @injection.content 0 1 0 1000)
	  (#set! injection.language "helm")
	  )
   )
 )

