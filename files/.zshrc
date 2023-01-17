source $(brew --prefix powerlevel10k)/powerlevel10k.zsh-theme
# User configuration

### Setup $PATH
export PATH=/opt/homebrew/bin:$PATH

### Set Ansible Variables
export ANSIBLE_VAULT_PASSWORD_FILE=$HOME/ansible_vault

### Set Hashicorp Vault Variables
export VAULT_ADDR=https://ssdlc-vault.soc.int.bell.ca
export VAULT_CACERT=/etc/ssl/certs/ssdlc-vault.soc.int.bell.ca.pem

### Add ssh keys
eval $(ssh-agent -s)
ssh-add $HOME/.ssh/id_rsa
ssh-add $HOME/.ssh/id_ed25519
ssh-add $HOME/.ssh/ua_jumpbox_id_rsa
ssh-add $HOME/.ssh/ut_jumpbox_id_rsa
ssh-add $HOME/.ssh/ug_jumpbox_id_rsa
ssh-add $HOME/.ssh/ug_id_rsa 
ssh-add $HOME/.ssh/google_compute_engine

### zsh addons
source /opt/homebrew/Cellar/powerlevel10k/1.17.0/powerlevel10k.zsh-theme
source /opt/homebrew/Cellar/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/Cellar/zsh-history-substring-search/1.0.2/share/zsh-history-substring-search/zsh-history-substring-search.zsh

### define fpath
fpath=(/opt/homebrew/Cellar/zsh-completions/0.34.0/share/zsh-completions $fpath)


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

