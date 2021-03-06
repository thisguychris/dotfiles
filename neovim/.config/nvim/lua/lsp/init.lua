local lsp_status = require('lsp-status')
local diagnostic = require('diagnostic')
local completion = require('completion')
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')
local util = require('nvim_lsp/util')

local on_attach = function(client, bufnr)
  lsp_status.on_attach(client, bufnr)
  diagnostic.on_attach(client, bufnr)
  completion.on_attach(client, bufnr)

  -- Keybindings for LSPs
  -- Note these are in on_attach so that they don't override bindings in a non-LSP setting
	--
   -- Mappings.
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ee', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
-- vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  -- vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end

lsp_status.register_progress()
lsp_status.config({
  status_symbol = '',
  indicator_errors = 'e',
  indicator_warnings = 'w',
  indicator_info = 'i',
  indicator_hint = 'h',
  indicator_ok = 'ok',
})

nvim_lsp.pyls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}
nvim_lsp.html.setup{
  on_attach = on_attach,
  capabilities = lsp_status.capabilities
}

require('format').setup({
  javascript = {
      prettier = function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
          stdin = true
        }
      end
  },
  lua = {
      luafmt = function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
})
