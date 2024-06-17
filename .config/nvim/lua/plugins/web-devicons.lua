return {
  'nvim-tree/nvim-web-devicons',
  opts = {
    override_by_filename = {
      ['gemfile'] = {
        icon = '',
        color = '#701516',
        cterm_color = '52',
        name = 'Gemfile',
      },
      ['gemfile.lock'] = {
        icon = '',
        color = '#701516',
        cterm_color = '52',
        name = 'Gemfile.lock',
      },
    },
  },
}
