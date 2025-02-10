local _, inspect = pcall(require, "inspect")

local _M = {}

function _M.inspect(...)
  if inspect then
    print(inspect(...))
  else
    print(...)
  end
end

function _M.write_to_file(filename, content)
  local file = io.open(filename, "w")
  if file then
    file:write(content)
    file:close()
  else
    error("Could not open file: " .. filename)
  end
end

function _M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function _M.nmap(lhs, rhs, opts)
  _M.map("n", lhs, rhs, opts)
end

function _M.get_mason_package_install_path(package_name)
  local mason_registry = require("mason-registry")
  local package = mason_registry.get_package(package_name)
  return package:get_install_path()
end

return _M
