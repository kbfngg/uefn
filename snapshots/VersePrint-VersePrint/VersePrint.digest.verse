using {/Verse.org/Colors}
# Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
Print<native><public>(Message:string, ?Duration:float = external {}, ?Color:color = external {})<transacts>:void

# Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
Print<native><public>(Message:message, ?Duration:float = external {}, ?Color:color = external {})<transacts>:void