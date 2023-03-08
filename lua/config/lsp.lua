local M = {}

M.null_ls = {}

M.mason = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
}

M.mason_lspconfig = {
  automatic_installation = true
}

M.lspconfig = {
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

M.mason_null_ls = {
  ensure_installed = {
    "prettier",
    --"rustfmt",
    "black"
  },
  automatic_installation = true,
  automatic_setup = true
}
  
function M.cmp(cmp)
  return {
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
      ['<Tab>'] = cmp.select_next_item()
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
end

return M
