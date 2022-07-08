local M = {}


-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onedark",
}

M.plugins = {
  status = {
    dashboard = true, -- on open show dashboard
  }
}


-- import custom mappings
M.mappings = require "custom.mappings"

return M
