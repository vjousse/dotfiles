# Oh-My-Zsh : Nico Theme (https://gist.github.com/ntarocco/3027ed75b6e8fc1fd119)
# Modified by : Carlos Cuesta

eval red='$FG[203]'
eval green='$FG[184]'
eval yellow='$FG[221]'
eval blue='$FG[081]'
eval magenta='$FG[204]'
eval cyan='$FG[037]'
eval white='$FG[231]'
eval grey='$FG[145]'
#
# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='
$(_prompt_virtualenv)$(_user_host)${_current_dir}$(git_prompt_info)
%{$white%}>%{$reset_color%} '

PROMPT2='%{$grey%}◀%{$reset_color%} '

#RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(git_prompt_short_sha) $(_git_time_since_commit) ${_return_status} %T% %{$(echotc DO 1)%}'
RPROMPT='$(_vi_status)%{$(echotc UP 1)%}$(git_prompt_short_sha) ${_return_status} %{$white%}%T%{$(echotc DO 1)%}%{$reset_color%}'

local _current_dir="%{$green%}%0~%{$reset_color%} "
local _return_status="%{$red%}%(?..×)%{$reset_color%}"
local _hist_no="%{$grey%}%h%{$reset_color%}"

# Virtualenv: current working virtualenv
function _prompt_virtualenv() {
	local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
        echo -n "%{$red%}[%{$reset_color%}%{$grey%}`basename $virtualenv_path`%{$reset_color%}%{$red%}]%{$reset_color%} "
    fi
}

function _user_host() {
  host_color=$yellow
  user_at_host="%{$red%}%n%{$reset_color%}%{$white%}%{$reset_color%} %{$white%}in "
  [[ -n $SSH_CONNECTION ]] && user_at_host="%{$cyan%}%n%{$reset_color%}%{$white%}@%{$host_color%}%m%{$reset_color%} %{$white%}in "
  echo $user_at_host
}

function _vi_status() {
  if {echo $fpath | grep -q "plugins/vi-mode"}; then
    echo "$(vi_mode_prompt_info)"
  fi
}

function _ruby_version() {
  if {echo $fpath | grep -q "plugins/rvm"}; then
    echo "%{$grey%}$(rvm_prompt_info)%{$reset_color%}"
  fi
}

# Determine the time since last commit. If branch is clean,
# use a neutral color, otherwise colors will vary according to time.
function _git_time_since_commit() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    # Only proceed if there is actually a commit.
    if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
      # Get the last commit.
      last_commit=$(git log --pretty=format:'%at' -1 2> /dev/null)
      now=$(date +%s)
      seconds_since_last_commit=$((now-last_commit))

      # Totals
      minutes=$((seconds_since_last_commit / 60))
      hours=$((seconds_since_last_commit/3600))

      # Sub-hours and sub-minutes
      days=$((seconds_since_last_commit / 86400))
      sub_hours=$((hours % 24))
      sub_minutes=$((minutes % 60))

      if [ $hours -gt 24 ]; then
          commit_age="${days}d"
      elif [ $minutes -gt 60 ]; then
          commit_age="${sub_hours}h${sub_minutes}m"
      else
          commit_age="${minutes}m"
      fi

      color=$ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL
      echo "$color$commit_age%{$reset_color%}"
    fi
  fi
}

if [[ $USER == "root" ]]; then
  CARETCOLOR="$red"
else
  CARETCOLOR="$white"
fi

MODE_INDICATOR="%{_bold$yellow%}❮%{$reset_color%}%{$yellow%}❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$white%}on %{$blue%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$red%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$green%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$green%}✚{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$yellow%}⚑{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DELETED=" %{$red%}✖{$reset_color%} "
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$blue%}▴{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$cyan%}§{$reset_color%} "
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$grey%}◒{$reset_color%} "

# Colors vary depending on time lapsed.
ZSH_THEME_GIT_TIME_SINCE_COMMIT_SHORT="%{$green%}"
ZSH_THEME_GIT_TIME_SHORT_COMMIT_MEDIUM="%{$yellow%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_LONG="%{$red%}"
ZSH_THEME_GIT_TIME_SINCE_COMMIT_NEUTRAL="%{$yellow%}"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$reset_color%}[%{$yellow%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}]"

# LS colors, made with http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'
