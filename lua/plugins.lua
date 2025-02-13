return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "lua", "vim" },
                highlight = { enable = true },
            })
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
	{
        "neovim/nvim-lspconfig",
        dependencies = {
            -- LSP Support
            "folke/neodev.nvim",     -- for lua development
            "williamboman/mason.nvim", -- Optional
            "williamboman/mason-lspconfig.nvim", -- Optional
        },
        config = function()
            -- Setup Mason if you want it (optional)
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls" }
            })

            -- Setup neodev for better Lua development
            require("neodev").setup()

            local lspconfig = require("lspconfig")

            -- Lua LSP configuration
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- TypeScript LSP configuration
            lspconfig.ts_ls.setup({
                settings = {
                    typescript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        }
                    },
                    javascript = {
                        inlayHints = {
                            includeInlayParameterNameHints = 'all',
                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                            includeInlayFunctionParameterTypeHints = true,
                            includeInlayVariableTypeHints = true,
                            includeInlayPropertyDeclarationTypeHints = true,
                            includeInlayFunctionLikeReturnTypeHints = true,
                            includeInlayEnumMemberValueHints = true,
                        }
                    }
                }
            })
        end
    },
	{
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',    -- LSP source for nvim-cmp
            'hrsh7th/cmp-buffer',      -- Buffer completions
            'hrsh7th/cmp-path',        -- Path completions
            'saadparwaiz1/cmp_luasnip', -- Snippets source
            'L3MON4D3/LuaSnip',        -- Snippets engine
        },
        config = function()
            require("config.completion").setup()
        end
    },
	{
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
				suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 150,      -- Increase this to reduce frequency of suggestions
                keymap = {
                    accept = "<C-y>",  -- Changed to Alt+j to avoid conflicts
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                -- Disable for certain filetypes to reduce triggers
                markdown = false,
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = true,
            },
            copilot_node_command = 'node', -- Specify node version
            server_opts_overrides = {
                trace = "off",             -- Reduce server logging
                advanced = {
                    listCount = 3,         -- Reduce number of suggestions
                    inlineSuggestCount = 3,-- Reduce number of inline suggestions
                }
			}
          })
        end,
    },
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional, for file icons
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
        })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            window = {
                width = 30,
            },
        })
        vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = "Toggle file explorer" })
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                numbers = "none", -- can be "none" | "ordinal" | "buffer_id" | "both"
                close_command = "bdelete! %d",       -- can be a string | function
                right_mouse_command = "bdelete! %d", -- can be a string | function
                left_mouse_command = "buffer %d",    -- can be a string | function
                middle_mouse_command = nil,          -- can be a string | function
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'icon',
                },
                buffer_close_icon = '󰅖',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count)
                    return "("..count..")"
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                },
                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = true,
                separator_style = "thin",
                always_show_bufferline = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
            }
        })
    end
  },
  'kdheepak/lazygit.nvim',
  {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
      opts = {
          -- add any opts here
          -- for example
          provider = "claude",
          openai = {
              endpoint = "https://api.anthropic.com",
              model = "claude-3-5-haiku-20241022", -- your desired model (or use gpt-4o, etc.)
              timeout = 30000, -- timeout in milliseconds
              temperature = 0, -- adjust if needed
              max_tokens = 4096,
          },
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
          "stevearc/dressing.nvim",
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          --- The below dependencies are optional,
          "echasnovski/mini.pick", -- for file_selector provider mini.pick
          "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
          "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
          "ibhagwan/fzf-lua", -- for file_selector provider fzf
          "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
          "zbirenbaum/copilot.lua", -- for providers='copilot'
          {
              -- support for image pasting
              "HakonHarnes/img-clip.nvim",
              event = "VeryLazy",
              opts = {
                  -- recommended settings
                  default = {
                      embed_image_as_base64 = false,
                      prompt_for_file_name = false,
                      drag_and_drop = {
                          insert_mode = true,
                      },
                      -- required for Windows users
                      use_absolute_path = true,
                  },
              },
          },
          {
              -- Make sure to set this up properly if you have lazy=true
              'MeanderingProgrammer/render-markdown.nvim',
              opts = {
                  file_types = { "markdown", "Avante" },
              },
              ft = { "markdown", "Avante" },
          },
      },
  }
}
