from libqtile.config import Group, Key
from libqtile.lazy import lazy
from .key import mod, keys

groups = [Group(g) for g in ["󰈹 ", " ", " ", "󰉋 "]]

for i, g in enumerate(groups):
    j = str(i + 1)
    keys.extend([
        # mod + group number = switch to workspace N
        Key([mod], j, lazy.group[g.name].toscreen()),
        # mod + shift + group number = switch to & move focused window to group
        Key( [mod, "shift"], j, lazy.window.togroup(g.name, switch_group=True)),
    ]) 
