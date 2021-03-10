function dotfiles_install --on-event dotfiles_events_install
    # Plugins
    fisher install \
        jorgebucaran/autopair.fish \
        patrickf1/fzf.fish \
        ilancosman/tide

    # Abbrs
    abbr gca "git commit -am"
    abbr gs "git status"
end
