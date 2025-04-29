#!/bin/bash

## Using nitrogen to set wallpaper on startup
# nitrogen --restore (not working)

## Pipewire audio backend
pipewire &
pipewire-pulse &
wireplumber &

## Starting compton compositor on startup for transparency
# If transparency is not working, try with vsync
picom &
