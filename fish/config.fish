if status is-login
    set fish_greeting "
    Hello! 
    Run startx to start a GUI.
    "

else if status is-interactive

    # Commands to run in interactive sessions can go here
    set fish_greeting

    # Starship
    function starship_transient_prompt_func
        set -gx STARSHIP_CONFIG "$DOTFILES/starship/greyed.toml"
        starship prompt
        set -ge STARSHIP_CONFIG
    end

    starship init fish | source
    enable_transience

    fish_config theme choose TokyoNight

    set -gx EDITOR nvim
    set -gx MANPATH "$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man"
    set -gx INFOPATH "$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info"
    fish_add_path --path /usr/local/texlive/2024/bin/x86_64-linux

    # Aliases
    alias ls=lsd
end
