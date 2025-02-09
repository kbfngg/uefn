# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-32.00-CL-37505882
#################################################

AINavigation<public> := module {
  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /Verse.org/Simulation }
  @experimental
  ai_navigation_relevant_component<native><public> := class(component) {
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>(): logic = external {}

    # Notification called then the component owner entity was added to the scene
    OnAddedToScene<native><override>(): void

    # The component is being initialized, called when it is added to an entity
    OnInitialized<native><override>(): void

    # Notification called when the component owner entity is about to be removed from the scene
    OnRemovingFromScene<native><override>(): void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnUninitializing<native><override>(): void

    @editable
    @experimental
    # If set, navigation data will not be generated under the surface of the geometry
    var FillCollisionUnderneathForNavData<native><epic_internal>: logic = external {}
  }
}

Abilities<public> := module {
  using { /UnrealEngine.com/Temporary/SceneGraph }
  ability<native><public> := class {
    Activate<native><protected>()<suspends>: void

    GameplayAbilityPath<native><epic_internal>: ?string = external {}
  }

  @experimental
  ability_component<native><public> := class(component) {
    ActivateAbility<native><epic_internal>(Ability: ability): void

    ActivateAbility<native><public>(Ability: subtype(ability)): void

    GiveAbility<native><epic_internal>(Ability: ability)<transacts><decides>: void

    GiveAbility<native><public>(Ability: subtype(ability))<transacts><decides>: void
  }

  @attribscope_data
  @customattribhandler
  ability_link<epic_internal> := class<computes>(attribute) {
    Name<epic_internal>: string = external {}
  }
}

using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Assets }
# Module import path: /UnrealEngine.com/Assets
Assets<public> := module {
  PlaySound<native><epic_internal>(Asset: sound, ?StartDelay: float = external {})<transacts>: cancelable

  PlaySoundAtLocation<native><epic_internal>(
    Asset: sound,
    Position: vector3,
    ?Rotation: rotation = external {},
    ?StartDelay: float = external {}
  )<transacts>: cancelable

  SpawnParticleSystem<native><public>(
    Asset: particle_system,
    Position: vector3,
    ?Rotation: rotation = external {},
    ?StartDelay: float = external {}
  )<transacts>: cancelable

  play_sound_subscription<native><epic_internal> := class(cancelable) {
    Cancel<native><override>()<transacts>: void
  }

  spawn_particle_system_subscription<native><epic_internal> := class(cancelable) {
    Cancel<native><override>()<transacts>: void
  }
}

Engine<public> := module {
  using { /UnrealEngine.com/Temporary/Curves }
  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Assets }
  using { /Verse.org/Simulation }
  using { /Verse.org/VerseEngine/Component }
  # Module import path: /UnrealEngine.com/Engine/VerseMovement
  VerseMovement<public> := module {
    GetPlayerMoveComponent<native><epic_internal>(Player: player_component)<transacts><decides>: movement_component

    # Module import path: /UnrealEngine.com/Engine/VerseMovement/VerseMovementUtil
    VerseMovementUtil<public> := module {
      CarConfig<public>: move_config = external {}
    }

    move_config<native><public> := struct<computes> {
      Entries<native><public>: []move_config_entry = external {}
    }

    move_config_asset<native><public> := class(asset) {}

    move_config_entry<native><public> := struct<computes> {
      Name<native><public>: string = external {}

      Responses<native><public>: []move_response = external {}

      Triggers<native><public>: []move_trigger = external {}
    }

    move_input_trigger_params<native><public> := struct<computes> {
      AccumulateAxisInput<native><public>: logic = external {}

      AxisToMagnitudeCurve<native><public>: ?editable_curve = external {}

      ClampAxis<native><public>: vector2 = external {}

      IsAxis<native><public>: logic = external {}

      Name<native><public>: string = external {}
    }

    move_physics_trigger_params<native><public> := struct<computes> {
      SpeedInDirection<native><public>: vector3 = external {}
    }

    move_response<native><public> := struct<computes> {
      ClampFrame<native><public>: move_response_frame = external {}

      ClampVector<native><public>: vector3 = external {}

      Effect<native><public>: move_response_effect = external {}

      Frame<native><public>: move_response_frame = external {}

      Magnitude<native><public>: float = external {}

      MagnitudeCurve<native><public>: ?editable_curve = external {}

      Modifier<native><public>: move_response_modifier = external {}

      Type<native><public>: move_response_type = external {}

      Vector<native><public>: vector3 = external {}
    }

    move_response_effect<native><public> := enum {
      Force

      Transform

      VelocityChange

      move_response_effect_MAX
    }

    move_response_frame<native><public> := enum {
      Absolute

      move_response_frame_Camera

      move_response_frame_MAX

      move_response_frame_Object
    }

    move_response_modifier<native><public> := enum {
      OverrideTransform

      OverrideVelocity

      TargetTransform

      TargetVelocity

      move_response_modifier_Add

      move_response_modifier_MAX
    }

    move_response_type<native><public> := enum {
      Angular

      Linear

      move_response_type_MAX
    }

    move_trace_trigger_params<native><public> := struct<computes> {
      Direction<native><public>: vector3 = external {}

      Frame<native><public>: move_response_frame = external {}

      HitDistanceToMagnitudeCurve<native><public>: ?editable_curve = external {}

      ProportionalToHitDistance<native><public>: logic = external {}

      TraceLength<native><public>: float = external {}
    }

    move_trigger<native><public> := struct<computes> {
      InputParams<native><public>: move_input_trigger_params = external {}

      PhysicsParams<native><public>: move_physics_trigger_params = external {}

      TraceParams<native><public>: move_trace_trigger_params = external {}

      Type<native><public>: move_trigger_type = external {}
    }

    move_trigger_type<native><public> := enum {
      Constant

      Constraint

      Input

      Physics

      Trace

      move_trigger_type_MAX
    }

    movement_component<native><epic_internal> := class<unique>(vk_component) {
      AddAngularImpulse<native><public>(Impulse: vector3): void

      AddImpulse<native><public>(Impulse: vector3): void

      DisableInput<native><public>(ThePlayer: player_component): void

      EnableInput<native><public>(ThePlayer: player_component): void

      SetConfig<native><public>(Config: move_config): void

      SetConfig<native><public>(Config: move_config_asset): void

      SetEnabled<native><public>(Enabled: logic): void

      SetPosition<native><public>(Position: vector3): void

      SetRotation<native><public>(Rotation: rotation): void

      SetVelocity<native><public>(Velocity: vector3): void
    }
  }
}

# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module {
  @hide_in_editor
  @experimental
  lambda_test_component<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}

    OnAddedToScene<native><override>(): void

    OnBeginSimulation<native><override>(): void

    OnEndSimulation<native><override>(): void

    OnInitialized<native><override>(): void

    OnRemovingFromScene<native><override>(): void

    OnSimulate<override>()<suspends>: void = external {}

    OnUninitializing<native><override>(): void
  }

  @hide_in_editor
  @experimental
  lambda_test_component_2<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}

    OnAddedToScene<native><override>(): void

    OnBeginSimulation<native><override>(): void

    OnEndSimulation<native><override>(): void

    OnInitialized<native><override>(): void

    OnRemovingFromScene<native><override>(): void

    OnSimulate<override>()<suspends>: void = external {}

    OnUninitializing<native><override>(): void
  }

  @hide_in_editor
  @experimental
  test_component<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}
  }
}

using { /Verse.org/VerseEngine/Component }
# Module import path: /UnrealEngine.com/EpicGames
EpicGames<public> := module {
  # Module import path: /UnrealEngine.com/EpicGames/Input
  Input<public> := module {
    # Represents a type of event that can occur involving a verse_key
    input_event<native><public> := enum {
      Pressed

      Released
    }

    # Enumerated list of available input 'key' bindings
    verse_key<native><public> := enum {
      E

      Eight

      Five

      Four

      Gamepad_DPad_Down

      Gamepad_DPad_Left

      Gamepad_DPad_Right

      Gamepad_DPad_Up

      Gamepad_FaceButton_Bottom

      Gamepad_FaceButton_Left

      Gamepad_FaceButton_Right

      Gamepad_FaceButton_Top

      Gamepad_LeftShoulder

      Gamepad_LeftTrigger

      Gamepad_LeftTriggerAxis

      Gamepad_LeftX

      Gamepad_LeftY

      Gamepad_RightShoulder

      Gamepad_RightTrigger

      Gamepad_RightTriggerAxis

      Gamepad_RightX

      Gamepad_RightY

      I

      J

      K

      Keyboard_Add

      Keyboard_Decimal

      Keyboard_Divide

      Keyboard_Down

      Keyboard_Enter

      Keyboard_Left

      Keyboard_LeftAlt

      Keyboard_LeftControl

      Keyboard_LeftShift

      Keyboard_Multiply

      Keyboard_Right

      Keyboard_RightAlt

      Keyboard_RightControl

      Keyboard_RightShift

      Keyboard_SpaceBar

      Keyboard_Subtract

      Keyboard_Up

      L

      Mouse_LeftButton

      Mouse_MiddleButton

      Mouse_RightButton

      Mouse_ScrollDown

      Mouse_ScrollUp

      Mouse_ThumbButton

      Mouse_ThumbButton2

      Mouse_WheelAxis

      Mouse_X

      Mouse_Y

      Nine

      NumPad_Eight

      NumPad_Five

      NumPad_Four

      NumPad_Nine

      NumPad_One

      NumPad_Seven

      NumPad_Six

      NumPad_Three

      NumPad_Two

      NumPad_Zero

      One

      Seven

      Six

      TAB

      Three

      Two

      Z

      Zero
    }

    # Represents a type of event that can occur involving a verse_key
    verse_ue_input_component<native><public> := class<final>(vk_component) {
      # Requests that the input vk_component adds a callback bound to whenever the action specified by ActionName occurs, in the manner specified by InputEvent e.g. press/release
      AddActionBinding<native><public>(ActionName: string, InputEvent: input_event, Callback: type { __(): void }): void

      # Requests that the input vk_component register an action mapping to the provided keys, with a description string provided for debugging/tracking
      AddActionMapping<native><public>(ActionName: string, Description: string, Keys: []verse_key): void

      # Utility wrapper which both binds the specified Actionname to the keys + input event specified, and also registers an associated callback
      AddActionMappingAndBinding<public>(ActionName: string, Description: string, Keys: []verse_key, InputEvent: input_event, Callback: type { __(): void }): void = external {}

      # Requests that the input vk_component adds a callback bound to whenever the Axis specified by AxisName changes value. The callback will be provided the current Axis value
      AddAxisBinding<native><public>(AxisName: string, Callback: ?type { __(: float): void }): void

      # Requests that the input vk_component register an axis mapping to the provided keys, with a description string provided for debugging/tracking
      AddAxisMapping<native><public>(ActionName: string, Description: string, Keys: []verse_key, Scale: ?float): void

      # Utility wrapper which both binds the specified Actionname to the Axis specified, and also registers an associated callback
      AddAxisMappingAndBinding<public>(AxisName: string, Description: string, Keys: []verse_key, Scale: ?float, Callback: ?type { __(: float): void }): void = external {}

      # Clears all previously registered action mappings for the provided input vk_component
      ClearActionMappings<native><public>(): void

      # Clears all previously registered axis mappings for the provided input vk_component
      ClearAxisMappings<native><public>(): void

      # Clears all input bindings for the provided input vk_component. This is the equivalent of clearing all action + axis mappings, and all bindings
      ClearInputBindings<native><public>(): void

      # Utility wrapper which Clears action mappings, axis mappings, and input bindings
      ClearInputMappingsAndBindings<public>(): void = external {}

      # Returns the current value associated with the specified AxisName. 0.0f if not currently being manipulated
      GetAxisValue<native><public>(AxisName: string): float

      # Removes a previously added action mapping and associated callback binding. Requires the Action name the action was added with
      RemoveActionBinding<native><public>(ActionName: string, InputEvent: input_event): void

      # Removes a previously added action mapping. Requires the Action name the action was added with
      RemoveActionMapping<native><public>(ActionName: string): void

      # Utility wrapper which both removes the specified Actionname and associated callback
      RemoveActionMappingAndBinding<public>(ActionName: string, InputEvent: input_event): void = external {}

      # Removes a previously added axis mapping. Requires the Action name the action was added with
      RemoveAxisBinding<native><public>(AxisName: string): void

      # Async function which continues execution when the associated ActionName occurs, and in the manner specified by InputEvent e.g. press/release
      WaitForAction<native><public>(
        InputComponent: verse_ue_input_component,
        ActionName: string,
        InputEvent: input_event
      )<suspends>: void
    }
  }
}

# Module import path: /UnrealEngine.com/EpicGamesRestricted
EpicGamesRestricted<public> := module {
  # Module import path: /UnrealEngine.com/EpicGamesRestricted/Network
  Network<public> := module {
    replicated<constructor><epic_internal>(ReplicationArgs: string)<computes>: replicated_attribute = external {}

    @attribscope_data
    @customattribhandler
    replicated_attribute<epic_internal> := class<computes><internal>(attribute) {}
  }
}

# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module {
  @hide_in_editor
  @experimental
  playspace_association_component<native><epic_internal> := class<epic_internal>(component) {
    IsAllowedOnClient<override>(): logic = external {}
  }
}

Temporary<public> := module {
  using { /UnrealEngine.com/Temporary/Diagnostics }
  # Module import path: /UnrealEngine.com/Temporary/Curves
  Curves<public> := module {
    editable_curve<native><public> := class<final><concrete> {
      # Evaluates this float curve at the specified time and returns the result as a float
      Evaluate<native><public>(Time: float): float
    }
  }

  # Module import path: /UnrealEngine.com/Temporary/Diagnostics
  Diagnostics<public> := module {
    # debug draw class to draw debug shapes on screen.
    debug_draw<native><public> := class {
      # Channel will be used to clear specific debug draw.
      Channel<native><public>: subtype(debug_draw_channel) = external {}

      # Clears all debug draw from this debug_draw instance.
      Clear<native><public>()<transacts>: void

      # Clears all debug draw for the channel.
      ClearChannel<native><public>()<transacts>: void

      # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
      DrawArrow<native><public>(
        Start: vector3,
        End: vector3,
        ?ArrowSize: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a box at the named location, and using the provided draw parameters
      DrawBox<native><public>(
        Center: vector3,
        Rotation: rotation,
        ?Extent: vector3 = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a capsule at the named location, and using the provided draw parameters.
      DrawCapsule<native><public>(
        Center: vector3,
        Rotation: rotation,
        ?Height: float = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cone at the named location, and using the provided draw parameters.
      DrawCone<native><public>(
        Origin: vector3,
        Direction: vector3,
        ?Height: float = external {},
        ?NumSides: int = external {},
        ?AngleWidthRadians: float = external {},
        ?AngleHeightRadians: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cylinder at the named location, and using the provided draw parameters.
      DrawCylinder<native><public>(
        Start: vector3,
        End: vector3,
        ?NumSegments: int = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a line from Start to End locations, and using the provided draw parameters.
      DrawLine<native><public>(
        Start: vector3,
        End: vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a point at the named location, and using the provided draw parameters.
      DrawPoint<native><public>(
        Position: vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a sphere at the named location, and using the provided draw parameters.
      DrawSphere<native><public>(
        Center: vector3,
        ?Radius: float = external {},
        ?Color: color = external {},
        ?NumSegments: int = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Hide Debug Draw for the channel for all users.
      HideChannel<native><public>()<transacts>: void

      # Show Debug Draw for the channel for all users.
      ShowChannel<native><public>()<transacts>: void
    }

    # debug_draw_channel is the base class used to define debug draw channels.
    debug_draw_channel<native><public> := class<abstract> {}

    # Enumerated presets for policies describing a desired draw duration.
    debug_draw_duration_policy<native><public> := enum {
      FiniteDuration

      Persistent

      SingleFrame
    }

    # log class to send messages to the default log
    log<native><public> := class {
      # Print message using the given log level
      (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<native><public>(
        Message: string,
        ?Level: log_level = external {}
      )<computes>: void

      # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
      Channel<native><public>: subtype(log_channel)

      # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
      DefaultLevel<native><public>: log_level = external {}

      # Prints current script call stack using the give log level
      PrintCallStack<native><public>(?Level: log_level = external {})<computes>: void
    }

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract> {}

    # log levels available for various log commands
    log_level<native><public> := enum {
      Debug

      Error

      Normal

      Verbose

      Warning
    }
  }

  SceneGraph<public> := module {
    @experimental
    (Entity: entity).GetPhysicsScene<epic_internal>()<transacts><decides>: physics_scene_component = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all components attached to entities below and including `InEntity` of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindComponents<native><public>(ComponentType: subtype(component))<transacts>: generator(ComponentType)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` of type `EntityType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntities<native><public>(EntityType: subtype(entity))<transacts>: generator(EntityType)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` whose `collision_component` shape is inside `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesInside<native><epic_internal>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` whose `transform_component.Translation` is inside `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesOriginInside<native><public>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` whose `collision_component` shape overlaps with `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesOverlapping<native><public>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` containing a component of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesWithComponent<native><public>(ComponentType: subtype(component))<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all entities below and including `InEntity` with `Tag` present in their `tag_component`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesWithTag<native><public>(Tag: tag)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all components attached to parent entities above `InEntity` of type `ComponentType`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentComponents<native><public>(ComponentType: subtype(component))<transacts>: generator(ComponentType)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` of type `EntityType`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntities<native><public>(EntityType: subtype(entity))<transacts>: generator(EntityType)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` whose `collision_component` shape is inside `Shape`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesInside<native><epic_internal>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` whose `transform_component.Translation` is inside `Shape`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesOriginInside<native><public>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` whose `collision_component` shape overlaps with `Shape`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesOverlapping<native><public>(Shape: convex_volume3)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` containing a component of type `ComponentType`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesWithComponent<native><public>(ComponentType: subtype(component))<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all parent entities above `InEntity` with `Tag` present in their `tag_component`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesWithTag<native><public>(Tag: tag)<transacts>: generator(entity)

    @experimental
    # Returns the simulation entity parent for this entity.  * The simulation entity is the rootmost entity in an experience.  * Fails if this entity is not currently in the scene.
    (InEntity: entity).GetSimulationEntity<native><public>()<transacts><decides>: entity

    using { /Verse.org/Assets }
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/FNECon
    FNECon<public> := module {
      @experimental
      # Used to handle general conversation.
      conversation_component<native><epic_internal> := class<epic_internal>(component, enableable) {
        # Event that sends the participating agent when a conversation has ended.
        ConversationEndedEvent<native><public>: listenable(agent) = external {}

        # Event that sends the participating agent when a conversation has started.
        ConversationStartedEvent<native><public>: listenable(agent) = external {}

        # Disables this component.
        Disable<native><override>(): void

        # Enables this component.
        Enable<native><override>(): void

        # Ends all conversations associated with this component.
        EndAllConversations<native><public>(): void

        # Ends a conversation with the input agent.
        EndConversation<native><public>(Agent: agent): void

        # Gets the speaker's name.
        GetSpeakerName<native_callable><public>(): message = external {}

        # Determines if this component is allowed on client.
        IsAllowedOnClient<override>(): logic = external {}

        # Succeeds if the component is enabled. Fails if it’s disabled.
        IsEnabled<native><override>()<transacts><decides>: void

        # Sets the name of the speaker that is displayed during conversations.
        SetSpeakerName<native><public>(InSpeakerName: message): void

        # Starts a conversation with the input agent.
        StartConversation<native><public>(Agent: agent): void

        @editable
        # The conversation database used when a conversation is started.
        var ConversationDatabase<native><public>: conversation_database = external {}

        @editable
        # Determines the range at which a player will be able to see the speech bubble (in meters). If set to less than 2m, the player will not see an indicator speech bubble.
        var IndicatorBubbleRange<native><public>: float = external {}

        @editable
        # The max number of participants allowed to interact with this component simultaneously.
        var MaximumParticipatingAgents<native><public>: int = external {}
      }

      # Data type used for conversations.
      conversation_database<native><epic_internal> := class<computes><concrete><epic_internal>(asset) {}
    }

    @experimental
    GetPhysicsSceneForEntity<native><epic_internal>(Entity: entity)<transacts><decides>: physics_scene_component

    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/NamedCollisionChannels
    NamedCollisionChannels<public> := module {
      @experimental
      Camera<public>: collision_channel = external {}

      @experimental
      Destructible<public>: collision_channel = external {}

      @experimental
      Pawn<public>: collision_channel = external {}

      @experimental
      PhysicsBody<public>: collision_channel = external {}

      @experimental
      Vehicle<public>: collision_channel = external {}

      @experimental
      Visibility<public>: collision_channel = external {}

      @experimental
      WorldDynamic<public>: collision_channel = external {}

      @experimental
      WorldStatic<public>: collision_channel = external {}
    }

    using { /UnrealEngine.com/EpicGamesRestricted/Network }
    using { /UnrealEngine.com/Temporary/SpatialMath }
    using { /Verse.org/Native }
    using { /Verse.org/ParameterCollections }
    using { /Verse.org/Simulation/Tags }
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/VerseCamera
    VerseCamera<public> := module {
      @experimental
      # Component that owns higher level camera behavior.
      # Owns a CameraDirector, which is responsible for selecting the best camera mode every update.
      # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
      camera_behavior_component<native><epic_internal> := class(component) {
        # Get camera parameters for a specific player
        GetCameraParametersForPlayer<native><epic_internal>(Player: player)<transacts><decides>: []parameter_collection

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>(): logic = external {}

        @experimental
        # Reponsible for deciding which camera modes should be active on each layer
        var CameraDirector<public>: camera_director = external {}

        @replicated("")
        @experimental
        # Parameters that can be used as input to all camera modes being run by this camera behavior component
        var<private> CameraParameters<native><epic_internal>: []parameter_collection = external {}
      }

      @experimental
      # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
      camera_component<native><epic_internal> := class(basic_camera_component) {
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>(): logic = external {}
      }

      @experimental
      # Base class for Camera Directors defined in Verse
      camera_director<native><epic_internal> := class(camera_director_base) {
        @experimental
        # Add a camera component to the list for consideration
        AddCameraMode<native><public>(CameraModeContext: camera_mode_context): void

        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native_callable><public>(): []camera_mode_context = external {}

        @experimental
        # Remove a camera component from the list for consideration
        RemoveCameraMode<native><public>(CameraModeContext: camera_mode_context): void
      }

      @import_as("/Script/VerseCamera.UVerseCameraDirectorBase")
      @experimental
      camera_director_base<native><epic_internal> := class {}

      @experimental
      # Camera director that returns the camera mode with the highest priority every update
      camera_director_priority_list<native><epic_internal> := class<final>(camera_director) {
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native><override>(): []camera_mode_context
      }

      @experimental
      # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
      camera_mode<native><epic_internal> := class<concrete> {
        @editable
        @display_name("CameraRigAsset")
        @replicated("")
        @experimental
        CameraRigAsset<native><epic_internal>: camera_rig_asset = external {}

        @experimental
        @editable
        # Transitions to use when entering this camera mode. Controls how this camera mode blends when blending in.  Enter transitions on this camera mode will be favoured over the outgoing camera mode's exit transition, unless the exit transition has a higher priority.  The camera mode will use the first transition it finds in this array that succeeds.
        EnterTransitions<native><public>: []camera_mode_transition = external {}

        @experimental
        @editable
        # Transitions to use when exiting this camera mode. Controls how this camera mode blends when blending out  Enter transitions from the camera mode we're transitioning to will be favoured over the this camera mode's exit transition, unless the exit transition has a higher priority.  The camera mode will use the first transition it finds in this array that succeeds.
        ExitTransitions<native><public>: []camera_mode_transition = external {}

        @experimental
        GetCameraModeTag<native><public>()<transacts><decides>: verse_camera_mode_tag

        @replicated("")
        @editable
        @experimental
        # Root camera operation - This is mutually exclusive with CameraRigAsset and is intended to allow you to build up your camera mode entirely in Verse without referencing any external assets
        RootCameraOperation<native><epic_internal>: ?camera_operation = external {}

        @experimental
        # Priority level that can be used by camera directors to determine the best camera mode
        var Priority<public>: float = external {}
      }

      @import_as("/Script/VerseCamera.UVerseCameraMode")
      @experimental
      camera_mode_base<native><epic_internal> := class<abstract> {}

      @experimental
      @hide_in_editor
      # Configurable blend between two camera modes
      camera_mode_blend<native><epic_internal> := class<concrete> {}

      @experimental
      # Linear blend between camera modes
      camera_mode_blend_linear<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      # Instantly snap to target mode
      camera_mode_blend_pop<native><epic_internal> := class<concrete>(camera_mode_blend) {}

      @experimental
      # Camera mode blend that uses the smootherstep function to blend between the two camera modes
      camera_mode_blend_smootherstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      # Camera mode blend that uses the smoothstep function to blend between the two camera modes
      camera_mode_blend_smoothstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      @hide_in_editor
      # Base class for camera mode blends that have a duration
      camera_mode_blend_with_duration<native><epic_internal> := class<concrete>(camera_mode_blend) {
        @editable
        # Sets the duration of the camera blend
        Duration<native><public>: float = external {}
      }

      @experimental
      # A camera mode, camera component pair used to give all the context required to execute a camera mode
      camera_mode_context<native><epic_internal> := struct {
        # Camera component this camera mode should run on
        CameraComponent<native><public>: camera_component

        # Camera mode this camera mode context refers to
        CameraMode<native><public>: camera_mode
      }

      @experimental
      # Controls how a camera mode transitions to another
      camera_mode_transition<native><epic_internal> := class<concrete> {
        @editable
        # Blend settings for this transition
        Blend<native><public>: camera_mode_blend = external {}

        # Transition will be taken if this function succeeds
        CanTransition<native_callable><public>(
          SourceCameraMode: camera_mode,
          DestinationCameraMode: camera_mode
        )<transacts><decides>: void = external {}

        @editable
        # Priority of this transition. System will default to using enter transition from new camera mode. This priority can be set to force the exit transition of the outgoing camera mode to be chosen
        Priority<native><public>: ?float = external {}
      }

      @experimental
      # Transition that will only be chosen if the CameraModeTag of the source and destination camera modes match the specified tag query
      camera_mode_transition_if_tags_match<native><epic_internal> := class<concrete>(camera_mode_transition) {
        # Transition will be taken if this function succeeds
        CanTransition<native><override>(
          SourceCameraMode: camera_mode,
          DestinationCameraMode: camera_mode
        )<transacts><decides>: void

        # Destination camera mode's tag must pass this search criteria
        DestinationCameraModeTags<native><public>: tag_search_criteria = external {}

        # Source camera mode's tag must pass this search criteria
        SourceCameraModeTags<native><public>: tag_search_criteria = external {}
      }

      @experimental
      # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
      camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base) {
        @experimental
        # Called when the camera mode is initialized
        Initialize<native_callable><public>(InitParams: camera_operation_initialization_parameters)<transacts><decides>: void = external {}

        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(
          InputParams: camera_operation_input_parameters,
          OutputParams: camera_operation_output_parameters
        ): void = external {}
      }

      @import_as("/Script/VerseCamera.UVerseCameraNode")
      @experimental
      camera_operation_base<native><epic_internal> := class<abstract> {}

      @experimental
      # Camera operation initialization parameters
      camera_operation_initialization_parameters<native><epic_internal> := class<final> {}

      @experimental
      # Input params to a camera operation
      camera_operation_input_parameters<native><epic_internal> := class<final> {
        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_float)<transacts><decides>: float

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_integer)<transacts><decides>: int

        @experimental
        # Get the value of a camera parameter
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_logic)<transacts><decides>: void

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_rotation)<transacts><decides>: rotation

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_transform)<transacts><decides>: transform

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_vector2)<transacts><decides>: vector2

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter: camera_parameter_vector3)<transacts><decides>: vector3

        @experimental
        # Camera behavior component that this camera_mode is running in
        var CameraBehaviorComponent<native><public>: ?camera_behavior_component = external {}

        @experimental
        # camera_component that this camera_mode is running in
        var CameraComponent<native><public>: ?camera_component = external {}

        @experimental
        # Camera location from the initial evaluator execution, or previous operation if an operation modified it before this one
        var CameraLocation<native><public>: vector3 = external {}

        @experimental
        # Camera rotation from the initial evaluator execution,  or previous operation if an operation modified it before this one
        var CameraRotation<native><public>: rotation = external {}

        @experimental
        # Delta time since last update
        var DeltaTime<native><public>: float = external {}
      }

      @experimental
      # Output params to a camera operation
      camera_operation_output_parameters<native><epic_internal> := class<final>(camera_output_parameters) {}

      @experimental
      camera_output_parameters<native><epic_internal> := class {
        Reset_Internal<native><epic_internal>(): void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable: camera_variable_float, Value: float)<transacts><decides>: void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable: camera_variable_integer, Value: int)<transacts><decides>: void

        @experimental
        # Set a camera variable value
        SetCameraVariable<native><epic_internal>(CameraVariable: camera_variable_logic, Value: logic)<transacts><decides>: void

        @experimental
        SetCameraVariable<native><epic_internal>(
          CameraVariable: camera_variable_rotation,
          Value: rotation
        )<transacts><decides>: void

        @experimental
        SetCameraVariable<native><epic_internal>(
          CameraVariable: camera_variable_transform,
          Value: transform
        )<transacts><decides>: void

        @experimental
        SetCameraVariable<native><epic_internal>(
          CameraVariable: camera_variable_vector2,
          Value: vector2
        )<transacts><decides>: void

        @experimental
        SetCameraVariable<native><epic_internal>(
          CameraVariable: camera_variable_vector3,
          Value: vector3
        )<transacts><decides>: void

        @experimental
        # If written to, will set the camera field of view
        var CameraFieldOfViewDegrees<native><public>: ?float = external {}

        @experimental
        # If written to, will set the camera location
        var CameraLocation<native><public>: ?vector3 = external {}

        @experimental
        # If written to, will set the camera rotation
        var CameraRotation<native><public>: ?rotation = external {}
      }

      @experimental
      camera_parameter_float<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: float = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_float = external {}
      }

      @experimental
      camera_parameter_integer<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: int = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_integer = external {}
      }

      @experimental
      camera_parameter_logic<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: logic = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_logic = external {}
      }

      @experimental
      camera_parameter_rotation<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: rotation = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_rotation = external {}
      }

      @experimental
      camera_parameter_transform<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: transform = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_transform = external {}
      }

      @experimental
      camera_parameter_vector2<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: vector2 = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_vector2 = external {}
      }

      @experimental
      camera_parameter_vector3<native><epic_internal> := class {
        @editable
        @experimental
        Value<native><public>: vector3 = external {}

        @editable
        @experimental
        Variable<native><public>: camera_variable_vector3 = external {}
      }

      @experimental
      # Component used to associate a camera behavior component with a player
      player_camera_view<native><epic_internal> := class(player_camera_view_base) {}

      @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
      @experimental
      player_camera_view_base<native><epic_internal> := class<abstract> {}

      @experimental
      verse_camera_mode_tag<native><epic_internal> := class(tag) {}
    }

    @experimental
    # Axis aligned box volume.
    axis_aligned_box3<native><public> := class<final><concrete>(convex_volume3) {
      # Center point of the box.
      Center<native><public>: vector3 = external {}

      # Extent of the box.
      Extent<native><public>: vector3 = external {}
    }

    @import_as("/Script/Entity.UBaseEntity")
    @experimental
    base_entity<native><epic_internal> := class<abstract> {}

    using { /UnrealEngine.com/Temporary/UI }
    using { /Verse.org/Colors }
    @hide_in_editor
    @experimental
    basic_camera_component<native><epic_internal> := class(component) {
      @experimental
      GetFieldOfView<public>(): float = external {}

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # Notification called then the component owner entity was added to a world
      OnAddedToScene<native><override>(): void

      # The component is being initialized, called when it is added to an entity
      OnInitialized<native><override>(): void

      # Notification called when the component owner entity is about to be removed from world
      OnRemovingFromScene<native><override>(): void

      # The component is being uninitialized, called when it is about to be removed from an entity
      OnUninitializing<native><override>(): void

      @experimental
      # Set the field of view of the camera in degrees
      SetFieldOfView<public>(InFieldOfView: float): void = external {}
    }

    using { /Verse.org/Simulation }
    @experimental
    # An interactable component with a composable feature set.
    basic_interactable_component<native><public> := class(interactable_component) {
      @experimental
      # Attempt to cancel an interaction. Fails if the supplied agent is not currently interacting with the component.
      Cancel<native><public>(Agent: agent)<transacts><decides>: void

      @editable
      @experimental
      # Cooldowns begin elapsing on successful interactions. A cooldown which applies for all attempts to interact on this component.
      Cooldown<native><public>: ?interactable_cooldown = external {}

      @editable
      @experimental
      # Cooldowns begin elapsing on successful interactions. A cooldown which applies for future attempts to interact on this component by the agent which succeeded.
      CooldownPerAgent<native><public>: ?interactable_cooldown_per_agent = external {}

      @experimental
      # The text to display to the user within the interaction range of the entity with a interact component that CannotInteract. Used only during initialization of the component and not modified by SetText.
      DefaultCannotInteractText<localizes><native><public>: message = external {}

      @experimental
      # The text to display when within the interaction range of the entity with a coolingdown interact component. Used only during initialization of the component and not modified by SetText.
      DefaultCoolDownText<localizes><native><public>: message = external {}

      @experimental
      # The text displayed when within the interaction range of the entity with an interactable interact component. Used only during initialization of the component and not modified by SetText.
      DefaultInteractText<localizes><native><public>: message = external {}

      @experimental
      # Get the remaining cooldown of the interactable for the supplied agent. This returns the duration left in seconds of either the shared or per agent cooldown, whichever is greater. Returns the same value when called multiple times within a transaction.
      GetRemainingCooldownDurationAffectingAgent<native><public>(Agent: agent): float

      @editable
      @experimental
      # An interaction with a duration does not succeed until the duration has elapsed, and success is not guaranteed as it can be canceled while the duration is active.
      InteractableDuration<native><public>: ?interactable_duration = external {}

      @experimental
      # Sets the text displayed when within the interaction range of the entity with an interactable interact component.
      SetInteractText<native><epic_internal>(InText: message): void

      @experimental
      # Attempt to succeed at an interaction. Success will also happen automatically after InteractDuration has elapsed after starting an interaction. Fails if the supplied agent is not currently interacting with the component.
      Succeed<native><public>(Agent: agent)<transacts><decides>: void

      @editable
      @experimental
      # Success limits prevent new interactions once the component has been successfully interacted with a specified number of times.
      SuccessLimit<native><public>: ?interactable_success_limit = external {}

      @experimental
      # The agents which are currently interacting with this interactable.
      var<private> InteractingAgents<native><public>: []agent
    }

    @experimental
    collision_channel<native><public> := struct<concrete><computes><epic_internal> {
      ChannelIndex: int = external {}
    }

    @experimental
    collision_channel_response<native><public> := enum {
      Block

      Ignore

      Overlap
    }

    @experimental
    collision_channel_responses<native><public> := class<concrete><epic_internal> {
      GetChannelResponse<native><epic_internal>(Channel: collision_channel): collision_channel_response

      SetChannelResponse<native><epic_internal>(Channel: collision_channel, Response: collision_channel_response): void
    }

    @experimental
    # Used to make an entity collide with other scene objects, including preventing players and NPCs from passing through the entity.Overlap queries can only find entities with enabled `collision_components`.Dependencies:  * `transform_component` on the entity positions the `collision_component`.  * `mesh_component` on the entity provides the collision shape for the `collision_component`.
    collision_component<native><public> := class<final>(component, enableable) {
      # Event signaled when something starts overlapping with the component.
      BeginOverlapEvent<native><epic_internal>: listenable(overlap_result) = external {}

      # Disables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
      Disable<native><override>(): void

      # Enables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
      Enable<native><override>(): void

      # Event signaled when something stops overlapping with the component.
      EndOverlapEvent<native><epic_internal>: listenable(overlap_result) = external {}

      GetCollisionProfile<native><epic_internal>(): ?collision_profile

      # Event signaled when the component experiences a blocking hit.
      HitEvent<native><epic_internal>: listenable(hit_result) = external {}

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      # Sets up collision simulation for the entity.
      OnBeginSimulation<native><override>(): void

      # Tears down collision simulation for the entity.
      OnEndSimulation<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      OnUninitializing<native><override>(): void

      SetCollisionProfile<native><epic_internal>(Profile: collision_profile): void

      VisibilityChannelResponseOverride<native><epic_internal>: ?collision_channel_response = external {}

      var CollisionOverride<epic_internal>: collision_override = external {}

      var SendHitEvents<native><epic_internal>: logic = external {}

      var SendOverlapEvents<native><epic_internal>: logic = external {}
    }

    @experimental
    collision_override<native><epic_internal> := class<epic_internal> {}

    @experimental
    collision_profile<native><public> := class<concrete><epic_internal> {
      GetChannel<native><public>(): collision_channel

      GetName<native><public>(): string

      GetResponses<native><public>(): collision_channel_responses

      SetChannel<native><public>(Channel: collision_channel): void

      SetName<native><public>(Name: string): void

      SetResponses<native><public>(Responses: collision_channel_responses): void
    }

    @experimental
    collision_query_params<native><public> := struct<epic_internal> {
      # True to have the query return Blocking hits
      DetectBlocking<native><public>: logic = external {}

      # True to have the query return Overlapping hits
      DetectOverlapping<native><public>: logic = external {}

      # A set of components to ignore in the query
      IgnoredComponents<native><public>: []collision_component = external {}
    }

    @experimental
    # Base class for authoring logic and data in the SceneGraph. Using components youcan author re-usable building blocks of logic and data which can then be added toentities in the scene.Components are a very low level building block which can be used in many ways.For example:  * Exposing engine level concepts like mesh or sound  * Adding gameplay capabilities like damage or interaction  * Storing an inventory for a character in the gameAs components are generic there is no specific way that they must be used.It is up to the needs of your experience if you use one big game componentor if you break up logic into many small components.Currently UEFN will not allow you to add more than one component of a givensubclass of component (for example, only one type of light_component). This restrictionwill be relaxed in the future where components will be able to decide if theywish to allow only one instance or many instances of the same component to existtogether on one entity.==============================================================================Component Lifetime  Components move through a series of lifetime functions as they are added  to entities, added to the scene, and begin running in the simulation. Components  should override these methods to perform setup and run their simulation.  As a component shuts down it will then move through shutdown version of these  functions, giving users the opportunity to clean up any retained state on the  component before it is disposed.  Lifetime Methods:    OnInitialized       OnAddedToScene         OnBeginSimulation -> OnSimulate<suspends>         OnEndSimulation       OnRemovingFromScene    OnUninitializing==============================================================================
    component<native><public> := class<abstract><unique>(disposable) {
      @experimental
      # Disposes of the component and all its resources.  * Disposed components are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
      Dispose<native><override><final>(): void

      @experimental
      @allow_self_reference
      @experimental_always_overridden
      # The parent entity of this component.  * Components must have a parent entity pointer provided when being constructed.  * Components cannot be moved between parents.  * The parent pointer remains valid even after the component has been disposed.
      Entity<native><public>: entity

      IsAllowedOnClient<native_callable><epic_internal>(): logic = external {}

      @experimental
      # Determines if the component has been disposed from the `Dispose` method. Disposed components cannot be added back to the scene.
      IsDisposed<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently in the scene.  * After `OnAddedToScene` is called this call succeeds.  * After `OnRemovingFromScene` is called this call fails.
      IsInScene<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently initialized with its parent entity.  * After `OnInitialized` is called this call succeeds.  * After `OnUninitializing` is called this call fails.
      IsInitialized<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently simulating.  * After `OnBeginSimulation` is called this call succeeds.  * After `OnEndSimulation` is called this call fails.
      IsSimulating<native><final><public>()<transacts><decides>: void

      @experimental
      # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.  * Querying for components in the scene is valid after this phase completes.  * `OnInitialized` is guaranteed to run before `OnAddedToScene`.
      OnAddedToScene<native><native_callable><protected>(): void

      @experimental
      # Called when the component begins simulating within the scene.  * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.  * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
      OnBeginSimulation<native><native_callable><protected>(): void

      @experimental
      # Called when the component ends simulation within the scene.  * Simulation ends on a component when the experience resets, the parent entity is removed from the scene, or the component is disposed.  * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.  * `OnSimulate` task will be canceled before `OnEndSimulation` is called.  * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
      OnEndSimulation<native><native_callable><protected>(): void

      @experimental
      # Called when the component is added to an entity using `entity.AddEntities`.  * Components can check for dependent sibling components at this stage through `entity.GetComponents`.  * Components can add additional components at this stage using `entity.AddComponents`
      OnInitialized<native><native_callable><protected>(): void

      @experimental
      # Called when the component is about to be removed from the scene.  * Components are removed from a scene when the parent entity is removed from the scene or the component is disposed.  * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
      OnRemovingFromScene<native><native_callable><protected>(): void

      @experimental
      # Called when the component begins simulating within the scene.  * Use this to add asynchronous/suspends update logic for a component.  * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.  * `OnSimulate` will be cancelled before `OnEndSimulation`
      OnSimulate<native_callable><protected>()<suspends>: void = external {}

      @experimental
      # Called when the component is about to be removed from the parent entity.  * Components are removed from their parent entity when they are disposed.  * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
      OnUninitializing<native><native_callable><protected>(): void

      @experimental
      # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updatesbefore and after physics is updated on your object.
      var<private> TickEvents<protected>: tick_events = external {}
    }

    @experimental
    component_query_iterator_interface<native><epic_internal> := interface<epic_internal> {
      NextValue<native_callable><public>()<transacts><decides>: component
    }

    @experimental
    # Base class for all convex volumes.
    convex_volume3<native><public> := class<epic_internal>(volume3) {
      # Determines if `Point` falls within the boundaries of this `convex_volume3`.
      Contains<native><public>(Point: vector3)<computes><decides><reads>: void
    }

    @experimental
    damageable_component<native><epic_internal> := class(component) {
      @experimental
      Damage<native><public>(Amount: float): void

      @experimental
      DamagedEvent<native><final><public>: listenable(float) = external {}
    }

    @experimental
    # A `directional_light_component` simulates light that is being emitted from a source that is infinitelyfar away. This means that all shadows cast by this light will be parallel, making this the ideal choicefor simulating sunlight.
    directional_light_component<native><public> := class<final>(light_component) {
      @experimental
      # Controls the amount of shadow occlusion. A value of 0.0 means no occlusion, thus no shadow.
      var ShadowOpacity<public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}
    }

    @experimental
    # Entities are the base object in the SceneGraph.  * Objects in experiences are constructed of one or more entities.  * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.  * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.  * The structure and content of entities is dynamic and be changed at any time through your experience.==============================================================================Deriving from entity  In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you  want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are  authored through the editor, with their Verse classes generated as part of the build into the projects  Assets.digest.verse file.  While you can create base prefabs for common game object types like a vehicle or character, we highly recommended  that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in  components allows you to restructure your prefabs throughout production of your experience, without needing to massively  refactor your class structure.
    entity<native><public> := class<concrete><unique><transacts>(base_entity, disposable) {
      @experimental
      # Adds the provided components to the entity.   * If a component is not allowed to be added to this entity it is skipped.  * Components are added following these rules:      1. All components are added to the entity child list.      2. All components have `OnInitialized` called.      3. All components have `OnAddedToScene` called (if this entity is in the scene).      4. All components have `OnBeginSimulation` called (if this entity is simulating).
      AddComponents<native><final><public>(Components: []component): void

      @experimental
      # Adds the provided entities as children of this entity.  * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.  * Added child entities will move through their lifetime methods until they match the state of the new parent.
      AddEntities<native><final><public>(NewChildEntities: []entity): void

      @experimental
      # Disposes of the entity and all its resources.  * Disposed entities are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
      Dispose<native><override><final>(): void

      @experimental
      # Returns the child components of type ComponentType.  * To get all child components use `GetComponents(component)`.  * To get a single component use `GetComponent(some_component)[0]`.
      GetComponents<native><final><public>(ComponentType: subtype(component))<transacts>: []ComponentType

      @experimental
      # Returns the child entities belonging to this entity which are accessible from the calling context.  * This method only gets the direct entity children. To query multiple levels down the entity structure use    the Find* query methods instead.
      GetEntities<native><final><public>()<transacts>: []entity

      @experimental
      # Returns the parent entity of this entity.  * The parent entity controls the lifetime of its child entities and components. When an entity    is removed from the scene, all its child entities and components will be removed as well.  * Some entities may choose to re-parent child entities before being disposed For example,    a vehicle might drop an attached wheel vs. having the wheel entity be removed with the vehicle.  * Method fails if there is currently no parent entity.
      GetParent<native><final><public>()<transacts><decides>: entity

      @experimental
      # Succeeds if the entity has been disposed by the `Dispose` method. Disposed entities cannot be added back to the scene.
      IsDisposed<native><final><public>()<transacts><decides>: void

      @experimental
      # Removes this entity from its parent. This is used to remove entities from the scene temporarily.  * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.  * Entity can be added back later by using `NewParent.AddEntities`.  * If this entity is no longer needed then consider using `Dispose` instead of `RemoveFromParent`.
      RemoveFromParent<native><final><public>(): void
    }

    @experimental
    # Reference type to editor defined prefab. Only generated digest code should reference this type.
    entity_prefab<native><public> := class<computes><epic_internal>(asset) {}

    @experimental
    entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    entity_query_iterator_interface<native><epic_internal> := interface<epic_internal> {
      NextValue<native_callable><public>()<transacts><decides>: entity
    }

    @hide_in_editor
    @experimental
    entity_query_manager_component<native><epic_internal> := class<epic_internal>(component) {
      IsAllowedOnClient<override>(): logic = external {}
    }

    @experimental
    # Used to subscribe a callback or await an event based callback 'IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventuallyclean up your subscription and your callback will stop being invoked.
    execution_event<native><public> := class<epic_internal>(listenable(tuple())) {
      # Suspends the current task until resumed by a matching call to `signalable.Signal`.
      Await<native><override>()<suspends>: tuple()

      @experimental
      # Subscribe a callback function to this event.
      Subscribe<native><override>(Callback: type { __(): void })<transacts>: cancelable
    }

    @experimental
    # Users to subscribe to, or await on, a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventuallyclean up your subscription and your callback will stop being invoked.
    execution_listenable<native><public> := class<epic_internal>(listenable(float)) {
      # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
      Await<native><override>()<suspends>: float

      @experimental
      # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that haspassed between the last update and the current update.
      Subscribe<native><override>(Callback: type { __(: float): void })<transacts>: cancelable
    }

    @experimental
    execution_subscription<native><epic_internal> := class(cancelable) {
      Cancel<native><override>()<transacts>: void

      RunAfter<native><epic_internal>(__dupe___unnamed_parameter_32: execution_subscription): void

      RunBefore<native><epic_internal>(__dupe___unnamed_parameter_33: execution_subscription): void
    }

    @experimental
    # A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
    float_range<native><public> := struct<concrete> {
      @editable
      Maximum<native><public>: float = external {}

      Minimum<native><public>: float = external {}
    }

    @experimental
    hit_result<native><epic_internal> := struct {
      @experimental
      HitLocation<native><public>: vector3

      @experimental
      HitNormal<native><public>: vector3

      @experimental
      OtherComponent<native><public>: ?component

      @experimental
      OtherEntity<native><public>: ?entity

      @experimental
      ThisComponent<native><public>: ?component

      @experimental
      ThisEntity<native><public>: ?entity
    }

    @experimental
    # Used to handle general interaction.
    interactable_component<native><public> := class(component, enableable) {
      # Returns whether the specified agent can interact.
      CanInteract<native><public>(Agent: agent)<computes><decides><reads>: void

      # Event fires when an interaction has ended before completing successfully. Sends the formerly interacting agent.  This event is called on all interacting agents when Disable() is called on the component.
      CanceledEvent<native><public>: listenable(agent) = external {}

      # Disable interaction with the component. Disabled components do not provide interaction prompts.
      Disable<native><override>(): void

      # Enable interaction with the component.
      Enable<native><override>(): void

      InteractFinishedEvent<native><public>: listenable(agent) = external {}

      # Returns an appropriate message to display to players to communicate the current state of the interactable.
      InteractMessage<native><public>(Agent: agent)<computes><decides><reads>: message

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      # Attempt to start an interaction. Fails if the agent does not pass the CanInteract function.
      Start<native><public>(Agent: agent)<transacts><decides>: void

      # Event fires when an a successful interaction starts. Sends the interacting agent. InteractDuration at or below 0 makes this event identical to InteractSucceededEvent.
      StartedEvent<native><public>: listenable(agent) = external {}

      # Event fires when an interaction has completed successfully. Sends the formerly interacting agent. InteractDuration at or below 0 makes this event identical to InteractStartedEvent.
      SucceededEvent<native><public>: listenable(agent) = external {}
    }

    @experimental
    # Used to set a cooldown when interacted.
    interactable_cooldown<native><public> := class<concrete> {
      @experimental
      # Event which fires when the shared cooldown expires.
      ExpiredEvent<native><public>: listenable(tuple()) = external {}

      @experimental
      # Get the remaining shared cooldown duration in seconds, affecting all agents.
      GetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_82: accessor)<transacts>: float

      @experimental
      # Set the remaining shared cooldown duration in seconds, affecting all agents.
      SetRemainingDuration<native><epic_internal>(
        __dupe___unnamed_parameter_81: accessor,
        InRemainingDuration: float
      )<transacts>: void

      @experimental
      # Event which fires when the shared cooldown triggers.
      TriggeredEvent<native><public>: listenable(float) = external {}

      @editable
      @experimental
      # The number of seconds after a successful interaction, before being able to initiate a subsequent interaction for anyone.This is only used if duration is greater than 0.0. Modifying this does not affect the RemainingDuration.When a cooldown starts on the component all other interactions are canceled.
      var Duration<native><public>: float = external {}

      @experimental
      # The remaining cooldown, in seconds, before new interactions can be initiated on this component.
      var<private> RemainingDuration<public>: float = external {}
    }

    @experimental
    # Used to set a cooldown per agent when interacted.
    interactable_cooldown_per_agent<native><public> := class<concrete> {
      @experimental
      # Event which fires when the per agent cooldown expires. Sends the agent which was previously affected by the cooldown.
      ExpiredEvent<native><public>: listenable(tuple()) = external {}

      @experimental
      # Get the remaining shared cooldown duration in seconds, affecting all agents.
      GetRemainingDurationForAgent<native><epic_internal>(
        __dupe___unnamed_parameter_84: accessor,
        Agent: agent
      )<transacts>: float

      @experimental
      # Set the remaining shared cooldown duration in seconds, affecting all agents.
      SetRemainingDurationForAgent<native><epic_internal>(
        __dupe___unnamed_parameter_83: accessor,
        Agent: agent,
        InRemainingDuration: float
      )<transacts>: void

      @experimental
      # Event which fires when the per agent cooldown triggers. Sends the agent which was previously affected by the cooldown.
      TriggeredEvent<native><public>: listenable(float) = external {}

      @editable
      @experimental
      # The duration in seconds after a successful interaction, before the interacting agent can initiate a subsequent interaction.This is only used if the duration is greater than 0.0. Modifying this does not affect any RemainingPerAgentCooldownDuration.This property gives other agents time to interact, when there is a limited number of Simultaneous Interators.
      var Duration<native><public>: float = external {}

      @experimental
      # The cooldown remaining, in seconds, before a particular agent is able to initiate an interaction on this component.
      var<private> RemainingDuration<native><public>: [agent]float = external {}
    }

    @experimental
    # Used to set an interaction duration.
    interactable_duration<native><public> := class<concrete> {
      @experimental
      # Returns an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.Returns the same value when called multiple times within a transaction.
      GetRemainingInteractDurationForAgent<final><native><public>(Agent: agent)<computes><decides><reads>: float

      @experimental
      # Sets an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.
      SetRemainingInteractDurationForAgent<final><native><public>(Agent: agent, RemainingDuration: float)<transacts>: void

      @editable
      @experimental
      # The number of seconds an agent must spend interacting with the object to successfully complete an interaction.0.0 or less results in an immediate successful interaction.
      var InteractDuration<native><public>: float = external {}

      @editable
      @experimental
      # The max number of simultaneous interactors. A value of false is unlimited.  This value represents how many agents may have active interactions.If this changes to a value less than the current number of active interactions, those interactions are not canceled but new interactions will not start.
      var MaxSimultaneousInteractors<native><public>: ?int = external {}
    }

    @experimental
    # Used to set a limit of times to interact.
    interactable_success_limit<native><public> := class<concrete> {
      @experimental
      # Resets the counter for the times this component has had a successful interaction.
      ClearSuccessfulInteractionCount<native><public>()<transacts>: void

      @experimental
      # Get the maximum number of successful interactions possible.
      GetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_86: accessor)<transacts>: ?int

      @experimental
      # Update the maximum number of successful interactions possible, a value of false is unlimited.If the current number of tracked interactions is greater than the value specified here, all current interactions will be canceled.
      SetMaxSuccessfulInteractions<native><epic_internal>(
        __dupe___unnamed_parameter_85: accessor,
        InMaxSuccessfulInteractions: ?int
      )<transacts>: void

      @experimental
      # The number of times the component can be successfully interacted with. A value of false is unlimited.When SuccessfulInteractionCount reaches MaxSuccessfulInteractions all active interactions are canceled, and the component cannot be interacted with.
      var MaxSuccessfulInteractions<public>: ?int = external {}

      @experimental
      # The number of times this component has had a successful interaction.
      var SuccessfulInteractionCount<public>: int = external {}
    }

    @hide_in_editor
    @experimental
    level_entity<native><epic_internal> := class<concrete><unique><transacts>(entity) {}

    @experimental
    # Base class for light components in the SceneGraph.Dependencies:  * `transform_component` on the entity positions the light.Examples of components implementing `light_component`:  * `directional_light_component`  * `point_light_component`  * `rect_light_component`  * `spot_light_component`
    light_component<native><public> := class<abstract><epic_internal>(component) {
      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void

      @experimental
      # If the light affects global illumination, when ray-traced global illumination is enabled.
      var AffectGlobalIllumination<public>: logic = external {}

      @experimental
      # If the light affects objects in reflections, when ray-traced reflection is enabled.
      var AffectReflection<public>: logic = external {}

      @experimental
      # If the light casts high quality shadows, such that hair-strands are self-shadowing. When this option is enabled, there is an extra GPU cost for this light.
      var CastDeepShadows<public>: logic = external {}

      @experimental
      # If the light casts any shadows.
      var CastShadows<public>: logic = external {}

      @experimental
      # If the light casts shadows on volumetric fog. Disabling this can save GPU time.
      var CastVolumetricShadow<public>: logic = external {}

      @experimental
      # The color of the light. Note that this can change the light’s effective intensity.
      var Color<public>: color = external {}

      @experimental
      # The total energy the light emits in candela. The renderer clamps between 0.0 and 20.0.
      var Intensity<public>: float = external {}
    }

    @experimental
    local_hud_component<epic_internal> := class(component) {
      @experimental
      Hide<public>(Player: player): void = external {}

      IsAllowedOnClient<override>(): logic = external {}

      OnBeginSimulation<override>(): void = external {}

      OnEndSimulation<override>(): void = external {}

      @experimental
      Show<public>(Player: player): void = external {}

      var Canvas<public>: canvas

      var UISlot<public>: player_ui_slot
    }

    @experimental
    # Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapesin the world such as:  * foliage and terrain decorations  * movers (for example, doors and lifts)  * procedurally created buildingsDependencies:  * `transform_component` on the entity positions the mesh.
    mesh_component<native><public> := class(component, enableable) {
      @experimental
      # Disables rendering of this mesh.
      Disable<native><override>(): void

      @experimental
      # Enables rendering of this mesh.
      Enable<native><override>(): void

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      @experimental
      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      @experimental
      # Sets the `material` to be applied to the `mesh`.
      SetMaterial<native><public>(InMaterial: ?material): void

      @experimental
      # Sets the `mesh` to be rendered.
      SetMesh<native><public>(InMesh: mesh): void

      @experimental
      @replicated("RepNotify")
      # A material to be applied to this mesh. If this is set to `false` the base material on the mesh asset will be used.
      var<private> Material<native><public>: ?material = external {}

      @experimental
      @editable
      @replicated("RepNotify")
      # The `mesh` to be rendered by this `mesh_component`.
      var<private> Mesh<native><public>: mesh = external {}
    }

    @experimental
    no_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override) {}

    @experimental
    null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: component
    }

    @experimental
    null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    overlap_hit<native><public> := struct<epic_internal> {
      Component<native><public>: ?component = external {}
    }

    @experimental
    overlap_hit_container<native><public> := struct<epic_internal> {
      Hits<native><public>: []overlap_hit
    }

    @experimental
    overlap_result<native><epic_internal> := struct<epic_internal> {
      OtherComponent<native><public>: ?component

      OtherEntity<native><public>: ?entity

      ThisComponent<native><public>: ?component

      ThisEntity<native><public>: ?entity
    }

    @experimental
    # Constrains the transform of this entity so it is always offset relatively from its parent entity.Any changes made to the parent entity's `transform_component` will automatically cause this entity to change too.Dependencies:  * `transform_component` on the entity provides the world transform to be constrained.
    parent_constraint_component<native><public> := class(component) {
      @experimental
      # Attaches the owner entity to the specified entity. This method will compute relative transform from the current world transform of both entity
      AttachTo<native><epic_internal>(InParentEntity: entity)<transacts><decides>: void

      @experimental
      # Attach the owner entity to the specified entity, use the specified transform as the relation to it
      AttachTo<native><epic_internal>(InParentEntity: entity, NewRelativeTransform: transform)<transacts><decides>: void

      @experimental
      # Automatically attach to owner at initialization
      AutoAttachToOwner<native><epic_internal>: logic = external {}

      @experimental
      # Detaches the owner entity if it was attached to an other entity
      DetachFrom<native><epic_internal>()<transacts><decides>: void

      @experimental
      # Retrieve the transform of the attachment
      GetAttachedTransform<native><epic_internal>()<decides>: transform

      @experimental
      # Returns the relative transform of the entity to its parent.
      GetRelativeTransform<native><epic_internal>()<transacts>: transform

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void

      @experimental
      # Sets the relative transform of the entity to its parent.
      SetRelativeTransform<native><epic_internal>(Transform: transform)<transacts><decides>: void

      @experimental
      # Set relative transform from a global transform
      SetRelativeTransformFromGlobal<native><epic_internal>(Transform: transform)<transacts><decides>: void

      @experimental
      # The relative transform to the attached entity
      var ParentEntity<native><epic_internal>: ?entity = external {}

      @experimental
      # The relative transform to the attached entity
      var RelativeTransform<native><epic_internal>: ?transform = external {}
    }

    @experimental
    # Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate whilethe `particle_system_component` is in the scene.Dependencies:  * `transform_component` on the entity positions the `particle_system`.
    particle_system_component<native><public> := class<final>(component, enableable) {
      @editable
      @experimental
      # Controls if the `particle_system_component` should start enabled.
      AutoEnable<native><public>: logic = external {}

      @experimental
      # Disables the simulation and rendering of this `particle_system`.
      Disable<native><override>(): void

      @experimental
      # Enables the simulation and rendering of this `particle_system`.
      Enable<native><override>(): void

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      @experimental
      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<override>()<transacts><decides>: void = external {}

      OnAddedToScene<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      OnUninitializing<native><override>(): void

      @editable
      # Controls if the `particle_system_component` should run a simulation preview in UEFN. This isseparate from `AutoEnable` so users can control what starts in the game separately from the editor.
      PreviewInEditor<native><public>: logic = external {}

      @experimental
      SetBeamEnd<native><epic_internal>(InBeamEnd: vector3): void

      @experimental
      SetBeamEndTangent<native><epic_internal>(InBeamEndTangent: vector3): void

      @experimental
      SetBeamStart<native><epic_internal>(InBeamStart: vector3): void

      @experimental
      SetBeamStartTangent<native><epic_internal>(InBeamStartTangent: vector3): void

      @experimental
      SetBeamWidth<native><epic_internal>(InBeamWidth: float): void

      @replicated("RepNotify")
      @editable
      @experimental
      # The `particle_system` to be created by this component.
      var ParticleSystem<native><public>: particle_system = external {}
    }

    @experimental
    physics_component<native><epic_internal> := class<final>(component, enableable) {
      @experimental
      # Disable this object.
      Disable<native><override>(): void

      @experimental
      # Enable this object.
      Enable<native><override>(): void

      @experimental
      # Event signaled when the component experiences a blocking hit
      HitEvent<native><public>: listenable(hit_result) = external {}

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      @experimental
      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      # Notification called then the component owner entity was added to a world
      OnAddedToScene<native><override>(): void

      # The component is being initialized, called when it is added to an entity
      OnInitialized<native><override>(): void

      # Notification called when the component owner entity is about to be removed from world
      OnRemovingFromScene<native><override>(): void

      # The component is being uninitialized, called when it is about to be removed from an entity
      OnUninitializing<native><override>(): void
    }

    @experimental
    physics_scene_component<native><epic_internal> := class<final>(component) {
      OnAddedToScene<native><override>(): void

      OnBeginSimulation<native><override>(): void

      OnEndSimulation<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      OnUninitializing<native><override>(): void

      # Find everything that overlaps a collision_component
      OverlapCollision<native><epic_internal>(
        Component: collision_component,
        Position: vector3,
        Rotation: rotation
      ): overlap_hit_container

      # Find everything that overlaps a convex shape
      OverlapShape<native><epic_internal>(
        Shape: convex_volume3,
        Position: vector3,
        Rotation: rotation,
        TraceChannel: collision_channel,
        QueryParams: collision_query_params
      ): overlap_hit_container

      # Trace a collision_component through the scene and return all hits
      TraceCollision<native><epic_internal>(
        Component: collision_component,
        StartPosition: vector3,
        EndPosition: vector3,
        Rotation: rotation
      ): trace_hit_container

      # Trace a line through the scene and return all hits
      TraceLine<native><epic_internal>(
        StartPosition: vector3,
        EndPosition: vector3,
        TraceChannel: collision_channel,
        QueryParams: collision_query_params
      ): trace_hit_container

      # Trace a shape through the scene and return all hits
      TraceShape<native><epic_internal>(
        Shape: convex_volume3,
        StartPosition: vector3,
        EndPosition: vector3,
        TraceChannel: collision_channel,
        QueryParams: collision_query_params
      ): trace_hit_container
    }

    @experimental
    # A `point_light_component` emits light equally in all directions from a single point in space.
    point_light_component<native><public> := class<final>(point_light_component_base) {}

    @hide_in_editor
    @experimental
    point_light_component_base<native><epic_internal> := class<epic_internal>(light_component) {
      GetAttenuationRadius<native><protected>(__dupe___unnamed_parameter_85: accessor)<transacts>: float

      GetSourceLength<native><protected>(__dupe___unnamed_parameter_89: accessor)<transacts>: float

      GetSourceRadius<native><protected>(__dupe___unnamed_parameter_87: accessor)<transacts>: float

      SetAttenuationRadius<native><protected>(
        __dupe___unnamed_parameter_86: accessor,
        InAttenuationRadius: float
      )<transacts>: void

      SetSourceLength<native><protected>(__dupe___unnamed_parameter_90: accessor, InSourceLength: float)<transacts>: void

      SetSourceRadius<native><protected>(__dupe___unnamed_parameter_88: accessor, InSourceRadius: float)<transacts>: void

      @experimental
      # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.This clamping of the light's influence is not physically correct but very important for performance. Larger lights cost more. Clamped between 8.0 and 16384.0.
      var AttenuationRadius<public>: float = external {}

      @experimental
      # The length of the light shape. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceLength<public>: float = external {}

      @experimental
      # The radius of the light shape. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceRadius<public>: float = external {}
    }

    @experimental
    # A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use theseto simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lightingfixtures, or wall sconces.
    rect_light_component<native><public> := class<final>(light_component) {
      @experimental
      # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.This clamping of the light's influence is not physically correct but very important for performance. Larger lights cost more. Clamped between 8.0 and 16384.0.
      var AttenuationRadius<public>: float = external {}

      @experimental
      # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
      var BarnDoorAngle<public>: float = external {}

      @experimental
      # The length of the barn door attached to the light source rect. Clamped to a minimum of 0.0 cm.
      var BarnDoorLength<public>: float = external {}

      @experimental
      # The height of the light source rect. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
      var SourceHeight<public>: float = external {}

      @experimental
      # The width of the light source rect. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
      var SourceWidth<public>: float = external {}
    }

    @experimental
    replication_component<native><epic_internal> := class(component) {
      @editable
      # Internal only flag to make this entity always relevant for replication to clients
      AlwaysRelevant<native><epic_internal>: logic = external {}

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # The component is being initialized, called when it is added to an entity
      OnAddedToScene<native><override>(): void

      # The component is being uninitialized, called when it is about to be removed from an entity
      OnRemovingFromScene<native><override>(): void
    }

    @experimental
    # Base class for all two-dimensional shapes.
    shape2<native><epic_internal> := class<epic_internal> {}

    @experimental
    # Base class for all three-dimensional shapes.
    shape3<native><public> := class<epic_internal> {}

    @hide_in_editor
    @experimental
    simulation_entity<native><epic_internal> := class<concrete><unique><transacts>(entity) {}

    @experimental
    slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: component
    }

    @experimental
    slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    sound_component<native><epic_internal> := class(component) {
      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # The component is being initialized, called when it is added to an entity
      OnInitialized<native><override>(): void

      # The component is being uninitialized, called when it is about to be removed from an entity
      OnUninitializing<native><override>(): void

      @experimental
      # Play the sound asset
      Play<native><public>(): void

      @experimental
      # Play the sound asset
      Stop<native><public>(): void

      @editable
      @replicated("RepNotify")
      @experimental
      # The path to the sound asset
      var Sound<native><public>: sound = external {}
    }

    @experimental
    # A sphere in three-dimensional space.
    sphere3<native><public> := class<final><concrete>(convex_volume3) {
      # Center point of the sphere.
      Center<native><public>: vector3 = external {}

      # Radius of the sphere.
      Radius<native><public>: float = external {}
    }

    @experimental
    # A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngle`and `OuterConeAngle`. Within the `InnerConeAngle` the light achieves full brightness. As you go from the extent of the inner radius to theextents of the `OuterConeAngle` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc ofillumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
    spot_light_component<native><public> := class<final>(point_light_component_base) {
      @experimental
      # The light’s inner cone shaped angle in degrees. Clamped between 1.0 and 80.00.
      var InnerConeAngle<public>: float = external {}

      @experimental
      # The light's 'outer cone shaped angle in degrees. Clamped between 1.0 and 80.00.
      var OuterConeAngle<public>: float = external {}
    }

    @experimental
    # Used to add tags to an entity. Tagged entities can then be queried using `entity.FindEntitiesWithTag` and `entity.FindParentEntitiesWithTag`.  * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
    tag_component<native><public> := class<final>(component, tag_view) {
      # Adds a tag to this component. Returns `true` if the tag was not present before being added.
      AddTag<native><public>(TagToAdd: tag)<transacts>: logic

      # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
      Has<native><override>(TagToCheck: tag)<computes><decides><reads>: void

      # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
      HasAll<native><override>(InTags: []tag)<computes><decides><reads>: void

      # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
      HasAny<native><override>(InTags: []tag)<computes><decides><reads>: void

      IsAllowedOnClient<override>(): logic = external {}

      OnAddedToScene<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      # Removes a tag from this component. Returns `true` if the tag was present before being removed.
      RemoveTag<native><public>(TagToRemove: tag)<transacts>: logic
    }

    @experimental
    # Used to render a string at the location of this entity.Dependencies:  * `transform_component` on the entity positions the `text_display_component`.
    text_display_component<native><public> := class<final>(component, enableable) {
      # Disable this object.
      Disable<native><override>(): void

      # Enable this object.
      Enable<native><override>(): void

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      # Succeeds if the component is enabled, fails if it is disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      OnBeginSimulation<native><override>(): void

      OnEndSimulation<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      @editable
      @replicated("RepNotify")
      # The color with which to display the text.
      var Color<native><public>: color = external {}

      @editable
      @replicated("RepNotify")
      # The time in seconds for the text to fully fade in.
      var FadeInTime<native><epic_internal>: float = external {}

      @editable
      @replicated("RepNotify")
      # The time in seconds for the text to fully fade out.
      var FadeOutTime<native><epic_internal>: float = external {}

      @experimental
      @editable
      @replicated("RepNotify")
      # Text to be displayed on the entity.
      var Text<native><public>: string = external {}
    }

    @experimental
    # Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run codebefore or after the physics system has updated your object, allowing you to affect or react to these updates.
    tick_events<native><public> := class<epic_internal> {
      DuringPhysics<native><epic_internal>: execution_listenable = external {}

      EndFrame<native><epic_internal>: execution_listenable = external {}

      EndPhysics<native><epic_internal>: execution_listenable = external {}

      # Listen `PostPhysics` to run your code after the physics system has updated your object this frame.
      PostPhysics<native><public>: execution_listenable = external {}

      # Listen `PrePhysics` to run your code before the physics system has updated your object this frame.
      PrePhysics<native><public>: execution_listenable = external {}

      StartPhysics<native><epic_internal>: execution_listenable = external {}
    }

    @experimental
    trace_hit<native><public> := struct<epic_internal> {
      # The component that we was hit by the traced component
      HitComponent<native><public>: ?component = external {}

      # The face normal at the ContactLocation. For a face contact this is the same as ContactNormal, but for edge and vertex contacts this will be the most opposing face sharing that edge or vertex
      HitFaceNormal<native><public>: vector3 = external {}

      # The normal at which the TracedComponent touched the HitComponent
      HitNormal<native><public>: vector3 = external {}

      # The point at which the TracedComponent touched the HitComponent
      HitPosition<native><public>: vector3 = external {}

      # The collision_channel_response based on the trace and HitComponent collision_channel and collision_responses
      HitResponse<native><public>: collision_channel_response = external {}

      # The distance traveled by the traced object when it hit the HitComponent
      TraceHitDistance<native><public>: float = external {}

      # The position of the traced object when it hit the HitComponent
      TraceHitPosition<native><public>: vector3 = external {}
    }

    @experimental
    trace_hit_container<native><public> := struct<epic_internal> {
      Hits<native><public>: []trace_hit
    }

    @experimental
    # Stores the world transform for an entity, which is used to position the entity.  * If you wish for an entity to update its transform when its parent entity transform changes then    you must also add a `parent_constraint_component` to the entity.
    transform_component<native><public> := class<final>(component) {
      # Returns the world transform of the entity.
      GetTransform<native><public>()<transacts>: transform

      # Internal epic method to know if this component is allowed on client
      IsAllowedOnClient<override>(): logic = external {}

      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void

      # Sets the world transform of the entity.
      SetTransform<native><public>(NewTransform: transform): void

      @editable
      # The value of `LocalTransform` is used when spawning an entity into the scene.  * When spawning an entity with a `transform_component`, the entity is offset by `LocalTransform` from the new parent entity's transform.  * When spawning an entity with a `transform_component` as a child of the simulation entity the entity is offset by `LocalTransform` from the simulation entity's transform.  * When spawning a prefab each sub-entity with a `transform_component` is offset by `LocalTransform` from its parent entities transform.
      var LocalTransform<native><public>: transform = external {}
    }

    @hide_in_editor
    @experimental
    typed_element_component<native><epic_internal> := class(component) {}

    @experimental
    # Base class for all three-dimensional volumes.
    volume3<native><public> := class<epic_internal>(shape3) {}

    @experimental
    volume_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override) {
      CollisionVolume<native><public>: convex_volume3 = external {}
    }
  }

  # Stably sort `Array` using `Less` where `Less` succeeding indicates `Left` should precede `Right`
  SortBy<native><public>(Array: []t, Less: type { __(: t, : t)<computes><decides>: void } where t: type)<computes>: []t

  using { /Verse.org/Native }
  # Module import path: /UnrealEngine.com/Temporary/SpatialMath
  SpatialMath<public> := module {
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyLocalRotationY<public>(AngleRadians: float)<transacts>: rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyLocalRotationZ<public>(AngleRadians: float)<transacts>: rotation = external {}

    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyPitch<native><public>(PitchUpRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyRoll<native><public>(RollClockwiseRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationX<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationY<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationZ<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyYaw<native><public>(YawRightRadians: float)<transacts>: rotation

    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation: rotation).RotateBy<native><public>(AdditionalRotation: rotation)<transacts>: rotation

    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation: rotation).UnrotateBy<native><public>(RotationToRemove: rotation)<transacts>: rotation

    # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation: rotation).GetAngle<native><public>()<computes><reads>: float

    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
    (Rotation: rotation).GetAxis<native><public>()<computes><reads>: vector3

    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
    (Rotation: rotation).GetLocalForward<public>()<transacts>: vector3 = external {}

    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
    (Rotation: rotation).GetLocalRight<public>()<transacts>: vector3 = external {}

    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
    (Rotation: rotation).GetLocalUp<public>()<transacts>: vector3 = external {}

    # Makes an `[]float` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation: rotation).GetYawPitchRollDegrees<native><public>()<computes><reads>: []float

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation: rotation).Invert<native><public>()<transacts>: rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation: rotation).IsFinite<native><public>()<converges><decides>: rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation: rotation).RotateVector<native><public>(Vector: vector3)<transacts>: vector3

    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation: rotation).UnrotateVector<native><public>(Vector: vector3)<transacts>: vector3

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: vector2).IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: vector2).IsFinite<public>()<computes><decides>: vector2 = external {}

    # Returns the length of `V`.
    (V: vector2).Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: vector2).LengthSquared<public>()<computes><reads>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: vector2).MakeUnitVector<native><public>()<computes><decides><reads>: vector2

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: vector3).IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: vector3).IsFinite<public>()<computes><decides>: vector3 = external {}

    # Returns the length of `V`.
    (V: vector3).Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: vector3).LengthSquared<public>()<computes>: float = external {}

    # Returns the squared length of `V` as if `V.Z = 0.0`.
    (V: vector3).LengthSquaredXY<public>()<computes><reads>: float = external {}

    # Returns the length of `V` as if `V.Z = 0.0`.
    (V: vector3).LengthXY<public>()<computes><reads>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: vector3).MakeUnitVector<native><public>()<computes><decides><reads>: vector3

    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    AngularDistance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

    # Returns the cross product of `V1` and `V2`.
    CrossProduct<native><public>(V1: vector3, V2: vector3)<computes><reads>: vector3

    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees: float)<computes><reads>: float = external {}

    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
    DistanceSquaredXY<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
    DistanceXY<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<public>(V1: vector2i, V2: vector2i)<computes>: int = external {}

    # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
    # Fails if any component of `V1` does not equal the corresponding component of `V2`.
    Equals<public>(V1: vector2i, V2: vector2i)<computes><decides>: vector2i = external {}

    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>: rotation

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1: vector2, V2: vector2, AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1: vector3, V2: vector3, AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From: vector2, To: vector2, Parameter: float)<computes><reads>: vector2 = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From: vector3, To: vector3, Parameter: float)<computes><reads>: vector3 = external {}

    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    MakeComponentWiseDeltaRotation<native><public>(RotationA: rotation, RotationB: rotation)<transacts>: rotation

    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    MakeRotation<native><public>(Axis: vector3, AngleRadians: float)<converges><reads>: rotation

    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    MakeRotationFromYawPitchRollDegrees<native><public>(
      YawRightDegrees: float,
      PitchUpDegrees: float,
      RollClockwiseDegrees: float
    )<converges><reads>: rotation

    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialRotation: rotation, FinalRotation: rotation)<transacts>: rotation

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector: vector3, FinalVector: vector3)<transacts>: rotation

    # Makes a `vector3` with all components `1.0`.
    Ones<epic_internal>()<computes>: vector3 = external {}

    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians: float)<computes><reads>: float = external {}

    # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction: vector2, SurfaceNormal: vector2)<computes><decides><reads>: vector2

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction: vector3, SurfaceNormal: vector3)<computes><decides><reads>: vector3

    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    Slerp<native><public>(
      InitialRotation: rotation,
      FinalRotation: rotation,
      Parameter: float
    )<transacts><decides>: rotation

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"Scale: {ToString(`InTransform.Scale`)} Rotation: {ToString(`InTransform.Rotation`)} Translation: {ToString(`InTransform.Translation`)}.
    ToString<native><epic_internal>(InTransform: transform)<computes><reads>: string

    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
    ToString<native><public>(Rotation: rotation)<computes><reads>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector2)<computes><reads>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector2i)<computes>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector3)<computes><reads>: string

    # Makes a `vector2` by converting the components of `V` to `float`s.
    ToVector2<public>(V: vector2i)<transacts>: vector2 = external {}

    # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
    ToVector2i<public>(V: vector2)<computes><decides><reads>: vector2i = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    TransformVector<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    TransformVectorNoScale<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

    # Makes a unit `vector3` pointing in the positive X axis (forward)
    XAxis<epic_internal>()<computes>: vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Y axis (right)
    YAxis<epic_internal>()<computes>: vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Z axis (up)
    ZAxis<epic_internal>()<computes>: vector3 = external {}

    # Makes a `vector3` with all components `0.0`.
    Zero<epic_internal>()<computes>: vector3 = external {}

    # Makes a `vector2` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: float, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: float, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: int, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left: vector2i, Right: int)<computes>: vector2i = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector3)<computes>: vector3 = external {}

    @editable
    @import_as("/Script/EpicGamesTemporary.FVerseRotation")
    rotation<native><public> := struct<concrete> {}

    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes> {
      @editable
      # The rotation of this `transform`.
      Rotation<native><public>: rotation = external {}

      @editable
      # The scale of this `transform`.
      Scale<native><public>: vector3 = external {}

      @editable
      # The location of this `transform`.
      Translation<native><public>: vector3 = external {}
    }

    # 2-dimensional vector with `float` components.
    vector2<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}
    }

    # 2-dimensional vector with `int` components.
    vector2i<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: int = external {}

      @editable
      Y<native><public>: int = external {}
    }

    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}

      @editable
      Z<native><public>: float = external {}
    }
  }

  # Module import path: /UnrealEngine.com/Temporary/Testing
  Testing<public> := module {
    # test_reporter is a test result aggregator that writes test results to a log stream and can compile and print a summary of test results.
    test_reporter<native><epic_internal> := class {
      # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
      DefaultLevel<native><epic_internal>: log_level = external {}

      # Returns a string of the test results summary.
      GetSummaryStrings<native><epic_internal>(?Level: log_level = external {}): []string

      # Logs `Message` to the `test_reporter` log stream. This allows users to add context for results to the summary.
      Log<native><epic_internal>(Message: string, ?Level: log_level = external {}): void

      # The name of this `test_reporter`. Used when displaying results summary.
      Name<native><epic_internal>: string = external {}

      # Prints a report of Verse API that was called in runtime, resets the report count
      PrintEpicAPICallSummary<native><epic_internal>(): void

      # Prints a summary of test results to the log stream and resets the test results.
      PrintSummary<native><epic_internal>(?Level: log_level = external {}): void

      # Report a test result of `Failed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestFailed<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Passed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestPassed<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Result`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestResult<native><epic_internal>(
        Message: string,
        Result: test_result,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Skipped`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestSkipped<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Resets test results.
      Reset<native><epic_internal>(): void
    }

    # test result outcomes
    test_result<native><epic_internal> := enum {
      Failed

      Passed

      Skipped
    }
  }

  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Assets }
  using { /Verse.org/Colors }
  using { /Verse.org/Simulation }
  using { /Verse.org/VerseEngine/Component }
  # Module import path: /UnrealEngine.com/Temporary/UI
  UI<public> := module {
    # Returns the `player_ui` vk_component associated with `Player`.
    # Fails if there is no `player_ui` associated with `Player`.
    GetPlayerUI<native><public>(Player: player)<transacts><decides>: player_ui

    # Make a canvas slot for fixed position widget.
    # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
    # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
    # The widget is not anchored and will not move if the parent is resized.
    # The Anchors is set to zero.
    MakeCanvasSlot<native><public>(Widget: widget, Position: vector2, ?Size: vector2 = external {}, ?ZOrder: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}, ?Alignment: vector2 = external {})<computes>: canvas_slot

    # The anchors of a `widget` determine its the position and sizing relative to its parent.
    # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
    anchors<native><public> := struct {
      # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
      Maximum<native><public>: vector2 = external {}

      # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
      Minimum<native><public>: vector2 = external {}
    }

    # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
    button<native><public> := class<final>(widget) {
      # Subscribable event that fires when the button is clicked.
      OnClick<public>(): listenable(widget_message) = external {}

      # Sets the child widget slot.
      SetWidget<native><public>(InSlot: button_slot): void

      # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
      Slot<native><public>: button_slot
    }

    # Slot for button widget.
    button_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
    canvas<native><public> := class<final>(widget) {
      # Adds a new child slot to the canvas.
      AddWidget<native><public>(Slot: canvas_slot): void

      # Removes a slot containing the given widget.
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []canvas_slot = external {}
    }

    # Slot for a canvas widget.
    canvas_slot<native><public> := struct {
      # Alignment is the pivot/origin point of the widget.
      # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
      Alignment<native><public>: vector2 = external {}

      # The border for the margin and how the widget is resized with its parent.
      # Values are defined between 0.0 and 1.0.
      Anchors<native><public>: anchors = external {}

      # The offset that defined the size and position of the widget.
      # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X, the Offsets.Bottom represent the distance in pixel from the Anchors Maximum.Y, effectively controlling the desired widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position and Offsets.Right and Offset.Bottom represent the widget size.
      Offsets<native><public>: margin = external {}

      # When true we use the widget's desired size. The size calculated by the Offsets is ignored.
      SizeToContent<native><public>: logic = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget

      # Z Order of this slot relative to other slots in this canvas panel.
      # Higher values are rendered last (and so they will appear to be on top)
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # A solid color widget.
    color_block<native><public> := class<final>(widget) {
      # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
      DefaultColor<native><public>: color = external {}

      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
      DefaultOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the widget's color.
      GetColor<native><public>(): color

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the widget's opacity.
      GetOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the widget's color.
      SetColor<native><public>(InColor: color): void

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the widgets's opacity.
      SetOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # `widget` horizontal alignment mode.
    horizontal_alignment<native><public> := enum {
      # Center `widget` horizontally within the slot.
      Center

      # `widget` fills the slot horizontally.
      Fill

      # Align `widget` to the left of the slot.
      Left

      # Align `widget` to the right of the slot.
      Right
    }

    # Tiling options values
    image_tiling<native><public> := enum {
      # Repeat/Wrap the image to fill the available space.
      Repeat

      # Stretch the image to fit the available space.
      Stretch
    }

    # Specifies the gap outside each edge separating a `widget` from its neighbors.
    # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
    margin<native><public> := struct {
      # The bottom edge spacing.
      Bottom<native><public>: float = external {}

      # The left edge spacing.
      Left<native><public>: float = external {}

      # The right edge spacing.
      Right<native><public>: float = external {}

      # The top edge spacing.
      Top<native><public>: float = external {}
    }

    # A widget to display a material.
    material_block<native><epic_internal> := class(widget) {
      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The image to render. Used only during initialization of the widget and not modified by SetImage.
      DefaultImage<native><public>: material

      # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
      DefaultTint<native><public>: color = external {}

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the image to render.
      GetImage<native><public>(): material

      # Gets the tint applied to the image.
      GetTint<native><public>(): color

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the image to render.
      SetImage<native><public>(InImage: material): void

      # Sets the tint applied to the image.
      SetTint<native><public>(InColor: color): void
    }

    # Used by`widget` orientation modes.
    orientation<native><public> := enum {
      # Orient `widget`s from left to right.
      Horizontal

      # Orient `widget`s from top to bottom.
      Vertical
    }

    # Overlay is a container consisting of widgets stacked on top of each other.
    overlay<native><public> := class<final>(widget) {
      # Add a new child slot to the overlay. Slots are added at the end.
      AddWidget<native><public>(Slot: overlay_slot): void

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []overlay_slot = external {}
    }

    # Slot for an overlay widget
    overlay_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # The main interface for adding and removing `widget`s to a player's UI.
    player_ui<native><public> := class<final><epic_internal>(vk_component) {
      # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
      AddWidget<native><public>(Widget: widget): void

      # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
      AddWidget<native><public>(Widget: widget, Slot: player_ui_slot): void

      # Removes `Widget` from this `player_ui`.
      RemoveWidget<native><public>(Widget: widget): void
    }

    # `widget` creation configuration options.
    player_ui_slot<native><public> := struct {
      # Controls `widget` input event consumption.
      InputMode<native><public>: ui_input_mode = external {}

      # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # Stack box is a container of a list of widgets stacked either vertically or horizontally.
    stack_box<native><public> := class<final>(widget) {
      # Add a new child slot to the stack box. Slots are added at the end.
      AddWidget<native><public>(Slot: stack_box_slot): void

      # The orientation of the stack box. Either stack widgets horizontal or vertical.
      Orientation<native><public>: orientation

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []stack_box_slot = external {}
    }

    # Slot for a stack_box widget
    stack_box_slot<native><public> := struct {
      # The available space will be distributed proportionally.
      # If not set, the slot will use the desired size of the widget.
      Distribution<native><public>: ?float = external {}

      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Base widget for text widget.
    text_base<native><public> := class<abstract>(widget) {
      # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
      DefaultJustification<native><public>: text_justification = external {}

      # The policy that determine what happens when the text is longer than its allowed length.
      # Used only during initialization of the widget and not modified by SetOverflowPolicy.
      DefaultOverflowPolicy<native><public>: text_overflow_policy = external {}

      # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
      DefaultText<native><localizes><public>: message = external {}

      # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
      DefaultTextColor<native><public>: color = external {}

      # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
      DefaultTextOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the text justification in the widget.
      GetJustification<native><public>(): text_justification

      # Gets the policy that determine what happens when the text is longer than its allowed length.
      GetOverflowPolicy<native><public>(): text_overflow_policy

      # Gets the text currently in the widget.
      GetText<native><public>(): string

      # Gets the color of the displayed text.
      GetTextColor<native><public>(): color

      # Gets the opacity of the displayed text.
      GetTextOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the text justification in the widget.
      SetJustification<native><public>(InJustification: text_justification): void

      # Sets the policy that determine what happens when the text is longer than its allowed length.
      SetOverflowPolicy<native><public>(InOverflowPolicy: text_overflow_policy): void

      # Sets the text displayed in the widget.
      SetText<native><public>(InText: message): void

      # Sets the color of the displayed text.
      SetTextColor<native><public>(InColor: color): void

      # Sets the opacity of the displayed text.
      SetTextOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # Text block widget. Displays text to the user.
    text_block_internal<native><epic_internal> := class(text_base) {}

    # Text justification values:
    #   Left: Justify the text logically to the left based on current culture.
    #   Center: Justify the text in the center.
    #   Right: Justify the text logically to the right based on current culture.
    # The Left and Right value will flip when the local culture is right-to-left.
    text_justification<native><public> := enum {
      Center

      InvariantLeft

      InvariantRight

      Left

      Right
    }

    # Text overflow policy values:
    #   Clip: Overflowing text will be clipped.
    #   Ellipsis: Overflowing text will be replaced with an ellipsis.
    text_overflow_policy<native><public> := enum {
      Clip

      Ellipsis
    }

    # A widget to display a texture.
    texture_block<native><public> := class(widget) {
      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The horizontal tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultHorizontalTiling<native><public>: image_tiling = external {}

      # The image to render. Used only during initialization of the widget and not modified by SetImage.
      DefaultImage<native><public>: texture

      # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
      DefaultTint<native><public>: color = external {}

      # The vertical tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultVerticalTiling<native><public>: image_tiling = external {}

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the image to render.
      GetImage<native><public>(): texture

      # Gets the tiling option.
      GetTiling<native><public>(): tuple(image_tiling, image_tiling)

      # Gets the tint applied to the image.
      GetTint<native><public>(): color

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the image to render.
      SetImage<native><public>(InImage: texture): void

      # Sets the tiling option when the image is smaller than the allocated size.
      SetTiling<native><public>(InHorizontalTiling: image_tiling, InVerticalTiling: image_tiling): void

      # Sets the tint applied to the image.
      SetTint<native><public>(InColor: color): void
    }

    # `widget` input consumption mode.
    ui_input_mode<native><public> := enum {
      # `widget` consumes all inputs
      All

      # `widget` does not consume any input.
      None
    }

    # Widget created from a umg_widget_class_asset.
    umg_widget<native><epic_internal> := class<epic_internal>(widget) {
      # The widget_blueprint asset to create.
      Asset<native><epic_internal>: umg_widget_class_asset

      GetNamedSlotOptional_<native><epic_internal>(NamedSlotName: []char)<transacts>: ?widget

      GetNamedSlot_<native><epic_internal>(NamedSlotName: []char)<transacts>: widget

      GetViewmodelOptional_<native><epic_internal>(ViewmodelType: type, ViewmodelName: []char)<transacts>: ViewmodelType

      GetViewmodel_<native><epic_internal>(ViewmodelType: type, ViewmodelName: []char)<transacts>: ViewmodelType

      SetNamedSlotOptional_<native><epic_internal>(NamedSlotName: []char, NamedSlotInstance: ?widget)<transacts>: void

      SetNamedSlot_<native><epic_internal>(NamedSlotName: []char, NamedSlotInstance: widget)<transacts>: void

      SetViewmodelOptional_<native><epic_internal>(
        ViewmodelType: type,
        ViewmodelName: []char,
        ViewmodelInstance: ViewmodelType
      )<transacts>: void

      SetViewmodel_<native><epic_internal>(
        ViewmodelType: type,
        ViewmodelName: []char,
        ViewmodelInstance: ViewmodelType
      )<transacts>: void
    }

    # Verse interface to native `umg asset`.
    umg_widget_class_asset<native><epic_internal> := class<computes><final>(client_asset) {}

    # `widget` vertical alignment mode.
    vertical_alignment<native><public> := enum {
      # Align `widget` to the bottom of the slot.
      Bottom

      # Center `widget` vertically within the slot.
      Center

      # `widget` fills the slot vertically.
      Fill

      # Align `widget` to the top of the slot.
      Top
    }

    # Base class for all UI elements drawn on the `player`'s screen.
    widget<native><public> := class<abstract><unique><epic_internal> {
      # Returns the `widget`'s parent `widget`.
      # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
      GetParentWidget<native><public>()<transacts><decides>: widget

      # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
      # Fails if this `widget` is not in the `player_ui`.
      GetRootWidget<native><public>()<transacts><decides>: widget

      # Returns the current `widget_visibility` state.
      GetVisibility<native><public>(): widget_visibility

      # `true` if this `widget` can be modified interactively by the player.
      IsEnabled<native><public>(): logic

      # Enables or disables whether the `player` can interact with this `widget`.
      SetEnabled<native><public>(InIsEnabled: logic): void

      # Shows or hides the `widget` without removing itself from the containing `player_ui`.
      # See `widget_visibility` for details.
      SetVisibility<native><public>(InVisibility: widget_visibility): void
    }

    # Parameters for `event`s signalled by a `widget`.
    widget_message<native><public> := struct {
      # The `player` that triggered the `event`.
      Player<native><public>: player

      # The `widget` that triggered the `event`.
      Source<native><public>: widget
    }

    # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
    widget_visibility<native><public> := enum {
      # The `widget` is invisible and does not occupy layout space.
      Collapsed

      # The `widget` is invisible and occupies layout space.
      Hidden

      # The `widget` is visible and occupies layout space.
      Visible
    }
  }
}

Tests<public> := module {
  # Module import path: /UnrealEngine.com/Tests/NexusUtils
  NexusUtils<public> := module {
    nexus_utils<native><epic_internal> := class {
      HelloWorld<native><public>(): void
    }
  }

  using { /UnrealEngine.com/Temporary/SpatialMath }
  # Module import path: /UnrealEngine.com/Tests/VersePrototypeGameplay
  VersePrototypeGameplay<public> := module {
    # Build a path from the StartLocation to the EndLocation using GridSize, GridOccupany, and navigation cost hueristics. Pop from the returned object_stack like so: "{if (Node:= i_nav_grid_node_2d[ReturnedPath.Pop[]]) #Use Node.GetLocation() }"
    BuildPathUsingAStar<public>(Args: build_path_astar_args)<transacts><decides>: []vector2i = external {}

    # Build a path from the StartLocation to the EndLocation using GridSize and GridOccupany.
    BuildPathUsingAStarSimple<public>(
      GridOccupancy: i_grid_occupancy,
      GridSize: vector2i,
      StartLocation: vector2i,
      EndLocation: vector2i
    )<transacts><decides>: []vector2i = external {}

    SimpleDistanceNavCost<public>(NodePosition: vector2i, NeighborPosition: vector2i)<transacts>: float = external {}

    SimpleManhattanDistance2D<public>(NodePosition: vector2i, NavTargetPosition: vector2i)<transacts>: float = external {}

    build_path_astar_args<public> := struct {
      ActualNavigationCost<public>: navigation_cost_delegate

      EndLocation<public>: vector2i

      EstimatedNavigationCost<public>: navigation_cost_delegate

      GridOccupancy<public>: i_grid_occupancy

      GridSize<public>: vector2i

      StartLocation<public>: vector2i
    }

    # Interface used for determining if a specific grid cell is considered occupied.
    i_grid_occupancy<public> := interface {
      # Fails if the grid location is not occupied.
      IsOccupied<public>(Location: vector2i)<transacts><decides>: void
    }

    # This method is used for calculating the cost from the specified node to the target position. See SimpleManhattanDistance2D for an example.
    navigation_cost_delegate<public> := type { __(: vector2i, : vector2i)<transacts>: float }

    simple_grid_occupancy<public> := class(i_grid_occupancy) {
      Init<public>(InGridSize: int): void = external {}

      IsOccupied<override>(Location: vector2i)<transacts><decides>: void = external {}

      SetOccupancy<public>(X: int, Y: int, Occupied: logic): void = external {}

      var GridSize<public>: int

      var OccupancyGrid<public>: [][]logic
    }
  }
}

using { /UnrealEngine.com/VGameplayRst/Transform }
using { /Verse.org/Colors }
using { /Verse.org/Restricted }
using { /Verse.org/VerseEngine/Entity }
using { /Verse.org/VerseExperimental }
# Module import path: /UnrealEngine.com/VGameplayRst
VGameplayRst<public> := module {
  # Module import path: /UnrealEngine.com/VGameplayRst/Audio
  Audio<public> := module {
    audio_component<native><public> := class<final>(vk_component) {
      BeginSound<native><public>(): void

      EndSound<native><public>(): void

      SetSound<native><epic_internal>(Sound: sound)<transacts>: void
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Components
  Components<public> := module {
    activation_state<native><public> := enum {
      Active

      Inactive
    }

    dynamic_activation_component<native><public> := class<final>(vk_component) {
      BeginTransition<native><public>(SecondsToChange: float, TargetState: activation_state): void

      LinkComponent<native><public>(ComponentToLink: vk_component): void

      Reset<native><public>(): void

      UnlinkComponent<native><public>(ComponentToUnlink: vk_component): void

      WaitForTransitionBegin<native><public>()<suspends>: void

      WaitForTransitionComplete<native><public>()<suspends>: void
    }

    script_component<native><public> := class<abstract><unique>(vk_component) {
      AddToCreateComponentList<native><public>(__dupe___unnamed_parameter_58: []subtype(vk_component)): void

      AddToRequiredComponentList<native><public>(__dupe___unnamed_parameter_59: []subtype(vk_component)): void

      GetAllComponentsOfType<native><public>(componentType: type)<transacts>: []vk_component

      GetComponentOfType<native><public>(componentType: type)<transacts>: ?vk_component

      GetFullname<native><public>(): string

      GetName<native><public>(): string

      IsEnabled<native><public>(): logic

      IsOwner<native><public>(Entity: vk_entity): logic

      OnBegin<native_callable><public>(): void = external {}

      OnCreate<native_callable><public>(): void = external {}

      OnEnabledChanged<native_callable><public>(Enabled: logic): void = external {}

      OnEnd<native_callable><public>(): void = external {}

      OnPostCreate<native_callable><public>(): void = external {}

      OnTick<native_callable><public>(DeltaTime: float): void = external {}

      SetEnabled<native><public>(Enabled: logic): void

      SetTickEnabled<native><public>(InIsEnabled: logic): void

      var AllowMultiple<native><public>: logic = external {}
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Datastore
  Datastore<public> := module {
    # Module import path: /UnrealEngine.com/VGameplayRst/Datastore/DatastoreComponent
    DatastoreComponent<epic_internal> := module {
      ClearAllDatastoreValues<native><public>(Player: player_component): void

      SetDatastoreValue<native><public>(Player: player_component, Key: string, Value: string): void

      SetDatastoreValueInt<native><public>(Player: player_component, Key: string, Value: int): void
    }

    datastore_component<native><public> := class<final>(vk_component) {}
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/EntityUtil
  EntityUtil<public> := module {
    # Creates a vk_component of the specified type on the vk_entity indicated by EntityID. Returns the spawned vk_component object
    CreateAndAddComponent<native><public>(EntityID: int, ComponentType: subtype(vk_component))<transacts>: vk_component

    # Attempts to find a sub vk_component of the specified type from the nominated vk_component. Returns it if found, otherwise fails
    GetComponentOfTypeFromComponent<native><public>(Component: vk_component, Type: type)<transacts><decides>: vk_component

    # Attempts to find a sub vk_component of the specified type from the nominated vk_component for the specified vk_entity. Returns it if found, otherwise fails
    GetComponentOfTypeFromComponentForEntity<native><public>(
      Component: vk_component,
      EntityID: int,
      Type: type
    )<transacts><decides>: vk_component

    # Spawn an empty vk_entity with the specified transform. Returns the EntityID
    SpawnEmptyEntity<native><public>(InTransform: transform, Name: string): int

    # Spawn an empty vk_entity with the specified transform. Returns the vk_entity.
    SpawnEntity<native><public>(InTransform: transform, Name: string): ?vk_entity

    # Spawn an empty vk_entity with the specified position. Returns the vk_entity
    SpawnEntity<native><public>(Position: vector3, Name: string): ?vk_entity

    # Spawn an empty vk_entity with the specified position, rotation, and scale. Returns the vk_entity
    SpawnEntity<native><public>(Position: vector3, Rotation: vector3, Scale: vector3, Name: string): ?vk_entity

    # Spawn an vk_entity from the specified assetPath with a transform. Returns the EntityID
    SpawnEntityFromAsset<native><public>(AssetPath: string, InTransform: transform, Name: string): int
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/GameObjects
  GameObjects<public> := module {
    CreateWorldAnchor<public>(Entity: vk_entity): ?world_anchor = external {}

    CreateWorldAnchor<public>(TagToFind: tag): ?world_anchor = external {}

    CreateWorldAnchor<public>(WorldPosition: vector3): ?world_anchor = external {}

    CreateWorldAnchor<public>(WorldPosition: vector3, DebugName: string): ?world_anchor = external {}

    world_anchor<public> := class<internal>(mutable_positionable) {
      Destroy<public>(): void = external {}

      GetComponent<public>()<transacts>: vk_component = external {}

      GetPosition<override>()<transacts>: vector3 = external {}

      SetPosition<override>(Position: vector3)<transacts>: void = external {}
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/LevelStreaming
  LevelStreaming<public> := module {
    level_streaming_component<native><public> := class<final>(vk_component) {
      RequestLoadLevel<native><epic_internal>(
        Level: level,
        Timeout: time_span,
        MessageToKickedPlayers: string
      ): ?sticky_event(void)

      RequestUnloadLevel<native><public>(Timeout: time_span, MessageToKickedPlayers: string): ?sticky_event(void)
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Lights
  Lights<public> := module {
    vk_point_light_component<native><public> := class<final>(vk_component) {
      GetAttenuationRadius<native><public>(): float

      GetColor<native><epic_internal>(): color

      GetIntensity<native><public>(): float

      GetSourceLength<native><public>(): float

      GetSourceRadius<native><public>(): float

      SetAttenuationRadius<native><public>(NewRadius: float): void

      SetColor<native><epic_internal>(NewColor: color): void

      SetIntensity<native><public>(NewIntensity: float): void

      SetSourceLength<native><public>(NewLength: float): void

      SetSourceRadius<native><public>(NewRadius: float): void
    }

    vk_spot_light_component<native><public> := class<final>(vk_component) {
      GetAttenuationRadius<native><public>(): float

      GetColor<native><epic_internal>(): color

      GetInnerConeAngle<native><public>(): float

      GetIntensity<native><public>(): float

      GetOuterConeAngle<native><public>(): float

      GetSourceLength<native><public>(): float

      GetSourceRadius<native><public>(): float

      SetAttenuationRadius<native><public>(NewRadius: float): void

      SetColor<native><epic_internal>(NewColor: color): void

      SetInnerConeAngle<native><public>(NewInnerConeAngle: float): void

      SetIntensity<native><public>(NewIntensity: float): void

      SetOuterConeAngle<native><public>(NewOuterConeAngle: float): void

      SetSourceLength<native><public>(NewLength: float): void

      SetSourceRadius<native><public>(NewRadius: float): void
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Messaging
  Messaging<public> := module {
    debug_command_component<native><public> := class(vk_component) {
      _WaitForCommand<native><public>(CommandId: string)<suspends>: string
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Physics
  Physics<public> := module {
    collision_shape_mode<native><public> := enum {
      CollisionBox

      CollisionCapsule

      CollisionMesh

      CollisionSphere
    }

    dof_movement_mode<native><public> := enum {
      CustomPlane

      Default

      NoConstraints

      SixDOF

      XYPlane

      XZPlane

      YZPlane
    }

    hit_result_legacy<native><public> := struct {
      # The location at which the hit occured on OtherEntityID
      HitLocation<native><public>: vector3

      # The surface normal at the location at which the hit occured on OtherEntityID
      HitNormal<native><public>: vector3

      # The vk_collision_component belonging to the entity hit
      OtherComponent<native><public>: vk_collision_component

      # The ID belonging to the entity hit
      OtherEntityID<native><public>: int
    }

    physics_trace<native><public> := class {
      InitPhysicsTrace<native><public>(
        ContextObject: vk_component,
        TraceCategory: physics_trace_category,
        TraceType: physics_trace_type,
        TraceShape: physics_trace_shape,
        TraceChannel: physics_trace_channel,
        Start: vector3,
        End: vector3,
        IgnoreCallingEntity: logic,
        TraceExtent: vector3,
        TraceRadius: float,
        ProfileName: string
      ): void

      WaitPhysicsTrace<native><public>()<suspends>: []hit_result_legacy
    }

    physics_trace_category<native><public> := enum {
      Channel

      Object

      Profile
    }

    physics_trace_channel<native><public> := enum {
      Camera

      Destructible

      GameTraceChannel1

      GameTraceChannel2

      GameTraceChannel3

      GameTraceChannel4

      GameTraceChannel5

      GameTraceChannel6

      Pawn

      PhysicsBody

      Vehicle

      Visibility

      WorldDynamic

      WorldStatic
    }

    physics_trace_shape<native><public> := enum {
      Box

      Line

      ShapeSphere
    }

    physics_trace_type<native><public> := enum {
      Multi

      Single

      Test
    }

    vk_collision_component<native><public> := class<final>(vk_component) {
      GetCollisionProfileName<native><public>()<transacts>: string

      GetCollisionShapeMode<native><public>()<transacts>: collision_shape_mode

      GetEnabled<native><public>(): logic

      GetGravityEnabled<native><public>(): logic

      GetMovable<native><public>()<transacts>: logic

      GetSendHitEventsOnCollide<native><public>()<transacts>: logic

      GetSendOverlapEvents<native><public>()<transacts>: logic

      GetUseContinuousCollisionDetection<native><public>(): logic

      SetBoxCollisionShapeMode<native><public>(BoxExtent: vector3)<transacts>: void

      SetCapsuleCollisionShapeMode<native><public>(Height: float, Radius: float)<transacts>: void

      SetCollisionProfileName<native><public>(CollisionProfile: string)<transacts>: void

      SetCustomDegreeOfFreedomConstrain<native><public>(CustomMovementPlaneNormal: vector3): void

      SetDegreeOfFreedomContraint<native><public>(MovementMode: dof_movement_mode): void

      SetEnabled<native><public>(InIsEnabled: logic): void

      SetGravityEnabled<native><public>(EnableGravity: logic): void

      SetMeshCollisionShapeMode<native><epic_internal>(Mesh: mesh)<transacts>: void

      # Looks at the mesh_component for the mesh.
      SetMeshCollisionShapeMode<native><public>()<transacts>: void

      SetMovable<native><public>(IsMovable: logic)<transacts>: void

      SetSendHitEventsOnCollide<native><public>(EnableHitEvents: logic)<transacts>: void

      SetSendOverlapEvents<native><public>(EnableOverlapEvents: logic)<transacts>: void

      SetSphereCollisionShapeMode<native><public>(Radius: float)<transacts>: void

      SetUseContinuousCollisionDetection<native><public>(UseCCD: logic): void

      WaitBeginOverlap<native><public>()<suspends>: vk_overlap_result

      WaitEndOverlap<native><public>()<suspends>: vk_overlap_result

      WaitHit<native><public>()<suspends>: hit_result_legacy
    }

    vk_overlap_result<native><public> := class {
      FromSweep<native><public>: logic

      OtherComponent<native><public>: vk_collision_component

      OtherEntityID<native><public>: int

      SweepHitLocation<native><public>: vector3

      SweepHitNormal<native><public>: vector3
    }
  }

  # Module import path: /UnrealEngine.com/VGameplayRst/Transform
  Transform<public> := module {
    mutable_positionable<native><public> := interface(positionable) {
      SetPosition<public>(v: vector3)<transacts>: void
    }

    mutable_rotatable<native><public> := interface(rotatable) {
      ApplyAdditionalRotation<public>(r: rotation): void

      SetForwardVectorFromXY<public>(x: vector3, y: vector3): void

      SetRotation<public>(r: rotation)<transacts>: void
    }

    mutable_scalable<native><public> := interface(scalable) {
      SetScale<public>(v: vector3)<transacts>: void
    }

    position_component<native><public> := class<final>(vk_component, mutable_positionable) {
      AddToPosition<native><public>(v: vector3): void

      GetPosition<override><native>()<transacts>: vector3

      SetPosition<override><native>(v: vector3)<transacts>: void
    }

    positionable<native><public> := interface {
      GetPosition<public>()<transacts>: vector3
    }

    rotatable<native><public> := interface {
      ForwardVector<public>()<transacts>: vector3

      RightVector<public>()<transacts>: vector3

      Rotation<public>()<transacts>: rotation

      UpVector<public>()<transacts>: vector3
    }

    rotation_component<native><public> := class<final>(vk_component, mutable_rotatable) {
      ApplyAdditionalRotation<override><native>(r: rotation): void

      ForwardVector<override>()<transacts>: vector3 = external {}

      RightVector<override>()<transacts>: vector3 = external {}

      Rotation<override><native>()<transacts>: rotation

      SetForwardVectorFromXY<override><native>(x: vector3, y: vector3): void

      SetRotation<override><native>(r: rotation)<transacts>: void

      UpVector<override>()<transacts>: vector3 = external {}
    }

    scalable<native><public> := interface {
      GetScale<public>()<transacts>: vector3
    }

    scale_component<native><public> := class<final>(vk_component, mutable_scalable) {
      AddToScale<native><public>(v: vector3): void

      GetScale<override><native>()<transacts>: vector3

      SetScale<override><native>(v: vector3)<transacts>: void
    }
  }
}

using { /UnrealEngine.com/Temporary/SceneGraph }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags }
# Module import path: /UnrealEngine.com/VerseQueryTestSuite
VerseQueryTestSuite<public> := module {
  @hide_in_editor
  tag_component_test_tag_bike<native><epic_internal> := class(tag_component_test_tag_vehicle) {}

  @hide_in_editor
  tag_component_test_tag_car<native><epic_internal> := class(tag_component_test_tag_vehicle) {}

  @hide_in_editor
  tag_component_test_tag_datsun<native><epic_internal> := class(tag_component_test_tag_car) {}

  @hide_in_editor
  tag_component_test_tag_norton<native><epic_internal> := class(tag_component_test_tag_bike) {}

  @hide_in_editor
  tag_component_test_tag_vehicle<native><epic_internal> := class(tag) {}

  @hide_in_editor
  @experimental
  verse_query_not_used_test_entity<native><epic_internal> := class(entity) {}

  @hide_in_editor
  @experimental
  verse_query_other_test_component<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}
  }

  @hide_in_editor
  verse_query_tag_animal<native><epic_internal> := class(tag) {}

  @hide_in_editor
  verse_query_tag_cat<native><epic_internal> := class(verse_query_tag_animal) {}

  @hide_in_editor
  verse_query_tag_cheddar_cat<native><epic_internal> := class(verse_query_tag_cat) {}

  @hide_in_editor
  verse_query_tag_dog<native><epic_internal> := class(verse_query_tag_animal) {}

  @hide_in_editor
  verse_query_tag_jello_cat<native><epic_internal> := class(verse_query_tag_cat) {}

  @hide_in_editor
  verse_query_tag_kimchi_dog<native><epic_internal> := class(verse_query_tag_dog) {}

  @hide_in_editor
  verse_query_tag_pollo_dog<native><epic_internal> := class(verse_query_tag_dog) {}

  @hide_in_editor
  @experimental
  verse_query_test_component<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}
  }

  @hide_in_editor
  @experimental
  verse_query_test_entity<native><epic_internal> := class(entity) {}

  @hide_in_editor
  @experimental
  verse_query_unused_test_component<native><epic_internal> := class(component) {
    IsAllowedOnClient<override>(): logic = external {}
  }
}

WorldPartition<public> := module {
  using { /Verse.org/Assets }
  # Module import path: /UnrealEngine.com/WorldPartition/VerseWorldPartition
  VerseWorldPartition<public> := module {
    GetDataLayerManager<native><public>()<transacts>: ?data_layer_manager

    data_layer_asset<native><public> := class<computes><final><epic_internal>(asset) {}

    # Data Layer Manager used to get/set the runtime state of Data Layers.
    data_layer_manager<native><public> := class<concrete> {
      # Returns data layer effective runtime state.
      GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset: data_layer_asset): data_layer_runtime_state

      # Sets data layer runtime state.
      SetDataLayerRuntimeState<native><public>(
        DataLayerAsset: data_layer_asset,
        State: data_layer_runtime_state,
        IsRecursive: logic
      ): logic
    }

    # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Data Layer runtime states.
    data_layer_runtime_state<native><public> := enum {
      # Activated (meaning loaded and visible)
      Activated

      # Loaded (meaning loaded but not visible)
      Loaded

      # Unloaded
      Unloaded
    }
  }
}