local tb = require("utils.tables")
local icons = {
  Hint = "",
  Info = "",
  Warn = "▲",
  Error = "🗙"
}

local function lsp_on_attach(keys)
  return function (client, _)
      if client.server_capabilities.document_formatting then
          keys.saga_keys = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "Format text" }
      elseif client.server_capabilities.document_range_formatting then
          keys.saga_keys = { "<Cmd>lua vim.lsp.buf.range_formatting()<CR>", "Range format" }
      end
      keys.general_keys = keys.saga_keys
      --require "which-key".register(keys.general_keys)
  end
end

local M = {}

function M.load_nulls(opts)
  local config = {}
  require("null-ls").setup(tb.merge(config, opts))
end

function M.load_mason(opts)
  local config = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
  require("mason").setup(tb.merge(config, opts))
end

function M.load_mason_lspconfig(opts)
  local config = {
    ensure_installed = {
      "lua_ls"
    },
    automatic_installation = true
  }
  require("mason-lspconfig").setup(tb.merge(config, opts))
end

-- Configure on_attach
-- List packages in main init
function M.load_lspconfig(opts)
  local lspconfig = require("lspconfig")
  local config = {
    terraformls = {},
    lua_ls = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = {"vim", "_G"},
        }
      }
    }
  }

  for type, icon in pairs(icons) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
  end

  for key, value in pairs(tb.merge(config, opts)) do
      lspconfig[key].setup({
          -- on_attach = lsp_on_attach({}),
          settings = value
      })
  end

end

-- List packages in main init
function M.load_mason_nulls(opts)
  local mason_null_ls = require("mason-null-ls")
  local config = {
    ensure_installed = {
      "prettier",
      --"rustfmt",
      "black"
    },
    automatic_installation = true,
    automatic_setup = true
  }
  mason_null_ls.setup(tb.merge(config, opts))
  mason_null_ls.setup_handlers()
end

function M.load_cmp(opts)
  local cmp = require("cmp")
  local config = {
    experimental = {
      ghost_text = true
    },
    completion = {
      completeopt = 'menu,menuone,noinsert'
    },
    formatting = {
      format = require("lspkind").cmp_format({
        mode = 'symbol_text',
        -- preset = "codicons",
        maxwidth = 100,
        ellipsis_char = '...',
      })
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end
    }),
    sources = cmp.config.sources(
      {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
      {
        { name = 'buffer' },
      }
    )
  }
  cmp.setup(tb.merge(config, opts))
end

return M
