# If you come from bash you might need to adjust your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Start startup time measurement (milliseconds).
ZSH_START_TIME=$(date +%s%3N)

# Set list of themes to pick from when loading at random.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior.
# zstyle ':omz:update' mode disabled
# zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
plugins=(git zsh-autosuggestions zsh-syntax-highlighting you-should-use zsh-bat)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment.
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions.
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags.
# export ARCHFLAGS="-arch $(uname -m)"

# Basic aliases.
alias zshconf="code ~/.zshrc"
alias fetchconf="code ~/.config/fastfetch/config.jsonc"
alias ..="cd .."
alias ...="cd ../.."
alias ll="ls -alFh"
alias py="python3"
alias open="open ."
alias avenv="source ./venv/bin/activate"
alias ovenv="deactivate"

# Print active Zsh version.
echo "Zsh $ZSH_VERSION"

# Show fastfetch only once after each system boot.
FLAG="/tmp/.fastfetch_ran_$(whoami)"
BOOT_TIME="$(sysctl -n kern.boottime 2>/dev/null)"

STORED_TIME=""
[[ -f "$FLAG" ]] && STORED_TIME="$(cat "$FLAG" 2>/dev/null)"

if [[ -n "$BOOT_TIME" ]] && [[ "$STORED_TIME" != "$BOOT_TIME" ]]; then
    fastfetch
    echo "$BOOT_TIME" > "$FLAG"
fi

# End startup time measurement.
ZSH_END_TIME=$(date +%s%3N)

# Compute and print shell load duration.
ZSH_LOAD_TIME=$((ZSH_END_TIME - ZSH_START_TIME))
echo "Loading personal and system profiles took ${ZSH_LOAD_TIME}ms."
