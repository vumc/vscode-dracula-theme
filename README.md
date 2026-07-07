# Dracula for Visual Studio Code

> A dark theme for [Visual Studio Code](https://code.visualstudio.com/) — ported from the [Zed Dracula theme](https://github.com/dracula/zed).

Ships three flavors:

- **Dracula** — the classic dark theme.
- **Dracula Solid** — same palette, opaque chrome (no translucent layers).
- **Dracula Light (Alucard)** — the official light counterpart.

## Install

1. Open Visual Studio Code.
2. Press `Ctrl+P` / `Cmd+P` and run `ext install dracula-theme.theme-dracula`.
3. `Ctrl+K Ctrl+T` / `Cmd+K Cmd+T` → pick **Dracula**, **Dracula Solid**, or **Dracula Light (Alucard)**.

### Manual install (from source)

```sh
git clone https://github.com/vumc/vscode-dracula-theme.git
cd dracula/vscode
# package + install locally
npm install -g @vscode/vsce
vsce package
code --install-extension theme-dracula-*.vsix
```

## What's mapped

This extension is a 1:1 port of the Zed theme spec to VSCode's color theme contract:

- All workbench surfaces (editor, sidebar, panels, tabs, status bar, title bar, terminal, peek view, diff, merge, etc.).
- TextMate token colors covering the full Zed `syntax` table (comment, string, number, keyword, type, function, attribute, tag, markdown, diff, etc.).
- Semantic highlighting (`parameter`, `type`, `interface`, `enumMember`, `selfKeyword`, …) to match Zed's modern tree-sitter coloring.

## Team

Maintained by the Dracula enthu

## License

[MIT License](../LICENSE)
