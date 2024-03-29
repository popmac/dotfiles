#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# zsh-completionsを読み込み
fpath=(path/to/zsh-completions/src $fpath)

# pecoの設定
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# 過去に同じ履歴が存在しても、古い履歴を削除しないようにする
unsetopt histignorealldups
# 同じコマンドを繰り返しても、履歴に残す
unsetopt histignoredups

# []などのメタ文字をエスケープしないで使えるようにする
setopt nonomatch
# #をエスケープしないで使えるようにする
setopt interactivecomments

alias ll='ls -alF'

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/opt/mysql@5.6/bin:$PATH
export PATH=/usr/local/opt/qt@5.5/bin:$PATH
export PATH=/usr/local/opt/imagemagick@6/bin:$PATH
export ELASTICPATH=/usr/local/opt/elasticsearch@5.6/libexec/bin/
export PATH=$PATH:$ELASTICPATH
export PATH=~/.ghq/github.com/CircleAround/bin:$PATH
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
