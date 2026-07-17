;; syntax highlight jq queries
(command
  name: (command_name) @cmd
  (#eq? @cmd "jq")
  argument: (raw_string) @injection.content
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "jq")
)
