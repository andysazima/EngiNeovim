# Nvim Config

## Introduction

This is my personal Neovim Config that I use at home. A similar config can be found on my [work Github](https://github.com/sazima1).

## Goal

I try to keep things simple and well-organized. I don't want to bloat my nvim with plugins I don't need.

This nvim setup is my attempt to switch away from VSCode. I was a loyal VSCode user for years, but I found that I just don't use VSCode how it is meant to be used, and I was actually trying to make VSCode act like Vim. So why not switch to the real deal?

## Scheme

I use a structured plugin setup that is centered around [lazy.nvim](https://github.com/folke/lazy.nvim).

I keep general configuration (including lazy.nvim initialization) in `./lua/config`, and I keep individual plugin configuration in `./lua/plugins`.

