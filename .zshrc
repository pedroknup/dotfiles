if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
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
alias nvimc='nvim ~/.dotfiles/nvim'

# work related aliases
alias neh="tmuxifier load-session eh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(tmuxifier init -)" 

eval "$(zoxide init zsh)"
alias cd="z"

export EDITOR='nvim'
DISABLE_AUTO_TITLE="true"
