# My Shell Kit

Cross-platform shell setup and terminal customization for:

- Fedora Linux
- macOS
- Windows
- WSL (Windows Subsystem for Linux)

Each platform folder contains:

- a local `README.md` with full setup instructions
- a local `.zshrc` profile (or PowerShell profile on Windows)
- plugin installation steps (including `git clone` commands)

## Repository Structure

- `fedora/`: Fedora Zsh profile and Linux-specific aliases/scripts.
- `macos/`: macOS Zsh profile and setup notes.
- `windows/`: Windows Terminal + PowerShell profile + optional Zsh notes (via WSL or MSYS2).
- `wsl/`: WSL Zsh profile and Linux-in-Windows setup.

## How to Use

1. Open the folder matching your operating system.
2. Follow the local `README.md` step-by-step.
3. Install Zsh, Oh My Zsh, required tools, and plugins.
4. Copy the local `.zshrc` to your home directory and reload your shell.

## Notes

- All documentation, comments, and printed output in this repository are in English.
- Package managers used by platform:
	- Windows: `winget`
	- Fedora: `dnf`
	- macOS: `brew` (Homebrew)