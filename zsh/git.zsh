# get the name of the branch we are on
function git_prompt_info_custom() {
    [ ! -f .git/HEAD ] && return
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="*detached*"
    prompt="$ZSH_THEME_GIT_PROMPT_PREFIX"
    prompt="$prompt${ref#refs/heads/}"
    prompt="$prompt$(git_prompt_short_sha)"
    prompt="$prompt$ZSH_THEME_GIT_PROMPT_DIRTY"
    prompt="$prompt$ZSH_THEME_GIT_PROMPT_SUFFIX"
    echo $prompt
}
