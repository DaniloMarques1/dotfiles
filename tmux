set -g history-limit 10000
set -g prefix C-q
# unbind C-b to free it up
unbind C-b
bind C-q send-prefix

set -sg escape-time 50
bind -n C-h select-window -t :-
bind -n C-j select-window -t :+
set-window-option -g mode-keys vi
bind c new-window -c "#{pane_current_path}"

set -g status-position top
set -g status-bg colour234
set -g status-fg colour137
set -g status-left ''
set -g status-right '#[fg=colour232,bg=colour243,bold] %d/%m/%y #[fg=colour233,bg=colour246,bold] %H:%M '

setw -g window-status-current-format '#[fg=colour2,bg=colour237] #I#[fg=colour250]:#[fg=colour255,bg=colour237]#W#[fg=colour50,bg=colour237]#F '
setw -g window-status-format '#[fg=colour137,bg=colour235] #I#[fg=colour237]:#[fg=colour250,bg=colour235]#W#[fg=colour244,bg=colour235]#F '
set-option -g renumber-windows on
