# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export PATH=${PATH}:~/workspace/bin:~/workspace/stuff/scripts:~/.local/bin:/opt/ansible/env/bin:/opt/fabric2/env/bin:~/workspace/go/bin
export GOPATH=~/workspace/go
export LANG=en_US.utf8
export HISTCONTROL=ignoredups:ignorespace      # don't put duplicated to history
export HISTSIZE=10000                          # History size length
export HISTFILESIZE=20000                      # Hitstory filesize
shopt -s histappend                            # append to hist after each cmd
shopt -s checkwinsize                          # Check window size after each
                                               # command update LINES COLUMNS
# Bash prompt reload everytime
# -----------------------------------------------------------------------------
#
# Save and reload the history after each command finishes
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND;"
EDITOR_CMD=vim
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=$EDITOR_CMD
export VISUAL=$EDITOR_CMD
# Gpg signature
export GPG_TTY=$(tty)

export ANSIBLE_HOME=/home/users/dmaas/workspace/ansible
export ANSIBLE_CONFIG=/home/users/dmaas/workspace/ansible/ansible.cfg
export ANSIBLE_VAULT_PASSWORD_FILE=/home/users/dmaas/.ansiblevault

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# Remap TERM environment variable
case "$TERM" in
  xterm*|rxvt-unicode*) TERM="xterm-256color" ;;
  alacritty) TERM="xterm-256color" ;;
esac

# If we have a colorful terminal set color_prompt to yes
case "$TERM" in
  xterm-256color) color_prompt=yes ;;
  tmux-256color) color_prompt=yes ;;
  screen-256color) color_prompt=yes ;;
  rxvt-unicode-256color) color_prompt=yes ;;
  alacritty) color_prompt=yes ;;
esac


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ "$color_prompt" = yes ]; then
  # Set prompt
  PROMPT_COMMAND=prompt_command_function
else
  # shellcheck disable=SC2153
  PS1="${GREEN}\u@${BLUE}\h${RESET}:${RESET}\w \$ "
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/workspace/.p/load.sh ]; then
    . ~/workspace/.p/load.sh
fi


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

unset color_prompt force_color_prompt

#if [ -d "/opt/pyenv/bin" ];then
#  export PATH="/opt/pyenv/bin:$PATH"
#  eval "$(pyenv init -)"
#  eval "$(pyenv virtualenv-init -)"
#fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source <(kubectl completion bash)
