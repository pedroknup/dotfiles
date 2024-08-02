if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
alias aftw="cd ~dev/personal/avocado-ftw"
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias dev="cd ~/dev"
alias gaa="git add ."
alias gcm='git commit -m'

alias hc='sh /Users/pedroknup/dev/personal/health-check.sh'
alias ac='nvim ~/dotfiles/' 
alias a='nvim'

# work related aliases
alias eh="cd ~/dev/EngineersHub" 
alias ehsp="cd ~/dev/engineershub-service-providers/"
alias ehsd="cd ~/dev/engineershub-service-definitions"
alias eht="cd ~/dev/engineershub-templates/" 
alias ehc="cd ~/dev/engineershub-configuration/"

alias neh="cd ~/dev/EngineersHub && nvim ."
alias nehsp="cd ~/dev/engineershub-service-providers/ && nvim ."
alias nehsd="cd ~/dev/engineershub-service-definitions/ && nvim ."
alias neht="cd ~/dev/engineershub-templates/ && nvim ."
alias nehc="cd ~/dev/engineershub-configuration/ && nvim ."

alias yeh="cd ~/dev/EngineersHub && yarn dev"

# personal projects
alias aftw="cd ~/dev/personal/avocado-ftw"

alias naftw="cd ~/dev/personal/avocado-ftw/ && nvim ."

function forkWithRollingStores() {
  git checkout -b "rolling-stores/$1"
}

alias gbe=forkWithRollingStores

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh)"
alias cd="z"

export EDITOR='vim'
DISABLE_AUTO_TITLE="true"
