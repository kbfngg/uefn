using {/Verse.org/Colors}
# Used to create customizable Grind Rails.
grind_rail_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device, letting players grind on the rail.
    Enable<public>():void = external {}

    # Disables this device, preventing players from grinding on the rail.
    Disable<public>():void = external {}

    # Sets the color of the Grind Rail.
    SetRailColor<public>(Color:color):void = external {}