if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias psc='ps xawf -eo pid,user,cgroup,args'
alias registriy_ipsw_dockerlogin='docker login --username $(oc whoami) --password $(oc whoami -t) registry.ipsw.dt.ept.lu'
alias vi="vim"
alias _reload_profile=". ~/.bashrc"
alias dotfiles="cd ~/workspace/dotfiles"
alias tmp="cd ~/workspace/tmp"
alias _load_virtualenv=". ~/workspace/env/bin/activate"
alias ansr="cd ~/workspace/ansible-roles"
alias ans="cd ~/workspace/ansible"
alias ansi="cd ~/workspace/ansible-inventory"
alias memo="vi ~/workspace/stuff/memo"
alias _load_adt=". ~/.p/load.sh"
