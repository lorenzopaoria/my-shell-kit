# WSL Setup (Zsh + Oh My Zsh)

This folder provides a lightweight `.zshrc` for WSL with optional `fastfetch` startup behavior.

## Requirements

Inside your WSL distro (Ubuntu/Debian example):

```bash
sudo apt update
sudo apt install -y zsh git curl wget fastfetch
```

## Install and Enable Zsh

```bash
zsh --version
chsh -s "$(which zsh)"
```

Close and reopen the WSL terminal after changing shell.

## Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Zsh Plugins (git clone)

The `.zshrc` uses these plugins:

- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- `you-should-use`
- `zsh-bat`

Install them:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat
```

Optional 6th plugin from the same guide: NVM (Oh My Zsh plugin + Node Version Manager installation).

Install NVM:

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
```

Then add `nvm` in your plugin list, for example:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat nvm)
```

## Apply This Configuration

From this folder:

```bash
cp .zshrc ~/.zshrc
source ~/.zshrc
```

## Notes

- The startup logic detects WSL and uses Windows boot time via PowerShell interop.
- If `fastfetch` is not installed, remove or comment its call in `.zshrc`.
