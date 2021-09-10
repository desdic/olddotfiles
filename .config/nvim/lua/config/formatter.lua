require("formatter").setup(
	{
		logging = true,
		filetype = {
			go = {
				function()
					return {
						exe = "gofmt",
						args = {"-s"},
						stdin = true
					}
				end
			}
		}
	}
)
