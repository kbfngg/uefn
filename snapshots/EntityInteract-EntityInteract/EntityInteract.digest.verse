using {/Verse.org/Simulation}
@experimental
# Used to handle general interaction.
interact_component<native><epic_internal> := class(component, enableable):
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Enable interaction with the component.
    Enable<native><override>():void

    @experimental
    # Disable interaction with the component. Disabled components do not provide interaction prompts.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    InteractFinishedEvent<native><public>:listenable(agent) = external {}

    # Event fires when an a successful interaction starts. Sends the interacting agent. InteractDuration at or below 0 makes this event identical to InteractSucceededEvent.
    InteractStartedEvent<native><public>:listenable(agent) = external {}

    # Event fires when an interaction has completed successfully. Sends the formerly interacting agent. InteractDuration at or below 0 makes this event identical to InteractStartedEvent.
    InteractSucceededEvent<native><public>:listenable(agent) = external {}

    @experimental
    # Event fires when an interaction has ended before completing successfully. Sends the formerly interacting agent.  This event is called on all interacting agents when Disable() is called on the component.
    InteractCanceledEvent<native><public>:listenable(agent) = external {}

    @experimental
    # Event fires when a new shared cooldown starts or if the remaining duration is modified to something greater than 0. Sends the new duration of the shared cooldown.
    SharedCooldownTriggeredEvent<native><public>:listenable(float) = external {}

    @experimental
    # Event fires when a new per agent cooldown starts or if the remaining duration is modified to something greater than 0. Sends the affected agent and new duration of the per agent cooldown.
    PerAgentCooldownTriggeredEvent<native><public>:listenable(tuple(agent, float)) = external {}

    @experimental
    # Event fires when the remaining duration of the shared cooldown becomes 0.
    SharedCooldownExpiredEvent<native><public>:listenable(tuple()) = external {}

    @experimental
    # Event fires when the remaining duration of the per agent cooldown becomes 0. Sends the affected agent. This does not indicate whether or not the agent is currently affected by the shared cooldown.
    PerAgentCooldownExpiredEvent<native><public>:listenable(agent) = external {}

    @editable
    @experimental
    var InteractDistance<native><public>:float = external {}

    @editable
    @experimental
    # The max number of simultaneous interactors. A value of false is unlimited.  This value represents how many agents may have active interactions. If this changes to a value less than the current number of active interactions, those interactions are not canceled.
    var MaxSimultaneousInteractors<native><public>:?int = external {}

    @editable
    @experimental
    # The number of seconds an agent must spend interacting with the object to complete an interaction. 0 is immediate.
    var InteractDuration<native><public>:float = external {}

    @editable
    @experimental
    # The number of seconds after a successful interaction, before being able to initiate a subsequent interaction for anyone. This is only used if duration is greater than 0.0. An agent’s actualized cooldown is the greater of the remaining SharedCooldownDuration and the agent’s remaining PerAgentCooldownDuration. Modifying this at runtime does not affect the in-progress cooldown.
    var SharedCooldownDuration<native><public>:float = external {}

    @editable
    @experimental
    # The duration in seconds after a successful interaction, before the same agent can initiate a subsequent interaction. This is only used if the duration is greater than 0.0. An agent’s actualized cooldown is the greater of the remaining SharedCooldownDuration and the agent’s remaining PerAgentCooldownDuration. Modifying this at runtime does not affect in-progress cooldowns. This property gives other agents time to interact, when there is a limited number of Simultaneous Interators.
    var PerAgentCooldownDuration<native><public>:float = external {}

    @experimental
    # The text displayed when within the interaction range of the entity with an interactable interact component. Used only during initialization of the component and not modified by SetText.
    DefaultInteractText<localizes><native><public>:message = external {}

    @experimental
    # Sets the text displayed when within the interaction range of the entity with an interactable interact component.
    SetInteractText<native><public>(InText:message):void

    @experimental
    # Gets the current text displayed when within the interaction range of the entity with an interactable interact component.
    GetInteractText<native><public>():string

    # The text to display when within the interaction range of the entity with a coolingdown interact component. Used only during initialization of the component and not modified by SetText.
    DefaultCoolDownText<localizes><native><public>:message = external {}

    # Sets the text to display when within the interaction range of the entity with a coolingdown interact component.
    SetCoolDownText<native><public>(InText:message):void

    # Gets the current text to display when within the interaction range of the entity with a coolingdown interact component.
    GetCoolDownText<native><public>():string

    # The text to display to the user within the interaction range of the entity with a interact component that CannotInteract. Used only during initialization of the component and not modified by SetText.
    DefaultCannotInteractText<localizes><native><public>:message = external {}

    # Sets the text to display to the user within the interaction range of the entity with a interact component that CannotInteract.
    SetCannotInteractText<native><public>(InText:message):void

    # Gets the current text to display to the user within the interaction range of the entity with a interact component that CannotInteract.
    GetCannotInteractText<native><public>():string

    @experimental
    # Returns the interacting agents for this interactable.
    GetInteractingAgents<native><final><public>():[]agent

    # Returns whether the specified agent is currently interacting.
    IsAgentInteracting<native><final><public>(Agent:agent)<computes><decides><reads>:void

    # Returns whether the specified agent can interact.
    CanInteract<native><public>(Agent:agent)<computes><decides><reads>:void

    @experimental
    # Attempt to start an interaction. Fails if the agent does not pass the CanInteract function.
    Start<native><public>(Agent:agent)<transacts><decides>:void

    @experimental
    # Attempt to cancel an interaction. Fails if the supplied agent is not currently interacting with the component.
    Cancel<native><public>(Agent:agent)<transacts><decides>:void

    @experimental
    # Attempt to succeed at an interaction. Success will also happen automatically after InteractDuration has elapsed after starting an interaction. Fails if the supplied agent is not currently interacting with the component.
    Succeed<native><public>(Agent:agent)<transacts><decides>:void

    @experimental
    # Set the remaining shared cooldown duration in seconds, affecting all agents. An individual agent will be subject to the greater of the remaining shared cooldown duration or their remaining per agent cooldown duration.
    SetRemainingSharedCooldownDuration<native><final><public>(NewCooldownTime:float):void

    @experimental
    # Set the remaining per agent cooldown duration in seconds, for each agent supplied. The supplied agents will be subject to the greater of the remaining shared cooldown duration or their remaining per agent cooldown duration.
    SetRemainingPerAgentCooldownDuration<native><final><public>(Agents:[]agent, NewCooldownTime:float):void

    @experimental
    # Get the remaining shared cooldown duration. This returns the duration left in seconds, not specific to any Agent. Returns the same value when called multiple times within a transaction.
    GetRemainingSharedCooldownDuration<native><final><public>():float

    @experimental
    # Get the remaining per-agent cooldown duration, for the supplied agent. This returns the duration left in seconds, for that agent. Returns the same value when called multiple times within a transaction.
    GetRemainingPerAgentCooldownDuration<native><final><public>(Agent:agent):float

    # Get the remaining cooldown of the interactable for the supplied agent. This returns the duration left in seconds of either the shared or per agent cooldown, whichever is greater. Returns the same value when called multiple times within a transaction.
    GetRemainingCooldownDurationAffectingAgent<native><public>(Agent:agent):float

    # Sets the remaining duration, in seconds, to interact for an agent. Fails if the agent is not interacting with this component.
    SetRemainingInteractDuration<native><final><public>(Agent:agent, NewInteractDuration:float)<transacts><decides>:void

    # Returns the remaining duration, in seconds, to interact for an agent. Fails if the agent is not interacting with this component. Returns the same value when called multiple times within a transaction.
    GetRemainingInteractDuration<native><final><public>(InteractingAgent:agent)<transacts><decides>:float

    # Update the maximum number of successful interactions possible, a value of false is unlimited. If the current number of tracked interactions is greater than the value specified here, all current interactions will be canceled.
    SetMaxSuccessfulInteractions<native><final><public>(NewMaxSuccessfulInteractions:?int):void

    # Returns the max number of times this component can have a successful interaction, false is unlimited.
    GetMaxSuccessfulInteractions<native><final><public>():?int

    # Returns the number of times this component has had a successful interaction.
    GetSuccessfulIteractionCount<native><final><public>():int

    # Resets the counter for the times this component has had a successful interaction.
    ResetSuccessfulIteractionCount<native><final><public>():void