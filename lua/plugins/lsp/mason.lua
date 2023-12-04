return {
  "williamboman/mason.nvim",
  config = function()
    local mason = require("mason")
    -- local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- mason_tool_installer.setup({
    --   ensure_installed = {
    --     "prettier", -- prettier formatter
    --     "stylua", -- lua formatter
    --     "eslint_d", -- js linter
    --   },
    -- })
  end,
}
