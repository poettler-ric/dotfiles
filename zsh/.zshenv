############################
# SETUP ENVIRONMENT
############################

[[ ":${PATH}:" == *:${HOME}/bin:* ]] || PATH="${HOME}/bin:${PATH}" 
[[ ":${PATH}:" == *:${HOME}/.local/bin:* ]] || PATH="${HOME}/.local/bin:${PATH}"
[[ ":${PATH}:" == *:${HOME}/nvim/nvim/bin:* ]] || PATH="${HOME}/nvim/nvim/bin:${PATH}"

############################
# EDITOR SETTINGS
############################
export EDITOR=vi
if type vim >/dev/null; then
	export EDITOR=vim
	alias vi=vim
fi
if type nvim >/dev/null; then
	export EDITOR=nvim
	alias vi=nvim
fi

############################
# BAT SETTINGS
############################

if type bat >/dev/null; then
  export PAGER=bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi

############################
# GO SETTINGS
############################

export GOPATH="${HOME}/go"
if [ -d "${GOPATH}/bin" ]; then
    [[ ":${PATH}:" == *:${GOPATH}/bin:* ]] || PATH="${GOPATH}/bin:${PATH}" 
fi
goroots=(
    /usr/lib/go
    /usr/lib/golang
)
for root ($goroots); do
    if [ -d $root ]; then
        export GOROOT=$root
    fi
done

############################
# RUST SETTINGS
############################

if [ -d "${HOME}/.cargo/bin" ]; then
    [[ ":${PATH}:" == *:${HOME}/.cargo/bin:* ]] || PATH="${HOME}/.cargo/bin:${PATH}" 
fi
if type sccache >/dev/null; then
    export RUSTC_WRAPPER=sccache
fi

############################
# PYTHON SETTINGS
############################

if [ -d "${HOME}/pylib" ]; then
    [[ ":${PYTHONPATH}:" == *:${HOME}/pylib:* ]] || PYTHONPATH="${HOME}/pylib:${PYTHONPATH}" 
    [[ ":${PATH}:" == *:${HOME}/pylib:* ]] || PATH="${HOME}/pylib:${PATH}"
    export PYTHONPATH
fi

############################
# JULIA SETTINGS
############################

if [ -d "${HOME}/julia/julia/bin" ]; then
    [[ ":${PATH}:" == *:${HOME}/julia/julia/bin:* ]] || PATH="${HOME}/julia/julia/bin:${PATH}"
    alias j="julia -q"
    export JULIA_NUM_THREADS=auto
fi

############################
# TERMINAL SETTINGS
############################

# export TERMINAL=alacritty

############################
# NNN SETTINGS
############################

export NNN_OPENER="${HOME}/.config/nnn/plugins/nuke"
export NNN_PLUG="p:preview-tui;z:autojump"
export NNN_FIFO="${XDG_RUNTIME_DIR}/nnn.fifo"
export BIN=1
export GUI=1
export KITTY_LISTEN_ON="unix:${XDG_RUNTIME_DIR}/kitty-${KITTY_PID}"

############################
# SSH AGENT
############################

# if ! pgrep -u "$USER" ssh-agent >/dev/null; then
#     ssh-agent >"${XDG_RUNTIME_DIR}/ssh-agent.env"
# fi
# if [[ ! "$SSH_AUTH_SOCK" ]]; then
#     eval "$(<"${XDG_RUNTIME_DIR}/ssh-agent.env")" >/dev/null
# fi

############################
# ENABLE ZFS COMMANDS
############################

export ZPOOL_SCRIPTS_AS_ROOT=yes

############################
# HTTP PROXY
############################

# export http_proxy="http://127.0.0.1:8118"
# export https_proxy="https://127.0.0.1:8118"

############################
# EXPORTING
############################

export PATH

