local ts_utils = require 'nvim-treesitter.ts_utils'
local parsers = require 'nvim-treesitter.parsers'

local function copy_method_name()
  local bufnr = vim.api.nvim_get_current_buf()

  if not parsers.get_buf_lang() == 'ruby' then
    print 'Xeref currently only supports Ruby'
  end

  local parser = vim.treesitter.get_parser(bufnr, 'ruby')
  local tree = parser:parse()[1] -- Get the syntax tree

  local class_or_module_query = '((method name: (identifier) @method.name)) \z
                                 | ((singleton_method name: (identifier) @singleton_method.name))'
  local class_or_module_captures = vim.treesitter.query.parse('ruby', class_or_module_query)

  local class_and_module_nodes = {}
  for _, node in class_or_module_captures:iter_captures(tree:root(), bufnr) do
    table.insert(class_and_module_nodes, node)
  end

  for i, node in ipairs(class_and_module_nodes) do
    print(i, vim.treesitter.get_node_text(node, bufnr))
  end

  -- Find the smallest treesitter node that contains the cursor
  local node = ts_utils.get_node_at_cursor()

  if not node then
    print 'No Treesitter node found at cursor'
    return
  end

  -- Traverse up the syntax tree to find the method definition node
  while node do
    local node_type = node:type()
    if node_type == 'method' or node_type == 'singleton_method' then
      break
    end
    node = node:parent()
  end

  if not node then
    print 'Cursor is not inside a method'
    return
  end

  -- Traverse up the syntax tree to find the class and/or module node(s)
  -- local ancestors = {}
  -- while node do
  --   local node_type = node:type()
  --   if node_type == 'class' or node_type == 'module' then
  --     table.insert(ancestors, value)
  --     break
  --   end
  --   node = node:parent()
  -- end
  --
  local query
  if node:type() == 'method' then
    query = vim.treesitter.query.parse('ruby', '((method name: (identifier) @method.name))')
  else
    query = vim.treesitter.query.parse('ruby', '((singleton_method name: (identifier) @singleton_method.name))')
  end

  local method_name
  for _, subnode in query:iter_captures(node, bufnr) do
    method_name = vim.treesitter.get_node_text(subnode, bufnr)
  end

  -- Copy the method name to register
  vim.fn.setreg('+', method_name)

  print('Copied ' .. method_name)
end

-- Assign the function to a command
vim.api.nvim_create_user_command('Xeref', copy_method_name, {})
