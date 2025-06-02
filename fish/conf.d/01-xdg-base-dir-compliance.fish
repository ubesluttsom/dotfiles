# XDG Base Directory setup
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_STATE_HOME $HOME/.local/state
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_RUNTIME_DIR /tmp/$USER-runtime
mkdir -p "$XDG_RUNTIME_DIR"
chmod 700 "$XDG_RUNTIME_DIR"

# Application specific configurations
set -x ATOM_HOME "$XDG_DATA_HOME"/atom
set -x HISTFILE "$XDG_STATE_HOME"/bash/history
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -x GEM_HOME "$XDG_DATA_HOME"/gem
set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -x NUGET_PACKAGES "$XDG_CACHE_HOME"/NuGetPackages
set -x AZURE_CONFIG_DIR "$XDG_DATA_HOME"/azure
set -x PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -x XAUTHORITY "$XDG_RUNTIME_DIR"/Xauthority
set -x HISTFILE "$XDG_STATE_HOME"/zsh/history
set -x TLDR_CACHE_DIR "$XDG_CACHE_HOME"/tldrc
set -gx GEM_HOME $XDG_DATA_HOME/gems
set -gx GEM_PATH $GEM_HOME
set -gx PATH $GEM_HOME/bin $PATH
set -gx PASSWORD_STORE_DIR "$XDG_DATA_HOME"/pass
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg
            
set -x RUSTUP_HOME $XDG_DATA_HOME/rustup
set -x CARGO_HOME $XDG_DATA_HOME/cargo

# npm configuration
set -Ux npm_config_prefix "$XDG_DATA_HOME/npm"
set -Ux npm_config_cache "$XDG_CACHE_HOME/npm"
set -Ux npm_config_tmp "$XDG_RUNTIME_DIR/npm"
set -Ux npm_config_init_module "$XDG_CONFIG_HOME/npm/config/npm-init.js"
