#!/usr/bin/env bash
set -euo pipefail

BOOK_DIR="${1:?Usage: apply-final-chapter-titles.sh /path/to/book-05-the-operators-last-job}"
cd "$BOOK_DIR"

rename_chapter() {
  local old_path="$1"
  local new_basename="$2"
  local new_title="$3"
  local new_path="manuscript/${new_basename}.md"

  if [ -f "$old_path" ] && [ "$old_path" != "$new_path" ]; then
    mv "$old_path" "$new_path"
  fi
  if [ ! -f "$new_path" ]; then
    echo "Missing chapter file: $new_path" >&2
    exit 1
  fi

  sed -i \
    -e "s|^title:.*|title: \"${new_title}\"|" \
    -e "s|^# .*|# ${new_title}|" \
    "$new_path"
}

rename_chapter "manuscript/01-the-operators-last-job.md" "01-when-the-system-no-longer-waits-for-you" "When the System No Longer Waits for You"
rename_chapter "manuscript/02-what-engineers-actually-do.md" "02-what-engineers-actually-do" "What Engineers Actually Do"
rename_chapter "manuscript/03-the-work-we-thought-was-technical.md" "03-the-work-we-mistook-for-technical" "The Work We Mistook for Technical"
rename_chapter "manuscript/04-when-expertise-becomes-data.md" "04-when-expertise-leaves-the-room" "When Expertise Leaves the Room"
rename_chapter "manuscript/05-first-we-automated-the-routine.md" "05-first-we-automated-the-routine" "First We Automated the Routine"
rename_chapter "manuscript/06-then-we-automated-the-diagnosis.md" "06-then-we-automated-the-diagnosis" "Then We Automated the Diagnosis"
rename_chapter "manuscript/07-then-we-let-machines-act.md" "07-then-we-let-machines-act" "Then We Let Machines Act"
rename_chapter "manuscript/08-the-day-the-runbook-became-an-agent.md" "08-when-the-runbook-learned-to-decide" "When the Runbook Learned to Decide"
rename_chapter "manuscript/09-judgment.md" "09-judgment-is-not-a-prediction" "Judgment Is Not a Prediction"
rename_chapter "manuscript/10-responsibility.md" "10-responsibility-has-a-name" "Responsibility Has a Name"
rename_chapter "manuscript/11-context.md" "11-context-is-the-missing-interface" "Context Is the Missing Interface"
rename_chapter "manuscript/12-trust.md" "12-trust-is-a-permission" "Trust Is a Permission"
rename_chapter "manuscript/13-knowing-when-not-to-act.md" "13-the-courage-to-do-nothing" "The Courage to Do Nothing"
rename_chapter "manuscript/14-from-operator-to-system-designer.md" "14-design-the-bounds-or-become-obsolete" "Design the Bounds or Become Obsolete"

# Swap Chapters 15 and 16 without losing either scaffold.
if [ -f "manuscript/15-the-engineer-as-governor.md" ]; then
  mv "manuscript/15-the-engineer-as-governor.md" "manuscript/.tmp-15-governor.md"
fi
if [ -f "manuscript/16-the-human-in-the-loop-is-not-enough.md" ]; then
  mv "manuscript/16-the-human-in-the-loop-is-not-enough.md" "manuscript/15-the-human-in-the-loop-is-not-enough.md"
fi
if [ -f "manuscript/.tmp-15-governor.md" ]; then
  mv "manuscript/.tmp-15-governor.md" "manuscript/16-the-engineer-as-governor.md"
fi
rename_chapter "manuscript/15-the-human-in-the-loop-is-not-enough.md" "15-the-human-in-the-loop-is-not-enough" "The Human in the Loop Is Not Enough"
rename_chapter "manuscript/16-the-engineer-as-governor.md" "16-the-engineer-as-governor" "The Engineer as Governor"
rename_chapter "manuscript/17-building-systems-worth-trusting.md" "17-systems-that-remember-why-they-acted" "Systems That Remember Why They Acted"

if [ -f "manuscript/18a-conclusion.md" ]; then
  sed -i \
    -e 's|^title:.*|title: "The Last Job Was Never About Typing Commands"|' \
    -e 's|^# .*|# The Last Job Was Never About Typing Commands|' \
    "manuscript/18a-conclusion.md"
fi

echo "Final chapter titles applied."
