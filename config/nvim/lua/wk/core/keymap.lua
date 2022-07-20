local err = require("wk.core.log").err
local DEFAULT_OPTS = { noremap = true }
local M = {}

local function validate(input, exec)
	vim.validate({
		input = {input, 'string'},
		exec = {exec, {'string', 'function'}}
	})
end

local function merge_opts(opts)
  if opts and type(opts) == 'table' then
    opts = vim.tbl_extend('force', DEFAULT_OPTS, opts)
  else
    opts = DEFAULT_OPTS
  end

  return opts
end

local function mapper(mode, input, exec, opts)
  local ok, errmsg = pcall(validate, input, exec)

  if not ok then
    err(errmsg)
    return
  end

  opts = merge_opts(opts)
                       
  if opts.bufnr then
    local bufnr = opts.bufnr
    opts.bufnr = nil

    ok, errmsg = pcall(vim.keymap.set, mode, input, exec, vim.tbl_extend('force', { buffer = bufnr }, opts))

    if not ok then
      err(errmsg)
    end
  else
    ok, errmsg = pcall(vim.keymap.set, mode, input, exec, opts)

    if not ok then
      err(errmsg)
    end
  end
end


function M.map(input, exec, opts)
  mapper('', input, exec, opts)
end

function M.nmap(input, exec, opts)
  mapper('n', input, exec, opts)
end

function M.imap(input, exec, opts)
  mapper('i', input, exec, opts)
end

function M.vmap(input, exec, opts)
  mapper('v', input, exec, opts)
end

function M.tmap(input, exec, opts)
  mapper('t', input, exec, opts)
end


return M
