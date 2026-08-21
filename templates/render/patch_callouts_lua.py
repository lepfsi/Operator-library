from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding='utf-8')
anchor = '  ["hookphrase"]     = "hookphrase",\n'
addition = '''  ["case-signal"]       = "casesignal",
  ["the-question"]      = "thequestion",
  ["the-shift"]         = "theshift",
  ["operator-note"]     = "operatornote",
  ["operator-dialogue"] = "operatornote",
  ["decision-ledger"]   = "decisionledger",
  ["four-questions"]    = "fourquestions",
  ["assumption-check"]  = "assumptioncheck",
  ["boundary-condition"] = "boundarycondition",
  ["exception-register"] = "exceptionregister",
  ["system-trace"]      = "tracebackbox",
  ["process-log"]       = "configblock",
  ["dissent-record"]    = "dissentrecord",
  ["handoff-note"]      = "handoffnote",
  ["routine-map"]       = "routinemap",
'''

if '"operator-dialogue"' in text:
    print('Callout mapping already present; no change made.')
    raise SystemExit(0)
if anchor not in text:
    raise SystemExit('Expected callout mapping anchor not found.')
path.write_text(text.replace(anchor, anchor + addition), encoding='utf-8')
print(f'Updated {path}')
