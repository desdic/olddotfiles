local packer_path = vim.fn.stdpath("data") ..
                        "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system({
        "git", "clone", "https://github.com/wbthomason/packer.nvim", packer_path
    })
    print("Installing packer, close and reopen ...")
end
vim.cmd("packadd packer.nvim")

vim.cmd([[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("Unable to require packer")
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end
    }
})

return packer.startup({
    function(use)
        -- speed up filetype detection
        use({"nathom/filetype.nvim"})
        use({"luukvbaal/stabilize.nvim"})
        use({"wbthomason/packer.nvim", opt = true})

        use({"p00f/nvim-ts-rainbow"})

        use({
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "nvim-treesitter/nvim-treesitter-refactor",
                "nvim-treesitter/nvim-treesitter-textobjects",
                "windwp/nvim-ts-autotag"
            },
            run = ":TSUpdate"
        })

        use({"ggandor/lightspeed.nvim"})
        use({"honza/vim-snippets"})
        use({"golang/vscode-go"})
        use({"rafamadriz/friendly-snippets"})
        use({"gpanders/editorconfig.nvim"})
        use({"Vimjas/vim-python-pep8-indent"})
        use({"numToStr/Comment.nvim"})
        use({"beauwilliams/focus.nvim"})

        use({"christianchiarulli/nvcode-color-schemes.vim"})
        use({"catppuccin/nvim"})
        use({
            "nvim-lualine/lualine.nvim",
            requires = {"kyazdani42/nvim-web-devicons", opt = true},
            config = function() require("config.evil_lualine") end
        })

        use({"akinsho/nvim-bufferline.lua"})

        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require("nvim-tree").setup({}) end
        })

        use({"neovim/nvim-lspconfig"})
        use({"williamboman/nvim-lsp-installer"})
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = {"nvim-lua/plenary.nvim"},
            run = {
                "go install github.com/daixiang0/gci@latest",
                "go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest",
                "go install golang.org/x/tools/cmd/goimports@latest"
            }
        })
        use({"onsails/lspkind-nvim"})
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-fzy-native.nvim",
                "nvim-telescope/telescope-media-files.nvim"
            }
        })

        use({"ray-x/lsp_signature.nvim"})
        use({"rcarriga/nvim-notify"})
        use({"kshenoy/vim-signature"})
        use({"lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim"})
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/vim-vsnip", "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-path", "hrsh7th/cmp-calc", "hrsh7th/cmp-vsnip"
            },
            after = "lspkind-nvim",
            config = function()
                require("cmp_nvim_lsp").setup()
                local cmp = require("cmp")
                local lspkind = require("lspkind")
                local compare = require("cmp.config.compare")
                local i = require("config.icons")

                cmp.setup({
                    preselect = false,
                    snippet = {
                        expand = function(args)
                            -- You must install `vim-vsnip` if you use the following as-is.
                            vim.fn["vsnip#anonymous"](args.body)
                        end
                    },
                    formatting = {
                        format = lspkind.cmp_format({
                            with_text = true,
                            symbol_map = i.symbol_map,
                            menu = {
                                buffer = "[buf]",
                                nvim_lsp = "[LSP]",
                                nvim_lua = "[api]",
                                path = "[path]",
                                calc = "[calc]",
                                vsnip = "[vsnip]"
                            }
                        })
                    },
                    sorting = {
                        priority_weight = 2.,
                        comparators = {
                            compare.offset, compare.exact, compare.score,
                            compare.kind, compare.sort_text, compare.length,
                            compare.order
                        }
                    },
                    min_length = 0, -- allow for `from package import _` in Python
                    mapping = {
                        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                        ["<Tab>"] = cmp.mapping.select_next_item(),
                        ["<C-k>"] = cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Insert,
                            select = true
                        }),
                        ["<CR>"] = cmp.mapping.confirm({
                            behavior = cmp.ConfirmBehavior.Replace,
                            select = true
                        })
                    },
                    sources = {
                        {name = "nvim_lsp"}, {name = "nvim_lua"},
                        {name = "path"}, {name = "vsnip"},
                        {name = "buffer", keyword_length = 3}, {name = "calc"}
                    }
                })
            end
        })

        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("nvim-autopairs").setup({map_cr = true})
                local cmp_autopairs = require("nvim-autopairs.completion.cmp")
                local cmp = require("cmp")
                cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done(
                                 {map_char = {tex = ""}}))
            end
        })
    end,
    config = {python_cmd = "python3"}
})
