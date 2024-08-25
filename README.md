# Nvim Config

## Introduction

This is my personal Neovim Config that I use at home. A similar config can be found on my [work Github](https://github.com/sazima1).

## Goal

I try to keep things simple and well-organized. I don't want to bloat my nvim with plugins I don't need. Although, I might not be able to completely stop myself there -- specially with cosmetic plugins...

This nvim setup is my attempt to switch away from VSCode. I was a loyal VSCode user for years, but I found that I just don't use VSCode how it is meant to be used, and I was actually trying to make VSCode act like Vim. So why not switch to the real deal?

## Scheme

I use a structured plugin setup that is centered around [lazy.nvim](https://github.com/folke/lazy.nvim).

I keep general configuration (including lazy.nvim initialization) in `./lua/config`, and I keep individual plugin configuration in `./lua/plugins`.

## Installation

This is a Neovim config like any other, so all you need to do is:

1. Make a backup of your current nvim config (optional but recommended): `mv ~/.config/nvim ~/.config/nvim.bkp`
2. Clone this repo into the config folder: `git clone https://github.com/andysazima/sazima-nvim.git ~/.config/nvim`
