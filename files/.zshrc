### Setup HomeBrew

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

### Add ssh keys
eval $(ssh-agent -s)
ssh-add $HOME/.ssh/id_ed25519

### zsh addons
source /opt/homebrew/Cellar/powerlevel10k/1.19.0/share/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/Cellar/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/Cellar/zsh-autopair/1.0/share/zsh-autopair/autopair.zsh
source /opt/homebrew/Cellar/zsh-history-substring-search/1.1.0/share/zsh-history-substring-search/zsh-history-substring-search.zsh

### source gcloud command completion support
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc

### define fpath
fpath=(/opt/homebrew/Cellar/zsh-completions/0.34.0/share/zsh-completions $fpath)


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
