if status is-interactive
    set -x LANGUAGE "en_US.UTF-8"
    set -x LC_CTYPE "en_US.UTF-8"
    set -x LC_ALL "en_US.UTF-8"
    set -x LANG "en_US.UTF-8"
    set -x EDITOR nvim
    # set -x PAGER "nvim -R"
    set -x MANPAGER "nvim +Man!"
    set -x DOCKER_BUILDKIT 1
    set -x FZF_DEFAULT_OPTS "--prompt='> ' --pointer='>' --border=sharp --color=gutter:16,pointer:-1,fg:-1:dim,fg+:-1,bg+:-1,hl:11,hl+:11:reverse,scrollbar:0:dim:reverse --preview-window=border-sharp --scrollbar=' '"
    set -x DOTNET_ROOT "/opt/homebrew/opt/dotnet/libexec"
end
