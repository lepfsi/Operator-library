-- ============================================================================
-- callouts.lua — The Operator's Library
-- Maps semantic fenced divs to LaTeX environments and creates explicit PDF
-- destinations for the collection navigation.
-- ============================================================================

local known_envs = {
  ["note"]           = "note",
  ["tip"]            = "tip",
  ["important"]      = "important",
  ["caution"]        = "caution",
  ["warning"]        = "warning",
  ["front-piece"]    = "frontpiece",
  ["config-block"]    = "configblock",
  ["field-note"]     = "field-note",
  ["operating-fact"] = "operating-fact",
  ["next-chapter"]   = "nextchapter",
  ["concept"]        = "concept",
  ["lesson"]         = "lesson",
  ["pitfall"]        = "pitfall",
  ["remember"]       = "remember",
  ["pullquote"]        = "pullquote",
  ["memorable-phrase"] = "memorablephrase",
  ["keytakeaways"]     = "keytakeaways",
  ["operator-rule"]  = "operator-rule",
  ["impact-quote"]   = "impact-quote",
  ["impact-opener"]  = "impact-opener",
  ["part-opener"]    = "part-opener",
  ["part-map"]       = "partmap",
  ["chapter-guide"]  = "chapterguide",
  ["diagram"]        = "diagram",
  ["hookphrase"]     = "hookphrase",
}

local function latex_escape(value)
  local escaped = tostring(value or "")
  escaped = escaped:gsub("\\", "\\textbackslash{}")
  escaped = escaped:gsub("([%%#$&_{}])", "\\%1")
  escaped = escaped:gsub("%~", "\\textasciitilde{}")
  escaped = escaped:gsub("%^", "\\textasciicircum{}")
  return escaped
end

local function first_link(block)
  local inlines = nil
  if block and (block.t == "Plain" or block.t == "Para") then
    inlines = block.content
  end
  if not inlines then return nil end
  for _, inline in ipairs(inlines) do
    if inline.t == "Link" then
      return pandoc.utils.stringify(inline.content), inline.target
    end
  end
  return nil
end

local function navigation_blocks(content, env)
  local output = pandoc.List()
  local first_entry = true
  for _, block in ipairs(content) do
    if block.t == "BulletList" then
      for _, item in ipairs(block.content) do
        local label, target = first_link(item[1])
        if not label or not target or target:sub(1, 1) ~= "#" then
          output:insert(block)
          break
        end
        local number, title
        if env == "partmap" then
          number, title = label:match("^Chapter%s+(%d+)%s+·%s+(.+)$")
        else
          number, title = label:match("^(%d+)%.%s+(.+)$")
        end
        if not number or not title then
          output:insert(block)
          break
        end
        if first_entry then
          if env == "partmap" then
            output:insert(pandoc.RawBlock("latex", "\\vspace{11pt}"))
          elseif env == "chapterguide" then
            output:insert(pandoc.RawBlock("latex", "\\vspace{7pt}"))
          end
          first_entry = false
        end
        local command = env == "partmap" and "partnaventry" or "guidenaventry"
        output:insert(pandoc.RawBlock(
          "latex",
          "\\" .. command .. "{" .. latex_escape(number) .. "}{" ..
          latex_escape(title) .. "}{" .. latex_escape(target:sub(2)) .. "}"
        ))
      end
    else
      output:insert(block)
    end
  end
  return output
end

function Header(el)
  if not (FORMAT:match("latex") or FORMAT:match("pdf")) then
    return nil
  end
  if el.identifier and el.identifier ~= "" then
    return {
      pandoc.RawBlock("latex", "\\hypertarget{" .. latex_escape(el.identifier) .. "}{}"),
      el,
    }
  end
  return nil
end

function Div(el)
  if not (FORMAT:match("latex") or FORMAT:match("pdf")) then
    return nil
  end

  local env = nil
  for _, class in ipairs(el.classes) do
    if known_envs[class] then
      env = known_envs[class]
      break
    end
  end
  if not env then return nil end

  local opening = "\\begin{" .. env .. "}"
  if env == "frontpiece" then
    local label = latex_escape(el.attributes.label or "FOREWORD")
    opening = "\\begin{frontpiece}[" .. label .. "]"
  elseif env == "impact-opener" then
    local number = latex_escape(el.attributes.number or "\\thechapter")
    local title = latex_escape(el.attributes.title or "THE OPERATOR'S LIBRARY")
    opening = "\\begin{impact-opener}[" .. number .. "][" .. title .. "]"
  elseif env == "part-opener" then
    local number = latex_escape(el.attributes.number or "")
    local title = latex_escape(el.attributes.title or "PART")
    opening = "\\begin{part-opener}[" .. number .. "][" .. title .. "]"
  end

  local blocks = pandoc.List()
  blocks:insert(pandoc.RawBlock("latex", opening))
  if el.identifier and el.identifier ~= "" then
    blocks:insert(pandoc.RawBlock("latex", "\\hypertarget{" .. latex_escape(el.identifier) .. "}{}"))
  end
  if env == "partmap" or env == "chapterguide" then
    blocks:extend(navigation_blocks(el.content, env))
  else
    blocks:extend(el.content)
  end
  blocks:insert(pandoc.RawBlock("latex", "\\end{" .. env .. "}"))
  return blocks
end
