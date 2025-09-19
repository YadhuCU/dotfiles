local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local curr_file = vim.fn.expand("%:t")

local function to_component_name(file_name)
  local without_ex = file_name:match("(.+)%..+$") or file_name
  local parts = vim.split(without_ex, "-", { plain = true })

  for j, part in ipairs(parts) do
    parts[j] = part:sub(1, 1):upper() .. part:sub(2)
  end
  return table.concat(parts, "")
end

local component_name = to_component_name(curr_file)

ls.add_snippets("javascriptreact", {
  -- Functional Component.
  s("rfc", {
    t("import React from \"react\";"), t({ "", "" }),
    t({ "", "" }),
    t("export const "), i(1, component_name), t(" = () => {"), t({ "", " " }),
    t("return ("), t({ "", "  " }),
    t("<div>"), rep(1), t("</div>"), t({ "", "  " }),
    t(");"), t({ "", "};", "" }),
  })
})

ls.add_snippets("typescriptreact", {
  -- Functional Component.
  s("rfc", {
    t("import React from \"react\";"), t({ "", "" }),
    t({ "", "" }),
    t("export const "), i(1, component_name), t(" = () => {"), t({ "", " " }),
    t("return ("), t({ "", "  " }),
    t("<div>"), rep(1), t("</div>"), t({ "", "  " }),
    t(");"), t({ "", "};", "" }),
  })
})
