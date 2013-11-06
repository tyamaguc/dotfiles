HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
MYSQL=/opt/mysql/server-5.6/bin

export EDITOR="emacsclient"
export LANG="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LESSCHARSET=utf-8
export PATH=$MYSQL:$HOME/bin:$HOME/.rbenv/bin:/sbin:$PATH
eval "$(rbenv init -)"