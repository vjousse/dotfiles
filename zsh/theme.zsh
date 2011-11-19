if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="white"; fi

returncode="%(?.%{$fg[green]%}.%{$fg[red]%})"

PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(git_prompt_info_custom)${returncode}%(!.#.$)%{$reset_color%} '
RPROMPT='$(vi_mode_prompt_info)[%*]'

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}±(%{$fg_no_bold[yellow]%}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%b%{$fg_bold[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗"
MODE_INDICATOR="%{$fg[yellow]%}vi%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$reset_color%}%{$fg[cyan]%} "
