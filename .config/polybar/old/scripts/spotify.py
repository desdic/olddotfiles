#!/usr/bin/python3
import dbus
try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object("org.mpris.MediaPlayer2.spotify",
                                         "/org/mpris/MediaPlayer2")
    print("Before interface")
    spotify_properties = dbus.Interface(spotify_bus,
                                        "org.freedesktop.DBus.Properties")
    metadata = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "Metadata")
    sstate = spotify_properties.Get("org.mpris.MediaPlayer2.Player", "PlaybackStatus")

    s = ""
    if sstate == 'Playing':
        # s = ""
        s = "%{F#1ed761}%{F#4C5260}"
    elif sstate == 'Paused':
        s = "%{F#bfc900}%{F#4C5260}"

    print(s, "".join(metadata['xesam:artist']), "-", metadata['xesam:title'])
except:
    print("")
