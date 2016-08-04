#
# Environment
# ---------
export PATH=$PATH:~/bin

#
# Setting up zsh
# ---------
autoload -Uz colors && colors
autoload -Uz compinit && compinit
setopt prompt_subst

#
# Git infos
# ---------
function git_infos(){
  if [ $(git rev-parse --is-inside-work-tree 2>/dev/null) ]; then
    branch=$(git branch 2>/dev/null | awk '/^\*/ {print $2}')
    if test "$(git status --porcelain 2>/dev/null)"; then
     echo "%{$fg_bold[yellow]%}$branch"
    else
     echo "%{$fg_bold[green]%}$branch"
    fi
  fi
}

#
# Prompts
# ---------#
PROMPT="%{$fg_no_bold[magenta]%}$USERNAME[0,1]%{$fg_no_bold[white]%} %{$fg_no_bold[magenta]%}%m %{$fg_bold[cyan]%}%~%{$fg_no_bold[white]%} ∙ %{$reset_color%}"
RPROMPT='$(git_infos)%{$reset_color%}'

#
# Aliases
# ---------
alias l='ls -1G'
alias ll='ls -Gla'

# Resource zshrc
alias update='. ~/.zshrc'
alias edit='vim ~/.zshrc'

# Delete .DS_Store
alias dsstore='sudo find / -name ".DS_Store" -depth -exec rm {} \;'

# Configurate rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
