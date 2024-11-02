using {/Verse.org/Simulation}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Temporary/SceneGraph/FNECon
FNECon<public> := module:
    # Data type used for conversations.
    conversation_database<native><epic_internal> := class<computes><concrete><epic_internal>(asset):


    @experimental
    # Used to handle general conversation.
    conversation_component<native><epic_internal> := class<epic_internal>(component, enableable):
        # Determines if this component is allowed on client.
        IsAllowedOnClient<override>():logic = external {}

        # Enables this component.
        Enable<native><override>():void

        # Disables this component.
        Disable<native><override>():void

        # Succeeds if the component is enabled. Fails if it’s disabled.
        IsEnabled<native><override>()<transacts><decides>:void

        # Sets the name of the speaker that is displayed during conversations.
        SetSpeakerName<native><public>(InSpeakerName:message):void

        # Gets the speaker's name.
        GetSpeakerName<native_callable><public>():message = external {}

        @editable
        # Determines the range at which a player will be able to see the speech bubble (in meters). If set to less than 2m, the player will not see an indicator speech bubble.
        var IndicatorBubbleRange<native><public>:float = external {}

        @editable
        # The conversation database used when a conversation is started.
        var ConversationDatabase<native><public>:conversation_database = external {}

        @editable
        # The max number of participants allowed to interact with this component simultaneously.
        var MaximumParticipatingAgents<native><public>:int = external {}

        # Starts a conversation with the input agent.
        StartConversation<native><public>(Agent:agent):void

        # Ends a conversation with the input agent.
        EndConversation<native><public>(Agent:agent):void

        # Ends all conversations associated with this component.
        EndAllConversations<native><public>():void

        # Event that sends the participating agent when a conversation has started.
        ConversationStartedEvent<native><public>:listenable(agent) = external {}

        # Event that sends the participating agent when a conversation has ended.
        ConversationEndedEvent<native><public>:listenable(agent) = external {}