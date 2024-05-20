# Instructions to use this repository

## Prequisites

This repository is made for use with [stow](https://www.gnu.org/software/stow/)

## Precautions

Backup any dotfile that is managed in this repository you want to keep by renaming them:

```bash
# e.g. ZSH config
mv ~/.zshrc ~/.zshrc.bak
```

## Clone repository

Clone this repository to your $HOME

```bash
# stow defaults to using the parent directory so we clone into $HOME
git clone https://github.com/GerbenWelter/dotfiles.git ~/dotfiles
```

## Use repository with stow

Use `stow` to link your dotfiles to this repository:

```bash
cd ~/dotfiles
# if not using the above directory adjust command below with '--target=<dir>'
stow --dotfiles .
```
