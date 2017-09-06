#!/bin/bash -e
# Rick Richardson <rick.richardson@gmail.com>
# License Apache2 or MIT

# * What this does *
#
# This script will install RLS and the Vim Language Server Plugin found here :
# https://github.com/prabirshrestha/vim-lsp

# * Credit *
#
# This script incorporates code found in 
# https://www.reddit.com/r/rust/comments/6rx634/async_autocompletion_for_vim8_and_neovim_via_rls/ 
# https://github.com/rust-lang-nursery/rls
# https://github.com/racer-rust/racer#configuration

# * Prereqs *
# Vim 8  -- On Debian style systems, you can follow the instructions here https://itsfoss.com/vim-8-release-install/
# curl   -- This one's pretty ubiquitous
# Rust nightly  -- This script will install it for you, but be warned it will set your default rustup to nightly

# If you are installing rustup and rustc, 
# I strongly recommend not running this as root, but as your regular
# logged-in user.  It will install the binaries 
# It will install rustup,  then rust nightly, then the rust language server
# After that it will configure a minimal .vim set-up
# Feel free to comment out the pieces that you don't need

function install_rustup() {
    rexe=$(which rustup)
    if [ "$rexe" = "" ]; then
      curl https://sh.rustup.rs -sSf | sh
    fi
}

function install_rustc() {
    rustup self update
    rustup update nightly
    rustup default nightly
}

function install_rls() {
    rustup component add rls --toolchain nightly
    rustup component add rust-analysis --toolchain nightly
    rustup component add rust-src --toolchain nightly
}

function install_via_git() {
    mkdir -p ~/.vim/pack/bundles/start
    pushd ~/.vim/pack/bundles/start
    for repo in 'prabirshrestha/async.vim' 'prabirshrestha/vim-lsp' 'prabirshrestha/asyncomplete.vim' 'prabirshrestha/asyncomplete-lsp.vim' 'rust-lang/rust.vim'
    do
        git clone --depth 1 https://github.com/${repo} || true
    done

    popd

    cat << EOF
vim plugins installed.

Please also add this block to your ~/.vimrc

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
EOF
}

function install_via_plug() {
cat << EOF
If you have vim-plug installed..."
Add these lines inside your call plug#begin() and call plug#end() lines in your .vimrc
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Also add this code outside of that block.

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
EOF
}

# * MAIN *

#install_rustup
#install_rustc
install_via_git
#install_via_plug

RUSTC_ROOT="$(rustc --print sysroot)"
RUST_SRC_PATH="${RUSTC_ROOT}/lib/rustlib/src/rust/src"

echo "installation completed"
echo "IMPORTANT : be sure to add this line to your ~/.bashrc"
echo "export RUST_SRC_PATH=$RUST_SRC_PATH"
echo "also insure that your path contains the rustc path and cargo path"
echo "export PATH=$PATH:${RUSTC_ROOT}/bin:~/.cargo/bin