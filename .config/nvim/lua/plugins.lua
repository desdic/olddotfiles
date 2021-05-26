-- Automatically install packer.nvim at bootstrapping
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

-- run :PackerCompile when plugins.lua is updated
vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

local packer = require('packer')

--- Check if a file or directory exists in this path
 local function require_plugin(plugin)
     local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

     local plugin_path = plugin_prefix .. plugin .. "/"
     --▸ print('test '..plugin_path)
     local ok, err, code = os.rename(plugin_path, plugin_path)
     if not ok then
         if code == 13 then
             -- Permission denied, but it exists
             return true
         end
     end
     --▸ print(ok, err, code)
     if ok then
         vim.cmd("packadd " .. plugin)
     end
     return ok, err, code
 end

return require("packer").startup({
  function()
    local use = packer.use

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- icons
    use {'ryanoasis/vim-devicons'}
    use {'kyazdani42/nvim-web-devicons'}

    -- Theme/colors
    use {"romgrk/barbar.nvim", opt = true}
    use {"glepnir/galaxyline.nvim", opt = true}
    use {'christianchiarulli/nvcode-color-schemes.vim', opt = true}
    use {'tomasiser/vim-code-dark', opt = true}

    -- Snippets
    -- use {'Shougo/neosnippet-snippets'}
    -- use {'honza/vim-snippets'}

    use {'kyazdani42/nvim-tree.lua', opt = true}
    use {'terrortylor/nvim-comment', opt = true}

    use {'windwp/nvim-autopairs', opt = true}
    use {"lewis6991/gitsigns.nvim", opt = true}

    -- use {'scrooloose/nerdcommenter'}
    use {'unblevable/quick-scope'}
    use {'editorconfig/editorconfig-vim', opt = true}

    use {'nvim-telescope/telescope.nvim', opt = true}
    use {'nvim-telescope/telescope-fzy-native.nvim', opt = true}
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim', opt = true}

    -- use {'nvim-lua/completion-nvim'}

    -- Lspinstall
    use {'neovim/nvim-lspconfig', opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {'kabouzeid/nvim-lspinstall'}

    use {'golang/vscode-go', opt = true}
    use {'rafamadriz/friendly-snippets', opt = true}
    use {'hrsh7th/nvim-compe', requires = {{'hrsh7th/vim-vsnip'}, {'hrsh7th/vim-vsnip-integ'}}}

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', requires = {'p00f/nvim-ts-rainbow'}}
    -- use {'nvim-treesitter/nvim-treesitter', cond = "vim.fn.has('nvim-0.5') == 1", run = ':TSUpdate'}

    require_plugin('nvim-lspconfig')
    require_plugin('lspsaga.nvim')
    require_plugin('vscode-go')
    require_plugin('friendly-snippets')
    require_plugin('nvim-autopairs')
    require_plugin('barbar.nvim')
    require_plugin('gitsigns.nvim')
    require_plugin('galaxyline.nvim')
    require_plugin('plenary.nvim')
    require_plugin('telescope.nvim')
    require_plugin('telescope-fzy-native.nvim')
    require_plugin('nvcode-color-schemes.vim')
    require_plugin('vim-code-dark')
    require_plugin('nvim-tree.lua')
    require_plugin('nvim-comment')
    require_plugin('editorconfig-vim')
  end,
  config = {
    git = {clone_timeout = false},
    display = {working_sym = "🗘", open_fn = require("packer.util").float},
  },
})
