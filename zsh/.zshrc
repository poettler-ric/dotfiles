bindkey -v

source "${HOME}/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept

autoload -Uz compinit && compinit
# case insensitive completion and complete even if in word
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt share_history

source "${HOME}/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

SUDO="sudo"
PACMAN="yay"
LS="eza"
alias b=bat
alias cal="cal -m"
alias datestr="date +%Y%m%d"
alias datetimestr="date +%Y%m%d%k%M"
alias df="df -h"
alias g=git
alias grep=rg
alias l="$LS -l"
alias la="$LS -a"
alias lg=lazygit
alias ll="$LS -la"
alias ls="$LS"
alias o=yazi
alias pacclean="$PACMAN -Sc"
alias paclsorphans="$PACMAN -Qdt"
alias pacrmorphans="$PACMAN -Rs \$($PACMAN -Qtdq | tr '\n' ' ')"
alias s="$SUDO"
alias suy="$PACMAN -Sy && $PACMAN -Que && $PACMAN -Suy"
alias suyi="$PACMAN -Sy && $PACMAN -Que && $PACMAN -Suy --ignore=linux --ignore=linux-lts --ignore=zfs-linux --ignore=zfs-linux-lts --ignore=zfs-utils"
alias sy="$PACMAN -Sy && $PACMAN -Que"
alias vdhcp="$SUDO virsh net-dhcp-leases default"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"

# must be sourced at the end of the file
source "${HOME}/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
