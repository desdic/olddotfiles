# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401

import os
import sys
import subprocess
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
# from libqtile.utils import guess_terminal
# from libqtile.log_utils import logger


HOME = os.path.expanduser('~')
TERMINAL = "/sbin/alacritty"  # guess_terminal()


def init_layout_theme():
    return {"margin": 2,
            "border_width": 2,
            "border_focus": "#6790eb",
            "border_normal": "#2F343F"
            }


def init_colors():
    return [["#2F343F", "#2F343F"],  # color 0
            ["#2F343F", "#2F343F"],  # color 1
            ["#c0c5ce", "#c0c5ce"],  # color 2
            ["#fba922", "#fba922"],  # color 3
            ["#3384d0", "#3384d0"],  # color 4
            ["#f3f4f5", "#f3f4f5"],  # color 5
            ["#cd1f3f", "#cd1f3f"],  # color 6
            ["#62FF00", "#62FF00"],  # color 7
            ["#6790eb", "#6790eb"],  # color 8
            ["#a9a9a9", "#a9a9a9"]]  # color 9


mod = "mod4"  # Windows key

# If we're running in debug mode, it's for development. Make sure the
# hotkeys don't clash, only start one window, etc.
if '-d' in sys.argv:
    hostname = 'xephyr'
    mod = "mod1"  # alt


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    Key([mod], "space", lazy.window.toggle_floating(),
        desc="Toggle floating window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Key([mod], "d", lazy.spawn("dmenu_run -p 'Run: '"), desc="Launch dmenu"),
    Key([mod], "d", lazy.spawn("rofi -modi run,drun -show drun -line-padding 4 -columns 2 -width 40 -padding 30 -hide-scrollbar -show-icons -drun-icon-theme \"Papirus\" > /tmp/kgnfile 2>&1"), desc="Rofi application launcher"),
    Key([mod], "g", lazy.spawn("/sbin/google-chrome-stable"), desc="Start Chrome"),

    Key([mod], "BackSpace",
        lazy.group["4"].toscreen(),
        lazy.spawn(HOME + "/bin/newsession.sh"),
        desc="Start tmux session"),

    Key([mod, "shift"], "p", lazy.spawn("/sbin/bwmenu"), desc="Start bwmenu"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "x", lazy.spawn(HOME + "/bin/imagelock.sh")),

    # Spotify
    Key([mod], "s",
        lazy.group["0"].toscreen(),
        lazy.spawn("/sbin/spotify"),
        desc="Start Spotify"),
    Key([mod], "p", lazy.spawn("/sbin/playerctl -p spotify play-pause")),
    Key([mod], "bracketleft", lazy.spawn("/sbin/playerctl -p spotify previous")),
    Key([mod], "bracketright", lazy.spawn("/sbin/playerctl -p spotify next")),
    Key([mod, "shift"], "Page_Up", lazy.spawn(HOME + "/bin/spotifyvolume.sh up")),
    Key([mod, "shift"], "Page_Down", lazy.spawn(HOME + "/bin/spotifyvolume.sh down")),

    Key([mod], "m",
        lazy.group["5"].toscreen(),
        lazy.spawn(TERMINAL + " --class mutt -e zsh -c 'source ~/.zshrc && /sbin/neomutt'"),
        desc="Start Mumble"),

    Key([mod], "n",
        lazy.group["1"].toscreen(),
        lazy.spawn("/sbin/mumble"),
        desc="Start Mumble"),

    Key([mod], "b",
        lazy.group["2"].toscreen(),
        lazy.spawn("/sbin/dino"),
        desc="Start Dino"),

]

groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
# https://fontawesome.com/v4.7.0/cheatsheet/
group_labels = ["", "", "", "", "", "", "", "", "", ""]
group_layouts  = ["columns", "jabber", "columns", "columns", "max", "columns", "columns", "columns", "columns", "columns"]
group_matches = [[Match(wm_class=["Mumble"])],
                 [Match(wm_class=["Dino"]), Match(wm_class=['Pidgin'], role=['Buddy List'])],
                 [Match(wm_class=["Google-chrome"])],
                 [],
                 [],
                 [],
                 [],
                 [Match(wm_class=["slack", "Slack"])],
                 [Match(wm_class=["code-oss"]), Match(wm_class=["Steam"])],
                 [],
                 ]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
            matches=group_matches[i],
        ))

for grp in groups:
    keys.extend([
        Key([mod], grp.name, lazy.group[grp.name].toscreen()),
        Key([mod, "shift"], grp.name, lazy.window.togroup(grp.name)),
    ])


colors = init_colors()
layout_theme = init_layout_theme()

layouts = [
    layout.Columns(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),

    # a layout for pidgin
    layout.Slice(side='right', width=256, name='jabber', role='buddy_list', fallback=layout.Stack(num_stacks=2, **layout_theme)),

    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    font='Ubuntu Mono',
    fontsize=12,
    padding=3,
    foreground=colors[2],
    background=colors[1],
)

widget_spotify = dict(
    font='Ubuntu Mono',
    fontsize=12,
    padding=3,
    foreground=colors[8],
    background=colors[1],
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.Image(scale=True,
                             # # mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("rofi -show drun")},
                             # filename="~/.config/qtile/icons/python.png",
                             # background=colors[1],
                             # padding=3),
                # widget.CurrentLayout(),
                widget.GroupBox(font="FontAwesome",
                                padding=3,
                                fontsize=12,
                                borderwidth=1,
                                disable_drag=True,
                                active=colors[5],
                                inactive=colors[9],
                                rounded=False,
                                highlight_method="border",
                                this_current_screen_border=colors[8],
                                background=colors[1],
                                urgent_border=colors[6]),

                widget.TextBox('|'),
                widget.CurrentLayout(),

                widget.TextBox('|'),
                widget.WindowName(),

                widget.Mpris2(
                    name='spotify',
                    objname="org.mpris.MediaPlayer2.spotify",
                    display_metadata=['xesam:title', 'xesam:artist'],
                    scroll_chars=None,
                    stop_pause_text="",
                    **widget_defaults,
                ),

                widget.TextBox('|'),
                widget.ThermalSensor(threshold=90,
                                     update_interval=2,
                                     foreground=colors[2],
                                     background=colors[1]),

                # widget.TextBox('|'),
                # widget.DF(partition="/", format='{p} ({uf}{m}|{r:.0f}%)'),

                widget.TextBox('|'),
                widget.TextBox("CPU"),
                widget.CPU(format='{load_percent}%', update_interval=2),

                widget.TextBox('|'),
                widget.TextBox("MEM"),
                widget.Memory(format='{MemPercent}%', update_interval=2),

                widget.TextBox('|'),
                widget.Maildir(subfolder_fmt="INSEC:{value}", maildir_path="~/.local/share/mail/insec", sub_folders=["INBOX"], update_interval=60),
                widget.Maildir(subfolder_fmt="ONE:{value}", maildir_path="~/.local/share/mail/one", sub_folders=["INBOX"], update_interval=60),

                widget.TextBox('|'),
                widget.Clock(format='%a %d/%m/%Y - %H:%M'),
                widget.Systray(icon_size=12),
                widget.Spacer(length=10),
            ],
            25,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='Pinentry-gtk-2'),  # GPG key password entry gtk2
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def autostart():
    subprocess.Popen([HOME + '/.config/qtile/autostart.sh'])


@hook.subscribe.client_new
def floating_dialogs(window):
    dialog = window.window.get_wm_type() == 'dialog'
    transient = window.window.get_wm_transient_for()
    if dialog or transient:
        window.floating = True


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
