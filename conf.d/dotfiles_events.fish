function dotfiles_install --on-event dotfiles_events_install
    # fish_add_path /opt/homebrew/bin/ if it exists
    if test -e /opt/homebrew/bin/
        fish_add_path /opt/homebrew/bin/
    end

    # Install dependencies if necessary
    set -l install_list
    set -l dependencies bat fd fzf lsd
    for dependency in $dependencies
        type --query $dependency || set -a install_list $dependency
    end

    if test -n "$install_list"
        type --query pacman && set -l package_manager_install sudo pacman -Syu
        type --query brew && set -l package_manager_install brew install

        set_color yellow
        echo Installing (string join ', ' $install_list)
        set_color normal

        $package_manager_install $install_list
    end

    # Plugins
    fisher install \
        jorgebucaran/autopair.fish \
        patrickf1/fzf.fish \
        ilancosman/tide@v5
end
