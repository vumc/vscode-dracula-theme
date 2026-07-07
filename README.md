# Dracula for Visual Studio Code

> A dark theme for [Visual Studio Code](https://code.visualstudio.com/) — ported from the [Zed Dracula theme](https://github.com/dracula/zed).

Ships three flavors:

- **Dracula** — the classic dark theme.
- **Dracula Solid** — same palette, opaque chrome (no translucent layers).
- **Dracula Light (Alucard)** — the official light counterpart.

## Install

1. Open Visual Studio Code.
2. Press `Ctrl+P` / `Cmd+P` and run `ext install vumc.vumc-vscode-dracula-theme`.
3. `Ctrl+K Ctrl+T` / `Cmd+K Cmd+T` → pick **VumC Dracula**, **VumC Dracula Solid**, or **VumC Dracula Light (Alucard)**.

### Manual install (from source)

[`@vscode/vsce`](https://www.npmjs.com/package/@vscode/vsce) ("**V**isual **S**tudio **C**ode **E**xtensions") is Microsoft's official CLI for packaging and publishing VSCode extensions. When you run `vsce package`, it:

- Reads `vscode/package.json` for the extension manifest (name, version, `contributes.themes`, etc.).
- Bundles the extension's files into a single `.vsix` archive, respecting `.vscodeignore` exclusions.
- Validates required manifest fields before packaging — e.g. `version` must be strict semver (`major.minor.patch`), not `"1.0"`.
- Outputs the same `.vsix` artifact format used when installing from the Marketplace, so a successful local package is a reliable signal that publishing would also succeed.

```sh
git clone https://github.com/vumc/vscode-dracula-theme.git
cd vscode-dracula-theme/ 
# package + install locally
npm install -g @vscode/vsce
vsce package
code --install-extension vumc-vscode-dracula-theme-*.vsix
```

### Uninstall

```sh
code --uninstall-extension vumc.vumc-vscode-dracula-theme
# if you installed before the extension was renamed, also remove the old one:
code --uninstall-extension vumc.vumc-zed-dracula-theme
```

### Verify install location

```sh
# cross-platform — lists installed extension ids
code --list-extensions | grep -i dracula
```

```sh
# Unix/macOS/Git Bash — inspect the extensions folder directly
ls ~/.vscode/extensions | grep -i dracula
```

```powershell
# Windows PowerShell — inspect the extensions folder directly
Get-ChildItem "$env:USERPROFILE\.vscode\extensions" | Where-Object Name -Match "dracula"
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
