# Laconic

Say the thing, then stop.

Philip II of Macedon sent word to Sparta: if he entered Laconia, he would raze the city to the ground. The Spartans wrote back one word.

> If.

The answer is there, the grammar is intact, and everything that was not the answer is gone. That is the whole skill.

## The problem

Ask an assistant a question it disagrees with and you get a recognizable skeleton. It validates you, softens the verdict, inflates a distinction, splits your question into three, reframes it, hedges, stacks proverbs, and recaps. The actual answer is in the last sentence, if it is anywhere.

Swapping the vocabulary does not fix it. The skeleton survives the rewrite. Laconic names the skeleton so it can be removed.

## What it does

**Ordering.** Two message shapes. A reply to a question or pushback opens with the verdict, then reasons, then one imperative action, then at most one condition that would flip it. A report on work done opens with one insight line, allows a middle of tables, before/after code, and proposals, and closes with state, risks, and a single next step.

**Sentences.** One idea each, active voice, twenty words or fewer, articles and full grammar kept. Six banned shapes, including the clipped negation ("Not because you're wrong. You aren't."), the trailing contrast ("That's not X, that's Y"), and the rhetorical colon ("Here's the thing:").

**Deletion.** A catalog of the moves that pad a hedging reply, each with the plain sentence it should have been. Prose caps at 200 words. Code and tables do not count toward it.

Length comes off by cutting whole sentences, never by cutting words out of them. This is not caveman mode. Articles stay, and so do verbs.

**Scope.** The shapes and the budget apply to replies. Anything that outlives the conversation, such as documentation, comments, commit messages, issues, and pull requests, is written in complete sentences in its reader's normal register. Only the catalog of tells and one rule for comments apply there: open with a verb that says what the code under it does, in words a 4th grader reads, with every noun written where it is used.

## Measured

Fresh-context agents ran five scenarios twice, once with no skill and once with Laconic loaded. Tell phrases are counts of the catalogued openers and hedges.

| Scenario | Words before | Words after | Tells before | Tells after |
|---|---|---|---|---|
| Pushback on technical advice | 338 | 187 | 13 | 0 |
| Rewriting a hedging reply | 170 | 106 | 8 | 0 |
| "Am I right about this architecture?" | 515 | 243 | 12 | 0 |
| End-of-turn work report | 215 | 184 | 4 | 0 |
| "Why does this re-render?" | 360 | 210 | 0 | 0 |

Roughly half the length, with the claims kept.

## Install

```
/plugin marketplace add ero-qt/laconic
/plugin install laconic@laconic
```

Installing the plugin turns Laconic on for every session through a SessionStart hook, the same mechanism Anthropic uses for its explanatory style. The skill is still there for rewriting text on demand.

Without the plugin: drop `skills/laconic/` into `~/.claude/skills/` for the on-demand skill, or `output-styles/laconic.md` into `~/.claude/output-styles/` and pick it in `/config` for always-on. Use one of the two, not both, or the text lands in context twice.

Once the skill is invoked it holds for the rest of the session. Say "stop" or "normal replies" to end it.

## Credits

Built on three ideas worth reading in their original form.

- [blader/humanizer](https://github.com/blader/humanizer) for the pattern-catalog method and the ground rules: keep every claim, invent no facts, match the writer's voice. Laconic defers to it for prose tells outside conversation.
- [juliusbrussee/caveman](https://github.com/juliusbrussee/caveman) for compression as a persona, and for the session persistence clause. Laconic takes its lite register and refuses the article-dropping.
- [ayghri/i-have-adhd](https://github.com/ayghri/i-have-adhd) for leading with the action and closing with one concrete next step.

The pattern-catalog approach ultimately traces to Wikipedia's [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup.

MIT.
