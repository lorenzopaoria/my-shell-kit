# Shell Configuration Profiles

This repository contains configuration files for customizing **Zsh** and **PowerShell** terminal environments. Both profiles are designed to enhance user experience, improve productivity, and speed up terminal workflows.

---

## Zsh Profile (`.zshrc`)

### Description
This file configures the **Zsh** shell using the [Oh My Zsh](https://ohmyz.sh/) framework. It includes theme customization, useful plugins, performance optimizations, and startup utilities.

### Key Features:
- **Theme**: Uses the `robbyrussell` theme (configurable to random themes)
- **Performance Monitoring**: Measures and displays profile load time in milliseconds
- **Plugins**: 
  - `git` - Git integration and aliases
  - `zsh-autosuggestions` - Command suggestions based on history
  - `zsh-syntax-highlighting` - Real-time syntax highlighting
  - `you-should-use` - Reminds you of existing aliases
  - `zsh-bat` - Enhanced file viewing with syntax highlighting
- **System Information**: Displays Zsh version on startup
- **Smart Fetch**: Runs `fastfetch` only once per session using a flag file
- **Customizable**: Supports custom plugins and aliases in `$ZSH_CUSTOM` directory
- **Configurable Options**: Commented guidance for PATH, editor, environment variables, and auto-update behavior

### Installation & Usage
1. Ensure [Oh My Zsh](https://ohmyz.sh/) is installed on your system
2. Copy or symlink this file as `.zshrc` to your home directory (`~`)
3. Install the required plugins:
   ```bash
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
   git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   git clone https://github.com/MichaelAquilina/zsh-you-should-use ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
   git clone https://github.com/fdellwing/zsh-bat ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat
   ```
4. Install `fastfetch` for system information display
5. Reload your terminal or run `source ~/.zshrc` to apply changes

---

## PowerShell Profile (`profile.ps1`)

### Description
This file configures **PowerShell** with customizations optimized for Windows environments, featuring Oh My Posh integration and enhanced terminal visuals.

### Key Features:
- **Oh My Posh Integration**: Initializes with the `robbyrussell` theme for a beautiful, informative prompt
- **Terminal Icons**: Imports the `Terminal-Icons` module for file and folder icons
- **Smart Fetch**: Runs `winfetch` only once per session using a flag file
- **Custom Aliases**:
  - `ll` - List all files including hidden (`Get-ChildItem -Force`)
  - `la` - Recursively list all files (`Get-ChildItem -Force -Recurse`)

### Installation & Usage
1. Install prerequisites:
   ```powershell
   # Install Oh My Posh
   winget install JanDeDobbeleer.OhMyPosh -s winget
   
   # Install Terminal-Icons module
   Install-Module -Name Terminal-Icons -Repository PSGallery
   
   # Install winfetch
   Install-Script -Name winfetch
   ```

2. Find your PowerShell profile path:
   ```powershell
   $PROFILE
   ```

3. Copy the `profile.ps1` content to your PowerShell profile location

4. Create the Oh My Posh theme directory and ensure the `robbyrussell.omp.json` theme is available:
   ```powershell
   # Theme should be located at: $HOME\oh-my-posh\robbyrussell.omp.json
   ```

5. Restart PowerShell or run:
   ```powershell
   . $PROFILE
   ```

---

## Repository Structure
```
.
├── .zshrc.txt          # Zsh configuration file
├── profile.ps1         # PowerShell configuration file
└── README.md           # This file
```

---

## Customization Tips

### For Zsh:
- Modify `ZSH_THEME` to change the prompt appearance
- Add custom aliases in `$ZSH_CUSTOM/aliases.zsh`
- Adjust plugins in the `plugins=()` array
- Uncomment configuration options to enable features like auto-correction, case-sensitive completion, etc.

### For PowerShell:
- Change the Oh My Posh theme by modifying the `--config` path
- Add more aliases following the `Set-Alias` pattern
- Import additional modules for extended functionality
- Customize the prompt by editing or creating your own `.omp.json` theme file

---

## Requirements

### Zsh Profile:
- Zsh shell
- Oh My Zsh framework
- Git
- fastfetch (optional but recommended)
- Nerd Fonts (recommended for icons and glyphs)

### PowerShell Profile:
- PowerShell 5.1 or later (PowerShell 7+ recommended)
- Oh My Posh
- Terminal-Icons module
- winfetch
- Nerd Fonts (required for proper icon display)

---

## Contributing
Feel free to fork this repository and customize the configurations to your needs. Suggestions and improvements are welcome!

---

## License
These configuration files are provided as-is for personal use and customization.