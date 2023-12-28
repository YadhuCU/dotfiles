set fish_greeting ""

set -gx TERM xterm-256color
### ~/.zshrc
#export SHELLDER_KEEP_PATH=1
# theme
# set -g theme_color_scheme terminal-dark
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname no
set -g theme_hostname always
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
#set -g theme_git_worktree_support yes
#set -g theme_use_abbreviated_branch_name no
#set -g theme_display_vagrant yes
#set -g theme_display_docker_machine no
#set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
#set -g theme_display_virtualenv no
#set -g theme_display_nix no
#set -g theme_display_ruby no
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
#set -g theme_display_date yes
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
#set -g theme_title_use_abbreviated_path no
#set -g theme_date_format "+%a %H:%M"
#set -g theme_date_timezone Asia/Kolkata
set -g theme_avoid_ambiguous_glyphs yes
#set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
# set -g theme_color_scheme dark
#set -g theme_color_scheme solarized
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 4
set -g theme_newline_cursor yes
set -g theme_newline_prompt '╰─|'

# aliases
alias ls lsd
alias la "ls -A"
alias ll "ls -l"
alias lla "ls -la"
alias g git
alias fcf "nvim ~/.config/fish/config.fish"
alias fcd "cd ~/.config/fish"
alias tt "exa -T --icons --color-scale"
alias python_env "source ~/Tutorial/DJango/django_env/bin/activate.fish"
alias cls "clear -x"
# bind \cl 'clear -x'
# bind \cl clear -x commandline -f repaint


alias 'Ctrl+f' tmux-sessionizer

command -qv nvim && alias n nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
