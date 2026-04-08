local function patch_query_predicates_for_nvim_012()
	local query = vim.treesitter.query
	local force = { force = true, all = false }

	local html_script_type_languages = {
		importmap = "json",
		module = "javascript",
		["application/ecmascript"] = "javascript",
		["text/ecmascript"] = "javascript",
	}

	local non_filetype_match_injection_language_aliases = {
		ex = "elixir",
		pl = "perl",
		sh = "bash",
		ts = "typescript",
		uxn = "uxntal",
	}

	local function first_capture(match, id)
		local capture = match[id]
		if not capture then
			return nil
		end

		if type(capture) == "userdata" then
			return capture
		end

		return capture[1]
	end

	local function get_parser_from_markdown_info_string(injection_alias)
		local match = vim.filetype.match({ filename = "a." .. injection_alias })
		return match or non_filetype_match_injection_language_aliases[injection_alias] or injection_alias
	end

	query.add_predicate("nth?", function(match, _, _bufnr, pred)
		local node = first_capture(match, pred[2])
		local n = tonumber(pred[3])
		if node and n and node:parent() and node:parent():named_child_count() > n then
			return node:parent():named_child(n) == node
		end

		return false
	end, force)

	query.add_predicate("is?", function(match, _, bufnr, pred)
		local node = first_capture(match, pred[2])
		local types = { unpack(pred, 3) }

		if not node then
			return true
		end

		local locals = require("nvim-treesitter.locals")
		local _, _, kind = locals.find_definition(node, bufnr)

		return vim.tbl_contains(types, kind)
	end, force)

	query.add_predicate("kind-eq?", function(match, _, _bufnr, pred)
		local node = first_capture(match, pred[2])
		local types = { unpack(pred, 3) }

		if not node then
			return true
		end

		return vim.tbl_contains(types, node:type())
	end, force)

	query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
		local capture_id = pred[2]
		local node = first_capture(match, capture_id)
		if not node then
			return
		end

		local type_attr_value = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[capture_id] }) or ""
		local configured = html_script_type_languages[type_attr_value]
		if configured then
			metadata["injection.language"] = configured
			return
		end

		local parts = vim.split(type_attr_value, "/", {})
		metadata["injection.language"] = parts[#parts]
	end, force)

	query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
		local capture_id = pred[2]
		local node = first_capture(match, capture_id)
		if not node then
			return
		end

		local injection_alias = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[capture_id] })
		if not injection_alias or injection_alias == "" then
			return
		end

		metadata["injection.language"] = get_parser_from_markdown_info_string(injection_alias:lower())
	end, force)

	query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
		local id = pred[2]
		local node = first_capture(match, id)
		if not node then
			return
		end

		local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
		metadata[id] = metadata[id] or {}
		metadata[id].text = string.lower(text)
	end, force)
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
		config = function()
			patch_query_predicates_for_nvim_012()

			require("nvim-treesitter.configs").setup({
				ensure_installed = { "bash", "c", "gleam", "javascript", "lua", "markdown", "markdown_inline", "python" },
				modules = {},

				sync_install = true,
				auto_install = true,

				ignore_install = {},

				highlight = {
					enable = true,
					disable = { "latex" },
					additional_vim_regex_highlighting = { "markdown" },
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["ai"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
						},
					},
					-- swap = {
					-- 	enable = true,
					-- 	swap_next = {
					-- 		["<leader>sa"] = "@parameter.inner",
					-- 	},
					-- 	swap_prev = {
					-- 		["<leader>sA"] = "@parameter.inner",
					-- 	},
					-- },
				},
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,

		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					-- Defaults
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
				-- Also override individual filetype configs, these take priority.
				-- Empty by default, useful if one of the "opts" global settings
				-- doesn't work well in a specific filetype
				per_filetype = { ["html"] = { enable_close = false } },
			})
		end,
	},
}
