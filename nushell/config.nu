# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# use std "path add"
# path add '/opt/homebrew/bin'

# Environment variables

$env.config.buffer_editor = "hx"

# Plugins

mkdir ($nu.data-dir | path join "vendor/autoload")

# Starship
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Zoxide
zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
