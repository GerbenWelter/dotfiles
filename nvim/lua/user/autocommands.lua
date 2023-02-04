vim.cmd([[
  augroup _yaml
      autocmd!
      autocmd BufEnter,BufWinEnter *.yaml set filetype=yaml.ansible ts=2 sts=2 sw=2 expandtab indentexpr=GetAnsibleIndent()
      autocmd BufEnter,BufWinEnter *.yml set filetype=yaml.ansible ts=2 sts=2 sw=2 expandtab indentexpr=GetAnsibleIndent()
      autocmd BufEnter,BufWinEnter *.yaml.j2 set filetype=ruby.jinja2 ts=2 sts=2 sw=2 expandtab
      autocmd BufEnter,BufWinEnter *.yml.j2 set filetype=ruby.jinja2 ts=2 sts=2 sw=2 expandtab
  augroup end

  autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup END

]])
