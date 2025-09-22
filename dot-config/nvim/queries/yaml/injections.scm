; the offset predicates are needed to skip the '|' or '>' which
; otherwise gets passed to the formatter for the injected
; content.
;
; TODO: if possible also account for newline stripping and indentation.
;       see: https://yaml-multiline.info
;
; NOTE: queries below formatted using: https://topiary.tweag.io/playground/

; inject bash into multiline yaml
(block_node
  (block_mapping
    (block_mapping_pair
      key: (flow_node) @key
      (#match? @key "\.sh$")
      value: (block_node
        (block_scalar) @injection.content
      )
      (#offset! @injection.content 0 1 0 0)
      (#set! injection.language "bash")
    )
  )
)

; inject json into multiline yaml
(block_node
  (block_mapping
    (block_mapping_pair
      key: (flow_node) @key
      (#match? @key "\.json$")
      value: (block_node
        (block_scalar) @injection.content
      )
      (#offset! @injection.content 0 1 0 0)
      (#set! injection.language "json")
    )
  )
)

; inject yaml into multiline yaml
(block_node
  (block_mapping
    (block_mapping_pair
      key: (flow_node) @key
      (#match? @key "\.ya?ml$")
      value: (block_node
        (block_scalar) @injection.content
      )
      (#offset! @injection.content 0 1 0 0)
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
        (block_scalar) @injection.content
      )
      (#match? @injection.content "\\{\\{.+\\}\\}")
      (#offset! @injection.content 0 1 0 0)
      (#set! injection.language "helm")
    )
  )
)

; inject Lua into ArgoCD yaml containing resource health checks
(block_node
  (block_mapping
    (block_mapping_pair
      key: (flow_node) @kind
      (#eq? @kind "kind")
      value: (flow_node) @argocd
      (#eq? @argocd "ArgoCD")
    )
    (block_mapping_pair
      key: (flow_node) @spec
      (#eq? @spec "spec")
      value: (block_node
        (block_mapping
          (block_mapping_pair
            key: (flow_node) @resource_hc
            (#eq? @resource_hc "resourceHealthChecks")
            value: (block_node
              (block_sequence
                (block_sequence_item
                  (block_node
                    (block_mapping
                      (block_mapping_pair
                        key: (flow_node) @check
                        (#eq? @check "check")
                        value: (block_node
                          (block_scalar) @injection.content
                        )
                        (#offset! @injection.content 0 1 0 0)
                        (#set! injection.language "lua")
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
)

; inject YAML into ArgoCD yaml containing resource exclusions
(block_node
  (block_mapping
    (block_mapping_pair
      key: (flow_node) @kind
      (#eq? @kind "kind")
      value: (flow_node) @argocd
      (#eq? @argocd "ArgoCD")
    )
    (block_mapping_pair
      key: (flow_node) @spec
      (#eq? @spec "spec")
      value: (block_node
        (block_mapping
          (block_mapping_pair
            key: (flow_node) @resource_ex
            (#eq? @resource_ex "resourceExclusions")
            value: (block_node
              (block_scalar) @injection.content
              (#offset! @injection.content 0 1 0 0)
              (#set! injection.language "yaml")
            )
          )
        )
      )
    )
  )
)

