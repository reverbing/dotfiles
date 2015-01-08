############################################################################################
### Environmental variables
############################################################################################

case ${OSTYPE} in
    darwin*)
        export PATH=/usr/local/bin:/usr/texbin:$PATH
        export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
        export LANG=ja_JP.UTF-8
        ;;
    linux*)
        export EDITOR=vim
        export LANG=en_US.UTF-8
        ;;
esac


############################################################################################
### Alias
############################################################################################

case ${OSTYPE} in
    linux*)
        alias ls='ls --color=always'
        ;;
esac
alias la='ls -a'
alias ll='ls -l'
alias vi='vim'
alias tmux='tmux -2'
alias javac='javac -encoding UTF-8'
alias java='java -Dfile.encoding=UTF-8'
alias gosh='rlwrap gosh'
alias ocaml='rlwrap ocaml'


############################################################################################
### Language
############################################################################################

# 文字コードをUTF-8に設定
export LESSCHARSET=UTF-8


############################################################################################
### General Setting
############################################################################################

# KCODEをUTF-8に設定
export KCODE=u

# キーバインドをemacsモードに設定
bindkey -e
# キーバインドをvimモードに設定
# bindkey -v

# ビープ音を鳴らさない
setopt no_beep
# ディレクトリ名の入力のみで移動する
setopt auto_cd
# 移動したディレクトリを記録しておく
setopt auto_pushd
# コマンドのスペルを訂正する
setopt correct

# ファイルを色付け表示
export LSCOLORS=gxfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# 補完候補の色付け
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# lsコマンド時、自動をつける
export CLICOLOR=true


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

# 履歴を保存するファイル
HISTFILE=~/.zsh_history
# メモリに展開する履歴の数
HISTSIZE=10000
# 保存する履歴の数
SAVEHIST=10000
# 直前と同じコマンドを履歴に追加しない
setopt hist_ignore_dups 
# historyコマンドは履歴に保存しない
setopt hist_no_store
# 余分なスペースを削除して履歴に保存
setopt hist_reduce_blanks
# すぐに履歴ファイルに記録する
setopt inc_append_history
# zshの開始、終了時刻をヒストリファイルに書き込む
setopt extended_history


#############################################################################################
### Prompt
#############################################################################################

# プロンプトに色を付ける
autoload colors
colors

PROMPT="%{${fg[white]}%}[%n@%m]$ %{${reset_color}%}"
PROMPT2="%{${fg[white]}%}[%n@%m]> %{${reset_color}%}"
RPROMPT="%{${fg[white]}%}%~ %{${reset_color}%}"
SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

# OPAM configuration
. /Users/reverbing/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
