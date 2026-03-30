# Neovim Config

## Stack

- **Plugin manager**: lazy.nvim (auto-installs on first run, lockfile at `lazy-lock.json`)
- **Lua formatter**: stylua (160-char width, 2-space indent, Unix line endings — `.stylua.toml`)
- **Completion**: blink.cmp
- **LSP installer**: mason.nvim
- **Fuzzy finder**: telescope.nvim
- **Syntax**: nvim-treesitter
- **Color scheme**: Catppuccin (mocha)
- **Leader key**: Space

## Structure

```
init.lua                  # Main entry: requires modules, configures lazy.nvim, core plugins
lua/
  options.lua             # Editor options (numbers, tabs, clipboard, splits, etc.)
  keymaps.lua             # All keybindings (leader = Space)
  autocmds.lua            # Autocommands (yank highlight, file auto-reload)
  custom/plugins/         # Custom plugin specs, one file per plugin
    theme.lua             # Catppuccin color scheme
    harpon.lua            # Harpoon file marks/navigation
    oil.lua               # File explorer as editable buffer
    gitter.lua            # Neogit git UI
    diffview.lua          # Git diff viewer
    marks.lua             # Enhanced mark management
    codex.lua             # AI code assistant popup
    supermaven.lua        # AI code completion
    autoparis.lua         # Auto-pairs for brackets/quotes
    wordpress.lua         # WordPress site editing integration
  kickstart/plugins/      # Reference kickstart plugins (mostly unused)
lsp/
  gdscript.lua            # GDScript LSP for Godot Engine
doc/
  kickstart.txt           # Kickstart.nvim docs
```

## Plugin Conventions

Each custom plugin lives in `lua/custom/plugins/<name>.lua` and returns a lazy.nvim spec table. They are auto-imported via `{ import = 'custom.plugins' }` in `init.lua`. Core plugins are defined directly in `init.lua`.

## Key Bindings Summary

| Prefix | Domain |
|--------|--------|
| `<leader>s*` | Telescope search (files, grep, help, keymaps) |
| `<leader>g*` | Git (blame, open) |
| `<leader>h` / `<leader>1-5` | Harpoon menu / jump to mark |
| `gd`, `gr*`, `<leader>rn` | LSP (goto def, references, rename) |
| `-` | Oil file explorer |
| `<leader>c` | Close buffer |

## Domain-Specific Notes

- **Godot**: GDScript LSP configured in `lsp/gdscript.lua`; project auto-detected by presence of `project.godot`
- **WordPress**: Custom plugin in `custom/plugins/wordpress.lua` for site editing workflows
- **AI**: Supermaven (inline completion) + Codex (popup assistant) both active
