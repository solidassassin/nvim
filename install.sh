# This is a setup script I made for my systems, if you have a similar configuration feel free to use it.

yay -S --needed \
    nodejs \
    npm \
    ripgrep \
    nerd-fonts-jetbrains-mono \
    python-pip \
    rust-analyzer \
    lua-language-server \
    terraform-ls-bin


sudo npm install -g \
    typescript-language-server \
    prettier \
    lua-fmt \
    pyright \
    bash-language-server \
    dockerfile-language-server-nodejs \
    vscode-langservers-extracted \
    yaml-language-server


pip install -U black
julia -e 'using Pkg; Pkg.add("LanguageServer")'
