# Emacs for a vim user. vi improved, improved.

This is a nearly wholesale clone of [my vim config](https://github.com/chrismccord/dot_vim), down to plugins and key bindings. All configuration is located in `init.el`, should be easy to customize, and has been tailored for a vim user who wants the best of both worlds.

![screenshot](https://raw.githubusercontent.com/chrismccord/dot_emacs/master/screenshot.png)

## Setup

Manually:
```console

$ git clone git@github.com:chrismccord/dot_emacs.git ~/.emacs.d
$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
$ cd ~/.emacs.d
$ ~/.cask/bin/cask install
```
Or using install script:
```console

$ git clone git@github.com:chrismccord/dot_emacs.git ~/.emacs.d
$ cd ~/.emacs.d
$ sh install.sh
```
