using {/Verse.org/VerseEngine/Component}
# Module import path: /UnrealEngine.com/EpicGames
EpicGames<public> := module:
    # Module import path: /UnrealEngine.com/EpicGames/Input
    Input<public> := module:
        # Enumerated list of available input 'key' bindings
        verse_key<native><public> := enum:
            Gamepad_FaceButton_Top
            Gamepad_FaceButton_Bottom
            Gamepad_FaceButton_Left
            Gamepad_FaceButton_Right
            Gamepad_LeftShoulder
            Gamepad_RightShoulder
            Gamepad_LeftTrigger
            Gamepad_RightTrigger
            Gamepad_DPad_Up
            Gamepad_DPad_Down
            Gamepad_DPad_Left
            Gamepad_DPad_Right
            Gamepad_LeftX
            Gamepad_LeftY
            Gamepad_RightX
            Gamepad_RightY
            Gamepad_LeftTriggerAxis
            Gamepad_RightTriggerAxis
            Mouse_X
            Mouse_Y
            Mouse_WheelAxis
            Mouse_LeftButton
            Mouse_RightButton
            Mouse_MiddleButton
            Mouse_ThumbButton
            Mouse_ThumbButton2
            Mouse_ScrollUp
            Mouse_ScrollDown
            Keyboard_Up
            Keyboard_Down
            Keyboard_Left
            Keyboard_Right
            Keyboard_Enter
            Keyboard_Multiply
            Keyboard_Divide
            Keyboard_Add
            Keyboard_Subtract
            Keyboard_Decimal
            Keyboard_SpaceBar
            Keyboard_LeftShift
            Keyboard_RightShift
            Keyboard_LeftControl
            Keyboard_RightControl
            Keyboard_LeftAlt
            Keyboard_RightAlt
            NumPad_Zero
            NumPad_One
            NumPad_Two
            NumPad_Three
            NumPad_Four
            NumPad_Five
            NumPad_Six
            NumPad_Seven
            NumPad_Eight
            NumPad_Nine
            E
            I
            J
            K
            L
            Z
            TAB
            Zero
            One
            Two
            Three
            Four
            Five
            Six
            Seven
            Eight
            Nine

        # Represents a type of event that can occur involving a verse_key
        input_event<native><public> := enum:
            Pressed
            Released

        # Represents a type of event that can occur involving a verse_key
        verse_ue_input_component<native><public> := class<final>(component):
            # Requests that the input component register an action mapping to the provided keys, with a description string provided for debugging/tracking
            AddActionMapping<native><public>(ActionName:[]char, Description:[]char, Keys:[]verse_key):void

            # Requests that the input component adds a callback bound to whenever the action specified by ActionName occurs, in the manner specified by InputEvent e.g. press/release
            AddActionBinding<native><public>(ActionName:[]char, InputEvent:input_event, Callback:type {__():void}):void

            # Requests that the input component register an axis mapping to the provided keys, with a description string provided for debugging/tracking
            AddAxisMapping<native><public>(ActionName:[]char, Description:[]char, Keys:[]verse_key, Scale:?float):void

            # Requests that the input component adds a callback bound to whenever the Axis specified by AxisName changes value. The callback will be provided the current Axis value
            AddAxisBinding<native><public>(AxisName:[]char, Callback:?type {__(:float):void}):void

            # Removes a previously added action mapping. Requires the Action name the action was added with
            RemoveActionMapping<native><public>(ActionName:[]char):void

            # Removes a previously added action mapping and associated callback binding. Requires the Action name the action was added with
            RemoveActionBinding<native><public>(ActionName:[]char, InputEvent:input_event):void

            # Removes a previously added axis mapping. Requires the Action name the action was added with
            RemoveAxisBinding<native><public>(AxisName:[]char):void

            # Clears all previously registered action mappings for the provided input component
            ClearActionMappings<native><public>():void

            # Clears all previously registered axis mappings for the provided input component
            ClearAxisMappings<native><public>():void

            # Clears all input bindings for the provided input component. This is the equivalent of clearing all action + axis mappings, and all bindings
            ClearInputBindings<native><public>():void

            # Returns the current value associated with the specified AxisName. 0.0f if not currently being manipulated
            GetAxisValue<native><public>(AxisName:[]char):float

            # Async function which continues execution when the associated ActionName occurs, and in the manner specified by InputEvent e.g. press/release
            WaitForAction<native><public>(InputComponent:verse_ue_input_component, ActionName:[]char, InputEvent:input_event)<suspends>:void

            # Utility wrapper which both binds the specified Actionname to the keys + input event specified, and also registers an associated callback
            AddActionMappingAndBinding<public>(ActionName:[]char, Description:[]char, Keys:[]verse_key, InputEvent:input_event, Callback:type {__():void}):void = external {}

            # Utility wrapper which both removes the specified Actionname and associated callback
            RemoveActionMappingAndBinding<public>(ActionName:[]char, InputEvent:input_event):void = external {}

            # Utility wrapper which both binds the specified Actionname to the Axis specified, and also registers an associated callback
            AddAxisMappingAndBinding<public>(AxisName:[]char, Description:[]char, Keys:[]verse_key, Scale:?float, Callback:?type {__(:float):void}):void = external {}

            # Utility wrapper which Clears action mappings, axis mappings, and input bindings
            ClearInputMappingsAndBindings<public>():void = external {}