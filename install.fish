# Install fisher if necessary
type --query fisher ||
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish |
        source && fisher install jorgebucaran/fisher

fisher install ilancosman/dotfiles
