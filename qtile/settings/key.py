from libqtile.lazy import lazy
from libqtile.config import Key
from .terminal import terminal

mod = "mod4"

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod], "w", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),

    ([mod, "control"], "q", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "space", lazy.spawn("rofi -show drun")),

    # Browser
    ([mod], "b", lazy.spawn("brave")),

    # File Explorer
    ([mod], "e", lazy.spawn("nautilus")),

    # Terminal
    ([mod], "Return", lazy.spawn("kitty")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
    )),

    # Brightness
    # ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    # ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]]
