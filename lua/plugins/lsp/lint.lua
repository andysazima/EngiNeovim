return {
	"mfussenegger/nvim-lint",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		ensure_installed = { "markdownlint", "ruff", "selene", "shellcheck", "vale" },
		-- LazyVim extension to easily override linter options
		-- or add custom linters.
		---@type table<string,table>
		linters = {
			-- -- Example of using selene only when a selene.toml file is present
			-- selene = {
			--   -- `condition` is another LazyVim extension that allows you to
			--   -- dynamically enable/disable linters based on the context.
			--   condition = function(ctx)
			--     return vim.fs.find({ "selene.toml" }, { path = ctx.filename, upward = true })[1]
			--   end,
			-- },
		},
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff" },
			lua = { "selene" },
			markdown = { "markdownlint" },
			sh = { "shellcheck" },
			latex = { "vale" },
			-- Use the "*" filetype to run linters on all filetypes.
			-- ['*'] = { 'global linter' },
			-- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
			-- ['_'] = { 'fallback linter' },
			-- ["*"] = { "typos" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
