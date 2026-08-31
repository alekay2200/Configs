return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require "custom.configs.treesitter"
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
        ensure_installed = require "custom.configs.mason-lspconfig",
        automatic_enable = true,
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      local function on_attach(bufnr)
        local api = require("nvim-tree.api")
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
      end

      require("nvim-tree").setup({
          on_attach = on_attach,
          sort = {
              sorter = "case_sensitive",
          },
          view = {
              width = vim.o.columns,
              side = 'left',
          },
          renderer = {
              group_empty = false,
          },
          filters = {
              dotfiles = false,
          },
          actions = {
              open_file = {
                  quit_on_open = true
              }
          },
      })
    end
  },

  -- LazyGit --
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      {"<leader>g", "<cmd>LazyGit<cr>", desc = "Open Lazy git"}
    },

    config = function()
      vim.g.lazygit_floating_window_use_plenary = 0
      vim.g.lazygit_floating_window_scaling_factor = 1.0
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_border_chars = {'', '', '', '', '', '', '', ''}

      -- Called from lazygit (via `os.edit`/`os.editAtLine` in lazygit's config.yml,
      -- through `nvim --remote-expr`) so files open in the window/buffer that was
      -- active before lazygit's floating window took over, instead of inside that
      -- (minimal-style) floating window itself. Closes the lazygit float and kills
      -- its job first, mirroring lazygit.nvim's own on_exit cleanup, so the plugin's
      -- state stays consistent and <leader>g works normally afterwards.
      _G.lazygit_open_file = function(filename, line)
        do
          local log = io.open(vim.fn.expand("~/lazygit_debug.log"), "a")
          if log then
            log:write(string.format(
              "[%s] filename=%q line=%s cwd=%s exists=%s\n",
              os.date("%H:%M:%S"), tostring(filename), tostring(line),
              vim.fn.getcwd(), tostring(vim.fn.filereadable(filename) == 1)
            ))
            log:close()
          end
        end
        local ok, err = pcall(function()
          local lazygit_buf = _G.LAZYGIT_BUFFER
          local lazygit_win = lazygit_buf and vim.fn.bufwinid(lazygit_buf) or -1

          local target_win = vim.fn.win_getid(vim.fn.winnr('#'))
          if target_win == 0 or target_win == lazygit_win then
            target_win = nil
            for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              if w ~= lazygit_win and vim.api.nvim_win_get_config(w).relative == "" then
                target_win = w
                break
              end
            end
          end

          if lazygit_win ~= -1 and vim.api.nvim_win_is_valid(lazygit_win) then
            vim.api.nvim_win_close(lazygit_win, true)
          end
          if lazygit_buf and vim.api.nvim_buf_is_valid(lazygit_buf) then
            local job_id = vim.b[lazygit_buf].terminal_job_id
            if job_id then
              vim.fn.jobstop(job_id)
            end
            vim.api.nvim_buf_delete(lazygit_buf, { force = true })
          end
          _G.LAZYGIT_BUFFER = nil
          _G.LAZYGIT_LOADED = false
          vim.g.lazygit_opened = 0

          if not target_win then
            vim.cmd("vsplit")
            target_win = vim.api.nvim_get_current_win()
          end

          vim.api.nvim_set_current_win(target_win)
          vim.cmd("edit " .. vim.fn.fnameescape(filename))
          if line and tonumber(line) then
            pcall(vim.api.nvim_win_set_cursor, 0, { tonumber(line), 0 })
          end
        end)

        if not ok then
          local log = io.open(vim.fn.expand("~/lazygit_debug.log"), "a")
          if log then
            log:write(string.format("[%s] ERROR: %s\n", os.date("%H:%M:%S"), tostring(err)))
            log:close()
          end
        end
      end
    end
  },

  -- Git-conflict --
  {
    'akinsho/git-conflict.nvim',
    dependencies = {
        'yorickpeterse/nvim-pqf'
    },
    lazy = false,
    version = "*",
    config = function()
        require('pqf').setup()
        require("git-conflict").setup({
          default_mappings = {
            ours = 'o',
            theirs = 't',
            none = '0',
            both = 'b',
            next = 'n',
            prev = 'p',
          },
            default_commands = true,    -- disable commands created by this plugin
            disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
            list_opener = 'copen',      -- command or function to open the conflicts list
            highlights = {              -- They must have background color, otherwise the default color will be used
                incoming = 'DiffAdd',
                current  = 'DiffText',
            },
        })

        -- vim.keymap.set('n', '<leader>gc', ':GitConflictRefresh<CR>', {noremap = true, silent = true})
        -- vim.keymap.set('n', '<leader>gq', ':GitConflictQf<CR>', {noremap = true, silent = true})

        vim.api.nvim_create_autocmd('User', {
            pattern = 'GitConflictDetected',
            callback = function()
                vim.notify('Conflict detected in file ' .. vim.api.nvim_buf_get_name(0))
                vim.cmd('LspStop')
            end
        })

        vim.api.nvim_create_autocmd('User', {
            pattern = 'GitConflictResolved',
            callback = function()
                vim.cmd('LspRestart')
            end
        })
    end
  },

  -- Spectre search and repalce plugin
  {
    "nvim-pack/nvim-spectre",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("spectre").setup({
        live_update = true
      })
    end
  },

  -- Multicursors Plugin
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-e>"] = cmp.mapping.abort(), -- close dialog
          ["<CR>"] = cmp.mapping.confirm( { select = false } ),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  {
    "vinnymeller/swagger-preview.nvim",
    cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
    build = "npm i",
    config = true,
  },

  {
    "mfussenegger/nvim-dap",
    -- event = "VeryLazy",
    lazhy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
      -- "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local mason_dap = require("mason-nvim-dap")
      local dap = require("dap")
      local ui = require("dapui")

      mason_dap.setup({
        ensure_installed = { "codelldb", "debugpy", "delve" },
        automatic_installation = true,
        handlers = {
          function(config)
            mason_dap.default_setup(config)
          end,

          delve = function()
            dap.adapters.go = {
              type = "server",
              port = "${port}",
              executable = {
                command = vim.fn.exepath("dlv"),
                args = {
                  "dap",
                  "-l",
                  "127.0.0.1:${port}",
                  "--check-go-version=false",
                },
              },
            }

            dap.configurations.go = {
              {
                type = "go",
                name = "Debug",
                request = "launch",
                program = "${file}",
                console = "integratedTerminal",
              },
            }
          end,
        },
      })

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.c = {
        {
          name = "Debug C",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input(
              "Path to executable: ",
              vim.fn.getcwd() .. "/a.out",
              "file"
            )
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          console = "internalConsole", -- ✅ stdout a dap-ui console
        },
      }

      dap.configurations.cpp = dap.configurations.c

      -- Dap UI
      ui.setup()
      vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

      dap.listeners.before.attach.dapui_config           = function() ui.open()  end
      dap.listeners.before.launch.dapui_config           = function() ui.open()  end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config     = function() ui.close() end
    end,
  },

  -- AstroJS tree-sitter plugin
  {
    "virchau13/tree-sitter-astro",
    lazy = true,
    ft = {
      "astro",
    },
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "astro",
      "vue",
      "svelte",
    },
    lazy = true,
    config = function()
      require("nvim-ts-autotag").setup()
    end
  }
}
