#!/usr/bin/env bash
if [[ ! -d ~/.tmux ]]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
if [[ -f ~/.tmux.conf ]]; then
    echo "Old tmux configuration detected, remove it before running."
    exit 1
fi
cat > ~/.tmux.conf << EOF
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'Determinant/tmux-vimer'
set -g @plugin 'Determinant/tmux-colortag'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-yank'
run -b '~/.tmux/plugins/tpm/tpm'
EOF
