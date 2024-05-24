using {/Verse.org/Colors}
using {/Verse.org/Simulation}
# Used to create a customizable vine version of the Grind Rails.
vine_rail_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device, letting players grind on the vines.
    Enable<public>():void = external {}

    # Disables this device, preventing players from grinding on the vines.
    Disable<public>():void = external {}

    # Hides the track. Players can still grind on the track if it is enabled.
    Hide<public>():void = external {}

    # Make this track visible.
    Show<public>():void = external {}

    # Signaled when an `agent` starts grinding on this `vine_rail_device`.
    StartedGrindingEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` starts grinding on this `vine_rail_device`.
    EndedGrindingEvent<public>:listenable(agent) = external {}

# Used to create customizable Grind Rails.
grind_rail_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device, letting players grind on the rail.
    Enable<public>():void = external {}

    # Disables this device, preventing players from grinding on the rail.
    Disable<public>():void = external {}

    # Sets the color of the Grind Rail.
    SetRailColor<public>(Color:color):void = external {}

    # Hides the track. Players can still grind on the track if it is enabled.
    Hide<public>():void = external {}

    # Make this track visible.
    Show<public>():void = external {}

    # Signaled when an `agent` starts grinding on this `grind_rail_device`.
    StartedGrindingEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` starts grinding on this `grind_rail_device`.
    EndedGrindingEvent<public>:listenable(agent) = external {}