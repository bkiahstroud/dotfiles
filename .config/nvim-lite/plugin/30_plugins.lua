-- TODO: reorganize order?

local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = _G.Config.now_if_args

now(function()
  -- Set up to not prefer extension-based icon for some extensions
  local ext3_blocklist = { scm = true, txt = true, yml = true }
  local ext4_blocklist = { json = true, yaml = true }
  require('mini.icons').setup({
    use_file_extension = function(ext, _)
      return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
    end,
  })

  -- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
  later(MiniIcons.mock_nvim_web_devicons)

  -- Add LSP kind icons. Useful for 'mini.completion'.
  later(MiniIcons.tweak_lsp_kind)
end)

now_if_args(function()
  -- Makes `:h MiniMisc.put()` and `:h MiniMisc.put_text()` public
  require('mini.misc').setup()

  -- Change current working directory based on the current file path. It
  -- searches up the file tree until the first root marker ('.git' or 'Makefile')
  -- and sets their parent directory as a current directory.
  -- This is helpful when simultaneously dealing with files from several projects.
  MiniMisc.setup_auto_root()

  -- Restore latest cursor position on file open
  MiniMisc.setup_restore_cursor()

  -- Synchronize terminal emulator background with Neovim's background to remove
  -- possibly different color padding around Neovim instance
  MiniMisc.setup_termbg_sync()
end)

now(function() require('mini.notify').setup() end)
now(function() require('mini.sessions').setup() end)
now(function() require('mini.starter').setup() end)
now(function() require('mini.statusline').setup() end)
now(function() require('mini.tabline').setup() end)

later(function() require('mini.extra').setup() end)

later(function()
  local ai = require('mini.ai')
  ai.setup({
    -- 'mini.ai' can be extended with custom textobjects
    custom_textobjects = {
      -- Make `aB` / `iB` act on around/inside whole *b*uffer
      B = MiniExtra.gen_ai_spec.buffer(),
      -- For more complicated textobjects that require structural awareness,
      -- use tree-sitter. This example makes `aF`/`iF` mean around/inside function
      -- definition (not call). See `:h MiniAi.gen_spec.treesitter()` for details.
      F = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }),
    },

    search_method = 'cover',
  })
end)

later(function() require('mini.align').setup() end)
later(function() require('mini.bracketed').setup() end)
later(function() require('mini.bufremove').setup() end)

later(function()
  local miniclue = require('mini.clue')
  -- stylua: ignore
  miniclue.setup({
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      Config.leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.square_brackets(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    triggers = {
      { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
      { mode =   'n',        keys = '\\' },       -- mini.basics
      { mode = { 'n', 'x' }, keys = '[' },        -- mini.bracketed
      { mode = { 'n', 'x' }, keys = ']' },
      { mode =   'i',        keys = '<C-x>' },    -- Built-in completion
      { mode = { 'n', 'x' }, keys = 'g' },        -- `g` key
      { mode = { 'n', 'x' }, keys = "'" },        -- Marks
      { mode = { 'n', 'x' }, keys = '`' },
      { mode = { 'n', 'x' }, keys = '"' },        -- Registers
      { mode = { 'i', 'c' }, keys = '<C-r>' },
      { mode =   'n',        keys = '<C-w>' },    -- Window commands
      { mode = { 'n', 'x' }, keys = 's' },        -- `s` key (mini.surround, etc.)
      { mode = { 'n', 'x' }, keys = 'z' },        -- `z` key
    },
  })
end)

later(function() require('mini.cmdline').setup() end)
later(function() require('mini.comment').setup() end)

later(function()
  -- Customize post-processing of LSP responses for a better user experience.
  -- Don't show 'Text' suggestions (usually noisy) and show snippets last.
  -- local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
  local process_items_opts = { kind_priority = { Text = 100, Snippet = 99 } }
  local process_items = function(items, base)
    return MiniCompletion.default_process_items(items, base, process_items_opts)
  end
  require('mini.completion').setup({
    lsp_completion = {
      source_func = 'omnifunc',
      auto_setup = false,
      process_items = process_items,
    },
  })

  -- Set 'omnifunc' for LSP completion only when needed.
  local on_attach = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.MiniCompletion.completefunc_lsp'
  end
  _G.Config.new_autocmd('LspAttach', nil, on_attach, "Set 'omnifunc'")

  -- TODO: needed?
  -- local autotrigger_completion = function(ev)
  --   local client = vim.lsp.get_client_by_id(ev.data.client_id)
  --   if client:supports_method('textDocument/completion') then
  --     vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
  --   end
  -- end
  -- _G.Config.new_autocmd('LspAttach', nil, autotrigger_completion, "Autotrigger completion")

  vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

later(function() require('mini.diff').setup() end)

later(function()
  require('mini.files').setup({ windows = { preview = true } })

  -- Add common bookmarks for every explorer. Example usage inside explorer:
  -- - `'c` to navigate into your config directory
  -- - `g?` to see available bookmarks
  local add_marks = function()
    MiniFiles.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Config' })
    MiniFiles.set_bookmark('w', vim.fn.getcwd, { desc = 'Working directory' })
  end
  _G.Config.new_autocmd('User', 'MiniFilesExplorerOpen', add_marks, 'Add bookmarks')
end)

later(function() require('mini.git').setup() end)

later(function()
  local hipatterns = require('mini.hipatterns')
  local hi_words = MiniExtra.gen_highlighter.words
  hipatterns.setup({
    highlighters = {
      -- Highlight a fixed set of common words. Will be highlighted in any place,
      -- not like "only in comments".
      fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
      hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
      todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
      -- todo_assigned = { pattern = 'TODO(%f[%w]())()%f[%W]', group = 'MiniHipatternsTodo' },
      note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

      -- Highlight hex color string (#aabbcc) with that color as a background
      hex_color = hipatterns.gen_highlighter.hex_color(),
    },
  })
end)

later(function() require('mini.indentscope').setup() end)

later(function() require('mini.jump').setup() end)

later(function() require('mini.jump2d').setup({
  view = {
    dim = true,
    n_steps_ahead = 2,
  },

  allowed_lines = {
    blank = false,
  },

  mappings = {
    start_jumping = '',
  },
}) end)

-- TODO: move to keymaps
vim.keymap.set('n', '<CR>', '<Cmd>lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<CR>')

later(function()
  require('mini.keymap').setup()
  -- Navigate 'mini.completion' menu with `<Tab>` /  `<S-Tab>`
  MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next' })
  MiniKeymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
  -- On `<CR>` try to accept current completion item, fall back to accounting
  -- for pairs from 'mini.pairs'
  MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
  -- On `<BS>` just try to account for pairs from 'mini.pairs'
  MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })
end)

later(function()
  require('mini.operators').setup()

  -- Create mappings for swapping adjacent arguments. Notes:
  -- - Relies on `a` argument textobject from 'mini.ai'.
  -- - It is not 100% reliable, but mostly works.
  -- - It overrides `:h (` and `:h )`.
  -- Explanation: `gx`-`ia`-`gx`-`ila` <=> exchange current and last argument
  -- Usage: when on `a` in `(aa, bb)` press `)` followed by `(`.
  vim.keymap.set('n', '(', 'gxiagxila', { remap = true, desc = 'Swap arg left' })
  vim.keymap.set('n', ')', 'gxiagxina', { remap = true, desc = 'Swap arg right' })
end)

later(function()
  -- Create pairs not only in Insert, but also in Command line mode
  require('mini.pairs').setup({ modes = { command = true } })
end)

later(function() require('mini.pick').setup() end)

later(function()
  -- Define language patterns to work better with 'friendly-snippets'
  local lang_patterns = {
    -- Recognize special injected language of markdown tree-sitter parser
    markdown_inline = { 'markdown.json' },
    -- rust = { 'rust/*.json' },
  }

  local snippets = require('mini.snippets')
  local config_path = vim.fn.stdpath('config')
  snippets.setup({
    snippets = {
      -- Always load 'snippets/global.json' from config directory
      snippets.gen_loader.from_file(config_path .. '/snippets/global.json'),
      -- Load from 'snippets/' directory of plugins, like 'friendly-snippets'
      snippets.gen_loader.from_lang({ lang_patterns = lang_patterns }),
    },
  })

  -- By default snippets available at cursor are not shown as candidates in
  -- 'mini.completion' menu. This requires a dedicated in-process LSP server
  -- that will provide them. To have that, uncomment next line (use `gcc`).
  -- MiniSnippets.start_lsp_server()
end)

later(function() require('mini.splitjoin').setup() end)
later(function() require('mini.surround').setup() end)
later(function() require('mini.trailspace').setup() end)
later(function() require('mini.visits').setup() end)

now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    checkout = 'main',
  })

  local languages = {
    'lua',
    'vimdoc',
    'markdown',
    'markdown_inline',
    'go',
    'gomod',
    'gosum',
    'gotmpl',
    'templ',
    'gowork',
    'rust',
    'sql',
    'yaml',
    'xml',
    'html',
    'toml',
    'zsh',
    'jq',
    'helm',
    'terraform',
    'bash',
    'dockerfile',
    'gitcommit',
    'gitignore',
    'javascript',
    'jsx',
    'mermaid',
    'ssh_config',
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Enable tree-sitter after opening a file for a target language
  local filetypes = {}
  for _, lang in ipairs(languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

now_if_args(function()
  add('neovim/nvim-lspconfig')

  vim.lsp.inlay_hint.enable()
  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'after/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    'gopls',
    'yamlls',
    'helm_ls',
    'marksman',
  })
end)

later(function()
  add('stevearc/conform.nvim')

  -- TODO: write custom "ensure_installed" for missing tools
  require('conform').setup({
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'goimports', 'gofmt' },
    },
  })
end)

now_if_args(function()
  add('mason-org/mason.nvim')
  require('mason').setup()
end)

now_if_args(function()
  add('mason-org/mason-lspconfig.nvim')
  require('mason-lspconfig').setup({
    ensure_installed = {
      'lua_ls',
      'gopls',
      'yamlls',
      'helm_ls',
      'marksman',
      'docker_compose_language_service',
    }
  })
end)

now_if_args(function ()
  add('qvalentin/helm-ls.nvim')
  require('helm-ls').setup({
    conceal_templates = {
      -- enable the replacement of templates with virtual text of their current values
      enabled = false,
    },
  })
end)
