# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A VumC-maintained fork/port of the Dracula theme, targeting two editors from one shared palette:

- `zed/themes/dracula.json` — the Zed extension theme (source of truth per the VSCode README). A single JSON file, `$schema: https://zed.dev/schema/themes/v0.2.0.json`, containing a `themes` array with three variant entries: `Dracula` (dark), `Dracula Solid` (dark, opaque chrome), and `Dracula Light (Alucard)` (light). Each variant has a full `style` block (workbench colors, `players` cursor colors for multiplayer, and a `syntax` table of tree-sitter token styles).
- `vscode/themes/*.json` — hand-ported VSCode color themes, one file per variant:
  - `dracula-color-theme.json` → Dracula
  - `dracula-solid-color-theme.json` → Dracula Solid
  - `dracula-light-color-theme.json` → Dracula Light (Alucard)
  
  Each VSCode theme file has three top-level sections that correspond to the Zed source: `colors` (workbench UI, ported from Zed's `style` keys), `tokenColors` (TextMate grammar scopes, ported from Zed's `syntax` table), and `semanticTokenColors` (semantic highlighting like `parameter`, `type`, `enumMember`, `selfKeyword` — Zed's tree-sitter-driven equivalent).
- `vscode/package.json` — the VSCode extension manifest (`vumc-zed-dracula-theme`, publisher `vumc`). `contributes.themes` registers the three theme labels and wires each to its JSON file and `uiTheme` (`vs-dark` for the two dark variants, `vs` for the light one).
- `extension.toml` — the Zed extension manifest (`vumc-vscode-dracula`).
- `screenshot/` — preview images referenced from README files.

There is no build system, package manager install step, linter, or test suite in this repo — it is static JSON theme data plus two manifest files. There is nothing to `npm install`, compile, or run.

## Working with theme files

When changing a color or adding token support, treat Zed and VSCode as two independent files that must be kept in sync by hand — there is no generation script:

1. Decide the color/scope change conceptually (e.g., "make `comment.doc` pink").
2. Apply it in `zed/themes/dracula.json` inside the correct variant's `style.syntax` (or top-level `style` key for workbench colors).
3. Apply the equivalent change in the corresponding `vscode/themes/*-color-theme.json` file — in `tokenColors` (match the TextMate `scope`, not the Zed key name — scope names differ between the two systems) or `colors`/`semanticTokenColors` as appropriate. Verify the scope string is a real TextMate scope (e.g. via VSCode's built-in scope inspector, `Developer: Inspect Editor Tokens and Scopes`, or the standard dot-delimited naming convention from the TextMate grammar spec) rather than copying Zed's tree-sitter key name verbatim — e.g. Zed's `string.escape` key does not correspond to a real scope named `string.escape`; the correct TextMate scope is `constant.character.escape`. A prior pass added several such invented scopes (`string.escape`, `string.regex`) alongside the correct ones (`constant.character.escape`, `string.regexp`) — they're harmless dead weight since no grammar emits them, but don't propagate the pattern.
4. Repeat for all three variants if the change is palette-wide, not variant-specific. Zed stores all three variants in one file (search for `"name": "Dracula Solid"` / `"name": "Dracula Light (Alucard"` to jump between them); VSCode splits them into three separate files.
5. Colors in the Zed file use 8-digit hex (`#RRGGBBAA`); VSCode's `colors`/`tokenColors` typically use 6-digit hex unless alpha is needed — check existing entries in the target file for the convention in use at that location.

## Validating changes

Since there's no test suite, verify JSON theme edits by:
- Confirming the file still parses as valid JSON (e.g. `node -e "JSON.parse(require('fs').readFileSync('vscode/themes/dracula-color-theme.json'))"` or equivalent).
- Loading the theme in the actual editor (VSCode: `Ctrl+K Ctrl+T` → pick the variant; Zed: reload the extension) and inspecting the affected UI surface or syntax scope visually — theme correctness here is inherently visual and can't be caught by static checks.

## Packaging (VSCode)

Per `vscode/README.md`, local packaging/install uses `vsce`:

```sh
npm install -g @vscode/vsce
cd vscode
vsce package
code --install-extension theme-dracula-*.vsix
```

## Line endings

`.gitattributes` normalizes the repo to LF, with two carve-outs: `.claude/` is git-ignored, and `.bat`/`.cmd` scripts are forced to CRLF (required for `cmd.exe`). Don't fight this — let Git normalize on checkout rather than hand-editing line endings.
