# vim:ft=zsh ts=2 sw=2 sts=2

rvm_current() {
  rvm current 2>/dev/null
}

rbenv_version() {
  rbenv version 2>/dev/null | awk '{print $1}'
}




if [ -e /etc/os-release ]; then
  declare $(cat /etc/os-release | grep "^NAME=")
elif [[ -v MSYSTEM_CHOST ]]; then
  NAME="Windows"
else
  NAME=$(sw_vers -productName)
fi

DISTRO_CHAR=?

if [ $NAME = '"Ubuntu"' ]; then
  DISTRO_CHAR=
elif [ $NAME = '"Arch Linux"' ]; then
  DISTRO_CHAR=
elif [ $NAME = 'Mac OS X' ]; then
  DISTRO_CHAR=🍏
elif [ $NAME = "Windows" ]; then
  DISTRO_CHAR=
fi

PROMPT='
%{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}%{$fg_bold[blue]%} $VS_PROMPT%{$reset_color%}$(git_prompt_info)  %{$fg_bold[red]%}%*%{$reset_color%}
$DISTRO_CHAR '

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}\uE702 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✎"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}✎"
ZSH_THEME_GIT_PROMPT_CLEAN=""

if [ -e ~/.rvm/bin/rvm-prompt ]; then
  RPROMPT='%{$fg_bold[red]%}‹$(rvm_current)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    RPROMPT='%{$fg_bold[red]%}$(rbenv_version)%{$reset_color%}'
  fi
fi

