# Visual Studio Code

## Setup

Open settings (Ctrl+,) and search "font size". Set font size to 20 (18 on desktop) everywhere.

Install extensions (via Ctrl+P):

```
ext install Horla.horla-light-theme
ext install emmanuelbeziat.vscode-great-icons

ext install 2gua.rainbow-brackets
ext install mechatroner.rainbow-csv

ext install ms-python.python
ext install esbenp.prettier-vscode

ext install waderyan.gitblame
ext install donjayamanne.githistory

ext install stkb.rewrap
ext install jackytsu.text-transformer
ext install bibhasdn.unique-lines
```

Add to settings.json:

```json
    "debug.console.fontSize": 20,
    "editor.accessibilitySupport": "off",
    "editor.dragAndDrop": false,
    "editor.fontSize": 20,
    "editor.renderWhitespace": "boundary",
    "editor.rulers": [80, 100],
    "editor.wordWrap": "bounded",
    "editor.wordWrapColumn": 120,
    "files.trimFinalNewlines": true,
    "files.trimTrailingWhitespace": true,
    "terminal.integrated.fontSize": 20,
    "window.menuBarVisibility": "toggle",
    "window.titleBarStyle": "custom",
    "workbench.colorTheme": "Horla",
    "workbench.editor.closeOnFileDelete": true,
    "workbench.editor.enablePreview": false,
    "workbench.editor.enablePreviewFromQuickOpen": false,
    "workbench.editor.showTabs": false,
    "workbench.iconTheme": "vscode-great-icons",
    "git.enableSmartCommit": true,

    // Extensions
    "markdown.preview.fontSize": 20,
    "prettier.requireConfig": true,
    "rewrap.reformat": true,
    "rewrap.wrappingColumn": 100,

    // Python
    "[python]": {
        "editor.formatOnSave": true
    },
    "python.analysis.memory.keepLibraryAst": true,
    "python.formatting.blackPath": "C:\\Python38\\Scripts\\black.exe",
    "python.formatting.provider": "black",
    "python.jediEnabled": false,
    "python.linting.mypyEnabled": true,
    "python.linting.mypyPath": "C:/Python38/Scripts/mypy.exe",
    "python.linting.pycodestyleEnabled": false,

    // Javascript
    "[javascript]": {
        "editor.formatOnSave": true
    },
    "[javascriptreact]": {
        "editor.formatOnSave": true
    },
    "prettier.requireConfig": true,
```
