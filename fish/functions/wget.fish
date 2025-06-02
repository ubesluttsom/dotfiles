function wget --description 'Use wget with custom HSTS file location'
    command wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end
