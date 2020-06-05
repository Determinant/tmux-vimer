#!/usr/bin/env bash

tmux set-option -g prefix C-]
tmux set-option -g default-terminal "screen-256color"
tmux set-option -gs terminal-overrides ',*-256color:Tc'
tmux set-window-option -g mode-keys vi
tmux bind-key -Tcopy-mode-vi 'v' send -X begin-selection
tmux bind-key -Tcopy-mode-vi 'y' send -X copy-selection
tmux bind-key k  select-pane -U
tmux bind-key j  select-pane -D
tmux bind-key h  select-pane -L
tmux bind-key l  select-pane -R
tmux bind-key Up     resize-pane -U 10
tmux bind-key Down   resize-pane -D 10
tmux bind-key Left   resize-pane -L 10
tmux bind-key Right  resize-pane -R 10
tmux bind-key c  new-window -c "#{pane_current_path}"
tmux bind-key '"'  split-window -v -c "#{pane_current_path}"
tmux bind-key '%'  split-window -h -c "#{pane_current_path}"
tmux bind-key -n C-s send-prefix
tmux set -ag terminal-overrides ",*:XT@"
tmux set-option -g status-position top

# Smart pane switching with awareness of vim splits
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
tmux bind-key -n M-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
tmux bind-key -n M-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
tmux bind-key -n M-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
tmux bind-key -n M-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
#bind-key -n M-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
tmux set -g escape-time 10

# List of plugins
tmux set -g @plugin 'tmux-plugins/tpm'
tmux set -g @resurrect-strategy-nvim 'session'
tmux set -g @resurrect-capture-pane-contents 'on'
tmux set -g @resurrect-processes 'ssh'
