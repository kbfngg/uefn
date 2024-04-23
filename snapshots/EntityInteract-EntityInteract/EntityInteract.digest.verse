using {/Verse.org/Simulation}
# Used to handle general interaction.
interact_component<native><epic_internal> := class(component, enableable):
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    InteractFinishedEvent<native><public>:listenable(agent) = external {}

    @editable
    var InteractDistance<native><public>:float = external {}

    @editable
    var InteractTime<native><public>:float = external {}

    @editable
    var TimesCanTrigger<native><public>:float = external {}

    SuccessfullyInteract<native><public>():void

    # The text to display to the user. Used only during initialization of the component and not modified by SetText.
    DefaultInteractText<localizes><native><public>:message = external {}

    # Sets the interact text.
    SetInteractText<native><public>(InText:message):void

    # Gets the interact text.
    GetInteractText<native><public>():string