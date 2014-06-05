############################################################################################
### PATH
############################################################################################
export PATH=/usr/local/bin:/usr/texbin:$PATH
# export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export WORKON_HOME=~/.virtualenvs

source /usr/local/bin/virtualenvwrapper.sh

############################################################################################
### Alias
############################################################################################

alias ls='ls -G'
alias la='ls -a'
alias vi='vim'
# alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias javac='javac -encoding UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias gosh='rlwrap gosh'

############################################################################################
### Language
############################################################################################

export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8

############################################################################################
### General Setting
############################################################################################

export EDITOR=vim               # エディタをvimに設定
export LANG=ja_JP.UTF-8         # 文字コードをUTF-8に設定
export KCODE=u                  # KCODEをUTF-8に設定

bindkey -e                      # キーバインドをemacsモードに設定
# bindkey -v                      # キーバインドをvimモードに設定

setopt no_beep                  # ビープ音を鳴らさない
setopt auto_cd                  # ディレクトリ名の入力のみで移動する
setopt auto_pushd               # 移動したディレクトリを記録しておく
setopt correct                  # コマンドのスペルを訂正する

export LSCOLORS=gxfxcxdxbxegedabagacad              # ファイルを色付け表示

#############################################################################################
### Complement
#############################################################################################

autoload -U compinit; compinit            # 補完機能を有効にする
setopt auto_list                          # 補完候補を一覧で表示する
setopt auto_menu                          # TABで補完候補を順に切り替える
setopt auto_param_keys                    # 対応する括弧を自動補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

#############################################################################################
### History
#############################################################################################

HISTFILE=~/.zsh_history                   # 履歴を保存するファイル
HISTSIZE=10000                            # メモリに展開する履歴の数
SAVEHIST=10000                            # 保存する履歴の数
setopt hist_ignore_dups                   # 直前と同じコマンドを履歴に追加しない
setopt hist_no_store                      # historyコマンドは履歴に保存しない
setopt hist_reduce_blanks                 # 余分なスペースを削除して履歴に保存
setopt inc_append_history                 # すぐに履歴ファイルに記録する
setopt extended_history                   # zshの開始、終了時刻をヒストリファイルに書き込む

#############################################################################################
### Prompt
#############################################################################################

autoload colors                         # プロンプトに色を付ける
colors

PROMPT="%{${fg[white]}%}[%n@%m]$ %{${reset_color}%}"
PROMPT2="%{${fg[white]}%}[%n@%m]> %{${reset_color}%}"
RPROMPT="%{${fg[white]}%}%/ %{${reset_color}%}"
SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

