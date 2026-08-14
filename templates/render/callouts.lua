-- ============================================================
--  callouts.lua — Pandoc Lua filter for The Operator's Library
--
--  Maps fenced divs (::: name ... :::) to LaTeX custom environments.
--  Pandoc's default LaTeX writer does NOT emit \begin{name} for
--  fenced divs; this filter fixes that.
--
--  Supports the 8 callouts used in chapter-template.md:
--    field-note, concept, lesson, warning, remember,
--    pullquote, keytakeaways, diagram
--  Plus the hookphrase helper.
--
--  Usage in build-book.sh:
--    pandoc ... --lua-filter=templates/render/callouts.lua
-- ============================================================

-- Known fenced-div classes → LaTeX environment names.
local known_envs = {
  ["field-note"]   = "field-note",
  ["concept"]      = "concept",
  ["lesson"]       = "lesson",
  ["warning"]      = "warning",
  ["pitfall"]      = "pitfall",
  ["remember"]     = "remember",
  ["pullquote"]    = "pullquote",
  ["keytakeaways"] = "keytakeaways",
  ["diagram"]      = "diagram",
  ["hookphrase"]   = "hookphrase",
}

function Div(el)
  -- Only applies to LaTeX / PDF output.
  if not (FORMAT:match("latex") or FORMAT:match("pdf")) then
    return nil
  end
  -- Use the first matching class.
  local env = nil
  for _, cls in ipairs(el.classes) do
    if known_envs[cls] then
      env = known_envs[cls]
      break
    end
  end
  if not env then
    return nil
  end
  -- Emit \begin{env} ... \end{env}, with the original content in between.
  local blocks = pandoc.List()
  blocks:insert(pandoc.RawBlock("latex", "\\begin{" .. env .. "}"))
  blocks:extend(el.content)
  blocks:insert(pandoc.RawBlock("latex", "\\end{" .. env .. "}"))
  return blocks
end
