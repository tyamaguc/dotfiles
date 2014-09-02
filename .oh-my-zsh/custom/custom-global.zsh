HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
MYSQL=/opt/mysql/server-5.6/bin
NODE=$HOME/.nodebrew/current/bin

unsetopt correct
unsetopt correct_all

if [ -f ~/.mysqlenv/etc/bashrc ]; then
  source ~/.mysqlenv/etc/bashrc
fi

export EDITOR="emacsclient"
export LANG="ja_JP.UTF-8"
export LC_CTYPE="ja_JP.UTF-8"
export LESSCHARSET=utf-8
export PATH=$MYSQL:$HOME/bin:/sbin:/usr/local/bin:./vendor/binstubs:$HOME/.rbenv/bin:${HOME}/.rbenv/shims:$NODE:$PATH
eval "$(rbenv init -)"