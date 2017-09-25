# Mockup for the RLS website

[![Build Status](https://travis-ci.org/booyaa/rustlangserver.github.io.svg?branch=source)](https://travis-ci.org/booyaa/rustlangserver.github.io)

http://rls.booyaa.wtf/

For background information see: https://github.com/rust-lang-nursery/rls/issues/261

# To build

- Fork this repo
- `cd rustlangserver.github.io`
- Install cobalt `cargo install --force cobalt-bin`
- Make your changes
- Use `cobalt serve` to test changes render correctly.
- Raise a PR with your changes

Once merged, travis will take care of deploying changes to website.

# Misc

## Animation (GIF)

Optimize gifs using [gifsicle](http://www.lcdf.org/gifsicle/)

```
for i in $(ls vscode-*.gif | grep -v opt); do gifsicle -O3 $i --colors 256 -o $i; done
```

Saved about 160kbytes using the tool!

## Creating static image from GIF

Also greyscaled to nudge avoid attracting users' attention.

```
for i in $(ls vscode-*.gif); do convert "$i[0]" -set colorspace Gray -separate -average $(basename $i .gif).png; done
```


# License 

The Rust Project is dual-licensed under Apache 2.0 and MIT
terms. So's this repo.
