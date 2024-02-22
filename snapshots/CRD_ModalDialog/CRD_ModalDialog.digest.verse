using {/Verse.org/Simulation}
# Used to create HUD text boxes that give players information, and allows responses to be customized to player choices.
popup_dialog_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when *Button <Index>* on this device is pushed by an `agent`.
    # Sends the `agent` that pushed the button.
    # Sends the `int` index of the button that was clicked.
    RespondingButtonEvent<public>:listenable(tuple(agent, int)) = external {}

    # Signaled when this device is shown to an `agent`.
    # Sends the `agent` looking at the popup.
    ShownEvent<public>:listenable(agent) = external {}

    # Signaled when this device is dismissed by an `agent`.
    # Sends the `agent` who dismissed the popup.
    DismissedEvent<public>:listenable(agent) = external {}

    # Signaled when this device times out while an `agent` is looking at it.
    # Sends the `agent` who was looking at the popup.
    TimeOutEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Shows the popup to `Agent`.
    Show<public>(Agent:agent):void = external {}

    # Shows the popup to all `agent`s in the experience.
    Show<public>():void = external {}

    # Hides the popup from `Agent`.
    Hide<public>(Agent:agent):void = external {}

    # Hides the popup from all `agent`s in the experience.
    Hide<public>():void = external {}

    # Sets the number of buttons this popup has.
    # Button Count is not updated on active Popups.
    SetButtonCount<public>(Count:int):void = external {}

    # Returns the *Button Text* for this popup at a specified index.
    GetButtonText<public>(Index:int)<transacts>:[]char = external {}

    # Sets the *Button Text* for a button at a specific index on this popup.
    #  * `Text` should be no more than `24` characters.
    #  * If `Text` is empty the button will show *OK* instead.
    #  * Button 1 uses `Index` 0.
    SetButtonText<public>(Text:message, Index:int):void = external {}

    # Sets the Button Text for a button at a specific index on this popup.
    #  * `Text` should be no more than `24` characters.
    #  * If `Text` is empty the button will show *OK* instead.
    #  * Button 1 uses `Index` 0. If set, `UpdateCount` will also update the number of buttons
    # if you are setting a button that isn't currently showing.
    SetButtonText<epic_internal>(Text:message, Index:int, UpdateCount:logic):void = external {}

    # Sets all *Button Text* based on the contents of an array of messages and alters the button count based on the size of the array.
    # Button count is not updated on active Popups.
    # `Text` should be no more than `24` characters.
    SetAllButtons<epic_internal>(Text:[]message):void = external {}

    # Sets the *Description* text for this popup. `Text` should be no more than `350` characters.
    SetDescriptionText<public>(Text:message):void = external {}

    # Returns the *Description* text for this popup.
    GetDescriptionText<public>()<transacts>:[]char = external {}

    # Sets the *Title* text for this popup. `Text` should be no more than `32` characters.
    SetTitleText<public>(Text:message):void = external {}

    # Returns the *Title* text for this popup.
    GetTitleText<public>()<transacts>:[]char = external {}

    # Sets the *Title*, *Description* and *Buttons* for this popup then displays a message for a specific user.
    SetAndShow<epic_internal>(Title:message, Description:message, ButtonsText:[]message, Agent:agent):void = external {}

    # Sets the *Title*, *Description* and *Buttons* for this popup then displays a message for all users.
    SetAndShow<epic_internal>(Title:message, Description:message, ButtonsText:[]message):void = external {}