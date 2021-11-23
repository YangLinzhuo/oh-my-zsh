# 参考 https://www.lyytaw.com/%E6%9D%82%E9%A1%B9/oh-my-zsh%E4%B8%BB%E9%A2%98%E6%94%AF%E6%8C%81conda%E8%99%9A%E6%8B%9F%E7%8E%AF%E5%A2%83/#%E4%BF%AE%E6%94%B9zsh%E4%B8%BB%E9%A2%98
# 以及 https://printempw.github.io/zsh-prompt-theme-customization/

local python_version_info='$(python_version_prompt_info)'
python_version_prompt_info() {
  if command -v python > /dev/null 2>&1; then
    PYTHON_VERSION="$(python -V 2>&1)"
    PYTHON_VERSION=${PYTHON_VERSION/Python /Python}
    PYTHON_VERSION=${PYTHON_VERSION/ */}
    CONDA_DEFAULT_ENV_NAME=''
    if [ -n "$CONDA_DEFAULT_ENV" ]; then
      CONDA_DEFAULT_ENV_NAME="$CONDA_DEFAULT_ENV::"
    fi
    echo -n " - %{$FG[069]%}(${CONDA_DEFAULT_ENV_NAME}${PYTHON_VERSION})%{$reset_color%}"
  fi
}

local time_info=' - %{$fg[blue]%}[%{$reset_color%}%{$FG[226]%}%D{%a %b %d, %H:%M:%S}%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}'
local user_info='%{$fg[blue]%}[%{$reset_color%}%{$FG[154]%}%n%{$reset_color%}%{$fg[magenta]%}@%{$reset_color%}%{$fg[blue]%}%M%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}'
local dir_info=' - %{$fg[blue]%}[%{$reset_color%}%{$FG[051]%}%~%{$reset_color%}%{$fg[blue]%}]%{$reset_color%}'

PROMPT=$'%{$fg[blue]%}┌─%{$reset_color%}'\
${user_info}\
${dir_info}\
' - %{$fg[blue]%}<%{$reset_color%}$(git_prompt_info)%{$fg[blue]%}>%{$reset_color%}'\
${python_version_info}\
${time_info}

PROMPT+=$'\n%{$fg[blue]%}└─[%(?:$FG[118]$:%{$fg[red]%}$)%{$fg[blue]%}]%{$reset_color%} '
PS2=$' %{$fg[blue]%}>%{$reset_color%} '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
