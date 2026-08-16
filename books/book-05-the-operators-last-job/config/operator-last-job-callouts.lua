-- ============================================================================
-- operator-last-job-callouts.lua
-- Book-local callout mapping for The Threshold Ledger identity.
-- ============================================================================

local known_envs = {
  ["front-piece"]      = "frontpiece",
  ["field-note"]       = "fieldnote",
  ["case-signal"]      = "casesignal",
  ["proposition"]      = "propositionbox",
  ["operator-note"]    = "operatornote",
  ["distinction"]      = "distinctionbox",
  ["decision-ledger"]  = "decisionledger",
  ["memorable-phrase"] = "memorablephrase",
  ["next-chapter"]     = "nextchapter",
  ["part-map"]         = "partmap",
  ["chapter-guide"]    = "chapterguide",
  ["the-question"]     = "thequestion",
  ["the-shift"]        = "theshift",
  ["four-questions"]   = "fourquestions",
  ["assumption-check"] = "assumptioncheck",
  ["boundary-condition"] = "boundarycondition",
  ["exception-register"] = "exceptionregister",
  ["traceback"]        = "tracebackbox",
  ["dissent-record"]   = "dissentrecord",
  ["handoff-note"]     = "handoffnote",
}

local function latex_escape(value)
  local escaped = tostring(value or "")
  escaped = escaped:gsub("([\\{}%%#$&_])", "\\%1")
  return escaped
end

function Div(el)
  if not (FORMAT:match("latex") or FORMAT:match("pdf")) then
    return nil
  end

  local env = nil
  for _, class in ipairs(el.classes) do
    if class == "impact-opener" then
      env = "impactopener"
      break
    elseif known_envs[class] then
      env = known_envs[class]
      break
    end
  end
  if not env then return nil end

  local blocks = pandoc.List()
  if el.identifier and el.identifier ~= "" then
    blocks:insert(pandoc.RawBlock("latex", "\\hypertarget{" .. latex_escape(el.identifier) .. "}{}"))
  end
  blocks:insert(pandoc.RawBlock("latex", "\\begin{" .. env .. "}"))
  blocks:extend(el.content)
  blocks:insert(pandoc.RawBlock("latex", "\\end{" .. env .. "}"))
  return blocks
end
