local options = {
  clipboard = "unnamedplus",                -- access to system clipboard
  tabstop = 2,                              -- insert 2 spaces for a tab
  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- number of spaces inserted for each indentation
  number = true,                            -- set numbered lines 
  relativenumber = true,                    -- set relative numbered lines
  numberwidth = 4,                          -- set number column width to 4
  signcolumn = "yes",                       -- always show the sign column
  scrolloff = 8,                            -- scroll 8 lines before
  sidescrolloff = 8,
  showmode = true,                         -- don't show mode
  fileencoding = "utf-8",                   -- set file encoding to UTF-8
  hlsearch = true,                          -- highlight search
  ignorecase = true,                        -- ignore case in search patterns
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smarter again
  completeopt = { "menuone", "noselect"},   -- don't default select complete option 
  splitbelow = true,                        -- force all horizontal splites to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  updatetime = 300,                         -- faster completion
  showtabline = 2,                          -- always show tabline
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
