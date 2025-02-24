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

function _M.get_active_pyenv_env()
  local pyenv_root = os.getenv("PYENV_ROOT") or os.getenv("HOME") .. "/.pyenv"
  local pyenv_exists = vim.fn.isdirectory(pyenv_root) == 1
  if not pyenv_exists then
    return nil
  end
  local handle = io.popen(pyenv_root .. "/bin/pyenv version-name 2>/dev/null")
  if not handle then
    return nil
  end
  local env_name = handle:read("*a"):gsub("%s+", "") -- Remove trailing whitespace
  handle:close()
  return env_name ~= "" and env_name or nil
end

return _M
