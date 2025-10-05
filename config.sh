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

tmux-create-paneled-fast-key-session() {
  # SECONDARY SESSION
  tmux new-session -d -s "secondary_fast_key_session"
  
  # Split horizontal: buat pane kanan 93%
  tmux select-window -t "secondary_fast_key_session"
  tmux split-window -h -p 100 -t "secondary_fast_key_session"
  
  # Split vertikal pane kiri: atas 25%, bawah 75%
  tmux select-pane -t "secondary_fast_key_session".1 # index akan diurutkan kembali setelah melakukan split h ataupun v, index dimulai dari kiri atas ke bawah, lalu geser ke kanan atas dan kebawah lalu seterusnya
  tmux split-window -v -p 75 -t "secondary_fast_key_session"
  
  # Split vertikal pane kanan: atas 25%, bawah 75%
  tmux select-pane -t "secondary_fast_key_session".3
  tmux split-window -v -p 75 -t "secondary_fast_key_session" # penting tp hasil setelah displit lagi dibawah ini akan berubah jadi tidak akurat 75%
  
  # Sekarang split pane kanan atas (ini jadi pane 1 setelah split sebelumnya)
  tmux select-pane -t "secondary_fast_key_session".3
  tmux split-window -v -t "secondary_fast_key_session"  # split vertikal jadi dua bagian (50/50)

  # MAIN SESSION
  tmux new-session -d -s "main_fast_key_session"
  
  # Split horizontal: buat pane kanan 93%
  tmux select-window -t "main_fast_key_session"
  tmux split-window -h -p 100 -t "main_fast_key_session"


  # FOURTH SESSION NO FAST KEY
  tmux new-session -d -s "fourth_no_fast_key_session"
  
  # Split horizontal: buat pane kanan 93%
  tmux select-window -t "fourth_no_fast_key_session"
  tmux split-window -h -p 100 -t "fourth_no_fast_key_session"
  
  # TERNARY SESSION
  tmux new-session -d -s "ternary_fast_key_session"
  
  # Split vertikal pane: atas 40%, bawah 60%
  tmux select-window -t "ternary_fast_key_session"
  tmux split-window -v -p 60 -t "ternary_fast_key_session"
  
  # Split horizontal pane atas
  tmux select-pane -t "ternary_fast_key_session".1 
  tmux split-window -h -t "ternary_fast_key_session"

  # Attach ke session utama
  tmux attach-session -t "main_fast_key_session"
}

alias v='nvim .'
alias vks='nvim -u ~/Desktop/miscellaneous/nvim/init.lua'
alias to-doc="$HOME/.shell_config_features.d/to-doc.sh"
