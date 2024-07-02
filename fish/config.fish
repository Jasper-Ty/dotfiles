if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    set -gx EDITOR nvim
    set -gx MANPATH "$MANPATH:/usr/local/texlive/2024/texmf-dist/doc/man"
    set -gx INFOPATH "$INFOPATH:/usr/local/texlive/2024/texmf-dist/doc/info"

    # PATH
    fish_add_path --path /usr/local/texlive/2024/bin/x86_64-linux
end
