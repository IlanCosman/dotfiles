function dotfiles_install --on-event dotfiles_events_install
    # Install dependencies if necessary
    set -l installList
    set -l dependencies bat fd fzf lsd
    for dependency in $dependencies
        type $dependency || set -a installList $dependency
    end

    if test -n "$installList"
        type --query pacman && set -l packageManagerCommand sudo pacman -Syu
        type --query brew && set -l packageManagerCommand brew install

        set_color yellow
        echo Installing (string join ', ' $installList)
        set_color normal

        $packageManagerCommand $installList
    end

    # Plugins
    fisher install \
        jorgebucaran/autopair.fish \
        patrickf1/fzf.fish \
        ilancosman/tide

    # Abbrs
    abbr gaa "git add -A"
    abbr gca "git commit -am"
    abbr gs "git status"
end
