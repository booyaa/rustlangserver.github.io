extends: default.liquid

title: Editors
date: 29 Jun 2017 08:54:58 +0100
path: editors/
---

Have you completed the [pre-reqs](/rustlangserver.github.io/pre-reqs/)?
Which editor do you have?

- [vscode](#vscode)
- [neovim](#neovim)

# vscode
<a name="vscode" />
You have two choices of extension: Kalita Alexey's or the reference extension.

## Which one should I choose?

Kalita's extension has implemented features that are essential for the IDE, but 
may also exceed the remit of RLS i.e. built in cargo commands, creating a 
snippet for use in the Rust Playground. The installation process is considerably 
easier beacuse Kalita has submitted the extension to the vscode market place.

Where as the reference extension is extremely useful for bug reporting, since 
this is what the RLS team will be testing your bug report against.

## Kalita's extension

1. Trigger your command palette (CTRL/CMD + P) and enter: `ext install vscode-rust`
2. When prompted reload your editor

# Reference extension

The installation is a bit more involved and will require a recent version of 
[node](https://nodejs.org/en/).

Run the following commands:

```shell
git clone https://github.com/rust-lang-nursery/rls-vscode
cd rls-vscode
npm install
code .
```

VSCode will open into the `rls-vscode` project.  From here, click the Debug
button on the left-hand side (a bug with a line through it). Next, click the
green triangle at the top.  This will launch a new instance of VSCode with the
`rls-vscode` plugin enabled. VSCode setting `"window.openFoldersInNewWindow"`
cannot be set to `"on"`. From there, you can open your Rust projects using
the RLS.

## Verifying RLS is functioning

You'll know it's working when you see this in the status bar at the bottom, with
a spinning indicator:

`RLS analysis: working /`

Once you see:

`RLS analysis: done`

# neovim

<a name="neovim" />

neovim, like it's vim uses plugins. The plugin we'll be using is 
LanguageClient-neovim which is a Language Server Client so this means it
support any programming languages that implement the LSC protocol.

You'll need a recent version of python (v3) and we'll assume you're using 
[vim-plug](https://github.com/junegunn/vim-plug) plugin manager. If you're
not, then you should reference to the installation 

1 - install python support for neovim: `sudo pip3 install --upgrade neovim`

2 - edit your vimrc and add the following lines: 

```vimrc
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



