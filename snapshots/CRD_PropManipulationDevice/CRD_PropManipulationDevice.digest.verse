using {/Verse.org/Simulation}
# Used to manipulate the properties of one or more props in a specified area (e.g. Visibility/Destructibility).
prop_manipulator_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when props affected by this device are damaged.
    # Sends the `agent` that damaged the prop.
    DamagedEvent<public>:listenable(agent) = external {}

    # Signaled when props affected by this device are destroyed.
    # Sends the `agent` that destroyed the prop.
    DestroyedEvent<public>:listenable(agent) = external {}

    # Signaled when prop resource nodes affected by this device are harvested.
    # Sends the `agent` that harvested resources from the prop.
    HarvestingEvent<public>:listenable(agent) = external {}

    # Signaled when prop resource nodes affected by this device are completely depleted of energy.
    # Sends the `agent` that depleted the prop's energy.
    ResourceDepletionEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Shows all props affected by this device.
    ShowProps<public>():void = external {}

    # Hides all props affected by this device.
    HideProps<public>():void = external {}

    # Empties the resources of all props affected by this device.
    ExhaustResources<public>():void = external {}

    # Restocks the resources of all props affected by this device.
    RestockResources<public>():void = external {}

    # Restores health of all props affected by this device.
    RestoreHealth<public>():void = external {}

    # Sets the *Override Resource* option to *Yes*.
    SetResourceOverridesActive<public>():void = external {}

    # Sets the *Override Resource* option to *No*.
    DisableResourceNodeOverrides<public>():void = external {}