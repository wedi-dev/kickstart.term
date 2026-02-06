# kickstart.term - Shell aliases and functions
# Source this file in your .zshrc or .bashrc

# wedi - Create or attach to tmux session "wedi"
wedi() {
    if tmux has-session -t wedi 2>/dev/null; then
        tmux attach-session -t wedi
    else
        tmux new-session -s wedi
    fi
}
