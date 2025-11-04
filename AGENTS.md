# Repository Guidelines

## Project Structure & Module Organization
`init.lua` sets global leaders and loads `lua/setup.lua` plus the `lua/core` defaults. `lua/core` holds editor options and keymaps that the rest of the config depends on. Plugin specs live in `lua/plugins`, grouped by responsibility (`ui.lua`, `lsp.lua`, `go-nvim.lua`, `vscode/`, etc.); mirror this layout when adding new features so Lazy loading stays predictable. Put shared helpers in `lua/utils`, and use `lua/plugins/lang` for language-specific overrides. When a plugin set changes, update `lazy-lock.json` so contributors inherit the locked versions.

## Build, Test, and Development Commands
Run the config in isolation with `NVIM_APPNAME=nvim nvim`, or spin up an experimental profile via `NVIM_APPNAME=nvim-dev nvim`. Sync and verify plugin state using `nvim --headless "+Lazy sync" "+Lazy check" +qa`. Confirm runtime health after changes with `nvim --headless "+checkhealth" +qa`. For Mason updates, open Neovim and run `:Mason` to install language servers configured in `lua/plugins/lsp.lua`.

## Coding Style & Naming Conventions
Format Lua with Stylua (`stylua .`), which enforces two-space indentation and a 120-column limit per `.stylua.toml`. Follow the existing file-naming pattern (`feature-area.lua` or `provider-name.lua`) and keep module namespaces aligned with their directories (e.g., require `plugins.ui`). Use descriptive table fields inside Lazy specs and move complex logic into small helpers in `lua/utils`. Prefer inline comments only when behavior is non-obvious.

## Testing Guidelines
There is no automated test suite; rely on headless runs and manual smoke checks. Before opening a PR, launch `nvim --headless "+Lazy sync" "+Lazy check" "+checkhealth" +qa` to ensure the config loads cleanly. For interactive features, start Neovim normally, exercise the new mappings, and inspect `:messages` for errors. Document any new external dependencies or manual steps required to reproduce the setup.

## Commit & Pull Request Guidelines
Follow the existing Conventional Commit style (`feat:`, `fix:`, `chore:`) and keep subjects concise. In PRs, link relevant issues, describe the motivation, note manual test steps, and call out UI-affecting changes with screenshots or GIFs. Mention whether `lazy-lock.json` changed and highlight follow-up work so reviews stay efficient.
