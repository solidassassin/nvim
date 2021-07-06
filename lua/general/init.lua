require "general.helpers"
require "general.mappings"

local HOME = os.getenv("HOME")

set_opts {
	mouse = 'a';
	ts = 4, sw = 4;
	clipboard = "unnamedplus";
	inccommand = "split";
	number = true;
	relativenumber = true;
	termguicolors = true;
	ignorecase = true;
	smartcase = true;
	undofile = true;
	undodir = HOME .. "/.config/nvim/.cache/undo";
	backupdir = HOME .. "/.config/nvim/.cache/backups";
	completeopt = "menuone,noselect";
	updatetime = 500;
	showmode = false;
	timeoutlen = 500;
}

require "which-key".register(keys)
