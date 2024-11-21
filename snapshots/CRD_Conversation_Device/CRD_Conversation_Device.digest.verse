using {/Verse.org/Simulation}
# Used to set and trigger conversations made via the Conversation Graph. The conversation triggered is assigned to the device.
conversation_device<public> := class<concrete><final>(creative_device_base, enableable):
    # Enables this device.
    # An enabled conversation device will listen for inputs and trigger conversations.
    Enable<override>():void = external {}

    # Disables this device.
    # A disabled conversation device will not listen for inputs and trigger conversations.
    Disable<override>():void = external {}

    # Check if the device is enabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    # Begins the assigned conversation with the `agent`.
    # The conversation will not start if the device or the `agent` are otherwise incapable of having a conversation.
    InitiateConversation<public>(Agent:agent):void = external {}

    # Check if an `agent` is in an active conversation.
    IsAgentInConversation<public>(Agent:agent)<transacts><decides>:void = external {}

    # Check if an `agent` can initiate a conversation.
    CanInitiateConversation<public>(Agent:agent)<transacts><decides>:void = external {}

    # Ends the assigned conversation with the `agent`.
    EndConversation<public>(Agent:agent):void = external {}

    # Ends all active conversations with this device.
    EndConversationForAll<public>():void = external {}

    # Signaled when a choice node tied to this event is selected by an `agent`.
    # Sends the `agent` that triggered the event, and `EventNumber` is the number specified in the Conversation Event node.
    OnConversationEvent<public>:listenable(tuple(agent, int)) = external {}

    # Returns the count of currently-active conversations with this device.
    GetActiveConversationsCount<public>()<transacts>:int = external {}

    # The Speaker Name of the device.
    var SpeakerName<public>:message = external {}

    # Whether the device will show the Speaker when nearby.
    var ShowNameWhenNearby<public>:logic = external {}

    # whether the device will show the Indicator Bubble when nearby.
    var ShowIndicatorBubble<public>:logic = external {}

    # The range that the Indicator Bubble will be seen at. Clamps to range[0, 25].
    var IndicatorBubbleRange<public>:float = external {}

    # Whether the device will show conversation text in worldspace when using the Radial UI type.
    var ShowConversationTextInWorldSpace<public>:logic = external {}

    # Sets the number of conversations allowed at once with the device.
    # This will not make any conversations exit if there are more current conversations than allowed after this call.
    var AllowedConversationCount<public>:int = external {}