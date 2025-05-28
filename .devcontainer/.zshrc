############################################################
#              ~/.zshrc for samuelcastro                   #
#        Modern, clean, and robust Zsh configuration       #
############################################################

# ================== Antigen Setup & Plugins =======================
# Install Antigen if not present
if [ ! -d "$HOME/antigen" ]; then
  git clone https://github.com/zsh-users/antigen.git "$HOME/antigen"
fi

# Load Antigen
source "$HOME/antigen/antigen.zsh"

# Use Oh My Zsh's library (for aliases, functions, completions)
antigen use oh-my-zsh

# Core plugins (from Oh My Zsh default repo)
antigen bundle git
antigen bundle nvm
antigen bundle ssh-agent
antigen bundle z

# Community plugins (from GitHub)
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle MichaelAquilina/zsh-you-should-use

# Theme (Powerlevel10k)
antigen theme robbyrussell

# Apply all Antigen changes
antigen apply

# ================== Zsh Configuration =============================

# Set default editor
export EDITOR="code"

# --- PATH Configuration ---
# Add Go binaries and local user bin to PATH
export PATH="$PATH:$(go env GOPATH)/bin:$HOME/.local/bin"

# --- Kubectl Completion ---
if command -v kubectl &>/dev/null; then
  source <(kubectl completion zsh)
fi
export KUBECONFIG=~/.kube/admin.conf

# --- direnv Configuration ---
eval "$(direnv hook zsh)"

# --- VS Code Shell Integration ---
if [[ "$TERM_PROGRAM" == "vscode" ]] && command -v code &>/dev/null; then
  . "$(code --locate-shell-integration-path zsh)"
fi
