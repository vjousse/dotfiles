# get the name of the branch we are on
function git_prompt_info_custom() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(git_prompt_short_sha)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Set the upstream branch
git-set-upstream() {
    [ -z $1 ] && 1=origin
    branch=$(git-current-branch)
    git branch --set-upstream $branch $1/$branch
}
