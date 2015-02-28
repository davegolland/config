# set the prompt to be pretty
source ~/.git-prompt.sh
PS1='\n.[\e[0;33m\w\e[m]    $(__git_ps1 "(%s)")\n$ '

test -r /sw/bin/init.sh && . /sw/bin/init.sh

pushd ~/rfig && . rc && popd

export PATH=$PATH:/opt/local/bin:/Users/dave/research/backed_up/scripts/
export MANPATH=$MANPATH:/opt/local/share/man
export INFOPATH=$INFOPATH:/opt/local/share/info

export PATH=~/bin:~/prismatic/config/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH

stty erase ^H

alias gst="git status"
alias gs="git status"
alias gcv="git commit -v"
alias gu="vim ~/.gitconfig"

alias aj="ag -G '\.(clj|cljs)$'"
alias ajt="ag -G 'test\.(clj|cljs)$'"
alias ajs="ag -G '(?!test)\.(clj|cljs)$'"
# git reauthor should work to ammend the author

# Setting PATH for MacPython 2.6
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.6/bin:${PATH}"
export PATH

. `brew --prefix`/etc/profile.d/z.sh

function gap {
  if [ -z "$1" ]; then
    git add --patch
  else
    git add --patch $@
  fi
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
      . `brew --prefix`/etc/bash_completion
fi

clear

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

set -o vi
export PATH=/Users/dave/.rvm/gems/ruby-1.8.7-p374/bin:/Users/dave/.rvm/gems/ruby-1.8.7-p374@global/bin:/Users/dave/.rvm/rubies/ruby-1.8.7-p374/bin:/Users/dave/.rvm/bin:/Library/Frameworks/Python.framework/Versions/2.6/bin:/usr/local/share/npm/bin:/Users/dave/bin:/Users/dave/prismatic/config/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/opt/local/bin:/Users/dave/research/backed_up/scripts/:/Applications/Android\ Studio.app/sdk/platform-tools
export PATH=/usr/local/bin:$PATH
