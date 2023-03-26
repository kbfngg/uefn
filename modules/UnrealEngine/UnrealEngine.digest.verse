# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-24.01-CL-24672685
#################################################

Temporary<public> := module:
    using {/Verse.org/Colors}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    # Module import path: /UnrealEngine.com/Temporary/UI
    UI<public> := module:
        # Verse interface to native `widget_class`.
        widget_class<native><public> := class<computes><final>:

        # Returns the `player_ui` component associated with `Player`.
        # Fails if there is no `player_ui` associated with `Player`.
        GetPlayerUI<native><public>(Player:player)<transacts><decides>:player_ui

        # The main interface for adding and removing `widget`s to a player's UI.
        player_ui<native><public> := class<final>:
            # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
            AddWidget<native><public>(Widget:widget):void

            # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
            AddWidget<native><public>(Widget:widget, Slot:player_ui_slot):void

            # Removes `Widget` from this `player_ui`.
            RemoveWidget<native><public>(Widget:widget):void

        # Base class for all UI elements drawn on the `player`'s screen.
        widget<native><public> := class<abstract><unique><epic_internal>:
            # Shows or hides the `widget` without removing itself from the containing `player_ui`.
            # See `widget_visibility` for details.
            SetVisibility<native><public>(InVisibility:widget_visibility):void

            # Returns the current `widget_visbility` state.
            GetVisibility<native><public>():widget_visibility

            # Enables or disables whether the `player` can interact with this `widget`.
            SetEnabled<native><public>(InIsEnabled:logic):void

            # `true` if this `widget` can be modified interactively by the player.
            IsEnabled<native><public>():logic

            # Returns the `widget`'s parent `widget`.
            # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
            GetParentWidget<native><public>()<transacts><decides>:widget

            # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
            # Fails if this `widget` is not in the `player_ui`.
            GetRootWidget<native><public>()<transacts><decides>:widget

        # `widget` creation configuration options.
        player_ui_slot<native><public> := struct:
            # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

            # Controls `widget` input event consumption.
            InputMode<native><public>:ui_input_mode = external {}

        # `widget` input consumption mode.
        ui_input_mode<native><public> := enum:
            # `widget` does not consume any input.
            None
            # `widget` consumes all inputs
            All

        # Parameters for `event`s signalled by a `widget`.
        widget_message<native><public> := struct:
            # The `player` that triggered the `event`.
            Player<native><public>:player

            # The `widget` that triggered the `event`.
            Source<native><public>:widget

        # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
        widget_visibility<native><public> := enum:
            # The `widget` is visible and occupies layout space.
            Visible
            # The `widget` is invisible and does not occupy layout space.
            Collapsed
            # The `widget` is invisible and occupies layout space.
            Hidden

        # Used by`widget` orientation modes.
        orientation<native><public> := enum:
            # Orient `widget`s from left to right.
            Horizontal
            # Orient `widget`s from top to bottom.
            Vertical

        # `widget` horizontal alignment mode.
        horizontal_alignment<native><public> := enum:
            # Center `widget` horizontally within the slot.
            Center
            # Align `widget` to the left of the slot.
            Left
            # Align `widget` to the right of the slot.
            Right
            # `widget` fills the slot horizontally.
            Fill

        # `widget` vertical alignment mode.
        vertical_alignment<native><public> := enum:
            # Center `widget` vertically within the slot.
            Center
            # Align `widget` to the top of the slot.
            Top
            # Align `widget` to the bottom of the slot.
            Bottom
            # `widget` fills the slot vertically.
            Fill

        # The anchors of a `widget` determine its the position and sizing relative to its parent.
        # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
        anchors<native><public> := struct:
            # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
            Minimum<native><public>:vector2 = external {}

            # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
            Maximum<native><public>:vector2 = external {}

        # Specifies the gap outside each edge separating a `widget` from its neighbors.
        # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
        margin<native><public> := struct:
            # The left edge spacing.
            Left<native><public>:float = external {}

            # The top edge spacing.
            Top<native><public>:float = external {}

            # The right edge spacing.
            Right<native><public>:float = external {}

            # The bottom edge spacing.
            Bottom<native><public>:float = external {}

        # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
        button<native><public> := class<final>(widget):
            # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
            Slot<native><public>:button_slot

            # Sets the child widget slot.
            SetWidget<native><public>(InSlot:button_slot):void

            # Subscribable event that fires when the button is clicked.
            OnClick<public>():listenable(widget_message) = external {}

        # Slot for button widget.
        button_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

        # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
        canvas<native><public> := class<final>(widget):
            # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]canvas_slot = external {}

            # Adds a new child slot to the canvas.
            AddWidget<native><public>(Slot:canvas_slot):void

            # Removes a slot containing the given widget.
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for a canvas widget.
        canvas_slot<native><public> := struct:
            # The border for the margin and how the widget is resized with its parent.
            # Values are defined between 0.0 and 1.0.
            Anchors<native><public>:anchors = external {}

            # The offset that defined the size and position of the widget.
            # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X,
            # the Offsets.Bottom represent the distance in pixel from the Anchors Maximun.Y, effectily controlling the desired
            # widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position
            # and Offsets.Right and Offset.Bottom represent the widget size.
            Offsets<native><public>:margin = external {}

            # When true we use the widget's desired size. The size calculated by the Offets is ignored.
            SizeToContent<native><public>:logic = external {}

            # Alignment is the pivot/origin point of the widget.
            # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
            Alignment<native><public>:vector2 = external {}

            # Z Order of this slot relative to other slots in this canvas panel.
            # Higher values are rendered last (and so they will appear to be on top)
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

        # Make a canvas slot for fixed position widget.
        # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
        # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
        # The widget is not anchored and will not move if the parent is resized.
        # The Anchors is set to zero.
        MakeCanvasSlot<native><public>(Widget:widget, Position:vector2, ?Size:vector2 = external {}, ?ZOrder:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}, ?Alignment:vector2 = external {})<computes>:canvas_slot

        # A solid color widget.
        color_block<native><public> := class<final>(widget):
            # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
            DefaultColor<native><public>:color = external {}

            # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
            DefaultOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # Sets the widget's color.
            SetColor<native><public>(InColor:color):void

            # Gets the widget's color.
            GetColor<native><public>():color

            # Sets the widgets's opacity.
            SetOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

            # Gets the widget's opacity.
            GetOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

        # Overlay is a container consisting of widgets stacked on top of each other.
        overlay<native><public> := class<final>(widget):
            # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]overlay_slot = external {}

            # Add a new child slot to the overlay. Slots are added at the end.
            AddWidget<native><public>(Slot:overlay_slot):void

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for an overlay widget
        overlay_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

        # Stack box is a container of a list of widgets stacked either vertically or horizontally.
        stack_box<native><public> := class<final>(widget):
            # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]stack_box_slot = external {}

            # The orientation of the stack box. Either stack widgets horizontal or vertical.
            Orientation<native><public>:orientation

            # Add a new child slot to the stack box. Slots are added at the end.
            AddWidget<native><public>(Slot:stack_box_slot):void

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

        # Slot for a stack_box widget
        stack_box_slot<native><public> := struct:
            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

            # The available space will be distributed proportionally.
            # If not set, the slot will use the desired size of the widget.
            Distribution<native><public>:?float = external {}

        # Text justification values:
        #   Left: Justify the text logically to the left.
        #   Center: Justify the text in the center.
        #   Right: Justify the text logically to the right.
        # The Left and Right value will flip when the local culture is right-to-left.
        text_justification<native><public> := enum:
            Left
            Center
            Right

        # Text overflow policy values:
        #   Clip: Overflowing text will be clipped.
        #   Ellipsis: Overflowing text will be replaced with an ellipsis.
        text_overflow_policy<native><public> := enum:
            Clip
            Ellipsis

        # Base widget for text widget.
        text_base<native><public> := class<abstract>(widget):
            # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
            DefaultText<native><localizes><public>:message = external {}

            # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
            DefaultTextColor<native><public>:color = external {}

            # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
            DefaultTextOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
            DefaultJustification<native><public>:text_justification = external {}

            # The policy that determine what happens when the text is longer than its allowed length.
            #  Used only during initialization of the widget and not modified by SetOverflowPolicy.
            DefaultOverflowPolicy<native><public>:text_overflow_policy = external {}

            # Sets the text displayed in the widget.
            SetText<native><public>(InText:message):void

            # Gets the text currently in the widget.
            GetText<native><public>():[]char

            # Sets the text justification in the widget.
            SetJustification<native><public>(InJustification:text_justification):void

            # Gets the text justificattion in the widget.
            GetJustification<native><public>():text_justification

            # Sets the policy that determine what happens when the text is longer than its allowed length.
            SetOverflowPolicy<native><public>(InOverflowPolicy:text_overflow_policy):void

            # Gets the policy that determine what happens when the text is longer than its allowed length.
            GetOverflowPolicy<native><public>():text_overflow_policy

            # Sets the color of the displayed text.
            SetTextColor<native><public>(InColor:color):void

            # Gets the color of the displayed text.
            GetTextColor<native><public>():color

            # Sets the opacity of the displayed text.
            SetTextOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

            # Gets the opacity of the displayed text.
            GetTextOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

    using {/Verse.org/Native}
    # Module import path: /UnrealEngine.com/Temporary/SpatialMath
    SpatialMath<public> := module:
        @editable
        @import_as("/Script/EpicGamesTemporary.FVerseRotation")
        rotation<native><public> := struct<concrete>:

        # Construct a rotation from axis and angle in radians. If 'axis' is 0, the rotation will always be the identity rotation. Angles use a left-handed sign convention (e.g., a positive rotation about +Z takes +X to +Y in a left-handed coordinate system)
        MakeRotation<native><public>(Axis:vector3, AngleRadians:float)<varies>:rotation

        # Construct a rotation from a yaw, a pitch, and a roll in degrees. These will be applied as intrinsic rotations in that order, meaning first we will apply a yaw about the Z axis with a positive angle indicating a clockwise rotation when viewed from above, then a pitch about the new Y axis with a positive angle indicating 'nose up', followed by a roll about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X. Note that these conventions are different from those used in the axis-angle constructor for rotation but they match those used by ApplyPitch/ApplyRoll/ApplyYaw.
        MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<varies>:rotation

        # Returns the identity rotation
        IdentityRotation<native><public>()<converges>:rotation

        # Returns a measure of the 'distance' between two rotations. The value will be in [0,1] with 0 representing equivalent rotations and 1 representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis)
        Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<varies>:float

        # Applies a rotation in radians around the local +Y axis using a right-handed sign convention.
        (InitialRotation:rotation).ApplyPitch<native><public>(PitchUpRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the local +X axis using a right-handed sign convention.
        (InitialRotation:rotation).ApplyRoll<native><public>(RollClockwiseRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the local +Z axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyYaw<native><public>(YawRightRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the world +X axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyWorldRotationX<native><public>(AngleRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the world +Y axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyWorldRotationY<native><public>(AngleRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the world +Z axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyWorldRotationZ<native><public>(AngleRadians:float)<transacts>:rotation

        # Applies a rotation in radians around the local +Y axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyLocalRotationY<public>(AngleRadians:float)<transacts>:rotation = external {}

        # Applies a rotation in radians around the local +Z axis using a left-handed sign convention.
        (InitialRotation:rotation).ApplyLocalRotationZ<public>(AngleRadians:float)<transacts>:rotation = external {}

        # Adds AdditionalRotation to InitialRotation such that the result logically applies InitialRotation followed by AdditionalRotation when transforming a vector.
        (InitialRotation:rotation).RotateBy<native><public>(AdditionalRotation:rotation)<transacts>:rotation

        # Subtracts RotationToRemove from InitialRotation such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
        (InitialRotation:rotation).UnrotateBy<native><public>(RotationToRemove:rotation)<transacts>:rotation

        # Returns an array of three elements, [Yaw, Pitch, Roll], such that if you call MakeRotationFromYawPitchRollDegrees(Result[0], Result[1], Result[2]) you will get an equivalent rotation to what was passed to GetYawPitchRollDegrees
        (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<varies>:[]float

        # Gets the natural axis of this rotation. If the rotation is nearly identity, this will return the vector <1, 0, 0>. See also GetAngle.
        (Rotation:rotation).GetAxis<native><public>()<varies>:vector3

        # Gets the angle in radians about the natural axis of this rotation. Use GetAxis to obtain the axis of this rotation.
        (Rotation:rotation).GetAngle<native><public>()<varies>:float

        # Creates and returns a rotation that represents the smallest angular rotation from InitialRotation to FinalRotation. I.e., InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation with MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle() being as small as possible. It is then possible to get the axis and the angle of this rotation via GetAxis() and GetAngle()
        MakeShortestRotationBetween<native><public>(InitialRotation:rotation, FinalRotation:rotation)<transacts>:rotation

        # Creates the smallest possible rotation between two vectors
        MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<transacts>:rotation

        # Spherical linear interpolation between InitialRotation and FinalRotation. Parameter must be on [0, 1]
        Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Parameter:float)<transacts><decides>:rotation

        # Rotate a vector by the provided rotation
        (Rotation:rotation).RotateVector<native><public>(Vector:vector3)<transacts>:vector3

        # Unrotate a vector by the provided rotation (i.e., rotate by Rotation's inverse)
        (Rotation:rotation).UnrotateVector<native><public>(Vector:vector3)<transacts>:vector3

        # Invert rotation such that ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation
        (Rotation:rotation).Invert<native><public>()<transacts>:rotation

        # Return Rotation if Rotation contains no NaNs or infinities.
        (Rotation:rotation).IsFinite<native><public>()<computes><decides>:rotation

        # Returns the local space forward direction in world space coordinates. This is equivalent to RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})
        (Rotation:rotation).GetLocalForward<public>()<transacts>:vector3 = external {}

        # Returns the local space right direction in world space coordinates. This is equivalent to RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})
        (Rotation:rotation).GetLocalRight<public>()<transacts>:vector3 = external {}

        # Returns the local space up direction in world space coordinates. This is equivalent to RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})
        (Rotation:rotation).GetLocalUp<public>()<transacts>:vector3 = external {}

        # Returns this rotation in axis angle form as a string in axis/angle format with the angle measured in degrees and with a left-handed sign convention. ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, Pi/2f)) produces the string "Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000" 
        ToString<native><public>(Rotation:rotation)<varies>:[]char

        # Convert degrees to radians
        DegreesToRadians<public>(Degrees:float)<varies>:float = external {}

        # Convert radians to degrees
        RadiansToDegrees<public>(Radians:float)<varies>:float = external {}

        # Represents a combination of scale, rotation, and translation applied in that order.
        transform<native><public> := struct<concrete><computes>:
            @editable
            # Represents the scale of this transform
            Scale<native><public>:vector3 = external {}

            @editable
            # Represents the rotation of this transform
            Rotation<native><public>:rotation = external {}

            @editable
            # Represents the location of this transform
            Translation<native><public>:vector3 = external {}

        # Given a vector and a transform, returns the vector transformed by the provided transform.
        TransformVector<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

        # Given a vector and a transform, returns the vector transformed by the provided transform without applying the scale transform.
        TransformVectorNoScale<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

        vector2<native><public> := struct<concrete><computes>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

        # Given a direction vector and a surface normal, returns the vector reflected across the surface normal. Produces a result like shining a laser at a mirror. Fails if surface normal or direction invalid
        ReflectVector<native><public>(Direction:vector2, SurfaceNormal:vector2)<varies><decides>:vector2

        # Returns the dot product of the two provided vectors
        DotProduct<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns the distance between the points represented by V1 and V2
        Distance<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns the squared distance between the points represented by V1 and V2
        DistanceSquared<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns a unit length vector representing the direction of this vector. Can fail if this vector is zero length or otherwise invalid
        (V:vector2).MakeUnitVector<native><public>()<varies><decides>:vector2

        # Returns the length of this vector
        (V:vector2).Length<public>()<varies>:float = external {}

        # Returns the squared length of this vector
        (V:vector2).LengthSquared<public>()<varies>:float = external {}

        # Performs a linear interpolation between 'From' and 'To' by Parameter. I.e., Result = From + (To - From) * Parameter. Returns From if Parameter=0 and To if Parameter=1. The result is not clamped to [From, To].
        Lerp<public>(From:vector2, To:vector2, Parameter:float)<varies>:vector2 = external {}

        # Returns a string formatted version of the vector and its components
        ToString<native><public>(V:vector2)<varies>:[]char

        # Vector negation operator
        prefix'-'<public>(Operand:vector2)<computes>:vector2 = external {}

        # Vector addition operator
        operator'+'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Vector subtraction operator
        operator'-'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Scaling operator. Multiplies the components of Left by the scalar value Right
        operator'*'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Scaling operator. Multiplies the components of Right by the scalar value Left
        operator'*'<public>(Left:float, Right:vector2)<computes>:vector2 = external {}

        # Scaling operator. Divides the components of Left by the scalar value Right.
        operator'/'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Converts the integer-based vector2i provided to a float-based Vector2 representation
        ToVector2<public>(V:vector2i)<transacts>:vector2 = external {}

        # Returns V if all the components of V are finite.
        (V:vector2).IsFinite<public>()<computes><decides>:vector2 = external {}

        # Succeeds if each member of vector V is within AbsoluteTolerance of zero. Fails otherwise.
        (V:vector2).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Succeeds if each member of vector V1 and V2 are within AbsoluteTolerance of each other. Fails otherwise.
        IsAlmostEqual<public>(V1:vector2, V2:vector2, AbsoluteTolerance:float)<computes><decides>:void = external {}

        vector2i<native><public> := struct<concrete><computes>:
            @editable
            X<native><public>:int = external {}

            @editable
            Y<native><public>:int = external {}

        # Returns the dot product of the two provided vectors
        DotProduct<public>(V1:vector2i, V2:vector2i)<computes>:int = external {}

        # Returns true if the two vectors are considered equal in direction and magnitude
        Equals<public>(V1:vector2i, V2:vector2i)<computes><decides>:vector2i = external {}

        # Returns a string formatted version of the vector and its components
        ToString<native><public>(V:vector2i)<computes>:[]char

        # Converts the float based vector2 provided to an int based Vector2i representation by component-wise truncation
        ToVector2i<public>(V:vector2)<varies><decides>:vector2i = external {}

        # Negate components of Operand
        prefix'-'<public>(Operand:vector2i)<computes>:vector2i = external {}

        # Vector sum operator
        operator'+'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Vector subtraction operator
        operator'-'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Scaling operator. Multiplies the components of Left by the integer value Right.
        operator'*'<public>(Left:vector2i, Right:int)<computes>:vector2i = external {}

        # Scaling operator. Multiplies the components of Right by the integer value Left.
        operator'*'<public>(Left:int, Right:vector2i)<computes>:vector2i = external {}

        vector3<native><public> := struct<concrete><computes>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

            @editable
            Z<native><public>:float = external {}

        # Given a direction vector and a surface normal, returns the vector reflected across the surface normal. Produces a result like shining a laser at a mirror. Fails if surface normal or direction invalid
        ReflectVector<native><public>(Direction:vector3, SurfaceNormal:vector3)<varies><decides>:vector3

        # Returns the dot product of the two provided vectors
        DotProduct<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the cross product of the two provided vectors
        CrossProduct<native><public>(V1:vector3, V2:vector3)<varies>:vector3

        # Returns the distance between the points represented by V1 and V2
        Distance<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the squared distance between the points represented by V1 and V2
        DistanceSquared<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the Euclidean distance between two points in the XY plane (ignoring Z)
        DistanceXY<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the squared Euclidean distance between two points in the XY plane (ignoring Z)
        DistanceSquaredXY<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns a unit length vector representing the direction of this vector. Can fail if this vector is zero length or otherwise invalid
        (V:vector3).MakeUnitVector<native><public>()<varies><decides>:vector3

        # Returns a string formatted version of the vector and its components
        ToString<native><public>(V:vector3)<varies>:[]char

        # Returns the length of this vector
        (V:vector3).Length<public>()<varies>:float = external {}

        # Returns the squared length of this vector
        (V:vector3).LengthSquared<public>()<computes>:float = external {}

        # Returns the magnitude of this vector as projected on the XY plane.
        (V:vector3).LengthXY<public>()<varies>:float = external {}

        # Returns the squared length of this vector as projected on the XY plane.
        (V:vector3).LengthSquaredXY<public>()<varies>:float = external {}

        # Performs a linear interpolation between 'From' and 'To' by Parameter. I.e., Result = From + (To - From) * Parameter. Returns From if Parameter=0 and To if Parameter=1. The result is not clamped to [From, To].
        Lerp<public>(From:vector3, To:vector3, Parameter:float)<varies>:vector3 = external {}

        # Vector negation operator
        prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

        # Vector addition operator.
        operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Vector subtraction operator.
        operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Component-wise multiplication operator.
        operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Scaling operator. Multiplies the components of Left by the scalar value Right
        operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

        # Scaling operator. Multiplies the components of Right by the scalar value Left
        operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

        # Operator to allow the components of a vector to be divided by a fixed scalar
        operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

        # Returns V if all the components of V are finite.
        (V:vector3).IsFinite<public>()<computes><decides>:vector3 = external {}

        # Succeeds if each member of vector V is within AbsoluteTolerance of zero. Fails otherwise.
        (V:vector3).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Succeeds if each member of vector V1 and V2 are within AbsoluteTolerance of each other. Fails otherwise.
        IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Module import path: /UnrealEngine.com/Temporary/Diagnostics
    Diagnostics<public> := module:
        # log levels available for various log commands
        log_level<native><public> := enum:
            Debug
            Verbose
            Normal
            Warning
            Error

        # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
        log_channel<native><public> := class<abstract>:

        # log class to send messages to the default log
        log<native><public> := class:
            # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
            Channel<native><public>:subtype(log_channel)

            # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
            DefaultLevel<native><public>:log_level = external {}

            # Print message using the given log level
            (log:)Print<native><public>(Message:[]char, ?Level:log_level = external {})<computes>:void

            # Prints current script call stack using the give log level
            PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

    # Module import path: /UnrealEngine.com/Temporary/Curves
    Curves<public> := module:
        editable_curve<native><public> := class<final>:
            # Evaluates this float curve at the specified time and returns the result as a float
            Evaluate<native><public>(Time:float):float


