extends: default.liquid
title: neovim
---
Have you completed the [pre-reqs](/pre-reqs/)?
Which editor do you have?

neovim, like vim uses plugins. The plugin we'll be using is 
LanguageClient-neovim which is a Language Server Client so this means it
support any programming languages that implement the LSC protocol.

You'll need a recent version of python (v3) and we'll assume you're using 
[vim-plug](https://github.com/junegunn/vim-plug) plugin manager. If you're
not, then you should reference to the installation 

1 - install python support for neovim: `sudo pip3 install --upgrade neovim`

2 - edit your vimrc and add the following lines: 

```
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
```

4 - in a shell run the following to install the plugin `nvim +PlugInstall +UpdateRemotePlugins +qa`



