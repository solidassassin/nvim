require "compe".setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = "always";
	allow_prefix_unmatch = false;
	throttle_time = 80;
	source_timeout = 400;
	incomplete_delay = 800;

	source = {
		path = { priority = 500 };
		buffer = { priority = 300 };
		calc = {priority = 400 };
		nvim_lua = { priority = 600 };
		spell = {
			priority = 100;
			filetypes = { "markdown", "tex", "latex", "text" };
		};
		tags = { priority = 200 };
		luasnip = { priority = 700 };
		nvim_lsp = true;
		treesitter = false;
	};
}
