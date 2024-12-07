return {
  'nvim-neorg/neorg',
  dependencies = { 'luarocks.nvim' },
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = '*', -- Pin Neorg to the latest stable release
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
              work = '~/notes/work',
              pals = '~/notes/work/palni-palci',
              nnp = '~/notes/work/nnp',
              calstate = '~/notes/work/calstate',
              linnbenton = '~/notes/work/linnbenton',
            },
            default_workspace = 'work',
          },
        },
        ['core.summary'] = {
          -- config = { strategy = 'by_path' }
        },
        ['core.export'] = {},
        ['core.esupports.metagen'] = {
          config = { type = 'auto' },
        },
        ['core.text-objects'] = {},
        ['core.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
        ['core.ui'] = {},
        ['core.ui.calendar'] = {},
        ['core.keybinds'] = {
          config = {
            hook = function(keybinds)
              -- Binding to edit code block in separate buffer
              keybinds.map('norg', 'n', '<leader>nc', '<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>')

              -- Binds to move items up or down
              keybinds.remap_event('norg', 'n', '<leader>nk', 'core.text-objects.item_up')
              keybinds.remap_event('norg', 'n', '<leader>nj', 'core.text-objects.item_down')

              -- text objects, these binds are available as `vaH` to "visual select around a header" or
              -- `diH` to "delete inside a header"
              keybinds.remap_event('norg', { 'o', 'x' }, 'ih', 'core.text-objects.textobject.heading.inner')
              keybinds.remap_event('norg', { 'o', 'x' }, 'ah', 'core.text-objects.textobject.heading.outer')

              -- TODO: create mappings to navigate to next/previous header
              -- keybinds.remap_event('norg', 'n', '[h', 'core.text-objects.textobject.heading.inner')
              -- keybinds.remap_event('norg', 'n', '[h', 'core.text-objects.textobject.heading.inner')
            end,
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
