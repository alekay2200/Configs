local opt = vim.opt
local fn = vim.fn
local bo = vim.bo
local api = vim.api
local diagnostic = vim.diagnostic
local o = vim.o
local cmd = vim.cmd

opt.list = true
opt.encoding = "utf-8"


-- opt.listchars = { lead = '•', tab = '» ' }
opt.listchars = { lead = '·', tab = '» ' }

-- Tabs / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true

-- -- Use tabs in go files
-- api.nvim_create_autocmd("FileType", {
--     pattern = "go",
--     callback = function()
--         opt.expandtab = false
--     end,
-- })

-- Cursor
opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"

-- Diagnostics --
-- To disable inline text, and do a diagnostic window on hover
diagnostic.config({
  virtual_text = false
})

-- Show line diagnostics automatically in hover window
o.updatetime = 250
cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


-- Breackpoint
api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "prevent colorscheme clears self-defined DAP icon colors.",
	callback = function()
		api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#c4751a' })
		api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
		api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
	end
})
fn.sign_define('DapBreakpoint', {text='', texthl='red', linehl='DapBreakpoint', numhl='DapBreakpoint'})

-- Set expandtab to false to some filetypes: go, makefile
api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*",
    callback = function()
      if bo.filetype == "go" then
        opt.expandtab = false
      elseif bo.filetype == "make" then
        opt.expandtab = false
      else
        opt.expandtab = true
      end
    end
})
