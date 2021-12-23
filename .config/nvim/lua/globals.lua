DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
HOME_PATH = "/home/" .. vim.fn.expand("$USER")

O = {
    auto_close_tree = 0,
    auto_complete = true,
    hidden_files = true,
    wrap_lines = false,
    shell = "zsh",
    timeoutlen = 100,
    nvim_tree_disable_netrw = 0 -- "1 by default, disables netrw (must be set before plugin's packadd)
}
