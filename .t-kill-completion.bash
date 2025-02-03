# t-kill auto completion scrips
_t_kill_completion(){
  local cur prev opts
  cur="${COMP_WORDS[COMP_CWORD]}"
  opts=$(tmux list-sessions -F "#{session_name}")

  COMPREPLY=( $(compgen -W "$opts" -- "$cur" ))
}

complete -F _t_kill_completion t-kill
