
local MiniPick = require("mini.pick")

-- Cheatsheet picker
MiniPick.registry.cheatsheet = function()
  local path = vim.fn.stdpath("config") .. "/vim-cheatsheet.txt"

  -- Check file
  if vim.fn.filereadable(path) == 0 then
    vim.notify("Cheatsheet not found: " .. path, vim.log.levels.WARN)
    return
  end

  -- Load cheatsheet
  local items = {}

  for _, line in ipairs(vim.fn.readfile(path)) do
    if line:match("^.-%s+|%s*%S") then
      table.insert(items, line)
    end
  end

  -- Start picker
  MiniPick.start({
    source = {
      name = "Vim Cheatsheet",
      items = items,

      -- Fill command line without executing
      choose = function(item)
        local cmd = item:match("^.-%s+|%s*(.-)%s*$")
        if not cmd then return end

        if not cmd:match("^[:/?]") then
          vim.notify("Normal-mode keys: " .. cmd)
          return
        end

        vim.schedule(function()
          vim.api.nvim_feedkeys(cmd, "n", true)
        end)
      end,
    },
  })
end

return {}

