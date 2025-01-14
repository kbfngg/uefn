using {/Verse.org/Simulation}
# Used to create a minigame which expects specific input timing from the player.
# Visuals may vary, but always feature a scrubber that moves from 0.0 to 1.0.
# Good and perfect zones are defined on the device, describing at what point the player must provide input to succeed.
skilled_interaction_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Begins the interaction for the provided `agent`.
    # Will cancel any other interactions already in progress for the `agent`.
    BeginInteraction<public>(Agent:agent)<transacts><decides>:void = external {}

    # Cancels the interaction, if in progress, for the provided `agent`.
    EndInteraction<public>(Agent:agent)<transacts><decides>:void = external {}

    # Signaled when the `agent` provides a perfect input.
    # Perfect input occurs when input is provided while the scrubber is within the device's *Perfect Zone*.
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    PerfectInputTriggeredEvent<public>:listenable(tuple(agent, float)) = external {}

    # Signaled when the `agent` provides a good input.
    # Good input occurs when input is provided while the scrubber is within the *Good Zone* (excluding the *Perfect Zone*).
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    GoodInputTriggeredEvent<public>:listenable(tuple(agent, float)) = external {}

    # Signaled when the `agent` provides a bad input.
    # Bad input occurs when input is provided while the scrubber is outside the *Good Zone*.
    # Sends the `agent` that provided the input.
    # Sends the `float` position of the meter scrubber from `0.0` to `1.0`.
    BadInputTriggeredEvent<public>:listenable(tuple(agent, float)) = external {}

    # Signaled when the `agent` starts an interaction.
    # Input is the `agent` which started interacting with the device.
    InteractionStartedEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` succeeds at the interaction.
    # The interaction is completed depending on the device's configuration.
    # * Once the device's *Success Target* is reached.
    # * Upon a perfect input if using *Instant Success Perfect Behavior*.
    InteractionSucceededEvent<public>:listenable(agent) = external {}

    # Signaled when the `agent` fails the interaction.
    # The interaction can be failed in several ways
    # * If the number of bad inputs reaches the *Failure Limit*.
    # * If the interaction has an *Interaction Time Limit* that expires.
    InteractionFailedEvent<public>:listenable(agent) = external {}

    # Signaled when the interaction is interrupted.
    # The interaction can be interrupted in several ways.
    # * If the participating `agent` is eliminated or enters a downed state.
    # * If *Deactivate* is called while the interaction is in progress.* If *Disable* is called while the interaction is in progress.
    InteractionCanceledEvent<public>:listenable(agent) = external {}

    # Enable this device.
    Enable<override>():void = external {}

    # Disable this device.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}