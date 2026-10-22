require "nvchad.options"

local opt = vim.opt

-- Mostrar espacios y tabs
opt.list = true
opt.encoding = "utf-8"
-- opt.listchars = { lead = '·', tab = '» ' }

-- Tabs / Indentacion
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- Cursor
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
