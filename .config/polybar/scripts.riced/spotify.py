#!/usr/bin/python3
import dbus
try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify",
                                         "/org/mpris/MediaPlayer2")
    spotify_properties = dbus.Interface(spotify_bus,
                                        "org.freedesktop.DBus.Properties")
    metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")
    sstate = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus")

    s = ""
    if sstate == 'Playing':
        s = ""
    elif sstate == 'Paused':
        s = ""

    print(s, "".join(metadata['xesam:artist']), "-", metadata['xesam:title'])
except:
    print("")
