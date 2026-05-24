# Disable suggestions
set -g fish_autosuggestion_enabled 0
set fish_greeting

# Env vars
set -gx BAT_THEME gruvbox-dark
set -gx EDITOR nvim

# PATH
fish_add_path /opt/homebrew/bin/
fish_add_path (brew --prefix openjdk)/bin
fish_add_path -g "/Users/gabi/.local/bin"

# JAVA_HOME
set -gx JAVA_HOME (brew --prefix openjdk)

# Aliases
alias ls="lsd"
alias ll="lsd -lah"
alias gs="git status"
alias cat="bat"
alias tl="tmux ls"
alias gl="git log --show-signature"
alias glo="git log --oneline --show-signature"

# Because completions
abbr ta --position command 'tmux attach -t'
abbr tk --position command 'tmux kill-session -t'
abbr gc --position command 'git commit'

# I miss $_
function last
  echo $history[1] | string split ' ' | tail -n 1
end

# Functions
function lk
    cd (walk --icons $argv)
end

# For when I get my scans back from film lab :D
function tif2png
    for f in *.tif
        ffmpeg -v -i "$f" (string replace -r '\.tif$' '.png' "$f"); and rm "$f"
    end
end

# Fuck.
function fuck -d "Correct your previous console command"
    set -l fucked_up_command $history[1]
    env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
    if [ "$unfucked_command" != "" ]
        eval $unfucked_command
        builtin history delete --exact --case-sensitive -- $fucked_up_command
        builtin history merge
    end
end

# Prompt
function fish_prompt
    set -l pwd_info (prompt_pwd)

    # git    
    set -l git_info ""
    if git rev-parse --git-dir >/dev/null 2>&1
        set -l branch_name (git branch --show-current 2>/dev/null)
        set -l git_status (git status --porcelain 2>/dev/null)

        if test -n "$git_status"
            set git_info (set_color yellow)"($branch_name*)"(set_color normal)
        else
            set git_info (set_color green)"($branch_name)"(set_color normal)
        end
    end

    # First line
    echo -n (set_color cyan)(whoami)(set_color normal)
    echo -n " "
    echo -n (set_color blue)$pwd_info(set_color normal)

    if test -n "$git_info"
        echo -n " $git_info"
    end

    echo "" # New line

    # vi mode indicator
    set -l mode_info ""
    switch $fish_bind_mode
        case default
            set mode_info (set_color --bold --italics red)"n"(set_color normal)" "
        case insert
            set mode_info (set_color --bold --italics green)"i"(set_color normal)" "
        case visual
            set mode_info (set_color --bold --italics yellow)"v"(set_color normal)" "
        case replace_one
            set mode_info (set_color --bold --italics blue)"r1"(set_color normal)" "
        case replace
            set mode_info (set_color --bold --italics blue)"r"(set_color normal)" "
    end

    # Second line
    echo -n $mode_info
    echo -n (set_color green)"> "(set_color normal)
end

# Enable vi mode
fish_vi_key_bindings

# Disable the default mode prompt
function fish_mode_prompt
end

