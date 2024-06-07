bindkey -v

source "${HOME}/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
bindkey '^ ' autosuggest-accept

source "${HOME}/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
bindkey '^K' history-substring-search-up
bindkey '^J' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

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
alias pacrmorphans="$PACMAN -Rs $($PACMAN -Qtdq)"
alias s="$SUDO"
alias suy="$PACMAN -Sy && $PACMAN -Que && $PACMAN -Suy"
alias suyi="$PACMAN -Sy && $PACMAN -Que && $PACMAN -Suy --ignore=linux --ignore=linux-lts --ignore=zfs-linux --ignore=zfs-linux-lts --ignore=zfs-utils"
alias sy="$PACMAN -Sy && $PACMAN -Que"
alias vdhcp="$SUDO virsh net-dhcp-leases default"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# must be sourced at the end of the file
source "${HOME}/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
