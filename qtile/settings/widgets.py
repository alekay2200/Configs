from libqtile import widget
from .color import colors

def Separator():
    return widget.Sep(linewidth=0, padding=5)

def Volume():
    return widget.Volume(
        background=colors["green"],
        step = 5,
        fmt="  {}",
        mute_format="/",
        mute_foreground=colors["surface1"]
    )

def Workspace():
    return [
        Separator(),
        widget.GroupBox(
            foreground=colors["crust"],
            background=colors["flamingo"],
            font='UbuntuMono Nerd Font',
            fontsize=28,
            # margin_y=10,
            margin_x=0,
            padding_y=32,
            padding_x=32,
            # active=colors["text"],
            borderwidth=1,
            inactive=colors["crust"],
            rounded=True,
            highlight_method='block',
            urgent_alert_method='block',
            # urgent_border=colors["text"],
            this_current_screen_border=colors["peach"],
            # this_screen_border=colors['text'],
            # other_current_screen_border=colors['text'],
            # other_screen_border=colors["text"],
            disable_drag=True
        ),
        Separator(),
        widget.WindowName(foreground=colors["crust"], background=colors["teal"]),
        Separator(),
        widget.Systray(),
        Separator(),
        Volume(),
        Separator(),
        widget.Clock(foreground=colors["crust"], background=colors["lavender"], format="%H:%M %a %d-%m-%Y"),
        Separator(),
        widget.QuickExit(foreground=colors["crust"], background=colors["red"]),
        Separator(),
    ]

# def Power():
#     return widget.UPowerWidget(
#                     background = "#2e3440",
#                     border_colour = '#d8dee9',
#                     border_critical_colour = '#bf616a',
#                     border_charge_colour = '#d8dee9',
#                     fill_low = '#ebcb8b',
#                     fill_charge = '#a3be8c',
#                     fill_critical = '#bf616a',
#                     fill_normal = '#d8dee9',
#                     percentage_low = 0.4,
#                     percentage_critical = 0.2,
#                     font = "RobotoMono Nerd Font"
#                     ),
