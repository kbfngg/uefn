using {/Verse.org/Simulation}
# Used to spawn NPCs made with Character Definition asset.
npc_spawner_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when a character is spawned.
    # Sends the `agent` character who was spawned.
    SpawnedEvent<public>:listenable(agent) = external {}

    # Signaled when a character is eliminated.
    # `Source` is the `agent` that eliminated the character. If the character was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the character that was eliminated.
    EliminatedEvent<public>:listenable(device_ai_interaction_result) = external {}

    # Enables this device. Characters will start to spawn.
    Enable<public>():void = external {}

    # Disables this device. Characters will despawn if *Despawn AIs When Disabled* is set.
    Disable<public>():void = external {}

    # Resets the spawn count allowing spawning of a new batch of characters.
    Reset<public>():void = external {}

    # Tries to spawn a character.
    Spawn<public>():void = external {}

    # Despawns all characters. If set, `Instigator` will be considered as the eliminator of those characters.
    DespawnAll<public>(Instigator:?agent):void = external {}