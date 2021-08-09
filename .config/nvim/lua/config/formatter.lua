-- Formatter Setup
require('formatter').setup({
  logging = false,
  filetype = {
    go = {
      function() return {exe = "gofumpt", args={"-s"}, stdin = true} end
	  -- gci is disabled for now. Non primary buffers jumps to line 0 on save
	   --  so I'll wait until gci accepts stdin or unbroken
      -- function() return {exe = "gci", args={"-w"}, stdin = false} end 
    }

    -- c = {
    --   -- clang-format
    --   function() return {exe = "clang-format", stdin = true} end

    -- },

    -- cpp = {
    --   -- clang-format
    --   function() return {exe = "clang-format", stdin = true} end

    -- },

    -- rust = {
    --   -- Rustfmt
    --   function()
    --     return {exe = "rustfmt", args = {"--emit=stdout"}, stdin = true}
    --   end
    -- },

    -- javascript = {
    --   -- prettier
    --   function()
    --     return {
    --       exe = "prettier",
    --       args = {
    --         "--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'
    --       },
    --       stdin = true
    --     }
    --   end
    -- },

    -- lua = {
    --   -- lua-format
    --   function()
    --     return {
    --       exe = "lua-format",
    --       args = {"--indent-width=2", "--no-use-tab", "--tab-width=2"},
    --       stdin = true
    --     }
    --   end
    -- }
  }
})

-- Autoformat on Save
-- vim.api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.go FormatWrite
-- augroup END
-- ]], true)
