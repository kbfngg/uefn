using {/Verse.org/Simulation}
# Creates a zipline that moves players from point to point.
zipline_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` attaches to the zipline.
    # Sends `agent` that attached.
    AttachEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` detaches from the zipline.
    # Sends `agent` that detached.
    DetachEvent<public>:listenable(agent) = external {}

    # Returns true if `Agent`is currently attached to this zipline.
    IsAttached<public>(Agent:agent)<transacts><decides>:void = external {}