local icon_pack = require("themes.icons")

local function feline_dharmx()
    local present, feline = pcall(require, "feline")
    if not present then return end
    
    -- Customizations {{{
    local theme = {
      aqua = "#7AB0DF",
      bg = "#1C212A",
      blue = "#5FB0FC",
      cyan = "#70C0BA",
      darkred = "#FB7373",
      fg = "#C7C7CA",
      gray = "#222730",
      green = "#79DCAA",
      lime = "#54CED6",
      orange = "#FFD064",
      pink = "#D997C8",
      purple = "#C397D8",
      red = "#F87070",
      yellow = "#FFE59E"
    }
    
    local mode_theme = {
      ["NORMAL"] = theme.green,
      ["OP"] = theme.cyan,
      ["INSERT"] = theme.aqua,
      ["VISUAL"] = theme.yellow,
      ["LINES"] = theme.darkred,
      ["BLOCK"] = theme.orange,
      ["REPLACE"] = theme.purple,
      ["V-REPLACE"] = theme.pink,
      ["ENTER"] = theme.pink,
      ["MORE"] = theme.pink,
      ["SELECT"] = theme.darkred,
      ["SHELL"] = theme.cyan,
      ["TERM"] = theme.lime,
      ["NONE"] = theme.gray,
      ["COMMAND"] = theme.blue,
    }
    
    local modes = setmetatable({
      ["n"] = "N",
      ["no"] = "N",
      ["v"] = "V",
      ["V"] = "VL",
      [""] = "VB",
      ["s"] = "S",
      ["S"] = "SL",
      [""] = "SB",
      ["i"] = "I",
      ["ic"] = "I",
      ["R"] = "R",
      ["Rv"] = "VR",
      ["c"] = "C",
      ["cv"] = "EX",
      ["ce"] = "X",
      ["r"] = "P",
      ["rm"] = "M",
      ["r?"] = "C",
      ["!"] = "SH",
      ["t"] = "T",
    }, { __index = function() return "-" end })
    -- }}}
    
    -- Components {{{
    local component = {}
    
    component.vim_mode = {
      provider = function() return modes[vim.api.nvim_get_mode().mode] end,
      hl = function()
        return {
          fg = "bg",
          bg = require("feline.providers.vi_mode").get_mode_color(),
          style = "bold",
          name = "NeovimModeHLColor",
        }
      end,
      left_sep = "block",
      right_sep = "block",
    }
    
    component.git_branch = {
      provider = "git_branch",
      hl = {
        fg = "fg",
        bg = "bg",
        style = "bold",
      },
      left_sep = "block",
      right_sep = "",
    }
    
    component.git_add = {
      provider = "git_diff_added",
      hl = {
        fg = "green",
        bg = "bg",
      },
      left_sep = "",
      right_sep = "",
    }
    
    component.git_delete = {
      provider = "git_diff_removed",
      hl = {
        fg = "red",
        bg = "bg",
      },
      left_sep = "",
      right_sep = "",
    }
    
    component.git_change = {
      provider = "git_diff_changed",
      hl = {
        fg = "purple",
        bg = "bg",
      },
      left_sep = "",
      right_sep = "",
    }
    
    component.separator = {
      provider = "",
      hl = {
        fg = "bg",
        bg = "bg",
      },
    }
    
    component.diagnostic_errors = {
      provider = "diagnostic_errors",
      hl = {
        fg = "red",
      },
    }
    
    component.diagnostic_warnings = {
      provider = "diagnostic_warnings",
      hl = {
        fg = "yellow",
      },
    }
    
    component.diagnostic_hints = {
      provider = "diagnostic_hints",
      hl = {
        fg = "aqua",
      },
    }
    
    component.diagnostic_info = {
      provider = "diagnostic_info",
    }
    
    component.lsp = {
      provider = function()
        if not rawget(vim, "lsp") then
          return ""
        end
    
        local progress = vim.lsp.util.get_progress_messages()[1]
        if vim.o.columns < 120 then
          return ""
        end
    
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients ~= 0 then
          if progress then
            local spinners = {
              "◜ ",
              "◠ ",
              "◝ ",
              "◞ ",
              "◡ ",
              "◟ ",
            }
            local ms = vim.loop.hrtime() / 1000000
            local frame = math.floor(ms / 120) % #spinners
            local content = string.format("%%<%s", spinners[frame + 1])
            return content or ""
          else
            return "לּ LSP"
          end
        end
        return ""
      end,
      hl = function()
        local progress = vim.lsp.util.get_progress_messages()[1]
        return {
          fg = progress and "yellow" or "green",
          bg = "gray",
          style = "bold",
        }
      end,
      left_sep = "",
      right_sep = "block",
    }
   
    component.fileinfo = {
      provider = { name = "file_info", opts = { type = "relative-short" } },
    }

    component.file_type = {
      provider = {
        name = "file_type",
        opts = {
          filetype_icon = true,
        },
      },
      hl = {
        fg = "fg",
        bg = "gray",
      },
      left_sep = "block",
      right_sep = "block",
    }
    
    component.scroll_bar = {
      provider = function()
        local chars = setmetatable({
          " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
          " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
        }, { __index = function() return " " end })
        local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
        local position = math.floor(line_ratio * 100)
    
        local icon = chars[math.floor(line_ratio * #chars)] .. position
        if position <= 5 then
          icon = " TOP"
        elseif position >= 95 then
          icon = " BOT"
        end
        return icon
      end,
      hl = function()
        local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
        local fg
        local style
    
        if position <= 5 then
          fg = "aqua"
          style = "bold"
        elseif position >= 95 then
          fg = "red"
          style = "bold"
        else
          fg = "purple"
          style = nil
        end
        return {
          fg = fg,
          style = style,
          bg = "bg",
        }
      end,
      left_sep = "block",
      right_sep = "block",
    }
    -- }}}
    
    -- Arrangements -- {{{
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
    feline.setup({
      components = {
        active = {
          {}, -- left
          {}, -- middle
          {   -- right
            component.vim_mode,
            component.file_type,
            component.lsp,
            component.git_branch,
            component.git_add,
            component.git_delete,
            component.git_change,
            component.separator,
            component.diagnostic_errors,
            component.diagnostic_warnings,
            component.diagnostic_info,
            component.diagnostic_hints,
            component.scroll_bar,
          },
        },
      },
      theme = theme,
      vi_mode_colors = mode_theme,
    })
    -- }}}
end

local function feline_catppuccin()
    local latte = require("catppuccin.palettes").get_palette "latte"
    local clrs = require("catppuccin.palettes").get_palette()
    local ctp_feline = require('catppuccin.groups.integrations.feline')
    local U = require "catppuccin.utils.colors"

    ctp_feline.setup({
        assets = {
            left_separator = "",
            right_separator = "",
            mode_icon = "",
            dir = "󰉖",
            file = "󰈙",
            lsp = {
                server = "󰅡",
                error = "",
                warning = "",
                info = "",
                hint = "",
            },
            git = {
                branch = "",
                added = "",
                changed = "",
                removed = "",
            },
        },
        sett = {
            text = U.vary_color({ latte = latte.base }, clrs.surface0),
            bkg = U.vary_color({ latte = latte.crust }, clrs.surface0),
            diffs = clrs.mauve,
            extras = clrs.overlay1,
            curr_file = clrs.maroon,
            curr_dir = clrs.flamingo,
            show_modified = true -- show if the file has been modified
        },
        vim_mode = {
            provider = function() return modes[vim.api.nvim_get_mode().mode] end,
            hl = function()
                return {
                fg = "bg",
                bg = require("feline.providers.vi_mode").get_mode_color(),
                style = "bold",
                name = "NeovimModeHLColor",
                }
            end,
            left_sep = "block",
            right_sep = "block",
        },
        mode_colors = {
            ["n"] = { "NORMAL", clrs.lavender },
            ["no"] = { "N-PENDING", clrs.lavender },
            ["i"] = { "INSERT", clrs.green },
            ["ic"] = { "INSERT", clrs.green },
            ["t"] = { "TERMINAL", clrs.green },
            ["v"] = { "VISUAL", clrs.flamingo },
            ["V"] = { "V-LINE", clrs.flamingo },
            ["�"] = { "V-BLOCK", clrs.flamingo },
            ["R"] = { "REPLACE", clrs.maroon },
            ["Rv"] = { "V-REPLACE", clrs.maroon },
            ["s"] = { "SELECT", clrs.maroon },
            ["S"] = { "S-LINE", clrs.maroon },
            ["�"] = { "S-BLOCK", clrs.maroon },
            ["c"] = { "COMMAND", clrs.peach },
            ["cv"] = { "COMMAND", clrs.peach },
            ["ce"] = { "COMMAND", clrs.peach },
            ["r"] = { "PROMPT", clrs.teal },
            ["rm"] = { "MORE", clrs.teal },
            ["r?"] = { "CONFIRM", clrs.mauve },
            ["!"] = { "SHELL", clrs.green },
        }
    })

    local feline = require("feline")

    -- feline.winbar.setup({})
    -- feline.statuscolumn.setup()

    feline.setup({
        components = ctp_feline.get(),
    })
end

local function default()
    local ctp_feline = require('catppuccin.groups.integrations.feline')
    ctp_feline.setup({})
    require("feline").setup({
        components = ctp_feline.get(),
    })
end

local function feline_Hitesh_Aggarwal()
  local line_ok, feline = pcall(require, "feline")
  if not line_ok then
    return
  end

  local one_monokai = {
    fg = "#abb2bf",
    bg = "#1e2024",
    green = "#98c379",
    yellow = "#e5c07b",
    purple = "#c678dd",
    orange = "#d19a66",
    peanut = "#f6d5a4",
    red = "#e06c75",
    aqua = "#61afef",
    darkblue = "#282c34",
    dark_red = "#f75f5f",
  }

  local vi_mode_colors = {
    NORMAL = "green",
    OP = "green",
    INSERT = "yellow",
    VISUAL = "purple",
    LINES = "orange",
    BLOCK = "dark_red",
    REPLACE = "red",
    COMMAND = "aqua",
  }

  local c = {
    vim_mode = {
      provider = {
        name = "vi_mode",
        opts = {
          show_mode_name = true,
          -- padding = "center", -- Uncomment for extra padding.
        },
      },
      hl = function()
        return {
          fg = require("feline.providers.vi_mode").get_mode_color(),
          bg = "darkblue",
          style = "bold",
          name = "NeovimModeHLColor",
        }
      end,
      left_sep = "block",
      right_sep = "block",
    },
    gitBranch = {
      provider = "git_branch",
      hl = {
        fg = "peanut",
        bg = "darkblue",
        style = "bold",
      },
      left_sep = "block",
      right_sep = "block",
    },
    gitDiffAdded = {
      provider = "git_diff_added",
      hl = {
        fg = "green",
        bg = "darkblue",
      },
      left_sep = "block",
      right_sep = "block",
    },
    gitDiffRemoved = {
      provider = "git_diff_removed",
      hl = {
        fg = "red",
        bg = "darkblue",
      },
      left_sep = "block",
      right_sep = "block",
    },
    gitDiffChanged = {
      provider = "git_diff_changed",
      hl = {
        fg = "fg",
        bg = "darkblue",
      },
      left_sep = "block",
      right_sep = "right_filled",
    },
    separator = {
      provider = "",
    },
    fileinfo = {
      provider = {
        name = "file_info",
        opts = {
          type = "relative",
        },
      },
      hl = {
        style = "bold",
      },
      left_sep = " ",
      right_sep = " ",
    },
    diagnostic_errors = {
      provider = "diagnostic_errors",
      hl = {
        fg = "red",
      },
    },
    diagnostic_warnings = {
      provider = "diagnostic_warnings",
      hl = {
        fg = "yellow",
      },
    },
    diagnostic_hints = {
      provider = "diagnostic_hints",
      hl = {
        fg = "aqua",
      },
    },
    diagnostic_info = {
      provider = "diagnostic_info",
    },
    lsp_client_names = {
      provider = "lsp_client_names",
      hl = {
        fg = "purple",
        bg = "darkblue",
        style = "bold",
      },
      left_sep = "left_filled",
      right_sep = "block",
    },
    file_type = {
      provider = {
        name = "file_type",
        opts = {
          filetype_icon = true,
          case = "titlecase",
        },
      },
      hl = {
        fg = "red",
        bg = "darkblue",
        style = "bold",
      },
      left_sep = "block",
      right_sep = "block",
    },
    file_encoding = {
      provider = "file_encoding",
      hl = {
        fg = "orange",
        bg = "darkblue",
        style = "italic",
      },
      left_sep = "block",
      right_sep = "block",
    },
    position = {
      provider = "position",
      hl = {
        fg = "green",
        bg = "darkblue",
        style = "bold",
      },
      left_sep = "block",
      right_sep = "block",
    },
    line_percentage = {
      provider = "line_percentage",
      hl = {
        fg = "aqua",
        bg = "darkblue",
        style = "bold",
      },
      left_sep = "block",
      right_sep = "block",
    },
    scroll_bar = {
      provider = "scroll_bar",
      hl = {
        fg = "yellow",
        style = "bold",
      },
    },
  }

  local left = {
    c.vim_mode,
    c.gitBranch,
    c.gitDiffAdded,
    c.gitDiffRemoved,
    c.gitDiffChanged,
    c.separator,
  }

  local middle = {
    c.fileinfo,
    c.diagnostic_errors,
    c.diagnostic_warnings,
    c.diagnostic_info,
    c.diagnostic_hints,
  }

  local right = {
    c.lsp_client_names,
    c.file_type,
    c.file_encoding,
    c.position,
    c.line_percentage,
    c.scroll_bar,
  }

  local components = {
    active = {
      left,
      middle,
      right,
    },
    inactive = {
      left,
      middle,
      right,
    },
  }

  feline.setup({
    components = components,
    theme = one_monokai,
    vi_mode_colors = vi_mode_colors,
  })
end

return {
  "freddiehaddad/feline.nvim",
  lazy = false,
  dependencies = {
    "gitsigns.nvim",
    icon_pack
  },
  config = feline_Hitesh_Aggarwal
}
