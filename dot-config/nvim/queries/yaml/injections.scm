; In inject language based on comment after block_scalar
; e.g.
;
; key: | # json
;   {
;     "foo": "bar"
;   }

(block_mapping
  (block_mapping_pair
    key: (flow_node)
    value: (block_node
      (block_scalar
        (comment) @injection.language
      )
    )
  ) @injection.content
  (#set! injection.include-children)
  (#offset! @injection.language 0 2 0 0)
  (#offset! @injection.content 1 2 0 0)
)
