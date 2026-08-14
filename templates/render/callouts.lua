-- ============================================================
--  callouts.lua — Pandoc Lua filter for The Operator's Library
--
--  Maps fenced divs (::: name ... :::) to LaTeX custom environments.
--  Pandoc's default LaTeX writer does NOT emit \begin{name} for
--  fenced divs; this filter fixes that.
--
--  Callouts aligned with the DailyOps.tech site style
--  (Note / Tip / Warning / Important / Caution) plus book-specific
--  blocks. Every class here MUST have a matching \newenvironment
--  or \newtcolorbox in template.latex.
--
--  Site-style callouts (icon + label + tinted background):
--    note, tip, important, caution, warning
--  Book-specific blocks:
--    field-note, concept, lesson, remember, pitfall,
--    pullquote, keytakeaways, operator-rule, impact-quote,
--    impact-opener, diagram
--  Helper:
--    hookphrase
--
--  Usage in build-book.sh:
--    pandoc ... --lua-filter=templates/render/callouts.lua
-- ============================================================

-- Known fenced-div classes -> LaTeX environment names.
local known_envs = {
  -- Site-style callouts
  ["note"]           = "note",
  ["tip"]            = "tip",
  ["important"]      = "important",
  ["caution"]        = "caution",
  ["warning"]        = "warning",
  -- Book-specific blocks
  ["field-note"]     = "field-note",
  ["concept"]        = "concept",
  ["lesson"]         = "lesson",
  ["pitfall"]        = "pitfall",
  ["remember"]       = "remember",
  ["pullquote"]      = "pullquote",
  ["keytakeaways"]   = "keytakeaways",
  ["operator-rule"]  = "operator-rule",
  ["impact-quote"]   = "impact-quote",
  ["impact-opener"]  = "impact-opener",
  ["diagram"]        = "diagram",
  ["hookphrase"]     = "hookphrase",
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
