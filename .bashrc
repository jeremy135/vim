# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

test -s ~/.alias && . ~/.alias || true
###-begin-bem-completion-###
#
# bem command completion script
#
# Installation: bem completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: bem completion > /usr/local/etc/bash_completion.d/bem
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if complete &>/dev/null; then
  _bem_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           bem completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _bem_completion bem
elif compctl &>/dev/null; then
  _bem_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       bem completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _bem_completion bem
fi
###-end-bem-completion-###

export NVM_DIR=$HOME"/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export NPM_PACAKGES="$HOME/.npm"

export PATH="$NPM_PACAKGES/bin:$PATH"

unset MANPATH

export MANPATH="$NPM_PACAKGES/share/man:$(manpath)"

export NODE_PATH="$NPM_PACAKGES/lib/node_modules:$NODE_PATH"
# for isp_service
export DHOST=188.120.252.210

alias ccat='pygmentize -g'
alias ls='ls -alh --color'

printf "\e[?2004l"
# The option '--bash' is not registered with the completion command. Run `ng completion --help` for a list of supported options.
###-begin-ng-completion###
#
# ng command completion script
#
# Installation: ng completion 1>> ~/.bashrc 2>>&1
#           or  ng completion 1>> ~/.zshrc 2>>&1
#

ng_opts='b build completion doc e2e g generate get github-pages:deploy gh-pages:deploy h help i init install lint make-this-awesome new s serve server set t test v version -h --help'

build_opts='--aot --base-href --environment --output-path --suppress-sizes --target --watch --watcher -bh -dev -e -o -prod -t -w'
generate_opts='class component directive enum module pipe route service c cl d e m p r s --help'
github_pages_deploy_opts='--base-href --environment --gh-token --gh-username --message --skip-build --target --user-page -bh -e -t'
help_opts='--json --verbose -v'
init_opts='--dry-run inline-style inline-template --link-cli --mobile --name --prefix --routing --skip-bower --skip-npm --source-dir --style --verbose -d -is -it -lc -n -p -sb -sd -sn -v'
new_opts='--directory --dry-run inline-style inline-template --link-cli --mobile --prefix --routing --skip-bower --skip-git --skip-npm --source-dir --style --verbose -d -dir -is -it -lc -p -sb -sd -sg -sn -v'
serve_opts='--aot --environment --host --live-reload --live-reload-base-url --live-reload-host --live-reload-live-css --live-reload-port --open --port --proxy-config --ssl --ssl-cert --ssl-key --target --watcher -H -e -lr -lrbu -lrh -lrp -o -p -pc -t -w'
set_opts='--global -g'
test_opts='--browsers --build --code-coverage --colors --lint --log-level --port --reporters --watch -cc -l -w'

version_opts='--verbose'

if test ".$(type -t complete 2>/dev/null || true)" = ".builtin"; then
  _ng_completion() {
    local cword pword opts

    COMPREPLY=()
    cword=${COMP_WORDS[COMP_CWORD]}
    pword=${COMP_WORDS[COMP_CWORD - 1]}

    case ${pword} in
      ng) opts=$ng_opts ;;
      b|build) opts=$build_opts ;;
      g|generate) opts=$generate_opts ;;
      gh-pages:deploy|github-pages:deploy) opts=$github_pages_deploy_opts ;;
      h|help|-h|--help) opts=$help_opts ;;
      init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      s|serve|server) opts=$serve_opts ;;
      set) opts=$set_opts ;;
      t|test) opts=$test_opts ;;
      v|version) opts=$version_opts ;;
      *) opts='' ;;
    esac

    COMPREPLY=( $(compgen -W '${opts}' -- $cword) )

    return 0
  }

  complete -o default -F _ng_completion ng
elif test ".$(type -w compctl 2>/dev/null || true)" = ".compctl: builtin" ; then
  _ng_completion () {
    local words cword opts
    read -Ac words
    read -cn cword
    let cword-=1

    case $words[cword] in
      ng) opts=$ng_opts ;;
      b|build) opts=$build_opts ;;
      g|generate) opts=$generate_opts ;;
      gh-pages:deploy|github-pages:deploy) opts=$github_pages_deploy_opts ;;
      h|help|-h|--help) opts=$help_opts ;;
      init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      s|serve|server) opts=$serve_opts ;;
      set) opts=$set_opts ;;
      t|test) opts=$test_opts ;;
      v|version) opts=$version_opts ;;
      *) opts='' ;;
    esac

    setopt shwordsplit
    reply=($opts)
    unset shwordsplit
  }

  compctl -K _ng_completion ng
else
  echo "Shell builtin command 'complete' or 'compctl' is redefined; cannot perform ng completion."
  return 1
fi

###-end-ng-completion###

