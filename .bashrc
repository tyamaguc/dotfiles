# Basic
umask 022
ulimit -c 0
export PAGER=less
export LESS=-q
export RSYNC_RSH=ssh
IGNOREEOF=10
HISTSIZE=1000
HISTFILESIZE=1000
PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin:/usr/local/bin:$HOME/bin

# Alias
alias ll='ls -la'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias em='emacsclient --tty'

# Subversion
export SVN_EDITOR=emacs

# Language
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

# Color
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi