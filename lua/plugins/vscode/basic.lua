-- VSCode环境的下划线修复
-- 禁用诊断和清除下划线高亮
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "ColorScheme" }, {
  callback = function()
    vim.schedule(function()
      vim.diagnostic.enable(false)

      -- 清除下划线相关的高亮组
      local underline_groups = {
        "SpellBad",
        "SpellCap",
        "SpellLocal",
        "SpellRare",
        "DiagnosticUnderlineError",
        "DiagnosticUnderlineWarn",
        "DiagnosticUnderlineInfo",
        "DiagnosticUnderlineHint",
      }

      for _, group in ipairs(underline_groups) do
        vim.cmd("hi " .. group .. " gui=NONE cterm=NONE")
      end
    end)
  end,
})

-- 延迟处理LSP相关下划线
vim.defer_fn(function()
  vim.diagnostic.enable(false)

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if client then
        client.server_capabilities.documentHighlightProvider = false
      end
    end,
  })
end, 1000)

-- 返回空table以满足Lazy.nvim的要求
return {}
