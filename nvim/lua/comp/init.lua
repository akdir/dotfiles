local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup {
    formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        maxwidth = 50,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
        }
      })
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'cmp_tabnine' },
      { name = 'luasnip' },
      { name = 'buffer', keyword_length = 5 },
    },
    snippet = {
      expand = function(args)
         require('luasnip').lsp_expand(args.body)
      end,
    },
    experimental = {
      native_menu = false,
      ghost_text = true,
    }
}

-- you need setup cmp first put this after cmp.setup()
require("cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})
