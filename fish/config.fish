if status is-interactive
    # Commands to run in interactive sessions can go here

    # Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"
 
    # Zoxide (AKA `z`)
    zoxide init fish | source
end
