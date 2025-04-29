from os import path
from libqtile.config import Screen
from libqtile import bar
from .widgets import Workspace


# TODO: Add support for multiple monitors

def StatusBar(widgets):
    return bar.Bar(widgets, 32, opacity=0.92)

screens = [
    Screen(
        top=StatusBar(Workspace())
    )
]
