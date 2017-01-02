# Inspired by https://github.com/KuoE0/oh-my-zsh-solarized-powerline-theme
# You can set following options in your .zshrc

# OS detection
[[ -n "${OS}" ]] || OS=$(uname)

# background color
BG_COLOR_BASE03=%K{8}
BG_COLOR_BASE02=%K{0}
BG_COLOR_BASE01=%K{10}
BG_COLOR_BASE00=%K{11}
BG_COLOR_BASE0=%K{12}
BG_COLOR_BASE1=%K{14}
BG_COLOR_BASE2=%K{7}
BG_COLOR_BASE3=%K{15}
BG_COLOR_YELLOW=%K{3}
BG_COLOR_ORANGE=%K{1}
BG_COLOR_RED=%K{9}
BG_COLOR_MAGENTA=%K{5}
BG_COLOR_VIOLET=%K{13}
BG_COLOR_BLUE=%K{4}
BG_COLOR_CYAN=%K{6}
BG_COLOR_GREEN=%K{2}

# foreground color
FG_COLOR_BASE03=%F{8}
FG_COLOR_BASE02=%F{0}
FG_COLOR_BASE01=%F{10}
FG_COLOR_BASE00=%F{11}
FG_COLOR_BASE0=%F{12}
FG_COLOR_BASE1=%F{14}
FG_COLOR_BASE2=%F{7}
FG_COLOR_BASE3=%F{15}
FG_COLOR_YELLOW=%F{3}
FG_COLOR_ORANGE=%F{1}
FG_COLOR_RED=%F{9}
FG_COLOR_MAGENTA=%F{5}
FG_COLOR_VIOLET=%F{13}
FG_COLOR_BLUE=%F{4}
FG_COLOR_CYAN=%F{6}
FG_COLOR_GREEN=%F{2}

# reset color
local RESET_COLOR=%f%k%b
local RESET=%{$RESET_COLOR%}
local RETURN_CODE="%(?..$FG_COLOR_RED%? ↵$RESET)"
local ARROW_SYMBOL=''
local ZSH_TIME=%D{%H:%M}
local PADDING=''

if [ $OS = "Darwin" ]; then
	local LOGO=""
else
	local LOGO="🐧"
fi

GIT_DIRTY_COLOR=%F{196}
GIT_CLEAN_COLOR=%F{118}
GIT_PROMPT_INFO=%F{012}

ZSH_THEME_GIT_PROMPT_PREFIX="  "
ZSH_THEME_GIT_PROMPT_SUFFIX="$GIT_PROMPT_INFO"
ZSH_THEME_GIT_PROMPT_DIRTY=" $GIT_DIRTY_COLOR✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" $GIT_CLEAN_COLOR✔"

ZSH_THEME_GIT_PROMPT_ADDED="%F{082}✚%f"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{166}✹%f"
ZSH_THEME_GIT_PROMPT_DELETED="%F{160}✖%f"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{220]➜%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{082]═%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{190]✭%f"

# option defaults
[[ -n "$ZSH_POWERLINE_SHOW_USER" ]]             || ZSH_POWERLINE_SHOW_USER=true
[[ -n "$ZSH_POWERLINE_SHOW_IP" ]]               || ZSH_POWERLINE_SHOW_IP=true
[[ -n "$ZSH_POWERLINE_SHOW_OS" ]]               || ZSH_POWERLINE_SHOW_OS=true
[[ -n "$ZSH_POWERLINE_SHOW_TIME" ]]             || ZSH_POWERLINE_SHOW_TIME=true
[[ -n "$ZSH_POWERLINE_SHOW_VENV" ]]             || ZSH_POWERLINE_SHOW_VENV=true
[[ -n "$ZSH_POWERLINE_SINGLE_LINE" ]]           || ZSH_POWERLINE_SINGLE_LINE=false
[[ -n "$ZSH_POWERLINE_SHOW_GIT_STATUS" ]]       || ZSH_POWERLINE_SHOW_GIT_STATUS=true
[[ -n "$ZSH_POWERLINE_SHOW_GIT_BRANCH_ONLY" ]]  || ZSH_POWERLINE_SHOW_GIT_BRANCH_ONLY=false
[[ -n "$ZSH_POWERLINE_SHOW_RETURN_CODE" ]]      || ZSH_POWERLINE_SHOW_RETURN_CODE=true
[[ -n "$ZSH_POWERLINE_DIRECTORY_DEPTH" ]]       || ZSH_POWERLINE_DIRECTORY_DEPTH=2

# virtualenv function

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

#

# a new line before prompt
PROMPT='
'
# username
if [ $ZSH_POWERLINE_SHOW_USER = true ]; then
	local USER="%n"
    PROMPT="${PROMPT}${FG_COLOR_BLUE}${BG_COLOR_BASE3}${PADDING}${USER}"
	PADDING=' '
fi

# hostname
if [ $ZSH_POWERLINE_SHOW_IP = true ]; then
    if [ "$(echo $IP | grep 200)" = "" ]; then
    IP=`curl -si --max-time 2 http://ipecho.net/plain`
        # no network connection, use hostname
        IP="%m"
    else
        # replace dot by dash
        IP=`echo -n $IP | tail -n 1 | sed "s/\./-/g"`
    fi
	if [ $ZSH_POWERLINE_SHOW_USER = true ]; then
		PROMPT="${PROMPT}${FG_COLOR_GREEN}${BG_COLOR_BASE3} at"
	fi
    PROMPT="${PROMPT}${FG_COLOR_VIOLET}${BG_COLOR_BASE3}${PADDING}${IP}"
	PADDING=' '
fi
# arrow symbol for username and ip/host
if [ $ZSH_POWERLINE_SHOW_USER = true ] || [ $ZSH_POWERLINE_SHOW_IP = true ]; then
	if [ $ZSH_POWERLINE_SHOW_TIME = true ]; then
		PROMPT="${PROMPT} ${FG_COLOR_BASE3}${BG_COLOR_BASE01}${ARROW_SYMBOL}"
	else
		PROMPT="${PROMPT} ${FG_COLOR_BASE3}${BG_COLOR_BASE02}${ARROW_SYMBOL}"
	fi
fi

# datetime
if [ $ZSH_POWERLINE_SHOW_TIME = true ]; then
	PROMPT="${PROMPT}${FG_COLOR_BASE3}${BG_COLOR_BASE01}${PADDING}${ZSH_TIME}"
	PROMPT="${PROMPT} ${FG_COLOR_BASE01}${BG_COLOR_BASE02}${ARROW_SYMBOL}"
	PADDING=' '
fi

# OS logo
if [ $ZSH_POWERLINE_SHOW_OS = true ]; then
	PROMPT="${PROMPT}${FG_COLOR_BASE3}${BG_COLOR_BASE02}${PADDING}${LOGO}"
	PADDING=' '
fi

# current directory (%E hightline all line to end)
DIRECTORY_DEPTH="%${ZSH_POWERLINE_DIRECTORY_DEPTH}~"
PROMPT="${PROMPT}${FG_COLOR_BASE1}${BG_COLOR_BASE02} ${DIRECTORY_DEPTH}"


# show git status
if [ $ZSH_POWERLINE_SHOW_GIT_BRANCH_ONLY = true ]; then
	# get git branch function
	git_branch() {
		git rev-parse --git-dir > /dev/null 2>&1
		if [ "$?" = "0" ]; then
			BRANCH=$(git branch | grep '*' | cut -d' ' -f2-)
			echo ${ZSH_THEME_GIT_PROMPT_PREFIX}${BRANCH}
		fi
	}
	PROMPT="${PROMPT}${FG_COLOR_CYAN}"'$(git_branch)'
elif [ $ZSH_POWERLINE_SHOW_GIT_STATUS = true ]; then
	PROMPT="${PROMPT}${FG_COLOR_CYAN}"'$(git_prompt_info)'
fi

if [ $ZSH_POWERLINE_SHOW_VENV = true ]; then

    # Virtualenv: current working virtualenv
    prompt_virtualenv() {
        local virtualenv_path="$VIRTUAL_ENV"
        if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
            echo -n " ${FG_COLOR_BASE03}${BG_COLOR_GREEN} `basename $virtualenv_path`"
            local -x ARROW_COLOR="${FG_COLOR_BASE01}"
        fi
    }
    PROMPT="${PROMPT}"'$(prompt_virtualenv)'
fi

arrow_color() {
    local virtualenv_path="$VIRTUAL_ENV"
    if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
        echo -n "${FG_COLOR_GREEN}"
    else
        echo -n "${FG_COLOR_BASE02}"
    fi

}

# single line or double lines
if [ $ZSH_POWERLINE_SINGLE_LINE = false ]; then
	PROMPT="${PROMPT} ${RESET}"'$(arrow_color)'"${ARROW_SYMBOL} ${BG_COLOR_BASE02}%E
  ${RESET}${FG_COLOR_BASE02}${ARROW_SYMBOL}"
else
	PROMPT="${PROMPT} ${RESET}"'$(arrow_color)'"${ARROW_SYMBOL}"
fi

# reset
PROMPT="$PROMPT ${RESET} "

if [ $ZSH_POWERLINE_SHOW_RETURN_CODE = true ]; then
	RPROMPT="${RETURN_CODE}"
fi

