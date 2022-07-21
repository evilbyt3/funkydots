local M = {}

M.latex = {
  n = {
    ["<leader>cc"] = {":w! | !compiler '%' <CR>", "Compile doc (groff, LaTeX, markdown, etc)"},
    ["<leader>pp"] = {":!opout '%' <CR><CR>", "Open corresponding .pdf/.html or preview"}
  }
}

return M
