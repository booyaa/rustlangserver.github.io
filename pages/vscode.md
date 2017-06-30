extends: default.liquid
title: Visual Studio Code
path: vscode/
---

Have you completed the [pre-reqs](/pre-reqs/)?

You have two choices of extension: Kalita Alexey's or the reference extension.

### Which one should I choose?

Kalita's extension has implemented features that are essential for the IDE, but 
may also exceed the remit of RLS i.e. built in cargo commands, creating a 
snippet for use in the Rust Playground. The installation process is considerably 
easier beacuse Kalita has submitted the extension to the vscode market place.

Where as the reference extension is extremely useful for bug reporting, since 
this is what the RLS team will be testing your bug report against.

#### Kalita's extension

1. Trigger your command palette (CTRL/CMD + P) and enter: `ext install vscode-rust`
2. When prompted reload your editor

#### Reference extension

The installation is a bit more involved and will require a recent version of 
[node](https://nodejs.org/en/).

Run the following commands:

```
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

### Verifying RLS is functioning

You'll know it's working when you see this in the status bar at the bottom, with
a spinning indicator:

`RLS analysis: working /`

Once you see:

`RLS analysis: done`
