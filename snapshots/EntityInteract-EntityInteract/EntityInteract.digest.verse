using {/Verse.org/Simulation}
@experimental
# Used to handle general interaction.
interact_component<native><epic_internal> := class(component, enableable):
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Enable this object.
    Enable<native><override>():void

    @experimental
    # Disable this object.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    InteractFinishedEvent<native><public>:listenable(agent) = external {}

    @editable
    @experimental
    var InteractDistance<native><public>:float = external {}

    @editable
    @experimental
    var InteractTime<native><public>:float = external {}

    @editable
    var CoolDownTime<native><public>:float = external {}

    @editable
    @experimental
    var TimesCanTrigger<native><public>:?int = external {}

    @experimental
    SuccessfullyInteract<native><public>():void

    @experimental
    # The text to display to the user. Used only during initialization of the component and not modified by SetText.
    DefaultInteractText<localizes><native><public>:message = external {}

    @experimental
    # Sets the interact text.
    SetInteractText<native><public>(InText:message):void

    @experimental
    # Gets the interact text.
    GetInteractText<native><public>():string

    # The text to display to the user. Used only during initialization of the component and not modified by SetText.
    DefaultCoolDownText<localizes><native><public>:message = external {}

    # Sets the CoolDown text.
    SetCoolDownText<native><public>(InText:message):void

    # Gets the CoolDown text.
    GetCoolDownText<native><public>():string

    # The text to display to the user. Used only during initialization of the component and not modified by SetText.
    DefaultDisabledText<localizes><native><public>:message = external {}

    # Sets the Disabled text.
    SetDisabledText<native><public>(InText:message):void

    # Gets the Disabled text.
    GetDisabledText<native><public>():string