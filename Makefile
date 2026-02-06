# kickstart.term - Terminal configuration for macOS
# Usage: make install

SHELL := /bin/bash
REPO_DIR := $(shell pwd)
HOME_DIR := $(HOME)

.PHONY: help install install-deps install-links install-zsh install-plugins uninstall

help:
	@echo "kickstart.term - Terminal configuration"
	@echo ""
	@echo "Usage:"
	@echo "  make install         Full installation (deps + links + zsh config)"
	@echo "  make install-deps    Install Homebrew packages (tmux, fzf)"
	@echo "  make install-links   Create symlinks only"
	@echo "  make install-zsh     Configure .zshrc to source .bash_aliases"
	@echo "  make install-plugins Show tmux plugin installation instructions"
	@echo "  make uninstall       Remove symlinks"
	@echo ""

install: install-deps install-links install-zsh install-plugins
	@echo ""
	@echo "Installation complete!"
	@echo "Restart your terminal or run: source ~/.zshrc"

install-deps:
	@echo "Installing dependencies via Homebrew..."
	@if ! command -v brew &> /dev/null; then \
		echo "Error: Homebrew not installed. Install from https://brew.sh"; \
		exit 1; \
	fi
	brew install tmux fzf
	@echo "Dependencies installed."

install-links:
	@echo "Creating symlinks..."
	@# Backup existing files if they exist and are not symlinks
	@if [ -f "$(HOME_DIR)/.tmux.conf" ] && [ ! -L "$(HOME_DIR)/.tmux.conf" ]; then \
		echo "Backing up existing .tmux.conf to .tmux.conf.backup"; \
		mv "$(HOME_DIR)/.tmux.conf" "$(HOME_DIR)/.tmux.conf.backup"; \
	fi
	@if [ -f "$(HOME_DIR)/.bash_aliases" ] && [ ! -L "$(HOME_DIR)/.bash_aliases" ]; then \
		echo "Backing up existing .bash_aliases to .bash_aliases.backup"; \
		mv "$(HOME_DIR)/.bash_aliases" "$(HOME_DIR)/.bash_aliases.backup"; \
	fi
	@# Remove existing symlinks
	@rm -f "$(HOME_DIR)/.tmux.conf" "$(HOME_DIR)/.bash_aliases"
	@# Create new symlinks
	ln -s "$(REPO_DIR)/tmux/.tmux.conf" "$(HOME_DIR)/.tmux.conf"
	ln -s "$(REPO_DIR)/.bash_aliases" "$(HOME_DIR)/.bash_aliases"
	@echo "Symlinks created:"
	@echo "  ~/.tmux.conf -> $(REPO_DIR)/tmux/.tmux.conf"
	@echo "  ~/.bash_aliases -> $(REPO_DIR)/.bash_aliases"

install-zsh:
	@echo "Configuring .zshrc..."
	@if [ -f "$(HOME_DIR)/.zshrc" ]; then \
		if ! grep -q "source.*\.bash_aliases" "$(HOME_DIR)/.zshrc"; then \
			echo '' >> "$(HOME_DIR)/.zshrc"; \
			echo '# kickstart.term - Load shell aliases' >> "$(HOME_DIR)/.zshrc"; \
			echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases' >> "$(HOME_DIR)/.zshrc"; \
			echo "Added .bash_aliases source to .zshrc"; \
		else \
			echo ".zshrc already sources .bash_aliases"; \
		fi \
	else \
		echo '# kickstart.term - Load shell aliases' > "$(HOME_DIR)/.zshrc"; \
		echo '[ -f ~/.bash_aliases ] && source ~/.bash_aliases' >> "$(HOME_DIR)/.zshrc"; \
		echo "Created .zshrc with .bash_aliases source"; \
	fi

install-plugins:
	@echo ""
	@echo "Tmux Plugin Manager (TPM) installation:"
	@echo "  1. Start tmux: tmux"
	@echo "  2. Press Ctrl+a I to install plugins"
	@echo ""
	@echo "If TPM is not installed, it will be auto-installed on first tmux start."

uninstall:
	@echo "Removing symlinks..."
	@if [ -L "$(HOME_DIR)/.tmux.conf" ]; then \
		rm "$(HOME_DIR)/.tmux.conf"; \
		echo "Removed ~/.tmux.conf symlink"; \
	fi
	@if [ -L "$(HOME_DIR)/.bash_aliases" ]; then \
		rm "$(HOME_DIR)/.bash_aliases"; \
		echo "Removed ~/.bash_aliases symlink"; \
	fi
	@echo ""
	@echo "Note: .zshrc modifications were not removed."
	@echo "Restore backups manually if needed (.tmux.conf.backup, .bash_aliases.backup)"
