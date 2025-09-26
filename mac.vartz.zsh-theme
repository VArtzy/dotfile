# ~/.oh-my-zsh/themes/custom.zsh-theme
function preexec() {
  timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    export EXECUTION_TIME=$(($SECONDS - $timer))
    unset timer
  fi
}

# Right Prompt (Language/cloud segments)
RPROMPT='$(node_prompt)$(python_prompt)%F{#b8e994}%K{#b8e994}%F{#222222}   100%% %k%F{#b8e994}%f%F{#47A029}%f%K{#47A029}%F{white}   %D{%d, %H:%M} %k%F{#47A029}'

# Left Prompt (Main segments)
PROMPT='%F{#0077c2}╭─%f%K{#0077c2}%F{white}  zsh %k%F{#0077c2}%f'  # Shell segment (user)
PROMPT+='%F{#A3320B}%K{#A3320B}%F{white}  %~ %k%F{#A3320B}%f'              # Path segment
PROMPT+='$(git_prompt_info)'                                       # Git segment
PROMPT+='%F{#241023}%f%K{#241023}%F{white}  ${EXECUTION_TIME}s %k%F{#241023}%f '  # Execution time
PROMPT+=$'\n'
PROMPT+='%F{white}╰─>%f '                                           # Final arrow

# Git Prompt Styling
ZSH_THEME_GIT_PROMPT_PREFIX="%F{#4A2C22}%f%K{#4A2C22}%F{white}  "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %k%F{#4A2C22}%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}%f"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{white}≡%f"

# Helper Functions for Right Prompt
function node_prompt() {
  if [ -f package.json ] || [ -f node_modules ]; then
    echo "%F{#47A029} %f"
  fi
}

function python_prompt() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "%F{#306998}%f"
  fi
}
