function dotfiles_install --on-event dotfiles_events_install
    # Add these to the path if they exist
    fish_add_path /opt/homebrew/bin/ ~/.cargo/bin/

    # Install dependencies if necessary
    set -l dependencies \
        bat \
        fd \
        fzf \
        lsd \
        thefuck \
        tealdeer \
        hyperfine

    set -l install_list
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

    # Load in thefuck
    thefuck --alias | source
    funcsave fuck
end
