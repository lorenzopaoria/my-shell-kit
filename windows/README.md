# Windows Setup (PowerShell + Terminal + Optional Zsh)

This folder contains:

- `profile.ps1` for PowerShell customization
- `settings_terminal.json` for Windows Terminal
- `.zshrc` for optional Zsh usage (typically via WSL)

## Requirements (winget)

Install core tools with `winget`:

```powershell
winget install --id Microsoft.PowerShell --source winget
winget install --id Microsoft.WindowsTerminal --source winget
winget install --id JanDeDobbeleer.OhMyPosh --source winget
winget install --id Microsoft.CascadiaCode --source winget
winget install --id Git.Git --source winget
```

Optional tools used in `profile.ps1`:

```powershell
winget install --id winfetch-cli.winfetch --source winget
```

Install the `Terminal-Icons` PowerShell module:

```powershell
Install-Module -Name Terminal-Icons -Repository PSGallery -Scope CurrentUser
```

## Apply PowerShell Profile

Copy this profile into your PowerShell profile path:

```powershell
copy profile.ps1 $PROFILE
```

Then reload PowerShell:

```powershell
. $PROFILE
```

## Apply Windows Terminal Settings

Replace your Windows Terminal settings with this file content (`settings.json`), or merge manually:

- source file: `settings_terminal.json`

## Optional: Use Zsh on Windows

Recommended approach: use Zsh in WSL. See `../wsl/README.md`.

If you already have a Zsh environment on Windows, copy `.zshrc` and run:

```bash
cp .zshrc ~/.zshrc
source ~/.zshrc
```

## What This Configuration Adds

- Oh My Posh prompt initialization.
- Terminal icons module import.
- One-time-per-boot `winfetch` output.
- Simple PowerShell aliases (`ll`, `la`).
