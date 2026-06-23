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
        set -gx STARSHIP_CONFIG "$HOME/.config/starship/greyed.toml"
        starship prompt
        set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    end

    set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
    starship init fish | source
    enable_transience

    fish_config theme choose TokyoNight

    if command -q lsd
        alias ls="lsd"
    end
end
