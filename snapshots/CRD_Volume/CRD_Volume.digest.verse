using {/Verse.org/Simulation}
# Used to track when agents enter and exit a volume.
volume_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when an `agent` enters the device volume.
    AgentEntersEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the device volume.
    AgentExitsEvent<public>:listenable(agent) = external {}

    # Returns an array of agents that are currently occupying the volume.
    GetAgentsInVolume<epic_internal>()<computes><reads>:[]agent = external {}

    # Succeeds when `Agent` is in the volume.
    IsInVolume<epic_internal>(Agent:agent)<transacts><decides>:void = external {}