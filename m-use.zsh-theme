# ZSH Theme - Modified from bira.zsh-theme
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

if [[ $UID -eq 0 ]]; then
    local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
    local user_symbol='#'
else
    local user_host='%{$terminfo[bold]$fg[cyan]%}%n@%m%{$reset_color%}'
    local user_symbol='$'
fi

local current_dir='%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT="
╭─${user_host}  ${current_dir}  ${git_branch}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"


ZSH_THEME_GIT_PROMPT_PREFIX="‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}‹"
# ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"