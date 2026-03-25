# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Inizio misurazione tempo (millisecondi)
ZSH_START_TIME=$(date +%s%3N)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# export nvidia
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
#
# aliases
alias zshconf="code ~/.zshrc"
alias fetchconf="code ~/.config/fastfetch/config.jsonc"
alias cleanall="sudo dnf autoremove && sudo dnf clean all && sudo dnf upgrade --refresh"
alias updateall="topgrade"
alias py="python3"
alias open="xdg-open ."
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -alFh"
alias avenv="source ./venv/bin/activate"
alias ovenv="deactivate"
alias system-fix='echo "\e[1;34m── $(date +%H:%M:%S) - Verifica integrità RPM ──────────────────────────────────────\e[0m"; sudo rpm -Va --nofiles --nodeps | grep -v "^\.\{8\}" || echo "File di sistema integri."; echo "\e[1;34m── $(date +%H:%M:%S) - Errori Hardware (dmesg) ──────────────────────────────────\e[0m"; sudo dmesg -l err,warn | tail -n 5; echo "\e[1;34m── $(date +%H:%M:%S) - Pulizia DNF & Orfani ─────────────────────────────────────\e[0m"; sudo dnf clean all && sudo dnf autoremove -y && dnf repoquery --extras --unneeded | xargs -r sudo dnf remove -y; echo "\e[1;34m── $(date +%H:%M:%S) - Flatpak Unused ───────────────────────────────────────────\e[0m"; flatpak uninstall --unused -y; echo "\e[1;34m── $(date +%H:%M:%S) - Journald Logs ────────────────────────────────────────────\e[0m"; sudo journalctl --vacuum-time=2d; echo "\e[1;34m── $(date +%H:%M:%S) - Crash Logs & Trash ───────────────────────────────────────\e[0m"; sudo find /var/spool/abrt/ -mindepth 1 -delete 2>/dev/null && echo "ABRT pulito."; rm -rf ~/.local/share/Trash/* 2>/dev/null && echo "Cestino svuotato."; echo "\n\e[1;32m✔ Manutenzione completata con successo!\e[0m"'
# Status della batteria e del limite 80%
alias bat-status='echo "\e[1;34m── $(date +%H:%M:%S) - Acer Health Status ───────────────────────\e[0m"; h_status=$(cat /sys/bus/wmi/drivers/acer-wmi-battery/health_mode 2>/dev/null); if [ "$h_status" = "1" ]; then echo "\e[1;32mON - Limite 80% ATTIVO\e[0m"; else echo "\e[1;31mOFF - Carica libera al 100%\e[0m"; fi; echo "\e[1;34m── $(date +%H:%M:%S) - Info Generali ──────────────────────────────────────────\e[0m"; echo "    temperatura:         $(awk "{print \$1/1000}" /sys/bus/wmi/drivers/acer-wmi-battery/temperature 2>/dev/null)°C"; upower -i $(upower -e | grep BAT) | grep --color=never -E "state|percentage|capacity"; echo "\n\e[1;32m✔ Driver MOK Signed operativo.\e[0m\n"'
alias bat-80="echo 1 | sudo tee /sys/bus/wmi/drivers/acer-wmi-battery/health_mode"
alias bat-100="echo 0 | sudo tee /sys/bus/wmi/drivers/acer-wmi-battery/health_mode"
alias fix-bat='~/.ripristina-batteria.sh'

# Stampa versione Zsh
echo "Zsh $ZSH_VERSION"

# Fine misurazione tempo
ZSH_END_TIME=$(date +%s%3N)

# Calcolo durata
ZSH_LOAD_TIME=$((ZSH_END_TIME - ZSH_START_TIME))

# Messaggi da stampare
echo "Loading personal and system profiles took ${ZSH_LOAD_TIME}ms."

# fastfetch solo al primo terminale dopo ogni boot
FLAG="/tmp/.fastfetch_ran_$(whoami)"

# Estrae il btime (secondi dall'epoca Unix all'avvio) in modo universale su Linux
BOOT_TIME=$(awk '/^btime/ {print $2}' /proc/stat)

STORED_TIME=""
[[ -f "$FLAG" ]] && STORED_TIME=$(cat "$FLAG" 2>/dev/null)

if [[ "$STORED_TIME" != "$BOOT_TIME" ]]; then
    fastfetch
    echo "$BOOT_TIME" > "$FLAG"
fi
