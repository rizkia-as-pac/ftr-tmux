alias tl="tmux list-session"
alias ta='tmux a -t $(tmux ls | fzf | awk -F": " "{print \$1}")'

# Alias to create tmux sessions with name that support for fast key bindings
tmux-create-fast-key-session() {
  # Create the tmux sessions
  tmux new-session -d -s secondary_fast_key_session
  tmux new-session -d -s main_fast_key_session
  tmux new-session -d -s ternary_fast_key_session

  # Attach to the main session (or adjust to your preference)
  tmux attach-session -t main_fast_key_session
}
