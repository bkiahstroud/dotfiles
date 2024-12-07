local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

ls.add_snippets('ruby', {
  s('prepend_singleton', {
    i(1, 'BaseClass'),
    t '.singleton_class.send(:prepend, ',
    i(2, 'BaseClassDecorator'),
    t ')',
  }),
})
