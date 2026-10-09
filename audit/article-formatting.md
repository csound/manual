# Article formatting and synopsis audit

Date: 2026-10-09. Base: `392161a833afce4dba38cab22a09bf2769183f46` on `develop`.

The audit checked all 1,607 tracked Markdown articles and changed 607.
[The article list](article-changes.csv) records the kinds of fixes for each changed
article. Running the checker with `--json` also lists articles with no findings.

## Formatting

The original MkDocs output had 434 HTML parser errors inside article bodies:
433 unexpected closing paragraph tags and one unknown entity. The revised build
has none. Most paragraph errors came from code fences directly after prose.

The changes:

- Separate code blocks from prose, including blocks inside tabs and quotes.
- Close broken fences in `bexprnd` and `fmvoice`; restore the hidden sections.
- Replace leftover DocBook tags and a missing author entity with Markdown or text.
- Restore the broken `connect` links and See also sections in signal-flow articles.
- Use the CSD highlighter for snippets that contain a full CSD document.
- Decode entities and remove Markdown emphasis from plain-text code titles.
- Use the heading “See also” throughout; its link target stays the same.
- Repair quoted examples, literal operators, and copied example descriptions.

## Synopsis and content checks

These fixes use Csound source, opcode registrations, and a compile-only fixture.
Source links below refer to Csound commit
`1908f26f51f08b21e69d5f083a63d0a15033feff`.

| Articles | Fix and evidence |
| --- | --- |
| `pow`, `limit`, `tableshuffle`, `schedkwhen`, `pvstanal` | Repair broken expressions, parentheses, or continuations. The syntax fixture compiles these forms. See [opcode registrations](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/Engine/entry.c). |
| `midifileopen`, `midifileloop` | Fix misspelled or copied opcode names; document channel mapping as `16 * port + channel`. See [MIDI file code](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/InOut/midifile.c). |
| `midifilein` | Use an i-rate file ID in both forms. Document zero-based indices, zero outputs for invalid IDs or indices, and event time in seconds. See [MIDI file code](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/InOut/midifile.c). |
| `midifilepos`, `midifiletempo`, `midifilestatus` | Match file-ID rates and optional arguments to [opcode registrations](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/Engine/entry.c). |
| `midion2`, `outic`, `outic14`, `noteondur2`, `outiat`, `outipc` | Fix optional-port notation and parameter names. See [opcode registrations](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/Engine/entry.c). |
| `fft` | Distinguish input and output arrays, restore the optional inverse flag in the classic Complex form, and remove stray semicolons. The fixture compiles the Complex forms. |
| `genarray`, `genarray_i`, `maparray`, `slicearray`, `cepsinv`, `inletv` and related replacement examples | Declare array outputs with `[]`; correct input array notation and typed literal declarations. The fixture checks the main forms. Predeclared-array examples in `fillarray` remain valid and unchanged. |
| `mp3scal` | Document skip time's default of 0, k-rate phase locking, and the missing optional interpolation control. See [MP3 implementation and registration](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/Opcodes/mp3in.c). The fixture compiles the full form with k-rate controls. |
| `pan2` | Use `xp` consistently for the pan input. See [panning implementation](https://github.com/csound/csound/blob/1908f26f51f08b21e69d5f083a63d0a15033feff/Opcodes/pan2.c). |
| `loscil`, `loscil3` | Remove invalid trailing underscores from opcode names and use a normalized example amplitude. The fixture compiles both calls. |

Other synopsis fixes remove duplicate commas before optional arguments in
`fprintks`, `syncphasor`, `printsk`, `println`, `event`, `looptseg`, and `event_i`.

## Validation

Install `tools/requirements-audit.txt` in a Python virtual environment, then run:

```sh
python -m unittest discover -s tools -p 'test_*.py'
python tools/check_articles.py --json /tmp/manual-source-audit.json
mkdocs build --strict --site-dir /tmp/manual-format-after
python tools/check_articles.py --site /tmp/manual-format-after --json /tmp/manual-rendered-after.json
csound tools/synopsis-smoke.csd
```

Results: six checker tests pass, both article audits report zero findings across
1,607 articles, and the strict MkDocs build passes. The Csound syntax fixture
passes with Csound 7 commit `a4f50585d6d6c959c325f5d5db2764405a347289` and the MP3
and signal-flow-graph plugins. It compiles only; it does not play audio or load
the named media files. Browser checks covered `pow`, `midifilein`, `hsboscil`,
`fmvoice`, `bexprnd`, `greaterthan`, `inletv`, and `mp3scal`.

The automated checks cover document structure, selected conversion errors, and
modern synopsis delimiters. They do not prove every DSP claim, parameter default,
or example in the manual. The source checks above cover the stated corrections;
legacy opcode articles and aliases remain in place.
