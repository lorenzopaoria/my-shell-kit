# Fedora Setup (Zsh + Oh My Zsh)

This folder contains a Fedora-focused Zsh configuration and helper aliases.

## Requirements

Install the required packages with `dnf`:

```bash
sudo dnf install -y zsh git curl wget fastfetch bat util-linux-user
```

Optional but recommended tools used by aliases:

```bash
sudo dnf install -y topgrade flatpak upower
```

## Install and Enable Zsh

```bash
zsh --version
chsh -s "$(which zsh)"
```

Log out and log back in after changing the default shell.

## Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install Zsh Plugins (git clone)

Clone custom plugins into Oh My Zsh custom plugins directory:

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

## What This Configuration Adds

- Startup time measurement and shell load log message.
- One-time-per-boot `fastfetch` display.
- Quality-of-life aliases (`ll`, `..`, virtualenv helpers, etc.).
- Fedora maintenance aliases (`cleanall`, `updateall`, `system-fix`).
- Optional Acer battery helper aliases.

## Notes

- `system-fix`, battery aliases, and cleanup aliases can run privileged commands.
- If `bat` command is missing, install package `bat`.
- If you do not use Acer battery modules, battery aliases can be removed safely.
