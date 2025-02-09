# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-31.30-CL-36600465
#################################################

AI<public> := module {
  # Returns the `npc_behavior` for `InAgent`.
  (InAgent: agent).GetNPCBehavior<native><public>()<transacts><decides>: npc_behavior

  # Get the focus_interface interface for the specified character.
  (InCharacter: fort_character).GetFocusInterface<native><public>()<transacts><decides>: focus_interface

  # Get the current fort_leashable interface for the specified character.
  (InCharacter: fort_character).GetFortLeashable<native><public>()<transacts><decides>: fort_leashable

  # Get the navigatable interface for the specified character
  (InCharacter: fort_character).GetNavigatable<native><public>()<transacts><decides>: navigatable

  @experimental
  # Returns the `entity` for `InNPCBehavior`.
  (InNPCBehavior: npc_behavior).GetEntity<native><public>()<computes><decides><reads>: entity

  using { /Fortnite.com/AI/CompanionAI/PingCommand }
  using { /Fortnite.com/Characters }
  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Simulation }
  # Module import path: /Fortnite.com/AI/CompanionAI
  CompanionAI<public> := module {
    @experimental
    (Agent: agent).GetTeamMembers<native><epic_internal>()<transacts>: []agent

    @experimental
    (Character: fort_character).GetNPCLeashRadius<native><epic_internal>()<transacts>: tuple(float, float)

    @experimental
    (Character: fort_character).IsBeingDBNOCarried<native><epic_internal>()<transacts><decides>: void

    @experimental
    (InEntity: entity).GetAgent<native><epic_internal>()<transacts>: ?agent

    # Module import path: /Fortnite.com/AI/CompanionAI/PingCommand
    PingCommand<epic_internal> := module {
      @experimental
      command_type<native><epic_internal> := enum {
        back_to_default

        back_to_me

        go_to

        hold_position

        invalid

        revive
      }

      @experimental
      entity_type<native><epic_internal> := enum {
        building_actor

        container

        pawn

        pickup

        player_built_actor

        undefined

        weapon
      }
    }

    @experimental
    ToString<epic_internal>(Type: command_type)<transacts>: string = external {}

    @experimental
    ToString<epic_internal>(Type: entity_type)<transacts>: string = external {}

    @hide_in_editor
    @experimental
    companion_ai<epic_internal> := class(npc_behavior) {
      OnBegin<override>()<suspends>: void = external {}
    }

    @hide_in_editor
    @experimental
    default_npc_behavior<epic_internal> := class(npc_behavior) {}

    @experimental
    # Fortnite NPC AI Management
    follower_actions_component<native><epic_internal> := class(fort_guard_actions_component) {
      @experimental
      IsFollowingBehaviorEnabled<native><epic_internal>()<transacts>: logic

      @experimental
      # Run the NPC default behavior
      RunDefaultBehavior<native><epic_internal>()<suspends>: ai_action_result
    }

    @experimental
    @hide_in_editor
    ping_component<native><epic_internal> := class<epic_internal>(fort_ai_component) {
      @experimental
      AreNPCCommandsEnabled<native><epic_internal>()<transacts>: logic

      @experimental
      CanAcceptPingCommand<native><epic_internal>()<transacts>: logic

      @experimental
      ConvertPingToAttack<native><epic_internal>(AttackTarget: agent): void

      @experimental
      ConvertedEvent<epic_internal>(): subscribable(tuple()) = external {}

      @experimental
      DeclineNPCCommand<native><epic_internal>(PlayUnableToPerformAction: logic): void

      @experimental
      EnableCommandWheel<native><epic_internal>(Enabled: logic): void

      @experimental
      GetCurrentNPCCommand<native><epic_internal>()<transacts><decides>: ping_info

      @experimental
      IsAttackCommandEnabled<native><epic_internal>()<transacts>: logic

      @experimental
      OnNPCCommand<native><epic_internal>()<suspends>: ?ping_info

      @experimental
      UnconvertedEvent<epic_internal>(): subscribable(tuple()) = external {}
    }

    @experimental
    ping_info<native><epic_internal> := struct {
      @experimental
      Emitter<native><public>: ?agent

      @experimental
      EntityType<native><public>: entity_type

      @experimental
      Location<native><public>: vector3

      @experimental
      LocationOnHorizontalSurface<native><public>: logic

      @experimental
      Target<native><public>: ?entity

      @experimental
      Type<native><public>: command_type
    }
  }

  @experimental
  # Generate a navigation_target from an entity
  MakeNavigationTarget<native><public>(Entity: entity)<decides>: navigation_target

  # Generate a navigation_target from any position
  MakeNavigationTarget<native><public>(Position: vector3): navigation_target

  # Generate a navigation_target from an agent
  MakeNavigationTarget<native><public>(Target: agent): navigation_target

  @experimental
  # Create a `navigation_target` from a `target_info`.
  MakeNavigationTarget<native><public>(TargetInfo: target_info): navigation_target

  @experimental
  # Result of an AI action
  ai_action_result<native><public> := enum {
    # The action has been canceled before completion
    Canceled

    # The action was not allowed to start
    Disallowed

    # The action has failed during its execution
    Failure

    # The action has been successfully executed
    Success
  }

  @experimental
  ai_target_component<native><epic_internal> := class<final>(component) {
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>(): logic = external {}
  }

  @experimental
  # Perception settings for damage.
  damage_perception_settings<native><epic_internal> := class<final><concrete> {
    @experimental
    @editable
    # Specifies duration in seconds after damage stimuli generated by this sense become forgotten. 0 means never.
    MaxStimulusDuration<native><public>: float = external {}

    @experimental
    @editable
    # Specifies if damage perception is enabled.
    SenseEnabled<native><public>: logic = external {}
  }

  focus_interface<native><public> := interface<epic_internal> {
    # Look At specified Agent. Will never complete unless interrupted.
    MaintainFocus<public>(Agent: agent)<suspends>: void

    # Look At specified location. Will never complete unless interrupted.
    MaintainFocus<public>(Location: vector3)<suspends>: void
  }

  @experimental
  fort_ai_actions_component<native><epic_internal> := class<abstract>(fort_ai_component) {}

  @experimental
  fort_ai_component<native><epic_internal> := class<abstract>(component) {}

  @experimental
  @hide_in_editor
  # Fortnite Guards AI actions management
  fort_guard_actions_component<native><public> := class<epic_internal>(fort_npc_actions_component) {
    @experimental
    # Attack the navigation obstacle
    Attack<native><epic_internal>(Target: fort_obstacle_info)<suspends>: ai_action_result

    @experimental
    # Attack the target
    Attack<native><public>(Target: target_info)<suspends>: ai_action_result

    @experimental
    # Change stance to crouch
    Crouch<native><epic_internal>()<suspends>: ai_action_result

    @experimental
    # Move in range to attack the current target
    MoveInRangeToAttack<native><public>()<suspends>: ai_action_result

    @experimental
    # Play an emote
    PlayEmote<native><epic_internal>(Emote: emote)<suspends>: ai_action_result

    @experimental
    # Play a random emote from the character emotes bank
    PlayRandomEmote<native><public>()<suspends>: ai_action_result

    @experimental
    # Revive the specified target
    Revive<native><public>(Target: agent)<suspends>: ai_action_result

    @experimental
    # Roam around the current position. Use the fort_leashable_component to specify the radius, else will roam anywhere.
    RoamAround<native><public>(?MovementType: movement_type = external {})<suspends>: navigation_result

    @experimental
    # Go back to standing
    StandUp<native><epic_internal>(): ai_action_result

    @experimental
    # Change movement speed to sprint and switch to tactical sprint when energy is full.
    TacticalSprint<native><epic_internal>()<suspends>: ai_action_result
  }

  @experimental
  # The different alert levels of a guard.
  fort_guard_alert_level<native><public> := enum {
    # The guard has identified a hostile target.
    Alerted

    # The guard has identified a hostile target but can't see it any more.
    LostTarget

    # The guard has seen a hostile target but hasn't identified it yet.
    Suspicious

    # The guard has not detected any hostile target.
    Unaware
  }

  @experimental
  @hide_in_editor
  # Fortnite guard perception management
  fort_guard_perception_component<native><public> := class<epic_internal>(fort_npc_perception_component) {
    @experimental
    # Event when the alert level of the guard has changed.
    AlertLevelChangedEvent<native><public>: listenable(fort_guard_alert_level) = external {}

    @experimental
    # Event when the current target has changed.
    CurrentTargetChangedEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Get the current alert level of the guard.
    GetAlertLevel<native><public>()<computes><reads>: fort_guard_alert_level

    @experimental
    # Get the current alert level of a target for the guard.
    GetAlertLevel<native><public>(Target: entity)<computes><decides><reads>: fort_guard_alert_level

    @experimental
    # Get information about the current target.
    GetCurrentTargetInfo<native><public>()<computes><decides><reads>: target_info

    @experimental
    # Get information about the potential current obstacle
    GetObstacleInfo<native><epic_internal>()<computes><decides><reads>: fort_obstacle_info

    @experimental
    # Event when a new best obstacle is detected
    ObstacleChangedEvent<native><epic_internal>: listenable(fort_obstacle_info) = external {}
  }

  fort_leashable<native><public> := interface<epic_internal> {
    # Removes the current leash.
    ClearLeash<public>(): void

    # Set the agent to be the new center of the leash.
    #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
    #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
    SetLeashAgent<public>(Agent: agent, InnerRadius: float, OuterRadius: float): void

    # Set custom leash position.
    #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
    #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
    SetLeashPosition<public>(Location: vector3, InnerRadius: float, OuterRadius: float): void
  }

  @experimental
  @hide_in_editor
  # Fortnite NPC leash management
  fort_leashable_component<native><public> := class<epic_internal>(fort_ai_component, fort_leashable) {
    @experimental
    # Removes the current leash.
    ClearLeash<native><override>(): void

    @experimental
    # Set the agent to be the new center of the leash.
    #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
    #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
    SetLeashAgent<native><override>(Agent: agent, InnerRadius: float, OuterRadius: float): void

    @experimental
    # Set custom leash position.
    #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
    #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
    SetLeashPosition<native><override>(Location: vector3, InnerRadius: float, OuterRadius: float): void
  }

  @experimental
  @hide_in_editor
  # Fortnite NPC AI actions management
  fort_npc_actions_component<native><public> := class<epic_internal>(
    fort_ai_actions_component,
    navigatable,
    focus_interface
  ) {
    @experimental
    # Fires the currently equipped weapon.
    FireCurrentWeapon<native><epic_internal>()<suspends>: void

    @experimental
    # Return the current destination of the character
    GetCurrentDestination<native><override>()<transacts><decides>: vector3

    @experimental
    # Add spare ammo for the currently equipped weapon.
    GiveAmmoForCurrentWeapon<native><epic_internal>(AmmoQuantity: int)<suspends>: void

    @experimental
    # Look At specified Agent. Will never complete unless interrupted.
    MaintainFocus<native><override>(Agent: agent)<suspends>: void

    @experimental
    # Look At specified location. Will never complete unless interrupted.
    MaintainFocus<native><override>(Location: vector3)<suspends>: void

    @experimental
    # Navigate toward the specified target
    NavigateTo<native><override>(
      Target: navigation_target,
      ?MovementType: movement_type = external {},
      ?ReachRadius: float = external {},
      ?AllowPartialPath: logic = external {}
    )<suspends>: navigation_result

    @experimental
    # Try to reload the currently equipped weapon.
    ReloadCurrentWeapon<native><epic_internal>()<suspends>: logic

    @experimental
    # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
    SetMovementSpeedMultiplier<native><override>(Multiplier: float): void

    @experimental
    # Stop navigation
    StopNavigation<native><override>(): void

    @experimental
    # Wait for a specific duration
    Wait<native><override>(?Duration: float = external {})<suspends>: void
  }

  @experimental
  # NPC Component
  fort_npc_component<native><epic_internal> := class(fort_game_component) {
    OnEndSimulation<override><final>(): void = external {}

    OnRoundBegin<override><final>()<suspends>: void = external {}

    OnRoundEnd<override><final>(): void = external {}
  }

  @experimental
  @hide_in_editor
  # Fortnite NPC perception management
  fort_npc_perception_component<native><public> := class<epic_internal>(fort_ai_component) {
    @experimental
    # Get the last known position of a target.
    GetLastKnownPosition<native><public>(Target: entity)<computes><decides><reads>: vector3

    @experimental
    # Event when a target is added.
    TargetAddedEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Event when a target is heard. Hearing sense must be active.
    TargetHeardEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Event when the info about a target has been updated.
    TargetInfoUpdatedEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Event when a target was removed.
    TargetRemovedEvent<native><public>: listenable(entity) = external {}

    @experimental
    # Event when a target is seen. Sight sense must be active.
    TargetSeenEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Event when a target is touched. Touch sense must be active.
    TargetTouchedEvent<native><public>: listenable(target_info) = external {}

    @experimental
    # Information about all detected targets.
    var<private> DetectedTargets<native><public>: []target_info
  }

  @experimental
  # Information about a perceived obstacle.
  fort_obstacle_info<native><epic_internal> := struct<epic_internal> {
    @experimental
    Location<native><public>: vector3

    @experimental
    Obstacle<native><public>: entity

    @experimental
    Status<native><public>: fort_obstacle_status
  }

  @experimental
  fort_obstacle_status<native><epic_internal> := enum {
    blocked_by_obstacle

    incoming_obstacle

    trap_obstacle
  }

  @experimental
  # Perception settings for hearing.
  hearing_perception_settings<native><epic_internal> := class<final><concrete> {
    @experimental
    @editable
    # Specifies if this sense is able to detect enemies.
    EnemiesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect friendlies.
    FriendliesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Maximum hearing distance in meters to notice a target.
    HearingRange<native><public>: float = external {}

    @experimental
    @editable
    # Specifies duration in seconds after audio stimuli generated by this sense become forgotten. 0 means never.
    MaxStimulusDuration<native><public>: float = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect neutral targets.
    NeutralsDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies if hearing is enabled.
    SenseEnabled<native><public>: logic = external {}
  }

  movement_style<native><epic_internal> := enum {
    Running

    Walking
  }

  movement_type<native><public> := class<concrete><final><computes><epic_internal> {
    MovementStyle<native><epic_internal>: movement_style = external {}
  }

  # Module import path: /Fortnite.com/AI/movement_types
  movement_types<public> := module {
    Running<public>: movement_type = external {}

    Walking<public>: movement_type = external {}
  }

  navigatable<native><public> := interface<epic_internal> {
    # Return the current destination of the character
    GetCurrentDestination<public>()<transacts><decides>: vector3

    # Navigate toward the specified target
    NavigateTo<public>(
      Target: navigation_target,
      ?MovementType: movement_type = external {},
      ?ReachRadius: float = external {},
      ?AllowPartialPath: logic = external {}
    )<suspends>: navigation_result

    # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
    SetMovementSpeedMultiplier<public>(Multiplier: float): void

    # Stop navigation
    StopNavigation<public>(): void

    # Wait for a specific duration
    Wait<public>(?Duration: float = external {})<suspends>: void
  }

  # Result of a navigation request
  navigation_result<native><public> := enum {
    # The navigating agent is blocked
    Blocked

    # Navigation has been interrupted before completion
    Interrupted

    # The destination has been partially reached (AllowPartialPath was used)
    PartiallyReached

    # The destination has been reached
    Reached

    # The destination cannot be reached
    Unreachable
  }

  navigation_target<native><public> := class<epic_internal> {}

  # Inherit from this to create a custom NPC behavior.
  # The npc_behavior can be defined for a character in a CharacterDefinition asset, or in a npc_spawner_device.
  npc_behavior<native><public> := class<abstract> {
    # Returns the agent associated with this behavior.
    GetAgent<native><public>()<transacts><decides>: agent

    # This function is called when the NPC is added to the simulation.
    OnBegin<native_callable><public>()<suspends>: void = external {}

    # This function is called when the NPC is removed from the simulation.
    OnEnd<native_callable><public>(): void = external {}
  }

  @experimental
  npc_behavior_component<native><epic_internal> := class(fort_game_component) {
    OnRoundEnd<override><final>(): void = external {}

    SetNPCBehavior<native><public>(NewNPCBehavior: npc_behavior)<transacts>: void

    @editable_non_concrete
    var<private> NPCBehavior<native><public>: npc_behavior
  }

  @experimental
  # Perception settings for sight.
  sight_perception_settings<native><epic_internal> := class<final><concrete> {
    @experimental
    @editable
    # Specifies if this sense is able to detect enemies.
    EnemiesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect friendlies.
    FriendliesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Maximum sight distance in meters to keep on seeing a target.
    # This value will be clamped between 'SightRadius' and 300 meters.
    LoseSightRadius<native><public>: float = external {}

    @experimental
    @editable
    # Specifies duration in seconds after sight stimuli generated by this sense become forgotten. 0 means never.
    MaxStimulusDuration<native><public>: float = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect neutral targets.
    NeutralsDetected<native><public>: logic = external {}

    @experimental
    @editable
    # How far to the side AI can see, in radians.
    # The value represents the angle measured in relation to the forward vector, not the whole range.
    PeripheralVisionAngle<native><public>: float = external {}

    @experimental
    @editable
    # Specifies if sight is enabled.
    SenseEnabled<native><public>: logic = external {}

    @experimental
    @editable
    # Maximum sight distance in meters to notice a target.
    # This value will be clamped between 0 and 300 meters.
    SightRadius<native><public>: float = external {}
  }

  @experimental
  # Information about a perceived target.
  target_info<native><public> := struct<epic_internal> {
    @experimental
    # Attitude toward this target.
    Attitude<native><public>: team_attitude

    @experimental
    # True if the target can be seen.
    HasLineOfSight<native><public>: logic

    @experimental
    # The source of the detection stimuli.
    Target<native><public>: entity
  }

  @experimental
  # Perception settings for touch.
  touch_perception_settings<native><epic_internal> := class<final><concrete> {
    @experimental
    @editable
    # Specifies if this sense is able to detect enemies.
    EnemiesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect friendlies.
    FriendliesDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies duration in seconds after touch stimuli generated by this sense become forgotten. 0 means never.
    MaxStimulusDuration<native><public>: float = external {}

    @experimental
    @editable
    # Specifies if this sense is able to detect neutral targets.
    NeutralsDetected<native><public>: logic = external {}

    @experimental
    @editable
    # Specifies if touch perception is enabled.
    SenseEnabled<native><public>: logic = external {}
  }
}

# Module import path: /Fortnite.com/Animation
Animation<public> := module {
  # Module import path: /Fortnite.com/Animation/PlayAnimation
  PlayAnimation<public> := module {
    # Get the play_animation_controller for the specified character.
    (InCharacter: fort_character).GetPlayAnimationController<native><public>()<transacts><decides>: play_animation_controller

    @experimental
    @hide_in_editor
    fort_npc_play_animation_component<native><public> := class<epic_internal>(
      fort_ai_actions_component,
      play_animation_controller
    ) {
      Play<override>(
        AnimationSequence: animation_sequence,
        ?PlayRate: float = external {},
        ?StartPositionSeconds: float = external {},
        ?BlendInTime: float = external {},
        ?BlendOutTime: float = external {}
      ): play_animation_instance = external {}

      PlayAndAwait<override>(
        AnimationSequence: animation_sequence,
        ?PlayRate: float = external {},
        ?StartPositionSeconds: float = external {},
        ?BlendInTime: float = external {},
        ?BlendOutTime: float = external {}
      )<suspends>: play_animation_result = external {}
    }

    # An interface for playing an animation on an object.
    play_animation_controller<native><public> := interface<epic_internal> {
      # Start an animation sequence and obtain an instance to query and manipulate.
      Play<public>(
        AnimationSequence: animation_sequence,
        ?PlayRate: float = external {},
        ?StartPositionSeconds: float = external {},
        ?BlendInTime: float = external {},
        ?BlendOutTime: float = external {}
      ): play_animation_instance

      # Play an animation sequence.
      PlayAndAwait<public>(
        AnimationSequence: animation_sequence,
        ?PlayRate: float = external {},
        ?StartPositionSeconds: float = external {},
        ?BlendInTime: float = external {},
        ?BlendOutTime: float = external {}
      )<suspends>: play_animation_result
    }

    # An animation instance created from play_animation_controller.Play that can be queried and manipulated.
    play_animation_instance<native><public> := class<epic_internal> {
      # Helper function that waits for the animation to complete or be interrupted.
      Await<public>()<suspends>: play_animation_result = external {}

      # Event triggered when the animation has finished to blend out.
      BlendedInEvent<native><public>: listenable(tuple()) = external {}

      # Event triggered when the animation is beginning to blend out.
      BlendingOutEvent<native><public>: listenable(tuple()) = external {}

      # Event triggered when the animation is completed.
      CompletedEvent<native><public>: listenable(tuple()) = external {}

      # Returns the state of the animation playback.
      GetState<native><public>()<transacts>: play_animation_state

      # Event triggered when the animation is interrupted.
      InterruptedEvent<native><public>: listenable(tuple()) = external {}

      # Helper function that succeeds if the state is Playing, BlendingIn, or BlendingOut.
      IsPlaying<public>()<transacts><decides>: void = external {}

      # Stops the animation.
      Stop<native><public>(): void
    }

    # Result of a PlayAndAwait request.
    play_animation_result<native><public> := enum {
      # The animation completed successfully.
      Completed

      # The animation encountered an error during initialization or whilst playing.
      Error

      # The animation was interrupted whilst playing.
      Interrupted
    }

    # The potential states of a play animation instance.
    play_animation_state<native><public> := enum {
      # The animation is blending in.
      BlendingIn

      # The animation is playing and is blending out.
      BlendingOut

      # The animation completed successfully.
      Completed

      # An error occurred at creation or during playback.
      Error

      # The animation was interrupted externally.
      Interrupted

      # The animation has blended in, is playing, and has not begun blending out.
      Playing

      # The animation was stopped internally.
      Stopped
    }
  }
}

# Module import path: /Fortnite.com/Assets
Assets<public> := module {
  emote<native><epic_internal> := class<computes><concrete><final>(asset) {}

  npc_character_definition<native><epic_internal> := class<computes><concrete><final>(asset) {}
}

# Module import path: /Fortnite.com/Building
Building<public> := module {
  @experimental
  building_component<native><epic_internal> := class<final>(component) {
    @experimental
    Damage<native><public>(Amount: float): void

    IsAllowedOnClient<override>(): logic = external {}

    @experimental
    IsPlayerBuilt<native><public>()<decides>: void

    @experimental
    var CanBeDamaged<public>: logic = external {}

    @experimental
    var CanBeReplaced<public>: logic = external {}
  }
}

# Module import path: /Fortnite.com/Characters
Characters<public> := module {
  # Returns the `fort_character` for `InAgent`. Fails if `InAgent` is not a `fort_character`.
  (InAgent: agent).GetFortCharacter<native><public>()<transacts><decides>: fort_character

  # Returns a `game_action_instigator` interface for `InAgent`.
  (InAgent: agent).GetInstigator<native><public>()<transacts>: game_action_instigator

  # Returns the `agent` for `InInstigator`. Fails if `InInstigator` is not an `agent`.
  (InInstigator: game_action_instigator).GetInstigatorAgent<native><public>()<transacts><decides>: agent

  # Main API implemented by Fortnite characters.
  fort_character<native><public> := interface<unique><epic_internal>(
    positional,
    healable,
    healthful,
    damageable,
    shieldable,
    game_action_instigator,
    game_action_causer
  ) {
    # Signaled when this `fort_character` changes crouch state.
    # Sends `tuple` payload:
    #  - 0: the `fort_character` that changed crouch states.
    #  - 1: `true` if the character is crouching. `false` if the character is not crouching.
    CrouchedEvent<public>(): listenable(tuple(fort_character, logic))

    # Signaled when this `fort_character` is eliminated from the match.
    EliminatedEvent<public>(): listenable(elimination_result)

    # Returns the agent associated with this `fort_character`. Use this when interacting with APIs that require an `agent` reference.
    GetAgent<public>()<transacts><decides>: agent

    @experimental
    GetEntity<epic_internal>()<transacts><decides>: entity

    # Returns the location where this `fort_character` is looking or aiming from.
    GetViewLocation<public>()<transacts>: vector3

    # Returns the rotation where this `fort_character` is looking or aiming at.
    GetViewRotation<public>()<transacts>: rotation

    # Sets this `fort_character` visibility to invisible.
    Hide<public>(): void

    # Succeeds if this `fort_character` is in the world and has not been eliminated. Most fort_character actions will silently fail if this fails. Please test IsActive if you want to handle these failure cases rather than allow them to silently fail.
    IsActive<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is crouching.
    IsCrouching<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is in the 'Down But Not Out' state. In this state the character is down but can still be revived by teammates for a period of time.
    IsDownButNotOut<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is in falling locomotion state.
    IsFalling<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is in flying locomotion state.
    IsFlying<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is in gliding locomotion state.
    IsGliding<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is standing in the air.
    IsInAir<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is inside water volume.
    IsInWater<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` is standing on the ground.
    IsOnGround<public>()<transacts><decides>: void

    # Succeeds if this `fort_character` can be damaged. Fails if this `fort_character` cannot be damaged.
    IsVulnerable<public>()<transacts><decides>: void

    # Signaled when this `fort_character` jumps. Returns a listenable with a payload of this `fort_character`.
    JumpedEvent<public>(): listenable(fort_character)

    # Puts this `fort_character` into stasis, preventing certain types of movement specified by `Args`.
    PutInStasis<public>(Args: stasis_args)<transacts>: void

    # Release this `fort_character` from stasis.
    ReleaseFromStasis<public>()<transacts>: void

    # Control if this `fort_character` can be damaged.
    SetVulnerability<public>(Vulnerable: logic)<transacts>: void

    # Sets this `fort_character` visibility to visible.
    Show<public>(): void

    # Signaled when this `fort_character` changes sprint state.
    # Sends `tuple` payload:
    #  - 0: the `fort_character` that changed sprint state.
    #  - 1: `true` if the character is sprinting. `false` if the character stopped sprinting.
    SprintedEvent<public>(): listenable(tuple(fort_character, logic))

    # Teleports this `fort_character` to the provided `Position` and applies the yaw of `Rotation`. Will fail if the `Position` specified is e.g. outside of the playspace or specifies a place where the character cannot fit.
    TeleportTo<public>(Position: vector3, Rotation: rotation)<transacts><decides>: void
  }

  @hide_in_editor
  @experimental
  fort_character_component<native><epic_internal> := class<final>(component, fort_character) {
    @experimental
    (fort_character:)GetEntity<override>()<transacts><decides>: entity = external {}

    CrouchedEvent<override>(): listenable(tuple(fort_character, logic)) = external {}

    @experimental
    Damage<override>(Amount: float): void = external {}

    @experimental
    Damage<override>(Args: damage_args): void = external {}

    DamagedEvent<override>(): listenable(damage_result) = external {}

    DamagedShieldEvent<override>(): listenable(damage_result) = external {}

    EliminatedEvent<override>(): listenable(elimination_result) = external {}

    @experimental
    FortCharacter<native><public>: fort_character

    @experimental
    GetAgent<override>()<transacts><decides>: agent = external {}

    @experimental
    GetHealth<override>()<transacts>: float = external {}

    @experimental
    GetMaxHealth<override>()<transacts>: float = external {}

    @experimental
    GetMaxShield<override>()<transacts>: float = external {}

    @experimental
    GetShield<override>()<transacts>: float = external {}

    @experimental
    GetTransform<override>()<transacts>: transform = external {}

    @experimental
    GetViewLocation<override>()<transacts>: vector3 = external {}

    @experimental
    GetViewRotation<override>()<transacts>: rotation = external {}

    @experimental
    Heal<override>(Amount: float): void = external {}

    @experimental
    Heal<override>(Args: healing_args): void = external {}

    HealedEvent<override>(): listenable(healing_result) = external {}

    HealedShieldEvent<override>(): listenable(healing_result) = external {}

    @experimental
    Hide<override>(): void = external {}

    @experimental
    IsActive<override>()<transacts><decides>: void = external {}

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>(): logic = external {}

    @experimental
    IsCrouching<override>()<transacts><decides>: void = external {}

    @experimental
    IsDownButNotOut<override>()<transacts><decides>: void = external {}

    @experimental
    IsFalling<override>()<transacts><decides>: void = external {}

    @experimental
    IsFlying<override>()<transacts><decides>: void = external {}

    @experimental
    IsGliding<override>()<transacts><decides>: void = external {}

    @experimental
    IsInAir<override>()<transacts><decides>: void = external {}

    @experimental
    IsInWater<override>()<transacts><decides>: void = external {}

    @experimental
    IsOnGround<override>()<transacts><decides>: void = external {}

    @experimental
    IsVulnerable<override>()<transacts><decides>: void = external {}

    JumpedEvent<override>(): listenable(fort_character) = external {}

    @experimental
    PutInStasis<override>(Args: stasis_args)<transacts>: void = external {}

    @experimental
    ReleaseFromStasis<override>()<transacts>: void = external {}

    @experimental
    SetHealth<override>(Health: float)<transacts>: void = external {}

    @experimental
    SetMaxHealth<override>(MaxHealth: float)<transacts>: void = external {}

    @experimental
    SetMaxShield<override>(MaxShield: float)<transacts>: void = external {}

    @experimental
    SetShield<override>(Shield: float)<transacts>: void = external {}

    @experimental
    SetVulnerability<override>(Vulnerable: logic)<transacts>: void = external {}

    @experimental
    Show<override>(): void = external {}

    SprintedEvent<override>(): listenable(tuple(fort_character, logic)) = external {}

    @experimental
    TeleportTo<override>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}
  }

  npc_character_modifier<native><epic_internal> := class<abstract> {
    ModifyCharacter<native_callable><public>(Character: fort_character): void
  }

  # Parameters for `fort_character.PutInStasis` function.
  stasis_args<native><public> := struct {
    # Controls if `fort_character` can still perform emotes while in stasis.
    AllowEmotes<native><public>: logic = external {}

    # Controls if `fort_character` can still fall while in stasis.
    AllowFalling<native><public>: logic = external {}

    # Controls if `fort_character` can still turn while in stasis.
    AllowTurning<native><public>: logic = external {}
  }
}

Devices<public> := module {
  @experimental
  # Returns the simulation entity at the root of the experience this `creative_device` is operating within.  * The simulation entity is the rootmost entity in an experience.  * Fails if this `creative_device` is not operating in a context with a valid SimulationEntity.
  (CreativeDevice: creative_device).GetSimulationEntity<native><public>()<transacts><decides>: entity

  @experimental
  # Returns the simulation entity at the root of the experience this `creative_object` is operating within.  * The simulation entity is the rootmost entity in an experience.  * Fails if this `creative_object` is not operating in a context with a valid SimulationEntity.
  (CreativeObject: creative_object).GetSimulationEntity<native><public>()<transacts><decides>: entity

  @experimental
  # Returns the `entity` associated to that `CreativeObject.
  (CreativeObject: creative_object_interface).GetEntity<native><epic_internal>()<transacts><decides>: entity

  # Returns the `fort_playspace` that `CreativeObject` belongs to.
  (CreativeObject: creative_object_interface).GetPlayspace<native><public>()<transacts>: fort_playspace

  # Returns a queryable `tag_view` which can be used to query the tags on `CreativeObject`.
  (CreativeObject: creative_object_interface).GetTags<native><public>(): tag_view

  (MovableObject: creative_movable_object_base).GetTransformInternalImpl<native><epic_internal>()<transacts>: transform

  # Moves the `creative_movable_object_base` to the specified `Position` and `Rotation` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
  (MovableObject: creative_movable_object_base).MoveToInternal<epic_internal>(
    Position: vector3,
    Rotation: rotation,
    OverTime: float
  )<suspends>: move_to_result = external {}

  # Moves the `creative_movable_object_base` to the specified `Transform` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
  (MovableObject: creative_movable_object_base).MoveToInternal<epic_internal>(
    Transform: transform,
    OverTime: float
  )<suspends>: move_to_result = external {}

  (MovableObject: creative_movable_object_base).MoveToInternalImpl<epic_internal>(
    TargetTransform: transform,
    OverTime: float
  )<suspends>: move_to_internal_result = external {}

  (MovableObject: creative_movable_object_base).TeleportToInternal<epic_internal>(
    Position: vector3,
    Rotation: rotation
  )<transacts><decides>: void = external {}

  (MovableObject: creative_movable_object_base).TeleportToInternal<epic_internal>(Transform: transform)<transacts><decides>: void = external {}

  (MovableObject: creative_movable_object_base).TeleportToInternalImpl<native><epic_internal>(Transform: transform)<transacts>: teleport_to_result

  # Module import path: /Fortnite.com/Devices/CreativeAnimation
  CreativeAnimation<public> := module {
    # Returns an `animation_controller` used to animate `Prop`. Only a subset of `creative_prop` types can be animated, though this may change in the future. A few examples of props that cannot be animated yet are:
    #  * Walls attached to buildings
    #  * Treasure chests
    #  * Loot llamas
    (Prop: creative_prop).GetAnimationController<public>()<transacts><decides>: animation_controller = external {}

    # Native implementation of `GetAnimationController`.
    GetAnimationController<native><epic_internal>(MovableObject: creative_movable_object_base)<transacts>: tuple(
      ?animation_controller,
      get_animation_controller_result
    )

    # Module import path: /Fortnite.com/Devices/CreativeAnimation/InterpolationTypes
    # Convenience interpolation modes. These built in modes are based on the CSS animation standard: https://www.w3.org/TR/css-easing-1/
    InterpolationTypes<public> := module {
      # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
      Ease<public>: cubic_bezier_parameters = external {}

      # `EaseIn` animations start slow, then speed up towards the end.
      EaseIn<public>: cubic_bezier_parameters = external {}

      # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
      EaseInOut<public>: cubic_bezier_parameters = external {}

      # `EaseOut` animations start fast, then slow down towards the end.
      EaseOut<public>: cubic_bezier_parameters = external {}

      # `Linear` animations move at a constant speed.
      Linear<public>: cubic_bezier_parameters = external {}
    }

    # Used to move and animate the position of `creative_prop` objects.
    #  * See `creative_prop.GetAnimationController` for information on acquiring an instance of an
    #    `animation_controller` for a given `creative_prop`.
    #  * See `SetAnimation` for details on authoring movement and animations.
    animation_controller<native><public> := class<epic_internal> {
      # Suspends at the callsite until the next `keyframe_delta` is finished. This will also return if the animation is aborted or not playing. See `await_next_keyframe_result` if your code needs to take different paths based on why `AwaitNextKeyframe` returned.
      AwaitNextKeyframe<native><public>()<suspends>: await_next_keyframe_result

      # Returns the current state of this `animation_controller`.
      GetState<native><public>()<transacts>: animation_controller_state

      # Succeeds if this `animation_controller`s target is still valid (i.e., the target has not been disposed of either via `Dispose` or through any external system.)
      IsValid<native><public>()<transacts><decides>: void

      # Signaled each time a keyframe is reached. Callback(KeyframeIndex:int, InReverse:logic). Note that the KeyframeIndex in the callback is generally in [1, NumDeltaKeyframes] except that in a PingPong animation the final keyframe played in reverse is identified as index 0. This is because SetAnimation takes *delta* keyframes whereas this event notifies the listener that a specific keyframe has been reached.
      KeyframeReachedEvent<native><public>: listenable(tuple(int, logic)) = external {}

      # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
      MovementCompleteEvent<native><public>: listenable(tuple()) = external {}

      # Pauses the animation if it is already playing.
      Pause<public>(): void = external {}

      # Native implementation of `Pause`.
      PauseInternal<native><epic_internal>(): playstoppause_result

      # Starts or resumes playback of the animation.
      Play<public>(): void = external {}

      # Native implementation of `Play`.
      PlayInternal<native><epic_internal>(): playstoppause_result

      # Sets the animation for the `animation_controller`. Animations are processed in the order provided in `Keyframes`. See notes in `keyframe_delta` and `animation_mode` for more details on controlling the animations.
      SetAnimation<public>(Keyframes: []keyframe_delta, ?Mode: animation_mode): void = external {}

      # Native implementation of `SetAnimation`.
      SetAnimationInternal<native><epic_internal>(
        Keyframes: []keyframe_delta,
        ?AnimationMode: animation_mode = external {}
      ): set_animation_result

      # Signaled when the state has changed. Use `GetState` to get the new state.
      StateChangedEvent<native><public>: listenable(tuple()) = external {}

      # Stops playback and resets the animation to the first keyframe. Also resets the prop transform. Calling this method is valid while the animation is in the `Playing` or `Paused` states.
      Stop<public>(): void = external {}

      # Native implementation of `Stop`.
      StopInternal<native><epic_internal>(): playstoppause_result
    }

    # `animation_controller` states.
    animation_controller_state<native><public> := enum {
      # No animation has been successfully set via `animation_controller.SetAnimation`, or that animation has been cleared by a failed call to `animation_controller.SetAnimation`.
      AnimationNotSet

      # The target of the animation is not an animatable prop. This could be because:
      #  * It is not a `creative_prop` that can be animated.
      #  * It was disposed or otherwise destroyed.
      #  * It has the 'Register with Structural Grid' option set in UEFN.
      InvalidObject

      # Animation is paused.
      Paused

      # Animation is playing.
      Playing

      # Animation has either never started, finished, or was explicitly stopped.
      Stopped
    }

    # Animation play modes.
    animation_mode<native><public> := enum {
      # Play the animation in a loop. This requires the animation ends exactly where it began.
      Loop

      # Stop after playing the animation once.
      OneShot

      # Reverse direction after reaching the final `keyframe_delta`, then play the animation in reverse.
      PingPong
    }

    # Results for `animation_controller.AwaitNextKeyframe` function.
    await_next_keyframe_result<native><public> := enum {
      # The animation was canceled either due to the object being destroyed, becoming invalid, or because it was moved via some other API.
      AnimationAborted

      # The next keyframe has been reached successfully.
      KeyframeReached

      # No animation is currently playing and this function call has returned immediately.
      NotPlaying
    }

    # A structure for defining Bezier interpolation parameters.
    # See https://en.wikipedia.org/wiki/B%C3%A9zier_curve for more info on Bezier curves.
    cubic_bezier_parameters<native><public> := struct<computes> {
      # X value of the P1 control point. `0.0 <= X0 <= 1.0` or an error will be generated when calling `animation_controller.SetAnimation`.
      X0<native><public>: float = external {}

      # X value of the P2 control point. `0.0 <= X1 <= 1.0 or an error will be generated when calling `animation_controller.SetAnimation`.
      X1<native><public>: float = external {}

      # Y value of the P1 control point.
      Y0<native><public>: float = external {}

      # Y value of the P2 control point.
      Y1<native><public>: float = external {}
    }

    # Results for `animation_controller.GetAnimationController' function.
    get_animation_controller_result<native><epic_internal> := enum {
      # The target of the animation is not an animatable prop. This could be because:
      #  * It is not a `creative_prop` that can be animated.
      #  * It was disposed or otherwise destroyed.
      #  * It has the 'Register with Structural Grid' option set in UEFN.
      InvalidObject

      # Function succeeded.
      Ok

      # An unknown error has occurred.
      UnknownError
    }

    # Instead of specifying the actual keyframe positions, we specify the keyframe *deltas*. This allows us to treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its initial location. For a `animation_mode.Loop` animation, the net rotation and translation must both be zero. Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s).
    keyframe_delta<native><public> := struct {
      # Target position of the `creative_prop`. This is a world-space coordinate in cm, with the initial position of the `creative_prop` acting as coordinate (0,0).
      DeltaLocation<native><public>: vector3

      # Target rotation for the `creative_prop`. Rotations are relative to the starting rotation of the `creative_prop`
      DeltaRotation<native><public>: rotation

      # Target scale for the `creative_prop`. Scale is multiplicative to the starting Scale of the `creative_prop`
      DeltaScale<native><public>: vector3 = external {}

      # Interpolation mode for this `keyframe_delta`. See `InterpolationTypes` for standard interpolation options. See `cubic_bezier_parameters` for authoring custom interpolations.
      # Default = `InterpolationTypes.Linear`
      Interpolation<native><public>: cubic_bezier_parameters = external {}

      # Time in seconds the `creative_prop` should animate between its last frame and this frame.
      Time<native><public>: float
    }

    # Results for `animation_controller`s play, pause, and stop functions.
    playstoppause_result<native><epic_internal> := enum {
      # No animation has been successfully set via SetAnimation, or that animation has been cleared by a failed call to SetAnimation.
      AnimationNotSet

      # The target of the animation is not an animatable prop. This could be because:
      #  * It is not a `creative_prop` that can be animated.
      #  * It was disposed or otherwise destroyed.
      #  * It has the 'Register with Structural Grid' option set in UEFN.
      InvalidObject

      # Function succeeded.
      Ok
    }

    # Results for `animation_controller.SetAnimation` function.
    set_animation_result<native><epic_internal> := enum {
      # See the documentation for cubic_bezier_parameters for more information.
      InvalidInterpolationParameters

      # The translation component of a keyframe contained a NaN or Inf.
      InvalidLocation

      # The target of the animation is not an animatable prop. This could be because:
      #  * It is not a `creative_prop` that can be animated.
      #  * It was disposed or otherwise destroyed.
      #  * It has the 'Register with Structural Grid' option set in UEFN.
      InvalidObject

      # The delta time value of a keyframe was negative.
      InvalidTime

      # The animation would cause the object to at least partially leave the boundaries of play.
      KeyframeOutOfBounds

      # The animation mode was 'Loop' but there was a net translation or rotation in the keyframes.
      LoopingAnimationDoesNotLoop

      # No keyframes were provided.
      NoKeyframes

      # Function succeeded.
      Ok

      # The target of the animation cannot be scaled.
      ScaleNotAllowed

      # An unknown error has occurred.
      UnknownError
    }
  }

  # A default asset to be used when creating an editor-specified `creative_prop_asset` variable.
  DefaultCreativePropAsset<public>: creative_prop_asset = external {}

  # Returns an array containing all creative objects which have been marked with the specified `Tag`.
  GetCreativeObjectsWithTag<native><public>(Tag: tag)<transacts>: []creative_object_interface

  # Returns an array containing creative objects which have tag(s) matching the specified `SearchCriteria`.
  GetCreativeObjectsWithTags<native><public>(SearchCriteria: tag_search_criteria)<transacts>: []creative_object_interface

  HandleMoveToInternalResult<epic_internal>(Result: move_to_internal_result): move_to_result = external {}

  Patchwork<public> := module {
    cable_splitter_device<public> := class<concrete><final>(patchwork_device) {}

    # Apply a distortion effect to Patchwork audio inputs.
    distortion_effect_device<public> := class<concrete><final>(patchwork_device) {}

    # Turn Patchwork note inputs into audio using drum samples.
    drum_player_device<public> := class<concrete><final>(patchwork_device) {}

    # Create drum note patterns for Patchwork devices.
    drum_sequencer_device<public> := class<concrete><final>(patchwork_device) {}

    # Apply an echo effect to Patchwork audio inputs.
    echo_effect_device<public> := class<concrete><final>(patchwork_device) {}

    # Turn Patchwork note inputs into audio using instrument samples.
    instrument_player_device<public> := class<concrete><final>(patchwork_device) {}

    # Modify a setting on another Patchwork device in a regularly repeating pattern.
    lfo_modulator_device<public> := class<concrete><final>(patchwork_device) {}

    # Define shared settings for Patchwork devices.
    music_manager_device<public> := class<concrete><final>(patchwork_device) {}

    # Transpose Patchwork note inputs to follow a chord progression.
    note_progressor_device<public> := class<concrete><final>(patchwork_device) {}

    # Create melodic note patterns for Patchwork devices.
    note_sequencer_device<public> := class<concrete><final>(patchwork_device) {}

    # Send events to devices based on Patchwork note inputs.
    note_trigger_device<public> := class<concrete><final>(patchwork_device) {}

    # Turn Patchwork note inputs into audio using customizable sound synthesis.
    omega_synthesizer_device<public> := class<concrete><final>(patchwork_device) {}

    # Base class for all Patchwork devices.
    patchwork_device<public> := class<concrete>(creative_device_base) {
      # Disables this device.
      Disable<public>(): void = external {}

      # Enables this device.
      Enable<public>(): void = external {}
    }

    song_sync_device<public> := class<concrete><final>(patchwork_device) {}

    # Output Patchwork audio for players to hear.
    speaker_device<public> := class<concrete><final>(patchwork_device) {}

    # Modify a setting on another Patchwork device in steps over time.
    step_modulator_device<public> := class<concrete><final>(patchwork_device) {}

    # Modify a setting on another Patchwork device when triggered.
    value_setter_device<public> := class<concrete><final>(patchwork_device) {}
  }

  # Spawns a `creative_prop` at the specified `Position` and `Rotation`. `Position` and `Rotation` units are in cm.
  # Returns tuple:
  #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
  #  1: Success or failure results.
  SpawnProp<native><public>(
    Asset: creative_prop_asset,
    Position: vector3,
    Rotation: rotation)<transacts>: tuple(?creative_prop,
    spawn_prop_result
  )

  # Spawns a `creative_prop` at the specified `Transform`. `Units are in cm.
  # Returns tuple:
  #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
  #  1: Success or failure results.
  SpawnProp<native><public>(
    Asset: creative_prop_asset,
    Transform: transform)<transacts>: tuple(?creative_prop,
    spawn_prop_result
  )

  # Returns a `string` representation of `move_to_internal_result` objects.
  ToString<epic_internal>(MoveToInternalResult: move_to_internal_result)<computes>: string = external {}

  # Used to set up islands so players will earn Battle Pass XP when they interact with your island. Accolades are achievements or accomplishments that players can complete to earn XP.
  accolades_device<public> := class<concrete><final>(creative_device_base) {
    # Awards the XP to `agent`.
    Award<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when testing the accolade to make sure it is awarded as expected. Only signals within unpublished island environments.
    # Sends the `agent` receiving the achievement.
    TestAwardEvent<public>: listenable(agent) = external {}
  }

  using { /UnrealEngine.com/Temporary/SpatialMath }
  # Used in conjunction with `advanced_storm_controller_device` to customize individual storm phases.
  advanced_storm_beacon_device<public> := class<concrete><final>(creative_device_base) {
    # Moves the `advanced_storm_beacon_device` to the specified `Position` and `Rotation` over the specified time, in seconds.
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position: vector3, Rotation: rotation, OverTime: float)<suspends>: move_to_result = external {}

    # Moves the `advanced_storm_beacon_device` to the specified `Transform` over the specified time, in seconds.
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform: transform, OverTime: float)<suspends>: move_to_result = external {}

    # Teleports the `advanced_storm_beacon_device` to the specified `Position` and `Rotation`.
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}

    # Teleports the `advanced_storm_beacon_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform: transform)<transacts><decides>: void = external {}
  }

  # Used to control a Battle Royale-style storm with up to 50 phases.
  #
  # Like `basic_storm_controller_device`s, you can use this storm to keep players inside a playable area, but unlike the `basic_storm_controller_device`, this device generates multiple storm phases. When used in conjunction with `advanced_storm_beacon_device`s, you can customize each phase of the storm by applying one or more beacons and setting customization options for the specific phase you assign to that beacon.
  advanced_storm_controller_device<public> := class<concrete><final>(storm_controller_device) {}

  # Used to create patrolling behavior for guards spawned with the `guard_spawner_device`.
  ai_patrol_path_device<public> := class<concrete><final>(creative_device_base) {
    # Assign an AI to this patrol path.
    Assign<public>(Patroller: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Commands patroller to follow the *Next Patrol Path Group* instead of the default *Patrol Path Group*.
    GoToNextPatrolGroup<public>(Patroller: agent): void = external {}

    # Commands patroller to follow the *Next Patrol Path* in the *Patrol Path Group*.
    GoToNextPatrolPath<epic_internal>(Patroller: agent): void = external {}

    # Signaled when a guard cannot reach the next `ai_patrol_path_device`.
    NextNodeUnreachableEvent<public>: listenable(agent) = external {}

    # Signaled when a guard reaches this device.
    NodeReachedEvent<public>: listenable(agent) = external {}

    # Signaled when a guard starts moving on the patrol path.
    PatrolPathStartedEvent<public>: listenable(agent) = external {}

    # Signaled when a guard stops moving on the patrol path.
    PatrolPathStoppedEvent<public>: listenable(agent) = external {}
  }

  # Used to boost `agent`s, vehicles, and other objects upwards into the air.
  air_vent_device<public> := class<concrete><final>(creative_device_base) {
    # Activates this device.
    Activate<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to track `agent` events used to generate analytics.
  analytics_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Submits an event for `Agent`.
    Submit<public>(Agent: agent): void = external {}
  }

  # Used to select, spawn, and configure a skeletal mesh to play a specific animation.
  animated_mesh_device<public> := class<concrete><final>(creative_device_base) {
    # Pauses playback of the animation.
    Pause<public>(): void = external {}

    # Starts or resumes playback of the animation.
    Play<public>(): void = external {}

    # Starts or resumes reverse playback of the animation.
    PlayReverse<public>(): void = external {}
  }

  # Evaluates attributes for `agent` when signaled from other devices. Acts as branching logic, checking whether the `agent` associated with the signal passes all of the tests setup in this device, then sends a signal on either `PassEvent` or `FailEvent`.
  attribute_evaluator_device<public> := class<concrete><final>(trigger_base_device) {
    # Tests whether the specified agent satisfies the required conditions specified on the device (e.g. eliminations/score), and fires either the `PassEvent` or `FailEvent` accordingly.
    EvaluateAgent<public>(Agent: agent): void = external {}

    # Signaled when the `agent` from `EvaluateAgent` fails the requirements specified by this device.
    # Sends the `agent` originally passed to this device in `EvaluateAgent`.
    FailEvent<public>: listenable(agent) = external {}

    # Signaled when the `agent` from `EvaluateAgent` passes the requirements specified by this device.
    # Sends the `agent` originally passed to this device in `EvaluateAgent`.
    PassEvent<public>: listenable(agent) = external {}
  }

  # Used to manage sound buses via control bus mixes set on the Audio Mixer Device.
  audio_mixer_device<public> := class<concrete><final>(creative_device_base) {
    # Activates the mix set on the audio mixer.
    ActivateMix<public>(): void = external {}

    # Deactivates the mix set on the audio mixer.
    DeactivateMix<public>(): void = external {}

    # Adds `Agent` as a target when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    Register<public>(Agent: agent): void = external {}

    # Removes `Agent` as a target when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    Unregister<public>(Agent: agent): void = external {}

    # Removes all previously registered `agent`s when using the *CanBeHeardBy* Registered Players or NonRegisteredPlayers options.
    UnregisterAll<public>(): void = external {}
  }

  # Used to configure and play audio from the device location or from registered `agent`s.
  audio_player_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device. No longer allows this device to be triggered from other linked devices (i.e. triggers) and will stop any currently playing audio.
    Disable<public>(): void = external {}

    # Enables this device. Allows this device to be triggered from other linked devices (i.e. triggers) and allow calls to `Play` to succeed.
    Enable<public>(): void = external {}

    # Hides this device from the world.
    Hide<public>()<transacts>: void = external {}

    # Starts playing audio from this device.
    Play<public>(): void = external {}

    # Starts playing audio from this device for `Agent`. This can only be used when the device is set to be *Heard by Instigator*.
    Play<public>(Agent: agent): void = external {}

    # Adds `Agent` as a target to play audio from when activated.
    Register<public>(Agent: agent): void = external {}

    # Shows this device in the world.
    Show<public>()<transacts>: void = external {}

    # Stops any audio playing from this device.
    Stop<public>(): void = external {}

    # Stops any audio playing from this device for `Agent`. This can only be used when the device is set to be *Heard by Instigator*.
    Stop<public>(Agent: agent): void = external {}

    # Removes `Agent` as a target to play audio from when activated.
    Unregister<public>(Agent: agent): void = external {}

    # Removes all previously registered `agent`s as valid targets to play audio from when activated.
    UnregisterAll<public>(): void = external {}
  }

  using { /Fortnite.com/Game }
  # Used to create a customizable turret that can search for nearby targets.
  automated_turret_device<public> := class<concrete><final>(creative_device_base, healthful, healable) {
    # Triggers when someone enters the activation radius while nobody else is there.
    # Sends the activating `agent`. If the activator is a non-agent then `false` is returned.
    ActivatedEvent<public>: listenable(?agent) = external {}

    # Clears the turret's current target and returns the turret to searching for targets.
    #  * If the current target is still in range, it'll likely be the best target, and will be reacquired.
    #  * Combine with disabled targeting for best results.
    ClearTarget<public>(): void = external {}

    # Triggers when the turret is damaged.
    # Sends the triggering `agent`. If the activator is a non-agent then `false` is returned.
    DamagedEvent<public>: listenable(?agent) = external {}

    # Triggers when the turret is destroyed.
    # Sends the triggering `agent`. If the activator is a non-agent then `false` is returned.
    DestroyedEvent<public>: listenable(?agent) = external {}

    # Disables the turret, causing it to close and ignore its activation radius.
    Disable<public>(): void = external {}

    # Enables the turret to rotate, target, and track.
    Enable<public>(): void = external {}

    GetHealth<override>()<transacts>: float = external {}

    GetMaxHealth<override>()<transacts>: float = external {}

    # Returns the `agent` currently targeted by the device.
    GetTarget<public>(): ?agent = external {}

    Heal<override>(Amount: float): void = external {}

    Heal<override>(Args: healing_args): void = external {}

    HealedEvent<override>(): listenable(healing_result) = external {}

    # Sets the range in meters at which the turret will activate to `Range`.
    # This is clamped between `2.0` and `100.0` meters.
    SetActivationRange<public>(Range: float): void = external {}

    # Sets the amount of damage the turret will do per shot to targets to `Damage`.
    SetDamage<public>(Damage: float): void = external {}

    SetHealth<override>(Health: float)<transacts>: void = external {}

    SetMaxHealth<override>(MaxHealth: float)<transacts>: void = external {}

    # Set the supplied `Agent` as the turret's target.
    #  * The target will only change if `Agent` is within the activation radius, has direct line-of-sight to the turret,
    # is on a targetable team as determined by `Possible Targets`, and is not Down But Not Out.
    SetTarget<public>(Agent: agent): void = external {}

    # Sets the range in meters at which the turret will target to `Range`.
    # This is clamped between `2.0` and `100.0` meters. Setting it lower than 2m will disable Targeting.
    SetTargetRange<public>(Range: float): void = external {}

    # Set the turret to the team with the chosen index number.
    #  * `TeamIndex` is clamped to valid team values, with a minimum of `1`.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    SetTeam<override>(TeamIndex: int): void = external {}

    # Set the turret to the same team as the supplied `Agent`.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    SetTeam<public>(Agent: agent): void = external {}

    # Triggers when the turret finds a target.
    # Sends the `agent` that was found.
    TargetFoundEvent<public>: listenable(agent) = external {}

    # Triggers when the turret loses a target.
    # Sends the `agent` that was lost.
    TargetLostEvent<public>: listenable(agent) = external {}

    # Set the turret to the Default Team.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    UseDefaultTeam<public>(): void = external {}

    # Set the turret to the Wildlife & Creatures team.
    #  * Only usable if `Possible Targets` is not set to `Everyone`.
    UseTeamWildlifeAndCreatures<public>(): void = external {}
  }

  # Used to spawn various types of balls. Can be used to control HUD elements related to the spawned balls.
  ball_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Hides the floating HUD Icons from players, if these have been configured by the device.
    HideHUD<public>(): void = external {}

    # Shows the floating HUD Icons to players, if these have been configured by the device.
    ShowHUD<public>(): void = external {}
  }

  # Creates an impenetrable zone that can block `agent` movement and weapon fire.
  barrier_device<public> := class<concrete><final>(creative_device_base) {
    # Adds the specified `agent` to a list of additional `agent`s that the Barrier should ignore. This list is in addition to the Ignore Team and Ignore Class options. Note: Has no effect on bullets.
    AddToIgnoreList<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Removes all `agent`s from the ignore list. `Agent`s will still be ignored if they are on an ignored team or of an ignored class.
    RemoveAllFromIgnoreList<public>(): void = external {}

    # Removes the specified `agent` from the ignore list. The `agent` will still be ignored if they are on an ignored team or of an ignored class.
    RemoveFromIgnoreList<public>(Agent: agent): void = external {}
  }

  # Base class for devices that spawn items.
  base_item_spawner_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an `agent` picks up the spawned item.
    # Sends the `agent` that picked up the item.
    ItemPickedUpEvent<public>: listenable(agent) = external {}
  }

  # A simplified storm device that provides a way to create a single-phase storm and control its basic behaviors.
  # To control multiple phases of the storm see `advanced_storm_controller_device`.
  basic_storm_controller_device<public> := class<concrete><final>(storm_controller_device) {}

  # Used to show an in world visual effect and/or a HUD marker at the desired location.
  beacon_device<public> := class<concrete><final>(creative_device_base) {
    # Adds the specified `agent` to a list of `agent`s that the Beacon will be shown to. This list of `agent`s is maintained separately from the Team Visibility set of `agent`s.
    AddToShowList<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Removes all `agent`s from the show list. `Agent`s will still see the Beacon if they meet the Team Visibility check.
    RemoveAllFromShowList<public>(): void = external {}

    # Removes the specified `agent` from the show list. The `agent` will still see the Beacon if they meet the Team Visibility check.
    RemoveFromShowList<public>(Agent: agent): void = external {}
  }

  # Used to display custom text messages on a billboard.
  billboard_device<public> := class<concrete><final>(creative_device_base) {
    # Returns `true` if the device border is enabled.
    GetShowBorder<public>()<transacts>: logic = external {}

    # Returns the device *Text*.
    GetText<epic_internal>()<transacts>: string = external {}

    # Returns the *Text Size* of the device *Text*.
    GetTextSize<public>()<transacts>: int = external {}

    # Hides the billboard text.
    HideText<public>(): void = external {}

    # Sets the visibility of the device border mesh. This also determines whether the device collision is enabled.
    SetShowBorder<public>(Show: logic): void = external {}

    # Sets the device *Text*.
    SetText<public>(Text: message): void = external {}

    # Sets the *Text Size* of the device *Text*. Clamped to range [8, 24].
    SetTextSize<public>(Size: int): void = external {}

    # Shows the billboard text.
    ShowText<public>(): void = external {}

    # Updates the device display to show the current *Text*.
    UpdateDisplay<public>(): void = external {}
  }

  # Used to create a bouncer that can launch players, vehicles, and more into the air with optional effects.
  bouncer_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the condition in the *On Bounced Trigger* option is met and someone or something is launched.
    #  * Sends the `agent` that bounced. If a vehicle bounced, sends the driver. If a projectile bounced, sends its instigator.
    #  * Sends `false` if something else bounced, including a vehicle with no driver
    BouncedEvent<public>: listenable(?agent) = external {}

    # Disables bouncing on this device, as well as any visual and audio effects.
    Disable<public>(): void = external {}

    # Enables bouncing on this device, as well as any visual and audio effects.
    Enable<public>(): void = external {}

    # Signaled when the heal effect starts for an `agent`.
    HealStartEvent<public>: listenable(agent) = external {}

    # Signaled when the heal effect stops for an `agent`.
    HealStopEvent<public>: listenable(agent) = external {}
  }

  @experimental
  bridge_component<native><epic_internal> := class<final>(component) {
    @experimental
    AsCreativeDevice<public>(Type: subtype(creative_device_base))<suspends>: ?Type = external {}

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>(): logic = external {}
  }

  # Used to create a button which can trigger other devices when an agent interacts with it.
  button_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the text that displays when an `agent` is close to this button and looks at it.
    GetInteractionText<epic_internal>()<transacts>: string = external {}

    # Returns the duration of the interaction required to activate this device (in seconds).
    GetInteractionTime<public>()<transacts>: float = external {}

    # Returns the maximum amount of times this button can be interacted with before it will be disabled.
    #  * `GetTriggerMaxCount` will be between `0` and `10`.
    #  * `0` indicates no limit on trigger count.
    GetMaxTriggerCount<public>()<transacts>: int = external {}

    # Returns the number of times that this button can still be interacted with before it will be disabled. Will return `0` if `GetMaxTriggerCount` is unlimited.
    GetTriggerCountRemaining<public>()<transacts>: int = external {}

    # Signaled when an `agent` successfully interacts with the button for `GetInteractionTime` seconds.
    # Sends the `agent` that interacted with the button.
    InteractedWithEvent<public>: listenable(agent) = external {}

    # Sets the text that displays when an `agent` is close to this button and looks at it. `Text` is limited to `64` characters.
    SetInteractionText<public>(Text: message): void = external {}

    # Sets the duration of the interaction required to activate this device (in seconds).
    SetInteractionTime<public>(Time: float): void = external {}

    # Sets the maximum amount of times this button can be interacted with before it will be disabled.
    #  * `MaxCount` must be between `0` and `10`.
    #  * `0` indicates no limit on trigger count.
    SetMaxTriggerCount<public>(MaxCount: int): void = external {}
  }

  # Used to focus the camera on specific `agent`s.
  camera_focus_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Drops focus from `Agent`.
    DropFocus<public>(Agent: agent): void = external {}

    # Drops focus from all `agent`s.
    DropFocusForAll<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Focuses the camera on `Agent`.
    Focus<public>(Agent: agent): void = external {}

    # Focuses the camera on all `agent`s.
    FocusAll<public>(): void = external {}

    # Signaled when the camera stops focusing on an `agent`.
    # Sends the `agent` that stopped being focused on.
    FocusIsDroppedEvent<public>: listenable(agent) = external {}

    # Signaled when the camera focuses on an `agent`.
    # Sends the `agent` being focused on.
    FocusOnEvent<public>: listenable(agent) = external {}
  }

  # Used to place a campfire in the world that an `agent` can use to heal themselves.
  campfire_device<public> := class<concrete><final>(creative_device_base) {
    # Adds wood to this device.
    AddWood<public>(): void = external {}

    # Signaled when an `agent` enters the area of effect for this device.
    # Sends the entering `agent`.
    AgentEntersEffectAreaEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the area of effect for this device.
    # Sends the exiting `agent`.
    AgentExitsEffectAreaEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` is affected by a pulse generated by this device.
    # Sends the affected `agent`.
    AgentPulsedEvent<public>: listenable(agent) = external {}

    # Signaled when this device generates a pulse.
    CampfirePulseEvent<public>: listenable(tuple()) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when this device is disabled.
    DisabledEvent<public>: listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when this device is enabled.
    EnabledEvent<public>: listenable(tuple()) = external {}

    # Extinguishes this device.
    Extinguish<public>(Agent: agent): void = external {}

    # Signaled when this device is extinguished by an `agent`.
    # Sends the extinguishing `agent`.
    ExtinguishedEvent<public>: listenable(agent) = external {}

    # Lights this device.
    Light<public>(Agent: agent): void = external {}

    # Signaled when this device is lit by an `agent`.
    # Sends the lighting `agent`.
    LitEvent<public>: listenable(agent) = external {}
  }

  # Used to create a zone that can trigger effects once players enter it. Can be set up to be capturable by a team, to provide a score while held, or to require a specific item as a drop-off.
  capture_area_device<public> := class<concrete><final>(creative_device_base) {
    # Activates the objective pulse for this device.
    ActivateObjectivePulse<public>(): void = external {}

    # Signaled when an `agent` enters this device area.
    # Sends the `agent` that entered this device area.
    AgentEntersEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits this device area.
    # Sends the `agent` that exited this device area.
    AgentExitsEvent<public>: listenable(agent) = external {}

    # Allows this device to be captured.
    AllowCapture<public>(): void = external {}

    # Signaled when this device is contested.
    # Sends the `agent` that is contesting this device.
    AreaIsContestedEvent<public>: listenable(agent) = external {}

    # Signaled when this device is scored.
    # Sends the `agent` that scored this device.
    AreaIsScoredEvent<public>: listenable(agent) = external {}

    # Signaled when this device control changes.
    # Sends the `agent` that triggered this device control change.
    ControlChangeEvent<public>: listenable(agent) = external {}

    # Signaled when this device control change starts.
    # Sends the `agent` that is triggering this device control change.
    ControlChangeStartsEvent<public>: listenable(agent) = external {}

    # Deactivates the objective pulse for this device.
    DeactivateObjectivePulse<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Disallows this device from being captured.
    DisallowCapture<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when the first `agent` enters this device area.
    # Sends the `agent` that entered this device area.
    FirstAgentEntersEvent<public>: listenable(agent) = external {}

    # Returns the *Capture Height* (in meters) of the capture area.
    GetHeight<public>()<computes><reads>: float = external {}

    # Returns the *Capture Radius* (in meters) of the capture area.
    GetRadius<public>()<computes><reads>: float = external {}

    # Gives control of this device to the capturing `agent`'s team.
    GiveControl<public>(Agent: agent): void = external {}

    # Signaled when an item is consumed by this device.
    # Sends the `agent` that provided the item to this device.
    ItemIsConsumedEvent<public>: listenable(agent) = external {}

    # Signaled when an item is delivered to this device.
    # Sends the `agent` that delivered the item to this device.
    ItemIsDeliveredEvent<public>: listenable(agent) = external {}

    # Signaled when the last `agent` exits this device area.
    # Sends the `agent` that exited this device area.
    LastAgentExitsEvent<public>: listenable(agent) = external {}

    # Clears control of this device for all teams.
    Neutralize<public>(): void = external {}

    # Resets control of this device for all teams.
    Reset<public>(): void = external {}

    # Sets the *Capture Height* (in meters) of the capture area.
    SetHeight<public>(Height: float): void = external {}

    # Sets the *Capture Radius* (in meters) of the capture area.
    SetRadius<public>(Radius: float): void = external {}

    # Toggles between `AllowCapture` and `DisallowCapture`.
    ToggleCaptureAllowed<public>(): void = external {}

    # Toggles between `Enable` and `Disable`.
    ToggleEnabled<public>(): void = external {}
  }

  # Spawns and tracks a single item as a game objective (e.g. flag).
  capture_item_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when spawned item is captured.
    # Sends the `agent` that captured the item.
    ItemCapturedEvent<public>: listenable(agent) = external {}

    # Signaled when spawned item is dropped.
    # Sends the `agent` that dropped the item.
    ItemDroppedEvent<public>: listenable(agent) = external {}

    # Signaled when spawned item is picked up.
    # Sends the `agent` that picked up the item.
    ItemPickedUpEvent<public>: listenable(agent) = external {}

    # Signaled when spawned item is returned.
    # Sends the `agent` that returned the item.
    ItemReturnedEvent<public>: listenable(agent) = external {}
  }

  # Creates a chair where `Agent`s can sit.
  chair_device<public> := class<concrete><final>(creative_device_base) {
    # Disables the Chair.
    # A disabled Chair cannot be interacted with
    # and any `agent` currently occupying the Chair will be ejected.
    Disable<public>(): void = external {}

    # Prevents any seated `agent` from leaving the Chair manually.
    # While Exit is disabled, call Eject to force them out.
    DisableExit<public>(): void = external {}

    # Ejects any `agent` currently in the chair.
    Eject<public>(): void = external {}

    # Makes `Agent` exit this chair if they are currently in the chair.
    Eject<public>(Agent: agent): void = external {}

    # Enables the Chair.
    # An enabled Chair can be interacted with and occupied
    # by any `agent` that meets the requirements.
    Enable<public>(): void = external {}

    # Allows any seated `agent` to leave the chair manually.
    EnableExit<public>(): void = external {}

    # Signaled when an `agent` stops sitting on the Chair.
    # Sends the standing `Agent`.
    ExitedEvent<public>: listenable(agent) = external {}

    # Returns the `agent` currently occupying the chair.
    GetSeatedAgent<public>(): ?agent = external {}

    # Succeeds if the chair is currently occupied.
    IsOccupied<public>()<transacts><decides>: void = external {}

    # Succeeds if `Agent` is currently in the chair .
    IsSeated<public>(Agent: agent)<transacts><decides>: void = external {}

    # Makes `Agent` sit on this chair if they meet the requirements.
    Seat<public>(Agent: agent): void = external {}

    # Signaled when an `agent` sits on the Chair.
    # Sends the sitting `agent`.
    SeatedEvent<public>: listenable(agent) = external {}
  }

  # Allows players to change their outfit in game!
  changing_booth_device<public> := class<concrete><final>(creative_device_base) {}

  # Sends an Event for every signal it receives. A simple relay to connect multiple devices together.
  # It can also broadcast an event to the playspace and listen for any other channel devices broadcasting
  # to the playspace.
  channel_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when either `Transmit` is called.
    ReceivedTransmitEvent<public>: listenable(?agent) = external {}

    # Calls `ReceivedTransmitEvent`, optionally with `Agent` as the instigator.
    Transmit<public>(Agent: ?agent): void = external {}
  }

  # Used to configure a single interactive mannequin, that can visualize characters, clothing, and perform emotes.
  character_device<public> := class<concrete>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Hides this device.
    Hide<public>(): void = external {}

    # Signaled when an `agent` interacts with this device.
    # Sends the `agent` that interacted with this device.
    InteractedWithEvent<public>: listenable(agent) = external {}

    # Plays an emote on the character created by this device.
    PlayEmote<public>(): void = external {}

    # Shows this device.
    Show<public>(): void = external {}
  }

  # Allows management of groups of `character_device`s e.g. changing all to have the same outfit, emote, or animation.
  character_device_controller_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Changes the character appearance of the associated `character_device`s.
    ChangeCharacterAppearance<public>(): void = external {}

    # Changes the character idle animation of the associated `character_device`s.
    ChangeCharacterIdleAnimated<public>(): void = external {}

    # Changes the character idle pose of the associated `character_device`s.
    ChangeCharacterIdlePose<public>(): void = external {}

    # Plays an emote on the associated `character_device`s.
    PerformEmote<public>(): void = external {}

    # Resets the character appearance of the associated `character_device`s.
    ResetCharacters<public>(): void = external {}
  }

  # Used to transform character appearance.
  character_transformation_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Sets `Agent` visibility to invisible.
    Hide<public>(Agent: agent): void = external {}

    # Transforms `Agent` into the character configured by this device.
    TransformInto<public>(Agent: agent): void = external {}

    # Plays the transform effect for `Agent`.
    TransformIntoEffectAvatar<public>(Agent: agent): void = external {}
  }

  # Used to trigger level sequences that allow coordination of cinematic animation, transformation, and audio tracks.
  cinematic_sequence_device<public> := class<concrete><final>(creative_device_base) {
    # Returns the playback rate of the sequence.
    GetPlayRate<public>()<transacts>: float = external {}

    # Returns the playback position (in frames) of the sequence.
    GetPlaybackFrame<public>()<transacts>: int = external {}

    # Returns the playback position (in time/seconds) of the sequence.
    GetPlaybackTime<public>()<transacts>: float = external {}

    # Go to the end and stop the sequence.
    GoToEndAndStop<public>(): void = external {}

    # Go to the end and stop the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    GoToEndAndStop<public>(Agent: agent): void = external {}

    # Pauses the sequence.
    Pause<public>(): void = external {}

    # Pauses the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Pause<public>(Agent: agent): void = external {}

    # Plays the sequence. This will only work when the device is set to *Everyone*
    Play<public>(): void = external {}

    # Plays the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Play<public>(Agent: agent): void = external {}

    # Plays the sequence in reverse. This will only work when the device is set to *Everyone*
    PlayReverse<public>(): void = external {}

    # Plays the sequence in reverse. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    PlayReverse<public>(Agent: agent): void = external {}

    # Set the playback rate of the sequence.
    SetPlayRate<public>(PlayRate: float): void = external {}

    # Set the playback position (in frames) of the sequence.
    SetPlaybackFrame<public>(PlaybackFrame: int): void = external {}

    # Set the playback position (in time/seconds) of the sequence.
    SetPlaybackTime<public>(PlaybackTime: float): void = external {}

    # Stops the sequence.
    Stop<public>(): void = external {}

    # Stops the sequence. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    Stop<public>(Agent: agent): void = external {}

    # Signaled when the sequence is stopped.
    StoppedEvent<public>: listenable(tuple()) = external {}

    # Toggles between `Play` and `Stop`.
    TogglePause<public>(): void = external {}

    # Toggles between `Play` and `Stop`. An instigating 'Agent' is required when the device is set to anything except *Everyone*.
    TogglePause<public>(Agent: agent): void = external {}
  }

  clapboard_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    TimeReachedEvent<public>: listenable(tuple()) = external {}
  }

  # Used together with `class_designer_device` to control how/when created classes can be accessed by `agent`s.
  class_and_team_selector_device<public> := class<concrete><final>(creative_device_base) {
    # Changes the `Agent`'s class.
    ChangeClass<public>(Agent: agent): void = external {}

    # Changes the selecting team.
    ChangeSelectorTeam<public>(Agent: agent): void = external {}

    # Changes the `Agent`'s team.
    ChangeTeam<public>(Agent: agent): void = external {}

    # Changes the `Agent`'s team and class.
    ChangeTeamAndClass<public>(Agent: agent): void = external {}

    # Signaled when an `agent` changes class.
    # Sends the `agent` whose class changed.
    ClassSwitchedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an `agent` changes teams.
    # Sends the `agent` whose team changed.
    TeamSwitchedEvent<public>: listenable(agent) = external {}
  }

  # Used together with `class_selector_device` to create class based gameplay. Defines custom class attributes and inventory loadouts.
  class_designer_device<public> := class<concrete><final>(creative_device_base) {}

  # Used to allow players to select their *Class* from a *Class Selector UI*.
  class_selector_ui_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` changes a class.
    # Sends the `agent` that selected a class and the `int` class that the player has changed to.
    ClassChangedEvent<public>: listenable(tuple(agent, int)) = external {}

    # Signaled when an `agent` selects a class.
    # Sends the `agent` that selected a class.
    ClassSelectedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Show the *Class Selector UI* to `Agent`.
    Show<public>(Agent: agent): void = external {}

    # Signaled when an `agent` closes the UI.
    # Sends the `agent` that closed the UI.
    UIClosedEvent<public>: listenable(agent) = external {}

    # Signaled when the UI is opened.
    # Sends the `agent` that is responsible for opening the UI.
    UIOpenedEvent<public>: listenable(agent) = external {}
  }

  # Used to place a collectible item into the world.
  collectible_object_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the collectible item is collected.
    # Sends the `agent` that collected the item.
    CollectedEvent<public>: listenable(agent) = external {}

    # Makes the collectible invisible.
    Hide<public>(): void = external {}

    # Immediately respawns the object for the instigating agent.
    # This will be affected by the option *Consume If Collected By*.
    Respawn<public>(Agent: agent): void = external {}

    # Immediately respawns the object for all agents.
    RespawnForAll<public>(): void = external {}

    # Makes the collectible visible.
    Show<public>(): void = external {}
  }

  # Used to create a tile that changes colors when `agent`s interact with it.
  color_changing_tiles_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when this device changes color.
    # Sends the `agent` that interacted with this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Hides this device from the world.
    Hide<public>(): void = external {}

    # Resets this device to its initial settings.
    Reset<public>(): void = external {}

    # Sets the color of the tile to `Agent`'s team color.
    SetTeam<public>(Agent: agent): void = external {}

    # Shows this device in the world.
    Show<public>(): void = external {}
  }

  # Used to create a specialized button which can only be activated when `agent`s are carrying specific items.
  conditional_button_device<public> := class<concrete><final>(creative_device_base) {
    # Activates this device. `Agent` is used as the instigator of the action.
    Activate<public>(Agent: agent): void = external {}

    # Signaled when this device is activated.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the text that appears when `agent`s approach the device.
    GetInteractionText<epic_internal>()<transacts>: string = external {}

    # Returns the time (in seconds) that an interaction with this device will take to complete.
    GetInteractionTime<public>()<transacts>: float = external {}

    # Returns how many items an `Agent` has of the item stored at `KeyItemIndex`.
    GetItemCount<public>(Agent: agent, KeyItemIndex: int): int = external {}

    # Returns the total quantity of a specific key item type that needs to be collected in order to activate the switch.
    GetItemCountRequired<public>(KeyItemIndex: int)<transacts>: int = external {}

    # Returns the score to be awarded for a key item.
    GetItemScore<public>(KeyItemIndex: int)<transacts>: int = external {}

    # Returns the remaining quantity of a specific key item type that needs to be collected in order to activate the switch.
    GetRemainingItemCountRequired<public>(KeyItemIndex: int)<transacts>: int = external {}

    # Returns if the `Agent` has all of the items required to interact with this Device.
    HasAllItems<public>(Agent: agent)<transacts><decides>: void = external {}

    # Returns if the `Agent` is currently holding any of the items stored in the Device.
    IsHoldingItem<public>(Agent: agent)<transacts><decides>: void = external {}

    # Returns if the `Agent` is currently holding the item stored at `KeyItemIndex`.
    IsHoldingItem<public>(Agent: agent, KeyItemIndex: int)<transacts><decides>: void = external {}

    # Signaled when this device fails to activate because `agent` didn't have the required items.
    # Sends the `agent` that attempted to activate the device.
    NotEnoughItemsEvent<public>: listenable(agent) = external {}

    # Resets this device to its original settings.
    Reset<public>(): void = external {}

    # Sets the text that appears when `agent`s approach the device. `Text` is limited to `150` characters and will revert back to default if empty.
    SetInteractionText<public>(Text: message): void = external {}

    # Sets the time (in seconds) that an interaction with this device should take to complete.
    SetInteractionTime<public>(Time: float): void = external {}

    # Sets the quantity of a specific key item type that needs to be collected in order to activate the switch.
    # `KeyItemIndex` ranges from `0` to number of key item types - 1.
    SetItemCountRequired<public>(KeyItemIndex: int, Count: int): void = external {}

    # Sets the score to be awarded for a key item. `KeyItemIndex` ranges from `0` to number of key item types - 1.
    SetItemScore<public>(KeyItemIndex: int, Score: int): void = external {}

    # Toggles the conditional button state. `Agent` is used as the instigator of the action.
    Toggle<public>(Agent: agent): void = external {}
  }

  # Used to place a crash pad that can bounce players and protect them from fall damage.
  crash_pad_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an `agent` is launched by this device.
    # Sends the launched `agent`.
    LaunchedEvent<public>: listenable(agent) = external {}
  }

  # Inherit from this to create a custom creative device. Inherited classes will appear in the UEFN content browser the next time Verse compiles. Instances of your derived `creative_device` can then be placed in the island by dragging them from the content browser into the scene.
  creative_device<native><public> := class<concrete>(creative_movable_object_base, creative_object_interface) {
    # Returns the `fort_playspace` that `creative_device` belongs to.
    GetPlayspaceEpicInternal<override><native>()<transacts>: fort_playspace

    # Returns the transform of the `creative_device` with units in cm.
    GetTransform<override>()<transacts>: transform = external {}

    # Hides this device in the world.
    Hide<native><public>()<transacts>: void

    # Moves the `creative_device` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
    MoveTo<public>(Position: vector3, Rotation: rotation, OverTime: float)<suspends>: move_to_result = external {}

    # Moves the `creative_device` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
    MoveTo<public>(Transform: transform, OverTime: float)<suspends>: move_to_result = external {}

    # Override to add custom logic when the game experience begins.
    OnBegin<native_callable><public>()<suspends>: void = external {}

    # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
    OnEnd<native_callable><public>(): void = external {}

    PlayspaceEpicInternal<native><epic_internal>: ?fort_playspace = external {}

    # Shows this device in the world.
    Show<native><public>()<transacts>: void

    # Teleports the `creative_device` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}

    # Teleports the `creative_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform: transform)<transacts><decides>: void = external {}
  }

  # Internal asset for representing creative devices.
  creative_device_asset<native><public> := class<computes><final><epic_internal>(asset) {}

  # Base class for creative_device.
  creative_device_base<native><public> := class<abstract><epic_internal>(creative_object) {
    # Set this device invisible in the world.
    Hide_Internal<native><epic_internal>()<transacts>: void

    # Set this device visible in the world.
    Show_Internal<native><epic_internal>()<transacts>: void
  }

  @import_as("/Script/VerseDevices.UVerseMovableObjectBase")
  creative_movable_object_base<native><epic_internal> := class<abstract><epic_internal> {}

  # Base class for creative devices and props.
  creative_object<native><public> := class<epic_internal>(creative_movable_object_base, creative_object_interface) {
    # Returns the `fort_playspace` that `creative_object` belongs to.
    GetPlayspaceEpicInternal<override><native>()<transacts>: fort_playspace

    # Returns the transform of the `creative_object` with units in cm. You must check `creative_object.IsValid` before calling this if there is a possibility the object has been disposed or destroyed by gameplay.
    # Otherwise a runtime error will result.
    GetTransform<override>()<transacts>: transform = external {}

    # Moves the `creative_object` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
    MoveTo<public>(Position: vector3, Rotation: rotation, OverTime: float)<suspends>: move_to_result = external {}

    # Moves the `creative_object` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
    MoveTo<public>(Transform: transform, OverTime: float)<suspends>: move_to_result = external {}

    # Sets the team to a specific user. 0 is no team.
    SetTeam<native><epic_internal>(TeamIndex: type { _X: int where 0 <= _X, _X <= 255 }): void

    # Teleports the `creative_object` to the specified `Position` and `Rotation`.
    TeleportTo<public>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}

    # Teleports the `creative_object` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    TeleportTo<public>(Transform: transform)<transacts><decides>: void = external {}
  }

  creative_object_interface<native><public> := interface<epic_internal>(positional) {
    # Returns the `fort_playspace` that `CreativeObject` belongs to.
    GetPlayspaceEpicInternal<native_callable><epic_internal>()<transacts>: fort_playspace
  }

  # A Fortnite prop that has been placed or spawned in the island.
  creative_prop<native><public> := class<concrete><final>(creative_object, invalidatable) {
    # Destroys the `creative_prop` and remove it from the island.
    Dispose<native><override>(): void

    # Hides the `creative_prop` in the world and disable collisions.
    Hide<native><public>()<transacts>: void

    # Succeeds if this object has been disposed of either via `Dispose()` or through an external system.
    IsDisposed<native><final><public>()<transacts><decides>: void

    # Returns true if the `creative_prop` is hidden in the world.
    IsHidden<native><epic_internal>()<transacts>: logic

    # Succeeds if this object has not been disposed of either via `Dispose()` or through an external system.
    IsValid<native><override>()<transacts><decides>: void

    # Changes the Material of the Mesh used by this instance. Optionally can specify which Mesh element index to apply the material to, otherwise defaults to the 0 (default) Mesh element
    SetMaterial<native><public>(Material: material, ?Index: int = external {})<transacts>: void

    # Changes the Mesh used by this instance.
    SetMesh<native><public>(Mesh: mesh)<transacts>: void

    # Shows the `creative_prop` in the world and enable collisions.
    Show<native><public>()<transacts>: void
  }

  # Asset used to spawn `creative_prop` instances.
  creative_prop_asset<native><public> := class<computes><concrete><final><epic_internal> {}

  creative_prop_debug_log<epic_internal> := class(log_channel) {}

  # Used to customize one creature type at a time. Place multiple `creature_manager_device`s for each type of creature on your island.
  creature_manager_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when a creature of the selected *Creature Type* is eliminated.
    # Sends the `agent` that eliminated the creature.
    MatchingCreatureTypeEliminatedEvent<public>: listenable(agent) = external {}
  }

  # Used to spawn a creature at a specified location.
  creature_placer_device<public> := class<concrete><final>(creative_device_base) {
    # Despawns the creature.
    Despawn<public>(): void = external {}

    # Signaled when the creature is eliminated.
    #  * Sends the `agent` that eliminated the creature.
    #  * Sends `false` if the creature was eliminated by something other than an `agent` (e.g. a vehicle).
    EliminatedEvent<public>: listenable(?agent) = external {}

    # Spawns the creature.
    Spawn<public>(): void = external {}

    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>: listenable(agent) = external {}
  }

  # Used to spawn one or more waves of creatures of customizable types at selected time intervals.
  creature_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Destroys this device.
    DestroySpawner<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Eliminates all creatures spawned by this device.
    EliminateCreatures<public>(): void = external {}

    # Signaled when a creature is eliminated.
    #  `Source` is the `agent` that has eliminated the creature. If the creature was eliminated by a non-agent then `Source` is 'false'.
    #  `Target` is the creature that was eliminated.
    EliminatedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>: int = external {}

    # Signaled when a creature is spawned.
    # Sends the `agent` creature who was spawned.
    SpawnedEvent<public>: listenable(agent) = external {}
  }

  # Spawns a crowd to cheer you on.
  crowd_volume_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to create a specialized light which can be enabled and disabled and set to a desired color in response to in game events.
  customizable_color_light_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Resets the light to its initial state.
    Reset<public>(Agent: agent): void = external {}

    # Sets the light color to `Agent`'s team color.
    SetToTeamColor<public>(Agent: agent): void = external {}

    # Toggles between `TurnOn` and `TurnOff`.
    Toggle<public>(Agent: agent): void = external {}

    # Turns off the light.
    TurnOff<public>(Agent: agent): void = external {}

    # Turns on the light.
    TurnOn<public>(Agent: agent): void = external {}

    # Signaled when this `popup_device` is turned off for an `agent`.
    # Sends the `agent` looking at the popup.
    TurnedOffEvent<public>: listenable(agent) = external {}

    # Signaled when this `popup_device` is turned on for an `agent`.
    # Sends the `agent` looking at the popup.
    TurnedOnEvent<public>: listenable(agent) = external {}
  }

  # Used to create a light which can have its color and brightness manipulated in response to in-game events.
  customizable_light_device<public> := class<concrete><final>(creative_device_base) {
    # Dims the light by *Dimming Amount*.
    DimLight<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Resets the light to its initial state.
    Reset<public>(): void = external {}

    # Toggles between `TurnOn` and `TurnOff`.
    Toggle<public>(): void = external {}

    # Turns off the light.
    TurnOff<public>(): void = external {}

    # Turns on the light.
    TurnOn<public>(): void = external {}

    # Brightens the light by *Dimming Amount*.
    UndimLight<public>(): void = external {}
  }

  # Used to amplify an `agent`'s damage temporarily. This applies to any weapon the `agent` is using at the time of the powerup.
  damage_amplifier_powerup_device<public> := class<concrete><final>(powerup_device) {
    # Returns the current *Magnitude* for the powerup.
    # For the Damage Amplifier Powerup, this is the damage multiplier.
    GetMagnitude<public>()<transacts>: float = external {}

    # Sets the *Magnitude* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    # For the Damage Amplifier Powerup, this is the damage multiplier.
    SetMagnitude<public>(Magnitude: float): void = external {}
  }

  # Used to specify an area volume which can damage `agent`s, vehicles, and creatures.
  damage_volume_device<public> := class<concrete><final>(effect_volume_device) {
    # Signaled when an `agent` enters the volume.
    # Sends the `agent` entering the volume.
    AgentEntersEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the volume.
    # Sends the `agent` exiting the volume.
    AgentExitsEvent<public>: listenable(agent) = external {}

    # Returns the damage to be applied each tick within the volume.
    GetDamage<public>()<transacts>: int = external {}

    GetSelectedClass<epic_internal>(): int = external {}

    GetSelectedClassFunction<epic_internal>: device_function_get_int = external {}

    GetSelectedTeam<epic_internal>(): int = external {}

    GetSelectedTeamFunction<epic_internal>: device_function_get_int = external {}

    # Is true when `Agent` is in the zone.
    IsInVolume<public>(Agent: agent)<transacts><decides>: void = external {}

    # Sets the damage to be applied each tick within the volume. `Damage` is clamped between `1` and `500`.
    SetDamage<public>(Damage: int): void = external {}

    # Updates *Selected Class* to `Agent`'s class.
    UpdateSelectedClass<public>(Agent: agent): void = external {}

    # Updates *Selected Team* to `Agent`'s team.
    UpdateSelectedTeam<public>(Agent: agent): void = external {}
  }

  # Used to capture `agent` dance moves.
  dance_capture_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Signaled when this device is deactivated by an `agent`.
    # Sends the `agent` that deactivated this device.
    DeactivatedEvent<public>: listenable(agent) = external {}
  }

  # Used to project a hologram of a character performing dance emotes.
  dance_mannequin_device<public> := class<concrete><final>(creative_device_base) {
    # Activates the hologram using *Default Preset* options.
    ActivateDefaultPreset<public>(): void = external {}

    # Activates the hologram using *Preset 2* options.
    ActivatePreset2<public>(): void = external {}

    # Activates the hologram using *Preset 3* options.
    ActivatePreset3<public>(): void = external {}

    # Activates the hologram using `Agent`'s skin and emotes.
    ActivateSkinAndEmoteCapture<public>(Agent: agent): void = external {}

    # Deactivates the hologram.
    DeactivateSkinAndEmoteCapture<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Payload of `device_event_ai_interaction`.
  device_ai_interaction_result<native><public> := struct<epic_internal> {
    # Optional agent that triggered the interaction
    Source<native><public>: ?agent

    # Optional agent targeted by `Source`.
    Target<native><public>: ?agent
  }

  # Partial implementation of `device_event(:type)` with no return payload.
  device_event<epic_internal>() := device_event(tuple())

  # Base implementation for events on `creative_device`s.
  device_event<native><epic_internal>(t: type) := class<abstract>(listenable(t)) {
    EventName<native><public>: string
  }

  # Implementation of `device_event(:type)` with required `agent` payload.
  device_event_agent<native><epic_internal> := class(device_event(agent)) {
    Await<native><override>()<suspends>: agent

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: agent): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with a `tuple(agent, float)` payload.
  device_event_agent_float<native><epic_internal> := class(device_event(tuple(agent, float))) {
    Await<native><override>()<suspends>: tuple(agent, float)

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: agent, : float): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with a `tuple(agent, int)` payload.
  device_event_agent_int<native><epic_internal> := class(device_event(tuple(agent, int))) {
    Await<native><override>()<suspends>: tuple(agent, int)

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: agent, : int): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with `device_ai_interaction_result` payload.
  device_event_ai_interaction<native><epic_internal> := class(device_event(device_ai_interaction_result)) {
    Await<native><override>()<suspends>: device_ai_interaction_result

    SourceName<native><public>: string

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: device_ai_interaction_result): void })<transacts>: cancelable

    TargetName<native><public>: string
  }

  # Implementation of `device_event(:type)` with optional `agent` payload.
  device_event_optional_agent<native><epic_internal> := class(device_event(?agent)) {
    Await<native><override>()<suspends>: ?agent

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: ?agent): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with a `tuple(?agent, int)` payload.
  device_event_optional_agent_int<native><epic_internal> := class(device_event(tuple(?agent, int))) {
    Await<native><override>()<suspends>: tuple(?agent, int)

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: ?agent, : int): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with required `fort_vehicle` payload.
  device_event_vehicle<native><epic_internal> := class(device_event(fort_vehicle)) {
    Await<native><override>()<suspends>: fort_vehicle

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(: fort_vehicle): void })<transacts>: cancelable
  }

  # Implementation of `device_event(:type)` with no payload.
  device_event_void<native><epic_internal> := class(device_event(tuple())) {
    Await<native><override>()<suspends>: tuple()

    # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
    Subscribe<native><override>(Callback: type { __(): void })<transacts>: cancelable
  }

  device_function<native><epic_internal> := class {
    FunctionName<native><epic_internal>: string

    Invoke<native><epic_internal>(): void

    Invoke<native><epic_internal>(InAgent: agent): void
  }

  device_function_get_agent<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: ?agent
  }

  device_function_get_base<native><epic_internal> := class<abstract> {
    FunctionName<native><epic_internal>: string
  }

  device_function_get_color<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: color
  }

  device_function_get_float<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: float
  }

  device_function_get_int<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: int
  }

  device_function_get_logic<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: logic
  }

  device_function_get_string<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: string
  }

  device_function_get_vector3<native><epic_internal> := class(device_function_get_base) {
    Invoke<native><epic_internal>()<computes><reads>: vector3
  }

  device_function_set_agent<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(InAgent: ?agent): void
  }

  device_function_set_base<native><epic_internal> := class<abstract> {
    FunctionName<native><epic_internal>: string
  }

  device_function_set_color<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: color): void
  }

  device_function_set_float<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: float): void
  }

  device_function_set_int<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: int): void
  }

  device_function_set_logic<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: logic): void
  }

  device_function_set_message<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: message): void
  }

  device_function_set_multi_parameter_base<native><epic_internal> := class<abstract>(device_function_set_base) {
    ReturnType<native><epic_internal>: ?subtype(function_parameter_base) = external {}
  }

  device_function_set_params_by_name<native><epic_internal> := class(device_function_set_multi_parameter_base) {
    Invoke<native><epic_internal>(NamedParameters: [string]function_parameter_base)<transacts>: ?function_parameter_base

    ParameterTypes<native><epic_internal>: [string]subtype(function_parameter_base)
  }

  device_function_set_params_by_name_const<native><epic_internal> := class(device_function_set_params_by_name) {
    InvokeConst<native><epic_internal>(NamedParameters: [string]function_parameter_base)<computes><reads>: ?function_parameter_base
  }

  device_function_set_params_by_type<native><epic_internal> := class(device_function_set_multi_parameter_base) {
    Invoke<native><epic_internal>(TypeExclusiveParameters: []function_parameter_base)<transacts>: ?function_parameter_base

    ParameterTypes<native><epic_internal>: []subtype(function_parameter_base)
  }

  device_function_set_params_by_type_const<native><epic_internal> := class(device_function_set_params_by_type) {
    InvokeConst<native><epic_internal>(TypeExclusiveParameters: []function_parameter_base)<computes><reads>: ?function_parameter_base
  }

  device_function_set_string<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: string): void
  }

  device_function_set_vector3<native><epic_internal> := class(device_function_set_base) {
    Invoke<native><epic_internal>(Value: vector3): void
  }

  # Class that implements the common logic for a healthful, damageable, healable device.
  device_health<native><epic_internal> := class<epic_internal>(healthful, damageable, healable) {
    Damage<override><native>(Amount: float): void

    Damage<override><native>(Args: damage_args): void

    DamagedEvent<override>(): listenable(damage_result) = external {}

    GetHealth<override><native>()<transacts>: float

    GetMaxHealth<override><native>()<transacts>: float

    Heal<override><native>(Amount: float): void

    Heal<override><native>(Args: healing_args): void

    HealedEvent<override>(): listenable(healing_result) = external {}

    SetHealth<override><native>(Health: float)<transacts>: void

    SetMaxHealth<override><native>(MaxHealth: float)<transacts>: void
  }

  # Used to customize (or prevent) the 'down but not out' player state between 'healthy' and 'removed from game'.
  down_but_not_out_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` is set to the `down but not out` player state.
    # Sends the `agent` that was downed.
    AgentDownedEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is dropped.
    # Sends the `agent` that was dropped.
    AgentDroppedEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is picked up.
    # Sends the `agent` that was picked up.
    AgentPickedUpEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is revived.
    # Sends the `agent` that was revived.
    AgentRevivedEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` in the `down but not out` player state is thrown.
    # Sends the `agent` that was thrown.
    AgentThrownEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Sets the `Agent` to the `down but not out` player state.
    Down<public>(Agent: agent): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Sets the `Agent` to the `healthy` player state if they are in the `down but not out` player state.
    Revive<public>(Agent: agent): void = external {}

    # Signaled when an `agent` is the aggressor of a shake down.
    # Sends the `agent` that is the aggressor.
    ShakeDownEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` is the victim of a shake down.
    # Sends the `agent` that is the victim.
    ShakenDownEvent<public>: listenable(agent) = external {}
  }

  # Base class for types of volumes with special gameplay properties.
  effect_volume_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to send custom messages to the elimination feed.
  elimination_feed_device<public> := class<concrete><final>(creative_device_base) {
    # Activates this device.
    # Requires *Activated by Team / Class* be set to `All`.
    Activate<public>(): void = external {}

    # Activates this device. `Agent` is used as the instigator of the action.
    Activate<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to spawn items when an `agent` or specified target is eliminated.
  elimination_manager_device<public> := class<concrete><final>(base_item_spawner_device) {
    # Signaled when a qualifying elimination occurs.
    # Sends the eliminated `agent`.
    EliminatedEvent<public>: listenable(agent) = external {}

    # Signaled when a qualifying elimination occurs.
    # Sends the eliminator `agent`. If the eliminator is a non-agent then `false` is returned.
    EliminationEvent<public>: listenable(?agent) = external {}
  }

  emote_controller_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Disables `agent` emote effects.
    DisableAgentEffects<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables `agent` emote effects.
    EnableAgentEffects<public>(): void = external {}

    # Grants emote item to `Agent`.
    GrantEmoteItem<public>(Agent: agent): void = external {}

    # Grants emote item all `agent`s.
    GrantEmoteItemAll<public>(): void = external {}
  }

  # Used to configure rules that can end the current round or game.
  end_game_device<public> := class<concrete><final>(creative_device_base) {
    # Ends the round/game. Uses `Agent`'s team to determine if the round/game ends when *Activating Team* is enabled.
    Activate<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to customize high level properties of the game mode.
  experience_settings_device<public> := class<concrete><final>(creative_device_base) {}

  # Hazard which deals damage in a radius around it when destroyed or triggered.
  explosive_device<public> := class<concrete><final>(creative_device_base) {
    # Triggers this device to explode. Passes `Agent` as the instigator of the explosion.
    Explode<public>(Agent: agent): void = external {}

    # Signaled when this device explodes.
    # Sends the `agent` that caused the explosion.
    ExplodedEvent<public>: listenable(agent) = external {}

    # Hides this device from the world.
    Hide<public>(): void = external {}

    # Resets this device.
    Reset<public>(): void = external {}

    # Shows this device in the world.
    Show<public>(): void = external {}
  }

  # Used to specify an area which allows (or prevents) various objects, terrain, or buildings from being set on fire.
  fire_volume_device<public> := class<concrete><final>(effect_volume_device) {
    # Extinguishes objects inside this device area.
    Extinguish<public>(): void = external {}

    # Ignites objects inside this device area.
    Ignite<public>(): void = external {}
  }

  # Used to spawn fireflies that can be collected by `agent`s.
  firefly_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when a firefly is collected.
    # Sends the `agent` collected the firefly.
    OnFirefliesCollected<public>: listenable(agent) = external {}

    # Resets respawn count.
    ResetRespawnCount<public>(): void = external {}

    # Spawns new fireflies. The previous fireflies will be destroyed before a new fireflies spawn.
    Respawn<public>(): void = external {}
  }

  # Used to add fishing mechanics to experiences, such as:
  #  * Fishing competitions between players.
  #  * Collecting fish as a resource.
  #  * Fishing minigames with their own rewards.
  fishing_zone_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` catches a fish.
    # Sends the `agent` that caught the fish.
    CaughtEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when all items have been caught and removed.
    # Sends the `agent` that caught the last fish.
    EmptyEvent<public>: listenable(agent) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Resets the number of available uses for this device back to *Uses Allowed*.
    Reset<public>(): void = external {}

    # Returns all caught and removed items to the inventory. This only works when *Pool Type* is set to *Device Inventory*.
    Restock<public>(): void = external {}
  }

  # Used to provide fuel sources for vehicles. Can also be used to deal considerable damage to `agent`s and the environment when destroyed.
  fuel_pump_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Grants fuel to `Agent`.
    Empty<public>(Agent: agent): void = external {}

    # Signaled when the fuel pump is emptied.
    # Sends the `agent` that emptied the fuel pump.
    EmptyEvent<public>: listenable(agent) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Resets fuel stock to *Fuel Capacity* value.
    Reset<public>(): void = external {}
  }

  function_parameter_agent<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: ?agent
  }

  function_parameter_base<native><epic_internal> := class<abstract><computes> {}

  function_parameter_color<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: color
  }

  function_parameter_float<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: float
  }

  function_parameter_int<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: int
  }

  function_parameter_logic<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: logic
  }

  function_parameter_message<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: ?message
  }

  function_parameter_string<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: string
  }

  function_parameter_vector3<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: vector3
  }

  # Used to update the camera’s current viewpoint and rotation based on current camera mode.
  gameplay_camera_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Adds the camera to the `Agent`’s camera stack and pushes it to be the active camera.
    AddTo<public>(Agent: agent): void = external {}

    # Adds the camera to all `Agent`s camera stacks and pushes it to be the active camera.
    AddToAll<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Removes the camera from the `Agent`’s camera stack and pops from being the active camera replacing it with the next one in the stack.
    RemoveFrom<public>(Agent: agent): void = external {}

    # Removes the camera from all `Agent`s camera stacks and pops from being the active camera replacing it with the next one in the stack.
    RemoveFromAll<public>(): void = external {}
  }

  @experimental
  # Used to update the camera's viewpoint from the perspective of the player character.
  gameplay_camera_first_person_device<public> := class<concrete><final>(gameplay_camera_device) {}

  # Used to update the camera’s current viewpoint and rotation based on a fixed angle.
  gameplay_camera_fixed_angle_device<public> := class<concrete><final>(gameplay_camera_device) {}

  # Used to update the camera’s current viewpoint and rotation based on a fixed point.
  gameplay_camera_fixed_point_device<public> := class<concrete><final>(gameplay_camera_device) {}

  # Used to update the camera's viewpoint to follow the target and be rotated manually.
  gameplay_camera_orbit_device<public> := class<concrete><final>(gameplay_camera_device) {}

  # Used to update the gameplay controls scheme based on current control mode.
  gameplay_controls_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Adds the gameplay control to the `Player`’s gameplay controls stack and pushes it to be the active control.
    AddTo<public>(Agent: agent): void = external {}

    # Adds the gameplay control to all `Agent`s gameplay controls stack and pushes it to be the active control.
    AddToAll<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Removes the gameplay control from the `Agent`’s gameplay controls stack and pops from being the active control replacing it with the next one in the stack.
    RemoveFrom<public>(Agent: agent): void = external {}

    # Removes the gameplay control from all `Agent`s gameplay controls stack and pops from being the active control replacing it with the next one in the stack.
    RemoveFromAll<public>(): void = external {}
  }

  # Used to adapt the controls to side scroller functionality
  gameplay_controls_side_scroller_device<public> := class<concrete><final>(gameplay_controls_device) {}

  # Used to adapt the controls to the camera perspective
  gameplay_controls_third_person_device<public> := class<concrete><final>(gameplay_controls_device) {}

  # Used to let `agent`s slide on any surface with accompanying visual and audio effects.
  grind_powerup_device<public> := class<concrete><final>(powerup_device) {}

  using { /Verse.org/Colors }
  # Used to create customizable Grind Rails.
  grind_rail_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device, preventing players from grinding on the rail.
    Disable<public>(): void = external {}

    # Enables this device, letting players grind on the rail.
    Enable<public>(): void = external {}

    # Signaled when an `agent` starts grinding on this `grind_rail_device`.
    EndedGrindingEvent<public>: listenable(agent) = external {}

    # Hides the track. Players can still grind on the track if it is enabled.
    Hide<public>(): void = external {}

    # Sets the color of the Grind Rail.
    SetRailColor<public>(Color: color): void = external {}

    # Make this track visible.
    Show<public>(): void = external {}

    # Signaled when an `agent` starts grinding on this `grind_rail_device`.
    StartedGrindingEvent<public>: listenable(agent) = external {}
  }

  # Used to spawn guards that can patrol and attack other `agent`s.
  guard_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when a guard has identified an opponent.
    # `Source` is the guard who is aware.
    # `Target` is the agent who alerted the guard.
    AlertedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Signaled when guard is damaged.
    # `Source` is the `agent` that damaged the guard. If the guard was damaged by a non-agent then `false` is returned.
    # `Target` is the guard that was damaged.
    DamagedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Despawns guards.
    Despawn<public>(): void = external {}

    # Despawns guards. `Instigator` will be considered as the eliminator of those guards.
    Despawn<public>(Instigator: agent): void = external {}

    # Disables this device. Guards will despawn if *Despawn Guards When Disabled* is set.
    Disable<public>(): void = external {}

    # Dismisses all hired guards that were recruited by `Instigator`.
    DismissAgentHiredGuards<public>(Instigator: agent): void = external {}

    # Dismisses all hired guards.
    DismissAllHiredGuards<public>(): void = external {}

    # Signaled when a guard is dismissed by a player.
    # `Source` is the `agent` who dismissed the guard.
    # `Target` is the guard that was dismissed.
    DismissedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard is eliminated.
    # `Source` is the `agent` that eliminated the guard. If the guard was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the guard that was eliminated.
    EliminatedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard eliminates an agent.
    # `Source` is the guard that eliminated the agent.
    # `Target` is the agent that was eliminated.
    EliminatingEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Enables this device. Guards will start to spawn.
    Enable<public>(): void = external {}

    # Forces guards to attack `Target`, bypassing perception checks.
    # 'ForgetTime' ranges from 0.0 to 600.0 (in seconds, default is 600.0), it is the time after which the target will be ignored if not found.
    # 'ForgetDistance' ranges from 0.0 to 100000.0 (in centimeters, default is 100000.0), it is the distance at which the target will be ignored if not found.
    ForceAttackTarget<public>(
      Target: agent,
      ?ForgetTime: float = external {},
      ?ForgetDistance: float = external {}
    ): void = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>: int = external {}

    # Hires guards to `Instigator`'s team.
    Hire<public>(Instigator: agent): void = external {}

    # Signaled when a guard is hired by a player.
    # `Source` is the `agent` who hired the guard.
    # `Target` is the guard that was hired.
    HiredEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Resets the spawn count allowing spawning of a new batch of guards.
    Reset<public>(): void = external {}

    # Allows guards to be hired.
    SetGuardsHireable<public>(): void = external {}

    # Prevents guards from being hired.
    SetGuardsNotHireable<public>(): void = external {}

    # Tries to spawn a guard.
    Spawn<public>(): void = external {}

    # Tries to spawn a guard. If *Auto Hire When Spawned* is set to *Triggering Player* the guard will be hired by `Instigator`.
    Spawn<public>(Instigator: agent): void = external {}

    # Signaled when a guard is spawned.
    # Sends the `agent` guard who was spawned.
    SpawnedEvent<public>: listenable(agent) = external {}

    # Signaled when a guard becomes suspicious.
    # Sends the `agent` guard who is suspicious.
    SuspiciousEvent<public>: listenable(agent) = external {}

    # Signaled when a guard has lost track of a target.
    # `Source` is the guard that lost track of a target.
    # `Target` is the `agent` no longer targeted by the guard.
    TargetLostEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Signaled when a guard becomes unaware.
    # Sends the `agent` guard who is unaware.
    UnawareEvent<public>: listenable(agent) = external {}
  }

  using { /Verse.org/Simulation }
  # Use to create a cactus with healing fruits that can be burst to heal nearby players.
  healing_cactus_device<public> := class<concrete><final>(creative_device_base) {
    # Burst the plant if the device is enabled, passing in the triggering `agent`.
    # If there is no triggering `agent`, players will only be healed if `Heal Targets` is set to `Everyone`.
    Burst<public>(): void = external {}

    # Burst the plant if the device is enabled, passing in the triggering `agent`.
    # If there is no triggering `agent`, players will only be healed if `Heal Targets` is set to `Everyone`.
    Burst<public>(Agent: agent): void = external {}

    # Triggers when the plant bursts, passing in the triggering `agent`.
    BurstEvent<public>: listenable(?agent) = external {}

    # Disables the device to prevent interaction and growth.
    Disable<public>(): void = external {}

    # Enables the device to allow interaction and let it grow.
    Enable<public>(): void = external {}

    # Grows the plant if the device is enabled. If `Infinite Regrowths` is `false`, this is limited by `Maximum Regrowths`.
    # If someone is too close, the plant won't grow until they move away.
    Grow<public>(): void = external {}

    # Triggers when the plant grows.
    GrowEvent<public>: listenable(tuple()) = external {}
  }

  # Used to regenerate an `agent`'s health and/or shields.
  health_powerup_device<public> := class<concrete><final>(powerup_device) {
    # Returns the current *Magnitude* for the powerup.
    # For the Health Powerup, this is the amount of health or shield that the powerup will add or remove,
    GetMagnitude<public>()<transacts>: float = external {}

    # Sets the *Magnitude* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    # For the Health Powerup, this is the amount of health or shield that the powerup will add or remove,
    SetMagnitude<public>(Magnitude: float): void = external {}
  }

  # Used to create a holographic screen that displays a clock or other curated images.
  holoscreen_device<public> := class<concrete><final>(creative_device_base) {}

  # Used to show or hide parts of the HUD for players or teams. Use this with other devices such as the `hud_message_device`, `map_indicator_device`, and `billboard_device` to control exactly how much information players can see during a game, as well as how and when they see that information.
  hud_controller_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Resets the *Affected Class* option to its starting value.
    ResetAffectedClass<public>(): void = external {}

    # Resets the *Affected Team* option to its starting value.
    ResetAffectedTeam<public>(): void = external {}

    # Sets the *Affected Class* option to `Agent`'s class.
    UpdateAffectedClass<public>(Agent: agent): void = external {}

    # Sets the *Affected Team* option to `Agent`'s team.
    UpdateAffectedTeam<public>(Agent: agent): void = external {}
  }

  # Used to show custom HUD messages to one or more `agent`s.
  hud_message_device<public> := class<concrete><final>(creative_device_base) {
    # Returns the time (in seconds) for which the HUD message will be displayed. `0.0` means the message is displayed persistently.
    GetDisplayTime<public>()<transacts>: float = external {}

    # Returns the *Message* to be displayed when the HUD message is activated.
    GetText<epic_internal>()<transacts>: string = external {}

    # Hides the HUD message.
    Hide<public>(): void = external {}

    @available { MinUploadedAtFNVersion := 3100 }
    # Hides the currently set HUD *Message* on `Agent`s screen.
    # Use this when the device is setup to target specific `agent`s.
    Hide<public>(Agent: agent): void = external {}

    # Sets the time (in seconds) the HUD message will be displayed. `0.0` will display the HUD message persistently.
    SetDisplayTime<public>(Time: float): void = external {}

    # Sets the *Message* to be displayed when the HUD message is activated. `Text` is clamped to 150 characters.
    SetText<public>(Text: message): void = external {}

    # Shows the currently set *Message* HUD message on screen. Will replace any previously active message.
    Show<public>(): void = external {}

    # Shows the currently set HUD *Message* on `Agent`s screen. Will replace any previously active message.
    # Use this when the device is setup to target specific `agent`s.
    Show<public>(Agent: agent): void = external {}

    # Displays a Custom message to a specific *Agent* that you define.Setting *DisplayTime* to `0.0` will display the HUD message persistently.If not defined, or less than `0.0` the message will show for the time set on the device.
    Show<public>(Agent: agent, Message: message, ?DisplayTime: float = external {}): void = external {}

    # Displays a Custom message that you define for all PlayersSetting *DisplayTime* to `0.0` will display the HUD message persistently.If not defined, or less than `0.0` the message will show for the time set on the device.
    Show<public>(Message: message, ?DisplayTime: float = external {}): void = external {}
  }

  # Used to listen for the player activating or releasing certain inputs.
  # The input is defined by the *Input* option.
  # Players can configure the key for the input in the Creative Input Actions section of the Keyboard Settings.
  input_trigger_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    # A disabled Input Trigger will not listen for inputs
    # and will never show on the HUD.
    Disable<public>(): void = external {}

    # Enables this device.
    # An Input Trigger will listen for inputs from players that meet the device requirements.
    Enable<public>(): void = external {}

    # Succeeds if `Agent` is currently holding the input.
    IsHeld<public>(Agent: agent)<transacts><decides>: void = external {}

    # Signaled when the tracked input is pressed by an `agent`.
    # Sends the `agent` that pressed the input.
    PressedEvent<public>: listenable(agent) = external {}

    # Adds `Agent` to the registered player list.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    Register<public>(Agent: agent): void = external {}

    # Signaled when the tracked input is released by an `agent`.
    # Sends the `agent` that released the input.
    # Sends the `float` duration that the input was held.
    ReleasedEvent<public>: listenable(tuple(agent, float)) = external {}

    # Removes `Agent` from the registered player list.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    Unregister<public>(Agent: agent): void = external {}

    # Clears the list of registered players.
    # *Registered Player Behavior* determines whether registered players meet the device requirements.
    UnregisterAll<public>(): void = external {}
  }

  # Used to grant items to `agent`s. Items can either be dropped at the `agent`'s location or added directly to their inventory.
  item_granter_device<public> := class<concrete><final>(creative_device_base) {
    # Clears saved data for `Agent`, preventing them from receiving items while offline. This only works when *Grant While Offline* is set to *Yes*.
    ClearSaveData<public>(Agent: agent): void = external {}

    # Cycles to the next item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToNextItem<public>(Agent: agent): void = external {}

    # Cycles to the previous item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToPreviousItem<public>(Agent: agent): void = external {}

    # Cycles to a random item. If *Grant on Cycle* is set `Agent` will be granted the item.
    CycleToRandomItem<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the current Item Index that this device will grant when activated.
    GetItemIndex<public>()<transacts>: int = external {}

    # Grants an item to `Agent`.
    GrantItem<public>(Agent: agent): void = external {}

    @available { MinUploadedAtFNVersion := 3100 }
    # Grants an item at a specific `ItemIndex` to an `Agent`.
    #  `Index` should be between `0` and the available item count - 1.
    #  If Value is out of bounds, which item is granted is determined by *Cycle Behavior*.
    GrantItemIndex<public>(Agent: agent, ItemIndex: int): void = external {}

    @available { MinUploadedAtFNVersion := 3100 }
    # Grants an item at a specific `ItemIndex` to all players.
    #  Only functions when *Receiving Players* is set to *All* or *Team Index*.
    #  `Index` should be between `0` and the available item count - 1.
    #  If Value is out of bounds, which item is granted is determined by *Cycle Behavior*.
    GrantItemIndex<public>(ItemIndex: int): void = external {}

    # Grants an item without requiring an agent reference.
    #  This only works when *Receiving Players* is set to *All* or *Team Index*.
    GrantItemToAll<public>(): void = external {}

    # Signaled when an item is granted to an `agent`.
    # Sends the `agent` that was granted the item.
    ItemGrantedEvent<public>: listenable(agent) = external {}

    # Restocks this device back to its starting inventory count.
    RestockItems<public>(): void = external {}

    # Sets the next item to be granted.
    #  * `Index` should be between `0` and the available item count - 1.
    #  * Calling `SetNextItem` with an invalid index will do nothing.
    SetNextItem<public>(Index: int): void = external {}
  }

  # Allows pickup items to be placed in the world..
  item_placer_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to cause `agent`s to drop or lose items from their inventory. For example, if an `agent` is *Down But Not Out*, they could drop items from their inventory, and other `agent`s could then pick up those items.
  item_remover_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Remove items from `Agent`s inventory. The items that are removed can be configured using *Affected Items*.
    Remove<public>(Agent: agent): void = external {}
  }

  # Allows the item shop to be opened when activated
  item_shop_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  item_shop_mannequin_device<epic_internal> := class<final>(character_device) {
    OpenStore<public>(Agent: agent): void = external {}
  }

  # Used to configuration and spawn items that players can pick up and use.
  item_spawner_device<public> := class<concrete><final>(base_item_spawner_device) {
    # Cycles device to next configured item.
    CycleToNextItem<public>(): void = external {}

    # Returns device *Respawn Item on Timer* option (see `SetTimeBetweenSpawns`)
    GetEnableRespawnTimer<public>()<transacts>: logic = external {}

    # Returns the *Time Between Spawns* (in seconds) after an item is collected before the next is spawned, if this device has *Respawn Item on Timer* enabled (see `SetEnableRespawnTimer`)
    GetTimeBetweenSpawns<public>()<transacts>: float = external {}

    # Sets device *Respawn Item on Timer* option (see `SetTimeBetweenSpawns`)
    SetEnableRespawnTimer<public>(Respawn: logic): void = external {}

    # Sets the *Time Between Spawns* (in seconds) after an item is collected before the next is spawned, if this device has *Respawn Item on Timer* enabled (see `SetEnableRespawnTimer`)
    SetTimeBetweenSpawns<public>(Time: float): void = external {}

    # Spawns the current item.
    SpawnItem<public>(): void = external {}
  }

  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /Verse.org/Native }
  @import_as("/Script/FortniteGame.ULevelSaveRecord")
  @experimental
  level_save_record<native><epic_internal> := class<epic_internal> {}

  # Used to customize the state and accessibility of doors. `lock_device` only works with assets that have a door attached.
  lock_device<public> := class<concrete><final>(creative_device_base) {
    # Closes the door. `Agent` is the instigator of the action.
    Close<public>(Agent: agent): void = external {}

    # Locks the door. `Agent` is the instigator of the action.
    Lock<public>(Agent: agent): void = external {}

    # Opens the door. `Agent` is the instigator of the action.
    Open<public>(Agent: agent): void = external {}

    # Toggles between `Lock` and `Unlock`. `Agent` is the instigator of the action.
    ToggleLocked<public>(Agent: agent): void = external {}

    # Toggles between `Open` and `Close`. `Agent` is the instigator of the action.
    ToggleOpened<public>(Agent: agent): void = external {}

    # Unlocks the door. `Agent` is the instigator of the action.
    Unlock<public>(Agent: agent): void = external {}
  }

  # Used to control the behavior of the map & minimap.
  # Activation for a given `agent` can occur automatically via the device's *Activate Automatically* user option, by the `agent` entering and exiting the device's volume if using the *Activate on Trigger* user option, or via events from other devices or verse.
  # When more than one map controller is activated for a given `agent`, the one with the highest *Map Priority* user option applies.
  map_controller_device<public> := class<concrete><final>(creative_device_base) {
    # Adds the map controller to all `agent`s in the experience.
    # If multiple map controllers are active for an `agent`, the one with the highest *Map Priority* is used.
    Activate<public>(): void = external {}

    # Adds the map controller to the provided `Agent`'s map controller stack.
    # If multiple map controllers are active for an `agent`, the one with the highest *Map Priority* is used.
    Activate<public>(Agent: agent): void = external {}

    # Removes the map controller from all `agent`s in the experience.
    # The next highest priority active map controller will be used, or if none exists, the default behavior will be restored.
    Deactivate<public>(): void = external {}

    # Removes the map controller from the provided `Agent`'s map controller stack.
    # The next highest priority active map controller will be used, or if none exists, the default behavior will be restored.
    Deactivate<public>(Agent: agent): void = external {}

    # Disables the device.
    # Disabling the device will deactivate it for all `agents` in the experience, turn off the trigger functionality, and prevent it from responding to events.
    Disable<public>(): void = external {}

    # Enables the device.
    # Enabling the device will allow it to be activated, both by incoming events, and by trigger if using *Activate on Trigger*.
    Enable<public>(): void = external {}

    # Returns the *Capture Box Size* (in meters).
    GetCaptureBoxSize<public>()<transacts>: float = external {}

    # Sets the *Capture Box Size* (in meters).
    # *Capture Box Size* refers to the length and width of the area used for both the map capture image as well as the activation trigger.
    # Value is clamped between `25.0` and `2500.0` meters.
    SetCaptureBoxSize<public>(Size: float): void = external {}
  }

  # Used to create custom points of interest and markers on the minimap and overview map.
  map_indicator_device<public> := class<concrete><final>(creative_device_base) {
    # Activates an objective pulse at `Agent`'s location pointing toward this device.
    ActivateObjectivePulse<public>(Agent: agent): void = external {}

    # Deactivates the objective pulse at `Agent`'s location.
    DeactivateObjectivePulse<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to take players to different islands and to link experiences together.
  matchmaking_portal_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  melee_designer_device<epic_internal> := class<final>(creative_device_base) {}

  move_to_debug_log<epic_internal> := class(log_channel) {}

  # Results for `MoveToInternal`.
  move_to_internal_result<epic_internal> := enum {
    # The destination would cause the object to be at least partially outside the island's boundaries.
    DestinationOutOfBounds

    # The destination has been reached.
    DestinationReached

    # NaN or Infinity in the requested destination.
    InvalidDestination

    # The object being moved is no longer valid. Example invalid states:
    #  * The object has been destroyed during gameplay.
    #  * The object has been destroyed by Verse.
    #  * The object has the 'Register with Structural Grid' option set in UEFN.
    InvalidObject

    # The `OverTime` parameter was not a float greater than zero.
    InvalidTime

    # The object being moved cannot be scaled.
    ScaleNotAllowed

    # An unknown error occurred. If this happens frequently, contact Epic support.
    UnknownError

    # The move was terminated before completion (e.g., via the `animation_controller` API).
    WillNotReachDestination
  }

  # Results for `MoveTo`.
  move_to_result<public> := enum {
    # The destination has been reached.
    DestinationReached

    # The destination will not be reached. See debug log in UEFN for more info.
    WillNotReachDestination
  }

  # Used to temporarily modify the speed of `agent`s and vehicles.
  movement_modulator_device<public> := class<concrete><final>(creative_device_base) {
    # Activates this device's movement effect on `Agent`.
    Activate<public>(Agent: agent): void = external {}

    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivationEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to specify a zone where custom gameplay effects can be applied (e.g. gravity, no build, no weapons).
  mutator_zone_device<public> := class<concrete><final>(effect_volume_device) {
    # Signaled when an `agent` in this zone begins emoting. This will not signal if the `agent` is on the *Safe Team* or if *Affects Players* is disabled.
    # Sends the `agent` that started emoting.
    AgentBeginsEmotingEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` in this zone ends emoting. This will not signal if the `agent` is on the *Safe Team* or if *Affects Players* is disabled.
    # Sends the `agent` that stopped emoting.
    AgentEndsEmotingEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` enters this zone.
    # Sends the `agent` entering this zone.
    AgentEntersEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits this zone.
    # Sends the `agent` exiting this zone.
    AgentExitsEvent<public>: listenable(agent) = external {}

    # Is true when `Agent` is in the zone.
    IsInVolume<public>(Agent: agent)<transacts><decides>: void = external {}

    # Updates *Selected Class* to `Agent`'s class.
    UpdateSelectedClass<public>(Agent: agent): void = external {}

    # Updates *Selected Team* to `Agent`'s team.
    UpdateSelectedTeam<public>(Agent: agent): void = external {}
  }

  # Used to create an environmental prop that applies Nitro to those around it when it is destroyed.
  nitro_barrel_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Allows the barrel to respawn after it explodes, waiting *RespawnDelay* seconds.
    AllowRespawn<public>(): void = external {}

    # Disables and hides the barrel.Disabling the device will remove an existing barrel and reset the respawn delay.
    Disable<public>(): void = external {}

    # Prevents the barrel from respawning.The *RespawnDelay* countdown will not start. If the countdown has already started, the barrel will not respawn when it ends.
    DisallowRespawn<public>(): void = external {}

    # Enables and shows the barrel.Enabling the device when it's disabled will spawn a new barrel.
    Enable<public>(): void = external {}

    # Triggers when the barrel explodes after being launched. Sends the launching `agent`.If the launcher is a non-agent, sends `false`.
    ExplodedEvent<public>: listenable(?agent) = external {}

    # Returns the force multiplier to launch the barrel.
    GetLaunchForceMultiplier<public>(): float = external {}

    # Returns the delay between exploding and respawning (if allowed), in seconds.
    GetRespawnDelay<public>(): float = external {}

    # Succeeds if the barrel is enabled and visible.
    IsEnabled<public>()<transacts><decides>: void = external {}

    # Succeeds if the barrel has respawn allowed.
    IsRespawnAllowed<public>()<transacts><decides>: void = external {}

    # Triggers when an `agent` launches the barrel. Sends the launching `agent`.If the launcher is a non-agent, sends `false`.
    LaunchedEvent<public>: listenable(?agent) = external {}

    # Sets the multiplier applied to the force used when launching.This is clamped between `0.25` and `2.0`.
    SetLaunchForceMultiplier<public>(LaunchForceMultiplier: float): void = external {}

    # Sets the delay time to respawn the barrel, clamped between `0.0` and `1000.0` seconds.This will override the delay timer if set during the delay countdown.
    SetRespawnDelay<public>(RespawnDelay: float): void = external {}
  }

  # Use to create a flaming hoop that accelerates and applies nitro to players and vehicles.
  nitro_hoop_device<public> := class<concrete><final>(creative_device_base) {
    # Allow the device to enter the cooldown state after a player or vehicle triggers it.
    AllowCooldown<public>(): void = external {}

    # Triggers when the device enters the cooldown state, becoming disabled.
    # This is not triggered by manually calling `Disable`.
    CooldownStartEvent<public>: listenable(tuple()) = external {}

    # Disable the device. This causes the device to enter the cooldown state until the device is re-enabled by `Enable`, `DisallowCooldown`, or `Enable on Phase`.
    Disable<public>(): void = external {}

    # Prevent the device from entering the cooldown state after use. Until `AllowCooldown` is called, triggering the device will not begin cooldown.
    # If the device is currently in the cooldown state, this ends the cooldown state and re-enables the device.
    DisallowCooldown<public>(): void = external {}

    # Enable the device. If the device is currently in the cooldown state, this also ends the cooldown state.
    Enable<public>(): void = external {}

    # Triggers when the device becomes enabled after being disabled, potentially through the cooldown state.
    EnabledEvent<public>: listenable(tuple()) = external {}

    # Return the default duration of the cooldown state in seconds.
    GetDefaultCooldownDuration<public>(): float = external {}

    # Succeeds if the device is currently enabled.
    # The device is not enabled if it is in the cooldown state, or has otherwise been manually disabled.
    IsEnabled<public>()<transacts><decides>: void = external {}

    # Triggers when a player triggers the device.
    # Sends the triggering `agent`.
    PlayerTriggeredEvent<public>: listenable(agent) = external {}

    # Set the default duration of the cooldown state to `Seconds`.
    #  * `Seconds` is clamped between `1.0` and `60.0`.
    SetDefaultCooldownDuration<public>(Seconds: float): void = external {}

    # Enter the cooldown state for `Seconds` seconds. If the device is already in the cooldown state, re-enable it after `Seconds` seconds.
    # `Seconds` is clamped to a minimum of `1.0`.
    StartCooldown<public>(Seconds: float): void = external {}

    # Triggers when a vehicle triggers the device.
    # Sends the driver as the triggering `agent`. If the vehicle has no driver then `false` is returned.
    VehicleTriggeredEvent<public>: listenable(?agent) = external {}
  }

  # Used to spawn NPCs made with Character Definition asset.
  npc_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Despawns all characters. If set, `Instigator` will be considered as the eliminator of those characters.
    DespawnAll<public>(Instigator: ?agent): void = external {}

    # Disables this device. Characters will despawn if *Despawn AIs When Disabled* is set.
    Disable<public>(): void = external {}

    # Signaled when a character is eliminated.
    # `Source` is the `agent` that eliminated the character. If the character was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the character that was eliminated.
    EliminatedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Enables this device. Characters will start to spawn.
    Enable<public>(): void = external {}

    # Resets the spawn count allowing spawning of a new batch of characters.
    Reset<public>(): void = external {}

    # Tries to spawn a character.
    Spawn<public>(): void = external {}

    # Signaled when a character is spawned.
    # Sends the `agent` character who was spawned.
    SpawnedEvent<public>: listenable(agent) = external {}
  }

  # Provides a collection of destructible devices that you can select from to use as objectives in your game.
  objective_device<public> := class<concrete><final>(creative_device_base, healthful, damageable, healable) {
    # Activates an objective pulse at `Agent`'s location pointing toward this device.
    ActivateObjectivePulse<public>(Agent: agent): void = external {}

    Damage<override>(Amount: float): void = external {}

    Damage<override>(Args: damage_args): void = external {}

    DamagedEvent<override>(): listenable(damage_result) = external {}

    # Deactivates the objective pulse at `Agent`'s location.
    DeactivateObjectivePulse<public>(Agent: agent): void = external {}

    # Destroys the objective item. This is done regardless of the visibility or health of the item.
    Destroy<public>(Agent: agent): void = external {}

    # Signaled when this device has been destroyed by an `agent`.
    # Sends the `agent` that destroyed this device.
    DestroyedEvent<public>: listenable(agent) = external {}

    GetHealth<override>()<transacts>: float = external {}

    GetMaxHealth<override>()<transacts>: float = external {}

    Heal<override>(Amount: float): void = external {}

    Heal<override>(Args: healing_args): void = external {}

    HealedEvent<override>(): listenable(healing_result) = external {}

    # Hides this device from the world.
    Hide<public>(): void = external {}

    SetHealth<override>(Health: float)<transacts>: void = external {}

    # Sets the device either invulnerable or damageable
    SetInvulnerable<public>(Invulnerable: logic): void = external {}

    SetMaxHealth<override>(MaxHealth: float)<transacts>: void = external {}

    # Shows this device in the world.
    Show<public>(): void = external {}
  }

  # Specialized `trigger_base_device` that will fire output events based on line of sight between `agent`s and the device.
  perception_trigger_device<public> := class<concrete><final>(trigger_base_device) {
    # Signaled when an `agent` has direct line of sight to this device.
    # Sends the `agent` that has seen this device.
    AgentLooksAtDeviceEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` has lost direct line of sight to this device.
    # Sends the `agent` that has lost sight of this device.
    AgentLooksAwayFromDeviceEvent<public>: listenable(agent) = external {}

    # Signaled when this device loses direct line of sight to an `agent`.
    # Sends the `agent` this device has lost sight of.
    DeviceLosesSightOfAgentEvent<public>: listenable(agent) = external {}

    # Signaled when this device has direct line of sight to an `agent`.
    # Sends the `agent` seen by this device.
    DeviceSeesAgentEvent<public>: listenable(agent) = external {}
  }

  # Physics boulder that can be dislodged and damage `agent`s, vehicles, creatures, and structures.
  physics_boulder_device<public> := class<concrete><final>(physics_object_base_device) {
    # Signaled when the balanced boulder is destroyed.
    BalancedBoulderDestroyedEvent<public>: listenable(tuple()) = external {}

    # Signaled when the balanced boulder is spawned on the base.
    BalancedBoulderSpawnedEvent<public>: listenable(tuple()) = external {}

    # Signaled when the base of the boulder is destroyed.
    BaseDestroyedEvent<public>: listenable(tuple()) = external {}

    # Destroys the boulder's base.
    DestroyBase<public>(): void = external {}

    # Destroys the current rolling boulder.
    DestroyRollingBoulder<public>(): void = external {}

    # Releases the boulder sitting on the base, if there is one.
    ReleaseRollingBoulder<public>(): void = external {}

    # Signaled when the rolling boulder is destroyed.
    RollingBoulderDestroyedEvent<public>: listenable(tuple()) = external {}
  }

  # Base class for various physics-based gameplay elements (e.g. boulders/trees).
  physics_object_base_device<public> := class<abstract><epic_internal>(prop_spawner_base_device) {}

  # Physics tree that can be chopped down, and damage players, vehicles, creatures, and structures.
  physics_tree_device<public> := class<concrete><final>(physics_object_base_device) {
    # Destroys the current log.
    DestroyLog<public>(): void = external {}

    # Destroys the current stump.
    DestroyStump<public>(): void = external {}

    # Signaled when the log created by a tree is destroyed.
    LogDestroyedEvent<public>: listenable(tuple()) = external {}

    # Releases the log from the tree, if there is one.
    ReleaseLog<public>(): void = external {}

    # Signaled when the stump created by a tree is destroyed.
    StumpDestroyedEvent<public>: listenable(tuple()) = external {}

    # Signaled when a tree has taken enough damage to be knocked down.
    TreeKnockedDownEvent<public>: listenable(tuple()) = external {}

    # Signaled when a tree is spawned.
    TreeSpawnedEvent<public>: listenable(tuple()) = external {}
  }

  # A triggered bumper that can knock players back, damage them, and award points.
  pinball_bumper_device<public> := class<concrete><final>(creative_device_base) {
    # Activates this device.
    Activate<public>(): void = external {}

    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to move, damage, and give scores to players that interact with it. By default, it is activated by any player touching its front face, which rotates it counterclockwise and knocks those players away from it and slightly upward.
  pinball_flipper_device<public> := class<concrete><final>(creative_device_base) {
    # Causes `Agent` to activate this device.
    Activate<public>(Agent: agent): void = external {}

    # Signaled when this device is activated by an `agent`.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Used to set an `agent`'s spawn point when activated. This can also clear the `agent`'s inventory.
  player_checkpoint_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when this device is first activated by any `agent`.
    # Sends the `agent` that activated this device.
    FirstActivationEvent<public>: listenable(agent) = external {}

    # Signaled each time a new `agent` activates this device.
    # Sends the `agent` that activated this device.
    FirstActivationPerAgentEvent<public>: listenable(agent) = external {}

    # Registers this checkpoint for `Agent`. This sets the respawn point and can clear `Agent`'s inventory depending on this device's settings. Multiple `agent`s can be registered to this device at one time.
    Register<public>(Agent: agent): void = external {}
  }

  # Used to track and react to how many players are in a particular area, and optionally display that information in game.
  player_counter_device<public> := class<concrete><final>(creative_device_base) {
    # Triggers an evaluation of the current count vs *Target Player Count*, signaling `CountSucceedsEvent` or `CountFailsEvent` based on the evaluation result.
    CompareToTarget<public>(): void = external {}

    # Signaled when the player count does not match *Target Player Count*. The frequency of evaluation against *Target Player Count* can be controlled through the device settings.
    CountFailsEvent<public>: listenable(tuple()) = external {}

    # Signaled when the player count matches *Target Player Count*. The frequency of evaluation against *Target Player Count* can be controlled through the device settings.
    CountSucceedsEvent<public>: listenable(tuple()) = external {}

    # Signaled when a valid player enters the zone and is counted. The frequency of evaluation against the *Target Player Count* can be controlled through the device settings.
    # Sends the `agent` that is now being counted.
    CountedEvent<public>: listenable(agent) = external {}

    # Decrements *Target Player Count* by `1`. Immediately triggers a new comparison.
    DecrementTargetCount<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the number of players currently counted by this device
    GetCount<public>()<transacts>: int = external {}

    # Returns the number of players required for this counter to succeed.
    GetTargetCount<public>()<transacts>: int = external {}

    # Hide this device info panel from the world.
    HideInfoPanel<public>(): void = external {}

    # Increments *Target Player Count* by `1`. Immediately triggers a new comparison.
    IncrementTargetCount<public>(): void = external {}

    # Is true if `Agent` is currently counted by this device.
    IsCounted<public>(Agent: agent)<transacts><decides>: void = external {}

    # Is true if the device is currently succeeding in its comparison.
    IsPassingTest<public>()<transacts><decides>: void = external {}

    # Returns whether this device is represented in the world as an info panel showing Current + Required player counts.
    IsShowingInfoPanel<public>()<transacts><decides>: void = external {}

    # Adds the player to the registered player list.
    # *Track Registered Players* determines how registered players are counted.
    Register<public>(Agent: agent): void = external {}

    # Signaled when a player is no longer counted by this device, such as when they leave the zone, leave the game, or are assigned to a different `team` or class.
    # Sends the `agent` that is no longer being counted.
    RemovedEvent<public>: listenable(agent) = external {}

    # Resets *Target Player Count* to the default value defined in the device settings. If *Target Player Count* was previously incremented or decremented, this reset immediately triggers a new comparison.
    Reset<public>(): void = external {}

    # Sets the number of players required for this counter to succeed. Immediately triggers a new comparison.
    SetTargetCount<public>(Count: int): void = external {}

    # Show this device in the world as an info panel showing Current + Required player counts.
    ShowInfoPanel<public>(): void = external {}

    # Triggers `CountedEvent` for all `agent`s currently being counted.
    TransmitForAllCounted<public>(): void = external {}

    # Removes the player from the registered player list.
    # *Track Registered Players* determines how registered players are counted.
    Unregister<public>(Agent: agent): void = external {}

    # Clears all players from the list of registered players.
    # *Track Registered Players* determines how registered players are counted.
    UnregisterAll<public>(): void = external {}
  }

  # Used to mark an `agent`'s position on the minimap and configure the information shown for marked `agent`s.
  #
  # Example configuration options:
  #  * Health and shield bars for marked players.
  #  * Distance to a marked player.
  #
  # Example marker appearance options:
  #  * Customized text label displayed on marked players.
  #  * Alternative minimap icon and icon color.
  player_marker_device<public> := class<concrete><final>(creative_device_base) {
    # Attaches a marker to `Agent`.
    Attach<public>(Agent: agent): void = external {}

    # Detaches a marker from `Agent`.
    Detach<public>(Agent: agent): void = external {}

    # Detaches markers from all marked `agent`s.
    DetachFromAll<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when the first item type monitored on marked agents has changed.
    # Sends the marked `agent`.
    FirstItemValueChangedEvent<public>: listenable(agent) = external {}

    # Signaled when a marked `agent` meets the quantity condition for the first monitored item type (e.g. Fewer Than, Equal To, More Than X).
    # Sends the marked `agent`.
    FirstItemValueReachedEvent<public>: listenable(agent) = external {}

    # Signaled when the second item type monitored on marked agents has changed.
    # Sends the marked `agent`.
    SecondItemValueChangedEvent<public>: listenable(agent) = external {}

    # Signaled when a marked `agent` meets the quantity condition for the second monitored item type (e.g. Fewer Than, Equal To, More Than X).
    # Sends the marked `agent`.
    SecondItemValueReachedEvent<public>: listenable(agent) = external {}
  }

  # Used to relay `agent` statistics to other devices and `agent`s. Can transmit statistics such as elimination count, eliminated count, or scores when certain conditions are met. Can also project a hologram of the `agent` and display text that can be altered in various positions and curvatures.
  player_reference_device<public> := class<concrete><final>(creative_device_base) {
    # Ends the round/game.
    Activate<public>(): void = external {}

    # Signaled when this device is activated.
    # Sends the `agent` stored in the device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Signaled when the `agent` tracked by this device is replaced.
    # Sends the new `agent` stored in the device.
    AgentReplacedEvent<public>: listenable(agent) = external {}

    # Signaled when the `agent` tracked by this fails to be updated.
    # Sends the `agent` that attempted to be stored in this device.
    AgentUpdateFailsEvent<public>: listenable(agent) = external {}

    # Signaled when the `agent` tracked by this device is updated.
    # Sends the new `agent` stored in the device.
    AgentUpdatedEvent<public>: listenable(agent) = external {}

    # Clears the state of this device.
    Clear<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the `agent` currently referenced by the device.
    GetAgent<public>(): ?agent = external {}

    # Returns the stat value that this device is currently tracking
    GetStatValue<public>(): int = external {}

    # Is true when `Agent` is the player being referenced by the device.
    IsReferenced<public>(Agent: agent)<transacts><decides>: void = external {}

    # Registers `Agent` as the `agent` being tracked by this device.
    Register<public>(Agent: agent): void = external {}

    # Signaled when a stat tracked by this device is updated.
    # Sends the `agent` stored in the device.
    TrackedStatChangedEvent<public>: listenable(agent) = external {}
  }

  # Used to spawn an `agent` on an island. Use multiple `player_spawner_device`s to spawn multiple `agent`s.
  player_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an `agent` is spawned from this device.
    # Sends the `agent` that spawned.
    SpawnedEvent<public>: listenable(agent) = external {}
  }

  # Used to create HUD text boxes that give players information, and allows responses to be customized to player choices.
  popup_dialog_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when this device is dismissed by an `agent`.
    # Sends the `agent` who dismissed the popup.
    DismissedEvent<public>: listenable(agent) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the *Button Text* for this popup at a specified index.
    GetButtonText<public>(Index: int)<transacts>: string = external {}

    # Returns the *Description* text for this popup.
    GetDescriptionText<public>()<transacts>: string = external {}

    # Returns the *Title* text for this popup.
    GetTitleText<public>()<transacts>: string = external {}

    # Hides the popup from all `agent`s in the experience.
    Hide<public>(): void = external {}

    # Hides the popup from `Agent`.
    Hide<public>(Agent: agent): void = external {}

    # Signaled when *Button <Index>* on this device is pushed by an `agent`.
    # Sends the `agent` that pushed the button.
    # Sends the `int` index of the button that was clicked.
    RespondingButtonEvent<public>: listenable(tuple(agent, int)) = external {}

    # Sets all *Button Text* based on the contents of an array of messages and alters the button count based on the size of the array.
    # Button count is not updated on active Popups.
    # `Text` should be no more than `24` characters.
    SetAllButtons<epic_internal>(Text: []message): void = external {}

    # Sets the *Title*, *Description* and *Buttons* for this popup then displays a message for all users.
    SetAndShow<epic_internal>(Title: message, Description: message, ButtonsText: []message): void = external {}

    # Sets the *Title*, *Description* and *Buttons* for this popup then displays a message for a specific user.
    SetAndShow<epic_internal>(
      Title: message,
      Description: message,
      ButtonsText: []message,
      Agent: agent
    ): void = external {}

    # Sets the number of buttons this popup has.
    # Button Count is not updated on active Popups.
    SetButtonCount<public>(Count: int): void = external {}

    # Sets the Button Text for a button at a specific index on this popup.
    #  * `Text` should be no more than `24` characters.
    #  * If `Text` is empty the button will show *OK* instead.
    #  * Button 1 uses `Index` 0. If set, `UpdateCount` will also update the number of buttons
    # if you are setting a button that isn't currently showing.
    SetButtonText<epic_internal>(Text: message, Index: int, UpdateCount: logic): void = external {}

    # Sets the *Button Text* for a button at a specific index on this popup.
    #  * `Text` should be no more than `24` characters.
    #  * If `Text` is empty the button will show *OK* instead.
    #  * Button 1 uses `Index` 0.
    SetButtonText<public>(Text: message, Index: int): void = external {}

    # Sets the *Description* text for this popup. `Text` should be no more than `350` characters.
    SetDescriptionText<public>(Text: message): void = external {}

    # Sets the *Title* text for this popup. `Text` should be no more than `32` characters.
    SetTitleText<public>(Text: message): void = external {}

    # Shows the popup to all `agent`s in the experience.
    Show<public>(): void = external {}

    # Shows the popup to `Agent`.
    Show<public>(Agent: agent): void = external {}

    # Signaled when this device is shown to an `agent`.
    # Sends the `agent` looking at the popup.
    ShownEvent<public>: listenable(agent) = external {}

    # Signaled when this device times out while an `agent` is looking at it.
    # Sends the `agent` who was looking at the popup.
    TimeOutEvent<public>: listenable(agent) = external {}
  }

  # Used to apply Post Process Effects to players through the creative device rather than a Post Process Volume.
  post_process_device<public> := class<concrete><final>(creative_device_base) {
    # Starts blending in the post process effect to the set strength only for the instigating `Agent`.
    BlendIn<public>(Agent: agent): void = external {}

    # Starts blending in the post process effect to the set strength for all players.
    BlendInForAll<public>(): void = external {}

    # Starts blending out the post process effect to 0 strength only for the instigating `Agent`.
    BlendOut<public>(Agent: agent): void = external {}

    # Starts blending out the post process effect to 0 strength for all players.
    BlendOutForAll<public>(): void = external {}

    # Signaled when a blend in event has finished. Sends the `agent` that used this device.
    BlendingInCompleteEvent<public>: listenable(?agent) = external {}

    # Signaled when a blend out event has finished. Sends the `agent` that used this device.
    BlendingOutCompleteEvent<public>: listenable(?agent) = external {}

    # Disables this device for all players.
    Disable<public>(): void = external {}

    # Disables this device only for the instigating `Agent`.
    Disable<public>(Agent: agent): void = external {}

    # Enables this device for all players.
    Enable<public>(): void = external {}

    # Enables this device only for the instigating `Agent`.
    Enable<public>(Agent: agent): void = external {}

    # Resets to the starting strength, ending any ongoing blending only for the instigating `Agent`.
    Reset<public>(Agent: agent): void = external {}

    # Resets to the starting strength, ending any ongoing blending for all players.
    ResetForAll<public>(): void = external {}
  }

  # Base class for various powerup devices offering common events like `ItemPickedUpEvent`.
  powerup_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Despawns this powerup from the experience.
    Despawn<public>(): void = external {}

    # Returns the *Duration* that this powerup will be active for on any player it is applied to.
    GetDuration<public>()<transacts>: float = external {}

    # If the `Agent` has the effect applied to them, this will return the remaining time the effect has.
    # Returns -1.0 if the effect has an infinite duration.
    # Returns 0.0 if the `Agent` does not have the effect applied.
    GetRemainingTime<public>(Agent: agent)<transacts>: float = external {}

    # Returns the `Agent` has the powerup's effect (or another of the same type) applied to them.
    HasEffect<public>(Agent: agent)<transacts><decides>: void = external {}

    # Succeeds if the powerup is currently spawned.
    IsSpawned<public>()<transacts><decides>: void = external {}

    # Signaled when the powerup is picked up by an `agent`.
    # Sends the `agent` that picked up the powerup.
    ItemPickedUpEvent<public>: listenable(agent) = external {}

    # Grants this powerup without an agent reference.
    # Requires *Apply To* set to *All Players*.
    Pickup<public>(): void = external {}

    # Grants this powerup to `Agent`.
    Pickup<public>(Agent: agent): void = external {}

    # Updates the *Duration* for this powerup, clamped to the Min and Max defined in the device.
    # Will not apply to any currently applied effects.
    SetDuration<public>(Time: float): void = external {}

    # Spawns the powerup into the experience so users can interact with it.
    Spawn<public>(): void = external {}
  }

  # Used to manipulate the properties of one or more props in a specified area (e.g. Visibility/Destructibility).
  prop_manipulator_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when props affected by this device are damaged.
    # Sends the `agent` that damaged the prop.
    DamagedEvent<public>: listenable(agent) = external {}

    # Signaled when props affected by this device are destroyed.
    # Sends the `agent` that destroyed the prop.
    DestroyedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Sets the *Override Resource* option to *No*.
    DisableResourceNodeOverrides<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Empties the resources of all props affected by this device.
    ExhaustResources<public>(): void = external {}

    # Signaled when prop resource nodes affected by this device are harvested.
    # Sends the `agent` that harvested resources from the prop.
    HarvestingEvent<public>: listenable(agent) = external {}

    # Hides all props affected by this device.
    HideProps<public>(): void = external {}

    # Signaled when prop resource nodes affected by this device are completely depleted of energy.
    # Sends the `agent` that depleted the prop's energy.
    ResourceDepletionEvent<public>: listenable(agent) = external {}

    # Restocks the resources of all props affected by this device.
    RestockResources<public>(): void = external {}

    # Restores health of all props affected by this device.
    RestoreHealth<public>(): void = external {}

    # Sets the *Override Resource* option to *Yes*.
    SetResourceOverridesActive<public>(): void = external {}

    # Shows all props affected by this device.
    ShowProps<public>(): void = external {}
  }

  # Used to move around a building or prop, and customize responses to various collision event types.
  prop_mover_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the prop hits a creature, animal, or NPC.
    AIHitEvent<public>: listenable(tuple()) = external {}

    # Moves the prop forward based on this device's default configuration, ignoring the prop's previous movement.
    Advance<public>(): void = external {}

    # Signaled when the prop hits an `agent`.
    # Sends the `agent` hit by the prop.
    AgentHitEvent<public>: listenable(agent) = external {}

    # Signaled when the prop movement begins.
    BeganEvent<public>: listenable(tuple()) = external {}

    # Begins the prop moving.
    Begin<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when this device is disabled.
    DisabledEvent<public>: listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when this device is enabled.
    EnabledEvent<public>: listenable(tuple()) = external {}

    # Ends the prop moving.
    End<public>(): void = external {}

    # Signaled when the prop movement ends.
    EndedEvent<public>: listenable(tuple()) = external {}

    # Signaled when the prop reaches its destination.
    FinishedEvent<public>: listenable(tuple()) = external {}

    # Returns the total distance (in meters) that the prop will move.
    GetTargetDistance<public>()<transacts>: float = external {}

    # Returns the speed (in meters per second) at which the prop mover will move the prop to its destination.
    GetTargetSpeed<public>()<transacts>: float = external {}

    # Signaled when the prop changes its direction.
    MovementModeChangedEvent<public>: listenable(tuple()) = external {}

    # Signaled when the prop hits another prop.
    PropHitEvent<public>: listenable(tuple()) = external {}

    # Moves the prop to its original position.
    Reset<public>(): void = external {}

    # Reverses the prop's moving direction.
    Reverse<public>(): void = external {}

    # Sets the total distance (in meters) that the prop will move.
    SetTargetDistance<public>(InDistance: float): void = external {}

    # Sets the speed (in meters per second) at which the prop will move to its destination.
    SetTargetSpeed<public>(Speed: float): void = external {}
  }

  # Allows customization of the Prop-o-Matic weapon functions and how the game reacts to players using it.
  prop_o_matic_manager_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` begins entering a disguise.
    # Sends the `agent` that began entering the disguise.
    BeginEnteringDisguiseEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits a disguise.
    # Sends the `agent` that exited the disguise.
    ExitingDisguiseEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` finishes entering a disguise.
    # Sends the `agent` that finished entering the disguise.
    FinishEnteringDisguiseEvent<public>: listenable(agent) = external {}

    # Returns whether a player is currently hiding or not.
    IsPlayerProp<public>(Agent: agent)<transacts><decides>: void = external {}

    # Manually ping a specific player if they are currently a prop.
    PingPlayerProp<public>(Agent: agent): void = external {}

    # Manually ping all players that are currently hiding as props.
    PingPlayerProps<public>(): void = external {}

    # Adjust the ping time.
    SetPingFrequency<public>(Time: float): void = external {}

    # Toggle Pinging props on/off.
    SetPingProps<public>(On: logic): void = external {}

    # Toggle showing the prop ping cooldown.
    SetShowPropPingCooldown<public>(On: logic): void = external {}

    # Toggle showing the props remaining on the UI.
    SetShowPropsRemaining<public>(On: logic): void = external {}
  }

  # Base class for devices that spawn a prop object.
  prop_spawner_base_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Destroys all props spawned from this device.
    DestroyAllSpawnedObjects<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Spawns the prop associated with this device.
    SpawnObject<public>(): void = external {}
  }

  # A device used to damage players who collide with it. Can also be used as a trigger to activate other devices.
  pulse_trigger_device<public> := class<concrete><final>(creative_device_base) {
    # Starts the damage pulse.
    Begin<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Stops the damage pulse.
    End<public>(): void = external {}

    # Returns the damage to be applied to those hit by an active pulse. Clamped between `0 <= GetDamage <= 100000`.
    GetDamage<public>()<transacts>: float = external {}

    # Returns the total number of times this pulse will complete before ending.
    # `0` indicates the pulse will continue indefinitely.
    GetLoopCount<public>()<transacts>: int = external {}

    # Returns the tempo (in beats per minute or BPM) at which the pulses generated by this pulse trigger will travel.
    GetTempo<epic_internal>()<transacts>: float = external {}

    # Returns the speed (in meters per second) at which the pulses generated by this pulse trigger will travel.
    GetWaveSpeed<public>()<transacts>: float = external {}

    # Resumes the damage pulse from the last position where it was stopped.
    ResumePulse<public>(): void = external {}

    @deprecated
    # This function is deprecated. Use `ResumePulse` instead of this.
    # Resumes the damage sequence from the last position where it was stopped.
    ResumeSequence<public>(): void = external {}

    # Sets the damage to be applied to those hit by an active pulse. Clamped between `0 <= GetDamage <= 100000`.
    # Pulse visuals will change to reflect whether the pulse causes damage or not.
    SetDamage<public>(Damage: float): void = external {}

    # Sets the total number of times this pulse will complete before ending. `LoopCount = 0` indicates the pulse should continue indefinitely.
    SetLoopCount<public>(LoopCount: int): void = external {}

    # Sets the tempo (in beats per minute or BPM) at which the pulses generated by this pulse trigger will travel.
    SetTempo<epic_internal>(Tempo: float): void = external {}

    # Sets the speed (in meters per second) at which the pulses generated by this pulse trigger will travel.
    SetWaveSpeed<public>(Speed: float): void = external {}
  }

  # Used in tandem with `race_manager_device` to define the route players must traverse.
  race_checkpoint_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when this checkpoint becomes the current checkpoint for `agent`.
    # Sends the `agent` who is now targeting this checkpoint.
    CheckpointBecomesCurrentEvent<public>: listenable(agent) = external {}

    # Signaled when this checkpoint becomes the next checkpoint that `agent`s need to pass for the first time.
    # Sends the first `agent` who is now targeting this checkpoint.
    CheckpointBecomesCurrentForTheFirstTimeEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` passes this checkpoint.
    # Sends the `agent` that passed this checkpoint.
    CheckpointCompletedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Sets this checkpoint as the current checkpoint for `Agent`. This only functions if `Agent` has not already passed this checkpoint.
    SetAsCurrentCheckpoint<public>(Agent: agent): void = external {}
  }

  # Used with the `race_checkpoint_device` to create more advanced racing modes.
  race_manager_device<public> := class<concrete><final>(creative_device_base) {
    # Begins the race.
    Begin<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Ends the race.
    End<public>(): void = external {}

    # Signaled when an `agent` completes their first lap.
    # Sends the `agent` that finished the lap.
    FirstLapCompletedEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` completes a lap.
    # Sends the `agent` that finished the lap.
    LapCompletedEvent<public>: listenable(agent) = external {}

    # Signaled when the race begins.
    # Sends the `agent` that started the race.
    RaceBeganEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` finishes the race.
    # Sends the `agent` that finished the race.
    RaceCompletedEvent<public>: listenable(agent) = external {}
  }

  # Used to play curated music from the device or one or more registered `agent`s.
  radio_device<public> := class<concrete><final>(creative_device_base) {
    # Hides this device from the world.
    Hide<public>()<transacts>: void = external {}

    # Starts playing audio from this device.
    Play<public>(): void = external {}

    # Adds the specified agent as a target for the Radio to play audio from
    Register<public>(Agent: agent): void = external {}

    # Shows this device in the world.
    Show<public>()<transacts>: void = external {}

    # Stops playing audio from this device.
    Stop<public>(): void = external {}

    # Removes the specified agent as a target for the Radio to play audio from if previously Registered
    Unregister<public>(Agent: agent): void = external {}

    # Removes all previously registered agents as targets for the Radio to play audio from
    UnregisterAll<public>(): void = external {}
  }

  # Used to trigger in game events based on real world time.
  real_time_clock_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when the optional second *Duration* time has been reached.
    DurationElapsedEvent<public>: listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when this device is enabled after the target time has been reached.
    EnablingAfterTimeReachedEvent<public>: listenable(tuple()) = external {}

    # Signaled when this device is enabled before the target time has been reached.
    EnablingBeforeTimeReachedEvent<public>: listenable(tuple()) = external {}

    # Signaled when the target time is reached.
    TimeReachedEvent<public>: listenable(tuple()) = external {}
  }

  # Used to generate random numbers between a minimum and maximum value. Events are signaled when numbers are generated.
  #  * *Value Limit 1* is the minimum value for generation.
  #  * *Value Limit 2* is the maximum value for generation.
  rng_device<public> := class<concrete><final>(creative_device_base) {
    # Randomly roll a number within the configured min + max value range.
    #  * If the number is >= *Winning Value* then `WinEvent` is fired.
    #  * If the number is < *Winning Value* then `LoseEvent` is fired.
    #  * If the number = minimum then `RolledMinEvent` is fired.
    #  * If the number = maximum then `RolledMaxEvent` is fired.
    Activate<public>(): void = external {}

    # Randomly generate a number between *Value Limit 1* and *Value Limit 2*.
    #  * If the number is >= *Winning Value* then `WinEvent` is fired.
    #  * If the number is < *Winning Value* then `LoseEvent` is fired.
    #  * If the number = minimum then `RolledMinEvent` is fired.
    #  * If the number = maximum then `RolledMaxEvent` is fired.
    #  * `Agent` is used as the Instigator of the roll event.
    Activate<public>(Agent: agent): void = external {}

    # Cancels the active number generation.
    Cancel<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when the generated number < *Winning Value*.
    LoseEvent<public>: listenable(tuple()) = external {}

    # Signaled when the generated number = maximum.
    RolledMaxEvent<public>: listenable(tuple()) = external {}

    # Signaled when the generated number = minimum.
    RolledMinEvent<public>: listenable(tuple()) = external {}

    # Signaled when the generated number >= *Winning Value*.
    WinEvent<public>: listenable(tuple()) = external {}
  }

  # Used to customize gameplay for any round-based game. It generally defines what happens to the`agent`'s inventory and rewards in each round.
  round_settings_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Disables all end-round conditions. The round must be ended through calling `EndRound` or a creative event after this is called.
    DisableEndRoundConditions<public>(): void = external {}

    # Disables the ability for players to Matchmake into the Island. Only applies to published games that have matchmaking turned on in the Island settings
    DisableMatchmaking<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables the ability for players to Matchmake into the Island. Only applies to published games that have matchmaking turned on in the Island settings
    EnableMatchmaking<public>(): void = external {}

    # Ends the round immediately with `Agent`'s team set as the winner of the round.
    EndRound<public>(Agent: agent): void = external {}

    # Signaled when a game round starts.
    RoundBeginEvent<public>: listenable(tuple()) = external {}

    # Toggles between `EnableMatchmaking` and `DisableMatchmaking`.
    ToggleMatchmaking<public>(): void = external {}
  }

  # Gives the ability to save player progress, location, resources and stats persistently across games.
  save_point_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Signaled when data is saved for an `agent`.
    ActivationEvent<public>: listenable(agent) = external {}

    # Clears all saved data for `Agent`.
    ClearData<public>(Agent: agent): void = external {}

    # Clears all saved data for all `agent`s in the current session.
    ClearDataForAll<public>(): void = external {}

    # Signaled when data is cleared for an `agent`.
    ClearedEvent<public>: listenable(agent) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns whether the `agent`'s data is automatically saved while they play.
    GetAutoSaveEnabled<public>()<transacts>: logic = external {}

    # Load data for `Agent`.
    Load<public>(Agent: agent): void = external {}

    # Loads Data for all players in the current session.
    LoadDataForAll<public>(): void = external {}

    # Signaled when data is loaded for an `agent`.
    LoadedEvent<public>: listenable(agent) = external {}

    # Save data for `Agent`. This function does nothing if `Agent` is already eliminated.
    Save<public>(Agent: agent): void = external {}

    # Saves Data for all players in the current session.
    SaveDataForAll<public>(): void = external {}

    # Sets whether the `agent`'s data is automatically saved while they play.
    SetAutoSaveEnabled<public>(Enabled: logic): void = external {}
  }

  # Used to manipulate scores using in-experience triggers. If *Activating Team* is set to a specific team, then you should use the `agent` overloads of each function. The `agent`'s team will be used to determine if that `agent` is allowed to affect the state of the device.
  score_manager_device<public> := class<concrete><final>(creative_device_base) {
    # Grants points.
    Activate<public>(): void = external {}

    # Grant points to `Agent`.
    Activate<public>(Agent: agent): void = external {}

    # Immediately awards the specified score quantity to the indicated agent. Does not require Activate to be called subsequently, and will not modify the device's current Score Award quantity
    AwardScore<epic_internal>(Agent: agent, ScoreToAward: int): void = external {}

    # Decrements the score quantity to be awarded by the next activation by `1`.
    Decrement<public>(): void = external {}

    # Decrements the score quantity to be awarded by the next activation by `1`.
    Decrement<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Disables this device.
    Disable<public>(Agent: agent): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables this device.
    Enable<public>(Agent: agent): void = external {}

    # Returns the current score for `Agent`.
    GetCurrentScore<public>(Agent: agent)<transacts>: int = external {}

    # Returns the score to be awarded by the next activation.
    GetScoreAward<public>()<transacts>: int = external {}

    # Increments the score quantity to be awarded by the next activation by `1`.
    Increment<public>(): void = external {}

    # Increments the score quantity to be awarded by the next activation by `1`.
    Increment<public>(Agent: agent): void = external {}

    # Signaled when the this device reaches its maximum number of triggers as defined by *Times Can Trigger*.
    # Sends the `agent` who last triggered the device.
    MaxTriggersEvent<public>: listenable(agent) = external {}

    # Resets this device to its original state.
    Reset<public>(): void = external {}

    # Resets this device to its original state.
    Reset<public>(Agent: agent): void = external {}

    # Signaled when the this device awards points to an `agent`.
    # Sends the `agent` who received the points.
    ScoreOutputEvent<public>: listenable(agent) = external {}

    # Sets the score to be awarded by the next activation to `Value`.
    SetScoreAward<public>(Value: int): void = external {}

    # Sets the score to be awarded by the next activation to `Agent`'s current score.
    SetToAgentScore<public>(Agent: agent): void = external {}
  }

  # Generates an AI bot that spawns in a location and usually attacks players when they come in range.
  sentry_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the sentry is alerted to an `agent`.
    # Sends the `agent` who alerted the sentry.
    AlertedEvent<public>: listenable(agent) = external {}

    # Signaled when a sentry attacks an `agent`.
    # Sends the `agent` who is being attacked.
    AttackingEvent<public>: listenable(agent) = external {}

    # Destroys the current sentry.
    DestroySentry<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when a sentry is eliminated.
    # Sends the `agent` that eliminated the sentry. If the sentry was eliminated by a non-agent then `false` is returned.
    EliminatedEvent<public>: listenable(?agent) = external {}

    # Signaled when the sentry eliminates a creature.
    EliminatingACreatureEvent<public>: listenable(tuple()) = external {}

    # Signaled when a sentry eliminates an `agent`.
    # Sends the `agent` who was eliminated by the sentry.
    EliminatingAgentEvent<public>: listenable(agent) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Puts the sentry into the alert state.
    EnableAlert<public>(): void = external {}

    # Signaled when the sentry enters the alert state.
    EntersAlertCooldownEvent<public>: listenable(tuple()) = external {}

    # Signaled when the sentry exists the alert state.
    ExitsAlertEvent<public>: listenable(tuple()) = external {}

    # Sets the sentry to the same team `Agent` is on.
    JoinTeam<public>(Agent: agent): void = external {}

    # Puts the sentry into the pacify state, preventing from entering the alert (attacking) state.
    Pacify<public>(): void = external {}

    # Resets the alert state.
    ResetAlertCooldown<public>(): void = external {}

    # Resets the sentry to the original team designated in the device options.
    ResetTeam<public>(): void = external {}

    # Spawns the sentry.
    Spawn<public>(): void = external {}

    # Sets the sentry to target `Agent`. The sentry will not target agents on the same team as the sentry.
    Target<public>(Agent: agent): void = external {}
  }

  using { /Fortnite.com/Vehicles }
  # A one stop automated refueling and repairing station for your vehicles.
  service_station_device<public> := class<concrete><final>(creative_device_base, healthful, damageable, enableable) {
    # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.
    # Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
    Damage<override>(Amount: float): void = external {}

    # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
    Damage<override>(Args: damage_args): void = external {}

    # Signaled when damage is applied to the `damageable` object.
    DamagedEvent<override>(): listenable(damage_result) = external {}

    # Disable this object.
    Disable<override>(): void = external {}

    # Enable this object.
    Enable<override>(): void = external {}

    # Returns the health state of the object. This value will between 0.0 and `GetMaxHealth`
    GetHealth<override>()<transacts>: float = external {}

    # Returns the maximum health of the object. This value will be between 1.0 and Inf.
    GetMaxHealth<override>()<transacts>: float = external {}

    # Check if any vehicle is inside the service station.
    IsAnyVehicleInside<public>()<transacts><decides>: void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
    IsEnabled<override>()<transacts><decides>: void = external {}

    # Sets the health state of the object to `Health`.
    #  * Health state will be clamped between 1.0 and `GetMaxHealth`.
    #  * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the `damageable.Damage` functions instead.
    SetHealth<override>(Health: float)<transacts>: void = external {}

    # Sets the maximum health state of the object.
    #  * MaxHealth will be clamped between 1.0 and Inf.
    #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
    SetMaxHealth<override>(MaxHealth: float)<transacts>: void = external {}

    # Fires when a vehicle enters the service station, returns the vehicle that entered.
    VehicleEnteredEvent<public>: listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station, returns the vehicle that exited.
    VehicleExitedEvent<public>: listenable(fort_vehicle) = external {}

    # Fires on the first tick of a vehicle refueling, returns the refueled vehicle.
    VehicleFuelingBeginEvent<public>: listenable(fort_vehicle) = external {}

    # Fires when a vehicle is at full fuel, returns the refueled vehicle.
    VehicleFuelingEndEvent<public>: listenable(fort_vehicle) = external {}

    # Fires when a vehicle starts repairing, returns the repaired vehicle.
    VehicleRepairBeginEvent<public>: listenable(fort_vehicle) = external {}

    # Fires when a vehicle is at full health, returns the repaired vehicle.
    VehicleRepairEndEvent<public>: listenable(fort_vehicle) = external {}
  }

  shared_saved_data_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Signaled if the save result is off when the state is checked.
    # Sends the `agent` that initiated the check.
    CheckResultOffEvent<public>: listenable(agent) = external {}

    # Signaled if the save result is on when the state is checked.
    # Sends the `agent` that initiated the check.
    CheckResultOnEvent<public>: listenable(agent) = external {}

    # Checks the device state with `Agent` acting as the instigator of the action.
    CheckState<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Loads the device state with `Agent` acting as the instigator of the action.
    LoadState<public>(Agent: agent): void = external {}

    # Saves the device state with `Agent` acting as the instigator of the action.
    SaveState<public>(Agent: agent): void = external {}

    # Signaled when state is saved.
    # Sends the `agent` that initiated the save.
    StateSaveEvent<public>: listenable(agent) = external {}

    # Toggles between `TurnOn` and `TurnOff` with `Agent` acting as the instigator of the action.
    ToggleState<public>(Agent: agent): void = external {}

    # Turns off the device with `Agent` acting as the instigator of the action.
    TurnOff<public>(Agent: agent): void = external {}

    # Turns on this device with `Agent` acting as the instigator of the action.
    TurnOn<public>(Agent: agent): void = external {}
  }

  # A single customizable pop up target that can be hit by `agent`s to trigger various events.
  shooting_range_target_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the target is hit in the bullseye area.
    BullseyeHitEvent<public>: listenable(tuple()) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when the target is hit by an `agent`.
    HitEvent<public>: listenable(tuple()) = external {}

    # Moves an active (standing upright) target down slightly, in an effort to make it harder to hit.
    HopDown<public>(): void = external {}

    # Signaled when the target moves down slightly, making it harder to hit.
    HopDownEvent<public>: listenable(tuple()) = external {}

    # Moves an active (standing upright) target up slightly, in an effort to make it harder to hit.
    HopUp<public>(): void = external {}

    # Signaled when the target moves up slightly, making it harder to hit.
    HopUpEvent<public>: listenable(tuple()) = external {}

    # Signaled when the target takes enough damage to get knocked down.
    KnockdownEvent<public>: listenable(tuple()) = external {}

    # Causes a target to transition from standing upright (active) to lying flat (inactive).
    PopDown<public>(): void = external {}

    # Signaled when the target moves from standing upright to laying flat.
    PopDownEvent<public>: listenable(tuple()) = external {}

    # Causes a target to transition from lying flat (inactive) to standing upright (active).
    PopUp<public>(): void = external {}

    # Signaled when the target moves from laying flat to standing upright.
    PopUpEvent<public>: listenable(tuple()) = external {}

    # Resets the target to its initial settings.
    Reset<public>(): void = external {}
  }

  # A set of customizable pop up targets that can be hit by players to trigger various events.
  shooting_range_target_track_device<public> := class<concrete><final>(creative_device_base) {
    # Activates the movement track.
    ActivateTrack<public>(): void = external {}

    # Signaled when target is hit in the bullseye area.
    BullseyeHitEvent<public>: listenable(tuple()) = external {}

    # Deactivates the movement track.
    DeactivateTrack<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Disables movement on the track. This prevents any movement from occurring, until track movement is enabled again.
    DisableTrackMovement<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables movement on the track. This does not start the target moving, it only enables movement.
    EnableTrackMovement<public>(): void = external {}

    # Signaled when the target is hit by a player.
    HitEvent<public>: listenable(tuple()) = external {}

    # Moves an active (standing upright) target attached to the track down slightly, in an effort to make it harder to hit
    HopDown<public>(): void = external {}

    # Signaled when the target moves down slightly, making it harder to hit.
    HopDownEvent<public>: listenable(tuple()) = external {}

    # Moves an active (standing upright) target attached to the track up slightly, in an effort to make it harder to hit
    HopUp<public>(): void = external {}

    # Signaled when the target moves up slightly, making it harder to hit.
    HopUpEvent<public>: listenable(tuple()) = external {}

    # Signaled when the target is hit by a player.
    KnockdownEvent<public>: listenable(tuple()) = external {}

    # Starts the target moving toward the end of the track.
    MoveToEnd<public>(): void = external {}

    # Starts the target moving toward the start of the track.
    MoveToStart<public>(): void = external {}

    # Causes the target attached to the track to transition from standing upright (active) to lying flat (inactive)
    PopDown<public>(): void = external {}

    # Signaled when the target moves from standing upright to laying flat.
    PopDownEvent<public>: listenable(tuple()) = external {}

    # Causes the target attached to the track to transition from lying flat (inactive) to standing upright (active)
    PopUp<public>(): void = external {}

    # Signaled when the target moves from laying flat to standing upright.
    PopUpEvent<public>: listenable(tuple()) = external {}

    # Resets the target to its initial settings.
    Reset<public>(): void = external {}
  }

  # Used to trigger a custom response to a *Primary* or *Secondary* signal, sent by a *Signal Remote* item.
  signal_remote_manager_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when a player has triggered the *Primary* signal using a *Signal Remote* item.
    # Sends the `agent` that triggered the signal.
    PrimarySignalEvent<public>: listenable(agent) = external {}

    # Signaled when a player has triggered the *Secondary* signal using a *Signal Remote* item.
    # Sends the `agent` that triggered the signal.
    SecondarySignalEvent<public>: listenable(agent) = external {}
  }

  # Used to create a zone where players are put into a skydive state. Can customize the amount of force used to push the player, and how fast players are launched into the air. The direction of the push is in relation to the device, so you can rotate and overlap several devices, then use variable speeds to create pneumatic tubes that propel players in different directions. You can even create unique traversal (traveling) options, where players can use these zones to reach places on your island they couldn't reach any other way.
  skydive_volume_device<public> := class<concrete><final>(effect_volume_device) {
    # Signaled when an `agent` enters the volume.
    # Sends the `agent` that entered the volume.
    AgentEntersEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the volume.
    # Sends the `agent` that exited the volume.
    AgentExitsEvent<public>: listenable(agent) = external {}

    # Disables volume locking which prevents users from leaving the volume once they've entered.
    DisableVolumeLocking<public>(): void = external {}

    # Enables volume locking which prevents users from leaving the volume once they've entered.
    EnableVolumeLocking<public>(): void = external {}

    # Is true when `Agent` is in the volume.
    IsInVolume<public>(Agent: agent)<transacts><decides>: void = external {}

    # Signaled when the zone changes from occupied to empty.
    # Sends the `agent` that last left the volume.
    ZoneEmptiedEvent<public>: listenable(agent) = external {}

    # Signaled when the zone changes from empty to occupied.
    # Sends the `agent` that entered the volume.
    ZoneOccupiedEvent<public>: listenable(agent) = external {}
  }

  # Controls how the sky looks, as well as giving you options for changing the sun, clouds, stars or other objects in the sky above your island. You can control the sun and moon, and add other atmospheric elements like stars, fog and clouds. You can change the color of your light source, and blend different colors for your island's sky to create the perfect atmosphere for your game.
  skydome_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}
  }

  # Results for `SpawnProp`.
  spawn_prop_result<native><public> := enum {
    # The asset is not a valid `creative_prop`.
    InvalidAsset

    # The spawn point contains NaN or Inf.
    InvalidSpawnPoint

    # Success.
    Ok

    # The spawn point is outside the island's boundaries.
    SpawnPointOutOfBounds

    # More props have been spawned than are permitted by the island's rules (currently 100 per script device and 200 total per island).
    TooManyProps

    # An unknown error occurred. If this happens frequently, contact Epic support.
    UnknownError
  }

  # Base class for various specialized storm devices. See also: * `basic_storm_controller_device` * `advanced_storm_controller_device`
  storm_controller_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Destroys the storm.
    DestroyStorm<public>(): void = external {}

    # Generates the storm. *Generate Storm On Game Start* must be set to *No* if you choose to use `GenerateStorm`.
    GenerateStorm<public>(): void = external {}

    # Moves the `storm_controller_device` to the specified `Position` and `Rotation` over the specified time, in seconds.
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Position: vector3, Rotation: rotation, OverTime: float)<suspends>: move_to_result = external {}

    # Moves the `storm_controller_device` to the specified `Transform` over the specified time, in seconds.
    # Existing storms will not target the new location, but newly generated storms will.
    MoveTo<override>(Transform: transform, OverTime: float)<suspends>: move_to_result = external {}

    # Signaled when storm resizing ends. Use this with the *On Finish Behavior* option for better controls.
    PhaseEndedEvent<public>: listenable(tuple()) = external {}

    # Teleports the `storm_controller_device` to the specified `Position` and `Rotation`.
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}

    # Teleports the `storm_controller_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    # Existing storms will not target the new location, but newly generated storms will.
    TeleportTo<override>(Transform: transform)<transacts><decides>: void = external {}
  }

  # Used to play streamed music.
  streaming_radio_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Changes audio channel for `Agent`.
    ChangeChannel<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Starts playing audio for `Agent`.
    Play<public>(Agent: agent): void = external {}

    # Stops playing audio for `Agent`.
    Stop<public>(Agent: agent): void = external {}
  }

  # Used to spawn and configure an aerial supply drop that can provide players with customized weapons/supplies.
  supply_drop_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the balloon on the supply crate is popped.
    # Sends the `?agent` that popped the balloon. If no `agent` popped the balloon returns `false`.
    BalloonPoppedEvent<public>: listenable(?agent) = external {}

    # Destroys the balloon and causes the supply crate to freefall.
    DestroyBalloon<public>(): void = external {}

    # Signaled when the supply crate lands for the first time.
    LandingEvent<public>: listenable(tuple()) = external {}

    # Locks the supply crate so `agent`s cannot open it.
    Lock<public>(): void = external {}

    # Opens the supply crate, ignoring the locked or unlocked state. `Agent` acts as the instigator of the open action.
    Open<public>(Agent: agent): void = external {}

    # Signaled when the supply crate is opened.
    # Sends the `agent` that opened the crate.
    OpenedEvent<public>: listenable(agent) = external {}

    # Spawns a supply drop provided one hasn't already spawned.
    Spawn<public>(): void = external {}

    # Spawns a supply drop provided one hasn't already spawned. *Owning Team* is set to `Agent`'s team.
    Spawn<public>(Agent: agent): void = external {}

    # Unlocks the supply crate so `agent`s can open it.
    Unlock<public>(): void = external {}
  }

  # DEPRECATED This device is no longer supported.Used to inform players of other content made by a creator using a Support-A-Creator code. When players activate the device, it will bring up the same Support-A-Creator dialog box they would see in the Creative hub. The Support-A-Creator information shows when the dialog box opens for the player.
  support_a_creator_device<public> := class<concrete><final>(creative_device_base) {}

  # Used to allow agents to turn other linked devices on/off or other custom state changes.
  switch_device<public> := class<concrete><final>(creative_device_base) {
    # Checks the device state with `Agent` acting as the instigator of the action.
    CheckState<public>(Agent: agent): void = external {}

    # Clears persistence data for all `agent`s.
    ClearAllPersistenceData<public>(): void = external {}

    # Signaled when the persistent data is cleared by the specified `agent`.
    # Sends the `agent` that cleared persistent data on the device.
    ClearEvent<public>: listenable(agent) = external {}

    # Clears persistence data for `Agent`.
    ClearPersistenceData<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the time, in seconds, before the switch will reset itself to default.
    #  Returns -1.0 if *Store State Per Player* is *Yes* or if  there is no active reset timer.
    GetCurrentResetTime<public>(): float = external {}

    # Returns the time, in seconds, before the switch will reset itself to default for *Agent*.
    #  Returns -1.0 if there is no active reset timer.
    GetCurrentResetTime<public>(Agent: agent): float = external {}

    # Returns the current state of this switch: true (on) or false (off). Use this overload  of `GetCurrentState` when this device has *Store State Per Player* set to *No*.
    GetCurrentState<public>()<transacts><decides>: void = external {}

    # Returns the current state of this switch: true (on) or false (off). Use this overload  of `GetCurrentState` when this device has *Store State Per Player* set to *Yes*.
    GetCurrentState<public>(Agent: agent)<transacts><decides>: void = external {}

    # Returns the *Interaction Time* required to activate this device (in seconds).
    GetInteractionTime<public>()<transacts>: float = external {}

    # Returns the value of *State Reset Time*, in seconds, for the device. Returns -1.0 if *State Reset Time* is not used.
    GetStateResetTime<public>()<transacts>: float = external {}

    # Returns the value of *State Reset Time*, in seconds, for the device, for a specific player. Returns -1.0 if *State Reset Time* is not used.
    GetStateResetTime<public>(Agent: agent)<transacts>: float = external {}

    # Signaled if the switch is off when the state is checked.
    IfOffWhenCheckedEvent<public>: listenable(tuple()) = external {}

    # Signaled if the switch is on when the state is checked.
    IfOnWhenCheckedEvent<public>: listenable(tuple()) = external {}

    # Query whether this device has a single global on/off state, or has a personalized on/off state for each individual agent.
    IsStatePerAgent<public>()<transacts><decides>: void = external {}

    # Loads the device state with `Agent` acting as the instigator of the action.
    LoadState<public>(Agent: agent): void = external {}

    # Loads the device state for all players.
    LoadStateForAll<public>(): void = external {}

    # Saves the device state with `Agent` acting as the instigator of the action.
    SaveState<public>(Agent: agent): void = external {}

    # Saves the device state for all players
    SaveStateForAll<public>(): void = external {}

    # Sets the *Interaction Time* required to activate this device (in seconds).
    SetInteractionTime<public>(Time: float): void = external {}

    # Sets the state of the switch to a specific value for a specific `Agent`.
    #  Use when the device has *Store State Per Player* set to *Yes*.
    SetState<public>(Agent: agent, State: logic): void = external {}

    # Sets the state of the switch to a specific value.
    #  Use when the device has *Store State Per Player* set to *No*.
    SetState<public>(State: logic): void = external {}

    # Updates the *State Reset Time* for the device, in seconds,for a specific player (if *Store State Per Player* is *Yes*), clamped to the Min and Max defined in the device.
    #  This will not apply to any state reset timers currently in effect.
    #  Set to 0.0 to disable the State Reset Time. Set to less than 0.0 to reset to default.
    SetStateResetTime<public>(Agent: agent, Time: float): void = external {}

    # Updates the *State Reset Time* for the device, in seconds, clamped to the Min and Max defined in the device.
    #  This will not apply to any state reset timers currently in effect.
    #  Set to 0.0 to disable the State Reset Time. Set to less than 0.0 to reset to default.
    SetStateResetTime<public>(Time: float): void = external {}

    # Sets the *Turn Off Text* to be displayed to a user when the switch is currently on, and offers an interaction to switch it off. Clamped to 150 characters.
    SetTurnOffInteractionText<public>(Text: message): void = external {}

    # Sets the *Turn On Text* to be displayed to a user when the switch is currently off, and offers an interaction to switch it on. Clamped to 150 characters.
    SetTurnOnInteractionText<public>(Text: message): void = external {}

    # Signaled when the switch state changes.
    StateChangesEvent<public>: listenable(tuple()) = external {}

    # Signaled when the switch state is loaded by the specified `agent`.
    # Sends the `agent` that loaded the state on the device.
    StateLoadEvent<public>: listenable(agent) = external {}

    # Signaled when the switch state is saved.
    StateSaveEvent<public>: listenable(tuple()) = external {}

    # Toggles between `TurnOn` and `TurnOff` with `Agent` acting as the instigator of the action.
    ToggleState<public>(Agent: agent): void = external {}

    # Turns off the device with `Agent` acting as the instigator of the action.
    TurnOff<public>(Agent: agent): void = external {}

    # Turns on this device with `Agent` acting as the instigator of the action.
    TurnOn<public>(Agent: agent): void = external {}

    # Signaled when the switch is turned off by the specified `agent`.
    # Sends the `agent` that turned off the device.
    TurnedOffEvent<public>: listenable(agent) = external {}

    # Signaled when the switch is turned on by the specified `agent`.
    # Sends the `agent` that turned on the device.
    TurnedOnEvent<public>: listenable(agent) = external {}
  }

  # Used to place the Infinity Blade on your island. When placed, the Infinity Blade becomes available to any player regardless of team affiliation.
  sword_in_the_stone_device<public> := class<concrete><final>(creative_device_base) {}

  # Provides team and inventory configurations that go beyond the choices the My Island settings provide.
  # Can also be used to customize individual devices and create variations in team setup.
  team_settings_and_inventory_device<public> := class<concrete><final>(creative_device_base) {
    # Ends the round and *Team* wins the round.
    EndRound<public>(): void = external {}

    # Signaled when an enemy of *Team* is eliminated by a team member.
    # Sends the `agent` team member who eliminated the enemy.
    EnemyEliminatedEvent<public>: listenable(agent) = external {}

    # Is true if `Agent` is on *Team*.
    IsOnTeam<public>(Agent: agent)<transacts><decides>: void = external {}

    # Signaled when a member of *Team* is eliminated.
    # Sends the `agent` that was eliminated.
    TeamMemberEliminatedEvent<public>: listenable(agent) = external {}

    # Signaled when a member of *Team* is spawned.Sends the `agent` that has spawned.
    TeamMemberSpawnedEvent<public>: listenable(agent) = external {}

    # Signaled when *Team* runs out of respawns.
    TeamOutOfRespawnsEvent<public>: listenable(tuple()) = external {}
  }

  # Customizable rift that allows `agent`s to move instantly between locations. You can use this to move players around your island, or create multi-island experiences with teleporters that take players from one island to another.
  teleporter_device<public> := class<concrete><final>(creative_device_base) {
    # Teleport `Agent` to the target group using this device.
    Activate<public>(Agent: agent): void = external {}

    # When a link is activated, the current destination teleporter will be able to bring the `agent` back to this origin teleporter. Both origin and destination teleporters need to have this activated to work as expected.
    ActivateLinkToTarget<public>(): void = external {}

    # Deactivates any currently active Link. The current destination teleporter will no longer be able to return the agent to this origin teleporter.
    DeactivateLinkToTarget<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an `agent` enters this device.
    # Sends the `agent` that entered this device.
    EnterEvent<public>: listenable(agent) = external {}

    # Resets the currently selected destination teleporter, and selects an eligible destination. If the target is a *Teleporter Group*, this may be another randomly chosen `teleporter_device` from that group.
    ResetLinkToTarget<public>(): void = external {}

    # Teleport `Agent` to this device.
    Teleport<public>(Agent: agent): void = external {}

    # Signaled when an `agent` emerges from this device.
    # Sends the `agent` that emerged from this device.
    TeleportedEvent<public>: listenable(agent) = external {}
  }

  # Configures game modes where players can start or stop timers to advance gameplay objectives, such as Attack/Defend Bomb objectives.
  timed_objective_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the objective begins.
    # Sends the `agent` that started the timer.
    BeganEvent<public>: listenable(agent) = external {}

    # Starts the objective with `Agent` acting as the user the interacted this device.
    Begin<public>(Agent: agent): void = external {}

    # Completes the objective with `Agent` acting as the user the interacted this device.
    Complete<public>(Agent: agent): void = external {}

    # Signaled when the objective is completed.
    # Sends the `agent` that started the timer or completed the timer by calling `Complete`.
    CompletedEvent<public>: listenable(agent) = external {}

    # Disables the objective for `Agent`.
    Disable<public>(Agent: agent): void = external {}

    # Enables the objective for `Agent`.
    Enable<public>(Agent: agent): void = external {}

    # Ends the objective with `Agent` acting as the user the interacted this device.
    End<public>(Agent: agent): void = external {}

    # Signaled when the objective ends.
    # Sends the `agent` that stopped the timer.
    EndedEvent<public>: listenable(agent) = external {}

    # Makes this device invisible.
    Hide<public>(): void = external {}

    # Pauses the objective with `Agent` acting as the user the interacted this device.
    Pause<public>(Agent: agent): void = external {}

    # Signaled when the objective is paused.
    # Sends the `agent` that paused the timer.
    PausedEvent<public>: listenable(agent) = external {}

    # Restarts the objective with `Agent` acting as the user the interacted this device.
    Restart<public>(Agent: agent): void = external {}

    # Signaled when the objective is restarted.
    # Sends the `agent` that restarted the timer.
    RestartedEvent<public>: listenable(agent) = external {}

    # Resumes the objective with `Agent` acting as the user the interacted this device.
    Resume<public>(Agent: agent): void = external {}

    # Signaled when the objective is resumed.
    # Sends the `agent` that resumed the timer.
    ResumedEvent<public>: listenable(agent) = external {}

    # Makes this device visible.
    Show<public>(): void = external {}
  }

  # Provides a way to keep track of the time something has taken, either for scoreboard purposes, or to trigger actions. It can be configured in several ways, either acting as a countdown to an event that is triggered at the end, or as a stopwatch for an action that needs to be completed before a set time runs out.
  timer_device<public> := class<concrete><final>(creative_device_base) {
    # Clears this device's saved data for `Agent`.
    ClearPersistenceData<public>(Agent: agent): void = external {}

    # Clears this device's saved data for all `agent`s.
    ClearPersistenceDataForAll<public>(): void = external {}

    # Clears this device's saved data for all `agent`s.
    ClearPersistenceDataForAll<public>(Agent: agent): void = external {}

    # Signaled when the timer clears persistent data for an `agent`.
    # Sends the `agent` that cleared the persistent data.
    ClearedEvent<epic_internal>: listenable(agent) = external {}

    # Completes the timer.
    Complete<public>(): void = external {}

    # Completes the timer for `Agent`.
    Complete<public>(Agent: agent): void = external {}

    # Completes the timer for all `agent`s.
    CompleteForAll<public>(): void = external {}

    # Completes the timer for all `agent`s.
    CompleteForAll<public>(Agent: agent): void = external {}

    # Disables this device. While disabled this device will not receive signals.
    Disable<public>(): void = external {}

    # Disables this device for `Agent`. While disabled this device will not receive signals.
    Disable<public>(Agent: agent): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables this device for `Agent`.
    Enable<public>(Agent: agent): void = external {}

    # Signaled when the timer completes or ends with failure.
    # Sends the `agent` that activated the timer, if any.
    FailureEvent<public>: listenable(?agent) = external {}

    # Returns the remaining time (in seconds) on the timer if it is set to be global.
    GetActiveDuration<public>()<transacts>: float = external {}

    # Returns the remaining time (in seconds) on the timer for `Agent`.
    GetActiveDuration<public>(Agent: agent)<transacts>: float = external {}

    # Returns the maximum duration of the timer (in seconds).
    GetMaxDuration<public>()<transacts>: float = external {}

    # Succeeds if this device is tracking timer state for each individual `agent` independently. Fails if state is being tracked globally for all `agent`'s.
    IsStatePerAgent<public>()<transacts><decides>: void = external {}

    # Loads this device's saved data for `Agent`.
    Load<public>(Agent: agent): void = external {}

    # Loads this device's saved data for all players.
    LoadForAll<epic_internal>(): void = external {}

    # Signaled when the timer loads data for an `agent`.
    # Sends the `agent` that loaded.
    LoadedEvent<epic_internal>: listenable(agent) = external {}

    # Pauses the timer.
    Pause<public>(): void = external {}

    # Pauses the timer for `Agent`.
    Pause<public>(Agent: agent): void = external {}

    # Pauses the timer for all `agent`s.
    PauseForAll<public>(): void = external {}

    # Pauses the timer for all `agent`s.
    PauseForAll<public>(Agent: agent): void = external {}

    # Resets the timer back to its base time and stops it.
    Reset<public>(): void = external {}

    # Resets the timer back to its base time and stops it for `Agent`.
    Reset<public>(Agent: agent): void = external {}

    # Resets the timer back to its base time and stops it for all `agent`s.
    ResetForAll<public>(): void = external {}

    # Resets the timer back to its base time and stops it for all `agent`s.
    ResetForAll<public>(Agent: agent): void = external {}

    # Resumes the timer.
    Resume<public>(): void = external {}

    # Resumes the timer for `Agent`.
    Resume<public>(Agent: agent): void = external {}

    # Resumes the timer for all `agent`s.
    ResumeForAll<public>(): void = external {}

    # Resumes the timer for all `agent`s.
    ResumeForAll<public>(Agent: agent): void = external {}

    # Saves this device's data for `Agent`.
    Save<public>(Agent: agent): void = external {}

    # Saves this device's data for all players.
    SaveForAll<epic_internal>(): void = external {}

    # Signaled when the timer saves data for an `agent`.
    # Sends the `agent` that saved.
    SavedEvent<epic_internal>: listenable(agent) = external {}

    # Sets the remaining time (in seconds) on the timer, if active. Use this function if the timer is set to use the same time for all `agent`'s.
    SetActiveDuration<public>(Time: float): void = external {}

    # Sets the remaining time (in seconds) on the timer, if active, on `Agent`.
    SetActiveDuration<public>(Time: float, Agent: agent): void = external {}

    # Sets the lap time indicator for `Agent`.
    SetLapTime<public>(Agent: agent): void = external {}

    # Sets the lap time indicator for all `agent`s.
    SetLapTimeForAll<public>(): void = external {}

    # Sets the lap time indicator for all `agent`s.
    SetLapTimeForAll<public>(Agent: agent): void = external {}

    # Sets the maximum duration of the timer (in seconds).
    SetMaxDuration<public>(Time: float): void = external {}

    # Starts the timer.
    Start<public>(): void = external {}

    # Starts the timer for `Agent`.
    Start<public>(Agent: agent): void = external {}

    # Starts the timer for all `agent`s.
    StartForAll<public>(): void = external {}

    # Starts the timer for all `agent`s.
    StartForAll<public>(Agent: agent): void = external {}

    # Signaled when the timer enters *Urgency Mode*.
    # Sends the `agent` that activated the timer, if any.
    StartUrgencyModeEvent<public>: listenable(?agent) = external {}

    # Signaled when the timer completes or ends with success.
    # Sends the `agent` that activated the timer, if any.
    SuccessEvent<public>: listenable(?agent) = external {}
  }

  # Allows creation and HUD tracking of custom objectives for `agent`s to complete.
  tracker_device<public> := class<concrete><final>(creative_device_base) {
    # Assigns the device to `Agent` (and any `agent`s sharing progress).
    Assign<public>(Agent: agent): void = external {}

    # Assigns this device to all valid `agent`s.
    AssignToAll<public>(): void = external {}

    # Clears tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    ClearPersistence<public>(Agent: agent): void = external {}

    # Clears tracked progress for all valid `agent`s. Only valid if *Use Persistence* is set to *Use*.
    ClearPersistenceForAll<epic_internal>(): void = external {}

    # Signaled when the tracker clears persistent data for an `agent`.
    # Sends the `agent` that cleared the persistent data.
    ClearedEvent<epic_internal>: listenable(agent) = external {}

    # The objective immediately completes.
    Complete<public>(Agent: agent): void = external {}

    # Signaled when the tracked value reaches `GetTarget` for an `agent`.
    # Sends the `agent` that reached `GetTarget` for their tracked value.
    CompleteEvent<public>: listenable(agent) = external {}

    # Decreases the target value for `Agent` by 1.
    DecreaseTargetValue<public>(Agent: agent): void = external {}

    # Decrease the tracked value by *Amount to Change on Received Signal* for `Agent`.
    Decrement<public>(Agent: agent): void = external {}

    # Returns the description for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `GetDescriptionText` has a 64 character limit.
    GetDescriptionText<epic_internal>()<transacts>: string = external {}

    # Returns the target value that must be achieved in order for `CompleteEvent` to trigger.
    # Clamped to `0 <= GetTarget <= 10000`.
    GetTarget<public>()<transacts>: int = external {}

    # Returns the title for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `GetTitleText` has a 32 character limit.
    GetTitleText<epic_internal>()<transacts>: string = external {}

    # Returns the current total tracked value for all players.
    GetValue<public>()<transacts>: int = external {}

    # Returns the current tracked value for `Agent`.
    GetValue<public>(Agent: agent)<transacts>: int = external {}

    # Returns the current total tracked value for the team at `TeamIndex`.
    GetValue<public>(TeamIndex: int)<transacts>: int = external {}

    # Is true if `Agent` has reached the *TargetValue* for the tracker.
    HasReachedTarget<public>(Agent: agent)<transacts><decides>: void = external {}

    # Increases the target value for `Agent` by 1.
    IncreaseTargetValue<public>(Agent: agent): void = external {}

    # Increases the tracked value by *Amount to Change on Received Signal* for `Agent`.
    Increment<public>(Agent: agent): void = external {}

    # Is true if `Agent` currently has the quest active.
    IsActive<public>(Agent: agent)<transacts><decides>: void = external {}

    # Loads tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    Load<public>(Agent: agent): void = external {}

    # Loads tracked progress for all valid `agent`s. Only valid if *Use Persistence* is set to *Use*.
    LoadForAll<public>(): void = external {}

    # Signaled when the tracker loads data for an `agent`.
    # Sends the `agent` that loaded.
    LoadedEvent<epic_internal>: listenable(agent) = external {}

    # Removes this device from `Agent` (and any `agent`s sharing progress).
    Remove<public>(Agent: agent): void = external {}

    # Removes this device from all valid `agent`s.
    RemoveFromAll<public>(): void = external {}

    # Resets the progress for `Agent` (and any `agent`s sharing progress).
    Reset<public>(Agent: agent): void = external {}

    # Saves tracked progress for `Agent`. Only valid if *Use Persistence* is set to *Use*.
    Save<public>(Agent: agent): void = external {}

    # Saves tracked progress for all valid `agent`s. Only valid if *Use Persistence* is set to *Use*.
    SaveForAll<epic_internal>(): void = external {}

    # Signaled when the tracker saves data for an `agent`.
    # Sends the `agent` that saved.
    SavedEvent<epic_internal>: listenable(agent) = external {}

    # Sets a description for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `Text` has a 64 character limit.
    SetDescriptionText<public>(Text: message): void = external {}

    # Sets the target value that must be achieved in order for `CompleteEvent` to trigger.
    # Clamped to `0 <= TargetValue <= 10000`.
    SetTarget<public>(TargetValue: int): void = external {}

    # Sets the title for the `tracker_device`, which is displayed if *Show on HUD* is enabled.
    # `Text` has a 32 character limit.
    SetTitleText<public>(Text: message): void = external {}

    # Sets the current tracked value for the device for a specific 'Agent'.
    # If *Sharing* is set to *Team*, this will set the value for their team.
    # If *Sharing* is set to *All*, this will set the value for everyone.
    SetValue<public>(Agent: agent, Value: int): void = external {}

    # Sets the current tracked value for the device for the Team at the `TeamIndex`.
    # If *Sharing* is set to *Individual*, this will set the value for all team members.
    # If *Sharing* is set to *All*, this will set the value for all players.
    SetValue<public>(TeamIndex: int, Value: int): void = external {}

    # Sets the current tracked value for the device for all active players.
    SetValue<public>(Value: int): void = external {}
  }

  # A trap device that destroys the tile it's placed on when activated.
  trick_tile_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when the tile this device is attached to is removed. This may occur later than `TriggeredEvent` if *Activation Delay* is set on the device.
    # Sends the `agent` that activated this device.
    ActivatedEvent<public>: listenable(agent) = external {}

    # Disables this device. While disabled this device will not react to incoming events.
    Disable<public>(): void = external {}

    # Disables this device from triggering when an `agent` makes contact with the device.
    DisableAgentContactTrigger<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables this device to trigger when an `agent` makes contact with the device.
    EnableAgentContactTrigger<public>(): void = external {}

    # Moves the `trick_tile_device` to the specified `Position` and `Rotation` over the specified time, in seconds.
    # Only the trigger will move, the target buildings will not change.
    MoveTo<override>(Position: vector3, Rotation: rotation, OverTime: float)<suspends>: move_to_result = external {}

    # Moves the `trick_tile_device` to the specified `Transform` over the specified time, in seconds.
    # Only the trigger will move, the target buildings will not change.
    MoveTo<override>(Transform: transform, OverTime: float)<suspends>: move_to_result = external {}

    # Restores the tile removed when this device was triggered.
    Reset<public>(): void = external {}

    # Teleports the `trick_tile_device` to the specified `Position` and `Rotation`.
    # Only the trigger will teleport, the target buildings will not change.
    TeleportTo<override>(Position: vector3, Rotation: rotation)<transacts><decides>: void = external {}

    # Teleports the `trick_tile_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
    # Only the trigger will teleport, the target buildings will not change.
    TeleportTo<override>(Transform: transform)<transacts><decides>: void = external {}

    # Flips the device between `EnableAgentContactTrigger` and `DisableAgentContactTrigger.
    ToggleAgentContactTrigger<public>(): void = external {}

    # Flips the device between `Enabled` and `Disable`.
    ToggleEnabled<public>(): void = external {}

    # Triggers the device, removing the associated tile.
    Trigger<public>(): void = external {}

    # Signaled when this device is triggered.
    # Sends the `agent` that triggered this device.
    TriggeredEvent<public>: listenable(agent) = external {}
  }

  # Base class for various specialized trigger devices. See also: * `trigger_device` * `perception_trigger_device` * `attribute_evaluator_device`
  trigger_base_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Gets the maximum amount of times this device can trigger.
    #  * `0` indicates no limit on trigger count.
    GetMaxTriggerCount<public>()<transacts>: int = external {}

    # Gets the time (in seconds) before the device can be triggered again (if `MaxTrigger` count allows).
    GetResetDelay<public>()<transacts>: float = external {}

    # Gets the time (in seconds) which must pass after triggering, before this device informs other external devices that it has been triggered.
    GetTransmitDelay<public>()<transacts>: float = external {}

    # Returns the number of times that this device can still be triggered before hitting `GetMaxTriggerCount`.
    # Returns `0` if `GetMaxTriggerCount` is unlimited.
    GetTriggerCountRemaining<public>()<transacts>: int = external {}

    # Resets the number of times this device has been activated. This will set `GetTriggerCountRemaining` back to `0`
    Reset<public>(): void = external {}

    # Sets the maximum amount of times this device can trigger.
    #  * `0` can be used to indicate no limit on trigger count.
    #  * `MaxCount` is clamped between [0,20].
    SetMaxTriggerCount<public>(MaxCount: int): void = external {}

    # Sets the time (in seconds) after triggering, before the device can be triggered again (if `MaxTrigger` count allows).
    SetResetDelay<public>(Time: float): void = external {}

    # Sets the time (in seconds) which must pass after triggering, before this device informs other external devices that it has been triggered.
    SetTransmitDelay<public>(Time: float): void = external {}
  }

  # Used to relay events to other linked devices.
  trigger_device<public> := class<concrete><final>(trigger_base_device) {
    # Triggers this device, causing it to activate its `TriggeredEvent` event.
    Trigger<public>(): void = external {}

    # Triggers this device with `Agent` being passed as the `agent` that triggered the action. Use an `agent` reference when this device is setup to require one (for instance, you want to trigger the device only with a particular `agent`.
    Trigger<public>(Agent: agent): void = external {}

    # Signaled when an `agent` triggers this device.
    # Sends the `agent` that used this device. Returns `false` if no `agent` triggered the action (ex: it was triggered through code).
    TriggeredEvent<public>: listenable(?agent) = external {}
  }

  # Specialized `vehicle_spawner_device` that allows an armored battle bus to be configured and spawned.
  vehicle_spawner_armored_battle_bus_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows an ATK (all terrain kart) to be configured and spawned.
  vehicle_spawner_atk_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Baller vehicle to be configured and spawned.
  vehicle_spawner_baller_device<public> := class<concrete><final>(vehicle_spawner_device) {
    # Signaled when the vehicle runs out of energy.
    OutOfEnergyEvent<public>: listenable(tuple()) = external {}

    # Refills the vehicle's energy.
    RefillEnergy<public>(): void = external {}
  }

  # Specialized `vehicle_spawner_device` that allows a Mudflap semi truck to be configured and spawned.
  vehicle_spawner_big_rig_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Stormwing biplane to be configured and spawned.
  vehicle_spawner_biplane_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a boat to be configured and spawned.
  vehicle_spawner_boat_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a cannon to be configured and spawned.
  vehicle_spawner_cannon_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Base class for various specialized vehicle spawners which allow specific vehicle types to be spawned and configured with specialized options.
  vehicle_spawner_device<public> := class<abstract><epic_internal>(creative_device_base) {
    # Signaled when an `agent` enters the vehicle.
    # Sends the `agent` that entered the vehicle.
    AgentEntersVehicleEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the vehicle.
    # Sends the `agent` that exited the vehicle.
    AgentExitsVehicleEvent<public>: listenable(agent) = external {}

    # Applies off-road tires to the vehicle if applicable.
    ApplyOffRoadTires<epic_internal>(): void = external {}

    # Sets `agent` as the vehicle's driver.
    AssignDriver<public>(Agent: agent): void = external {}

    # Destroys the vehicle if it exists.
    DestroyVehicle<public>(): void = external {}

    # Signaled when a vehicle is destroyed.
    DestroyedEvent<public>: listenable(tuple()) = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Returns the `agent` who is currently driving the vehicle.
    GetDriver<epic_internal>()<transacts><decides>: agent = external {}

    # Gets the amount of fuel(or energy) in the vehicle as a percentage between `0.0` and `100.0`.
    GetFuelRemaining<epic_internal>()<transacts>: float = external {}

    # Returns the vehicle's current health.
    # Returns 0.0 if the vehicle does not exist.
    GetVehicleHealth<epic_internal>()<transacts>: float = external {}

    # Returns the vehicle's maximum health.
    GetVehicleMaxHealth<epic_internal>(Amount: float): void = external {}

    # Checks to see if a vehicle is currently spawned from this device.
    HasVehicle<epic_internal>()<transacts><decides>: void = external {}

    # Succeeds if `agent` is the driver of the vehicle.
    IsDriver<epic_internal>(Agent: agent)<transacts><decides>: void = external {}

    # Succeeds if `agent` is the passenger of the vehicle.
    IsPassenger<epic_internal>(Agent: agent)<transacts><decides>: void = external {}

    # Pops all of the tires on the vehicle, if applicable.
    PopAllTires<epic_internal>(): void = external {}

    # Reverts to road tires on the vehicle if applicable.
    RemoveTireMods<epic_internal>(): void = external {}

    # Repairs all of the tires on the vehicle, if applicable.
    RepairAllTires<epic_internal>(): void = external {}

    # Restores the vehicle to full health.
    RepairVehicle<epic_internal>(): void = external {}

    # Spawns a new vehicle. The previous vehicle will be destroyed before a new vehicle spawns.
    RespawnVehicle<public>(): void = external {}

    # Sets the amount of fuel(or energy) in the vehicle as a percentage between `0.0` and `100.0`.
    SetFuelRemaining<epic_internal>(Amount: float): void = external {}

    # Sets the vehicle's current health to the supplied amount.
    # Health will be clamped between `1.0` and *Max Health*.
    SetVehicleHealth<epic_internal>(Amount: float): void = external {}

    # Sets the vehicle's maximum health to the supplied value.
    # Health will be clamped between `1.0` and `9,999.0`.
    SetVehicleMaxHealth<epic_internal>(Amount: float): void = external {}

    # Signaled when a vehicle is spawned or respawned by this device.
    # Sends the fort_vehicle who was spawned.
    SpawnedEvent<public>: listenable(fort_vehicle) = external {}

    # Signaled when a vehicle is destroyed.
    # Deprecated, use DestroyedEvent instead.
    VehicleDestroyedEvent<public>: listenable(tuple()) = external {}

    # Signaled when a vehicle is spawned or respawned by this device.
    # Deprecated, use SpawnedEvent instead.
    VehicleSpawnedEvent<public>: listenable(tuple()) = external {}
  }

  # Specialized `vehicle_spawner_device` that allows a dirtbike to be configured and spawned.
  vehicle_spawner_dirtbike_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Driftboard to be configured and spawned.
  vehicle_spawner_driftboard_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a GetAway Car to be configured and spawned.
  vehicle_spawner_getaway_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows an anti-vehicle turret to be configured and spawned.
  vehicle_spawner_heavy_turret_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a helicopter to be configured and spawned.
  vehicle_spawner_helicopter_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Nitro Drifter sedan to be configured and spawned.
  vehicle_spawner_nitro_drifter_sedan_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Spawns a lightweight vehicle made for defying gravity with its rocket boosting, jumping, and aerial maneuverability capabilities.
  vehicle_spawner_octane_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a pickup truck to be configured and spawned.
  vehicle_spawner_pickup_truck_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Quadcrasher to be configured and spawned.
  vehicle_spawner_quadcrasher_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Rocket Racing Vehicle to be configured and spawned.
  vehicle_spawner_rocketracing_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Prevalent sedan to be configured and spawned.
  vehicle_spawner_sedan_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a shopping cart to be configured and spawned.
  vehicle_spawner_shopping_cart_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a siege cannon to be configured and spawned.
  vehicle_spawner_siege_cannon_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a sportbike to be configured and spawned.
  vehicle_spawner_sportbike_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a Whiplash sports car to be configured and spawned.
  vehicle_spawner_sports_car_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a surfboard to be configured and spawned.
  vehicle_spawner_surfboard_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a tank to be configured and spawned.
  vehicle_spawner_tank_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a taxi to be configured and spawned.
  vehicle_spawner_taxi_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a UFO to be configured and spawned.
  vehicle_spawner_ufo_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a valet SUV to be configured and spawned.
  vehicle_spawner_valet_suv_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Specialized `vehicle_spawner_device` that allows a war bus to be configured and spawned.
  vehicle_spawner_war_bus_device<public> := class<concrete><final>(vehicle_spawner_device) {}

  # Holds and spawns items, with an optional cost for each item. Can hold up to three items, and `agent`s can cycle between these by hitting the machine with their pickaxe.
  vending_machine_device<public> := class<concrete><final>(creative_device_base) {
    # Cycles the screen to show the next item.
    CycleToNextItem<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when an item is spawned from this device.
    # Sends the `agent` that used this device.
    ItemSpawnedEvent<public>: listenable(agent) = external {}

    # Spawns an item.
    SpawnItem<public>(): void = external {}
  }

  # Used to create and customize your own visual effects. This is more flexible than the `vfx_spawner_device`, which gives you a selection of pre-made visual effects to choose from but limits how much you can customize or change those effects.
  vfx_creator_device<public> := class<concrete><final>(creative_device_base) {
    # Starts playing the effect.
    Begin<public>(): void = external {}

    # Starts the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    Begin<public>(Agent: agent): void = external {}

    # Starts the effect at every `agent`'s location. This option is only valid if *Stick to Player* is enabled.
    BeginForAll<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Ends playing the effect.
    End<public>(): void = external {}

    # Ends the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    End<public>(Agent: agent): void = external {}

    # Ends the effect at every `agent`'s locations. This option is only valid if *Stick to Player* is enabled.
    EndForAll<public>(): void = external {}

    # Removes the effect from `Agent` and continues playing at the device location. This option is only valid if *Stick to Player* is enabled.
    Remove<public>(Agent: agent): void = external {}

    # Removes the effect for every `agent` and continues playing at the device location. This option is only valid if *Stick to Player* is enabled.
    RemoveFromAll<public>(): void = external {}

    # Spawns the effect at `Agent`'s location. This option is only valid if *Stick to Player* is enabled.
    SpawnAt<public>(Agent: agent): void = external {}

    # Toggles between `Begin` and `End`.
    Toggle<public>(): void = external {}

    # Toggles between `Begin` and `End`.
    Toggle<public>(Agent: agent): void = external {}

    # Toggles between `Enable` and `Disable`.
    ToggleEnabled<public>(): void = external {}

    # Toggles between `BeginForAll` and `EndForAll`.
    ToggleForAll<public>(): void = external {}

    # Pauses the effect if the effect is running. If the effect is paused, unpauses the effect. Pausing an effect causes the effect to freeze in place.
    TogglePause<public>(): void = external {}

    # Pauses the effect at `Agent`'s locations if it is playing, or resumes the effect if it is paused.
    # When paused the effect freezes in place.
    TogglePause<public>(Agent: agent): void = external {}

    # Pauses the effect at every `agent`'s locations if it is playing, or resumes the effect if it is paused.
    # When paused the effect freezes in place.
    TogglePauseForAll<public>(): void = external {}
  }

  # Used to place visual effects around your island. You can use these effects to enhance the overall theme and experience of your game.
  vfx_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Signaled when the effect is disabled.
    EffectDisabledEvent<public>: listenable(tuple()) = external {}

    # Signaled when the effect is enabled.
    EffectEnabledEvent<public>: listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Restarts the VFX. Triggers the VFX if it's Burst VFX.
    Restart<public>(): void = external {}
  }

  # Used to display curated videos onto in-game screens or player HUDs.
  video_player_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device.
    Disable<public>(): void = external {}

    # Disables collision checks on this device.
    DisableCollision<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Enables collision checks on this device.
    EnableCollision<public>(): void = external {}

    # Turns off all streaming devices of this type on the island.
    EndForAll<public>(): void = external {}

    # Transitions to fullscreen for `Agent`.
    EnterFullScreen<public>(Agent: agent): void = external {}

    # Transitions to fullscreen for `Agent`.
    ExitFullScreen<public>(Agent: agent): void = external {}

    # Hides the picture-in-picture video from `Agent`.
    HidePIP<public>(Agent: agent): void = external {}

    # Transitions the picture-in-picture video to the default size for `Agent`.
    MakePIPDefaultSize<public>(Agent: agent): void = external {}

    # Transitions the picture-in-picture video to full screen for `Agent`.
    MakePIPFullScreen<public>(Agent: agent): void = external {}

    # If any streaming device has forced control of the stream, this will release it and play the highest priority stream in line.
    ReleaseControl<public>(): void = external {}

    # Restart the stream from the beginning.
    Restart<public>(): void = external {}

    # Seeks to the *Triggered Seek Time*. Caution: The stream will pause while the video buffers when seeking.
    Seek<public>(): void = external {}

    # Signaled when this device becomes the controlling streaming device for the `agent`.
    StreamStartedEvent<public>: listenable(agent) = external {}

    # Stops the currently playing stream and starts the custom stream with the audio only playing from this device. *Stream Priority* will not work until control is released.
    TakeControl<public>(): void = external {}
  }

  # Used to create a customizable vine version of the Grind Rails.
  vine_rail_device<public> := class<concrete><final>(creative_device_base) {
    # Disables this device, preventing players from grinding on the vines.
    Disable<public>(): void = external {}

    # Enables this device, letting players grind on the vines.
    Enable<public>(): void = external {}

    # Signaled when an `agent` starts grinding on this `vine_rail_device`.
    EndedGrindingEvent<public>: listenable(agent) = external {}

    # Hides the track. Players can still grind on the track if it is enabled.
    Hide<public>(): void = external {}

    # Make this track visible.
    Show<public>(): void = external {}

    # Signaled when an `agent` starts grinding on this `vine_rail_device`.
    StartedGrindingEvent<public>: listenable(agent) = external {}
  }

  # Used to trigger a visual effect (a glow or an outline) when `agent`s pick it up.
  visual_effect_powerup_device<public> := class<concrete><final>(powerup_device) {}

  # Used to track when agents enter and exit a volume.
  volume_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` enters the device volume.
    AgentEntersEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the device volume.
    AgentExitsEvent<public>: listenable(agent) = external {}
  }

  # Used to create and manipulate volumes of water where players can swim, fish, or drive boats.
  water_device<public> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` enters the water.
    # Sends `agent` that entered the water.
    AgentEntersWaterEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` exits the water.
    # Sends `agent` that exited the water.
    AgentExitsWaterEvent<public>: listenable(agent) = external {}

    # Starts vertically emptying the water in the volume.
    BeginVerticalEmptying<public>(): void = external {}

    # Starts vertically filling the water in the volume.
    BeginVerticalFilling<public>(): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Resets the water level in the volume to the value set in the *Default Vertical Water Percentage* option.
    Reset<public>(): void = external {}

    # Resumes either filling or emptying the volume.
    ResumeVerticalMovement<public>(): void = external {}

    # Stops filling or emptying the volume.
    StopVerticalMovement<public>(): void = external {}

    # Signals when the water volume is completely empty.
    VerticalEmptyingCompletedEvent<public>: listenable(tuple()) = external {}

    # Signals when the volume is filled to the water level set in the *Default Vertical Water Percentage* option.
    VerticalFillingCompletedEvent<public>: listenable(tuple()) = external {}
  }

  # Used to spawn various wildlife that players can herd, hunt, or tame.
  wildlife_spawner_device<public> := class<concrete><final>(creative_device_base) {
    # Consumes energy from wildlife belonging to `Agent` by *Energy Consume Amount*.
    ConsumeEnergy<public>(Agent: agent): void = external {}

    # Consumes energy from wildlife by *Energy Consume Amount*.
    ConsumeEnergyForAll<public>(): void = external {}

    # Signaled when wildlife is damaged.
    # `Source` is the `agent` that damaged the wildlife. If the wildlife was damaged by a non-agent then `false` is returned.
    # `Target` is the wildlife that was damaged.
    DamagedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Despawns wildlife. `Agent` is marked as the one who eliminated the wildlife.
    Despawn<public>(Agent: agent): void = external {}

    # Destroys this device, marking `Agent` as the destroyer of the device.
    DestroySpawner<public>(Agent: agent): void = external {}

    # Disables this device.
    Disable<public>(): void = external {}

    # Dismounts `Agent` from wildlife.
    Dismount<public>(Agent: agent): void = external {}

    # Dismounts all `agent`s from wildlife.
    DismountAll<public>(): void = external {}

    # Signaled when an `agent` dismounts wildlife.
    # `Source` is the `agent` that dismounted the wildlife.
    # `Target` is the wildlife that was dismounted.
    DismountedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Eliminates wildlife tamed by `Agent`.
    EliminateTamed<epic_internal>(Agent: agent): void = external {}

    # Signaled when wildlife is eliminated.
    # `Source` is the `agent` that eliminated the wildlife. If the wildlife was eliminated by a non-agent then `Source` is 'false'.
    # `Target` is the wildlife that was eliminated.
    EliminatedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Signaled when a wildlife eliminates an agent.
    # `Source` is the wildlife that eliminated the agent.
    # `Target` is the agent that was eliminated.
    EliminatingEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Enables this device.
    Enable<public>(): void = external {}

    # Signaled when wildlife is force-spawned and causes the oldest wildlife to be eliminated.
    # Sends the `agent` wildlife that was spawned.
    ForceSpawnedEvent<public>: listenable(agent) = external {}

    # Returns the spawn limit of the device.
    GetSpawnLimit<public>()<transacts>: int = external {}

    # Resets the count on the *Total Spawn Count* option.
    Reset<public>(): void = external {}

    # Restores energy to wildlife belonging to `Agent` by *Energy Restore Amount*.
    RestoreEnergy<public>(Agent: agent): void = external {}

    # Restores energy to wildlife by *Energy Restore Amount*.
    RestoreEnergyForAll<public>(): void = external {}

    # Signaled when an `agent` rides wildlife.
    # `Source` is the `agent` that started riding the wildlife.
    # `Target` is the wildlife that was ridden.
    RiddenEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Teleports `Agent` to the nearest wildlife, then `Agent` mounts that wildlife.
    Ride<public>(Agent: agent): void = external {}

    # Signaled when wildlife eats a pickup such as a Shroom or Meat.
    #  Sends the wildlife that ate something.
    SomethingIsEatenEvent<public>: listenable(agent) = external {}

    # Spawns wildlife from this device.
    Spawn<public>(): void = external {}

    # Signaled when this device spawns wildlife.
    # Sends the `agent` wildlife that was spawned.
    SpawnedEvent<public>: listenable(agent) = external {}

    # Tames wildlife, making them AI partners of `Agent`.
    Tame<public>(Agent: agent): void = external {}

    # Signaled when wildlife is tamed.
    # `Source` is the `agent` that tamed the wildlife.
    # `Target` is the wildlife that was tamed.
    TamedEvent<public>: listenable(device_ai_interaction_result) = external {}

    # Untames any tamed wildlife that belong to `Agent`.
    Untame<public>(Agent: agent): void = external {}

    # Untames all wildlife.
    UntameAll<public>(): void = external {}

    # Signaled when wildlife is untamed.
    # `Source` is the `agent` that tamed the wildlife.
    # `Target` is the wildlife that was untamed.
    UntamedEvent<public>: listenable(device_ai_interaction_result) = external {}
  }

  # Used to create plants with explosive pods that players can detonate and launch.
  wilds_plant_device<public> := class<concrete><final>(creative_device_base) {
    # Disables the device to prevent interaction and growth.
    Disable<public>(): void = external {}

    # Enables the device to allow interaction and let it grow.
    Enable<public>(): void = external {}

    # Detonates the plant if the device is enabled.
    Explode<public>(): void = external {}

    # Triggers whenever the plant or launched projectile explodes.
    #  * Sends the `agent` that initially launched the projectile or triggered an immediate explosion.
    #  * Sends `false` if no `agent` is found.
    ExplodeEvent<public>: listenable(?agent) = external {}

    # Grows the plant if the device is enabled. If *Infinite Regrowths* is `false`, this is limited by *Maximum Regrowths*.
    Grow<public>(): void = external {}

    # Triggers whenever the plant grows.
    GrowEvent<public>: listenable(tuple()) = external {}

    # Triggers whenever the plant launches a projectile.
    #  * Sends the `agent` that triggered this event.
    #  * Sends `false` if no `agent` is found.
    LaunchEvent<public>: listenable(?agent) = external {}

    # Sets whether the plant can always regrow after launching a projectile or being destroyed.
    SetInfiniteRegrowths<public>(InfiniteRegrowths: logic): void = external {}

    # Sets how many times the plant can regrow after launching a projectile or being destroyed.
    #  * This applies across the device’s entire lifetime and is unaffected by *Enable* and *Disable*.
    #  * This value is clamped.
    SetMaximumRegrowths<public>(MaximumRegrowths: int): void = external {}
  }

  # Creates a zipline that moves players from point to point.
  zipline_device<epic_internal> := class<concrete><final>(creative_device_base) {
    # Signaled when an `agent` attaches to the zipline.
    # Sends `agent` that attached.
    AttachEvent<public>: listenable(agent) = external {}

    # Signaled when an `agent` detaches from the zipline.
    # Sends `agent` that detached.
    DetachEvent<public>: listenable(agent) = external {}

    # Returns true if `Agent`is currently attached to this zipline.
    IsAttached<public>(Agent: agent)<transacts><decides>: void = external {}
  }
}

# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module {
  # Respawns the character for `InAgent` at the provided `RespawnPosition` and applies the yaw of `RespawnRotation`.
  (InAgent: agent).Respawn<native><public>(RespawnPosition: vector3, RespawnRotation: rotation)<transacts>: void

  # Returns an `[]player`s currently spectating `InPlayer`.
  (InPlayer: player).GetPlayersSpectating<native><public>()<transacts>: []player

  # Succeeds if `InPlayer` is spectating the experience. Fails otherwise.
  (InPlayer: player).IsSpectator<native><public>()<transacts><decides>: void

  # Sends `InPlayer` back to the main game lobby.
  (InPlayer: player).SendToLobby<native><public>()<transacts>: void

  # Sets the dynamic resolution behavior based on the preferred rendering mode.
  SetPreferredRenderingModeHint<native><epic_internal>(
    Players: []player,
    InPreferredRenderingMode: preferred_rendering_mode
  ): void

  # The possible dynamic resolution rendering modes
  preferred_rendering_mode<native><epic_internal> := enum {
    # Maximize the framerate
    MaximizeFramerate

    # Maximize the dynamic resolution by setting a lower target framerate
    MaximizeResolution
  }
}

using { /Fortnite.com/Characters }
using { /Verse.org/Assets }
using { /Verse.org/Simulation }
using { /Verse.org/VerseEngine/Component }
# Module import path: /Fortnite.com/Game
Game<public> := module {
  @experimental
  # Activate a camera behavior component for a player, setting it as the active view target
  (InCameraBehavior: camera_behavior_component).ActivateForPlayer<native><epic_internal>(InPlayer: player)<transacts><decides>: void

  @experimental
  (InCameraBehavior: camera_behavior_component).ActivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex: int)<transacts><decides>: void

  @experimental
  # Deactivate a camera behavior component for a player, restoring the player's view target to the default
  (InCameraBehavior: camera_behavior_component).DeactivateForPlayer<native><epic_internal>(InPlayer: player)<transacts><decides>: void

  @experimental
  (InCameraBehavior: camera_behavior_component).DeactivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex: int)<transacts><decides>: void

  @experimental
  # Activate a camera component for a player, setting it as the active view target
  (InCameraBehavior: camera_component).ActivateForPlayer<native><epic_internal>(InPlayer: player)<transacts><decides>: void

  @experimental
  (InCameraBehavior: camera_component).ActivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex: int)<transacts><decides>: void

  @experimental
  # Deactivate a camera component for a player, restoring the player's view target to the default
  (InCameraBehavior: camera_component).DeactivateForPlayer<native><epic_internal>(InPlayer: player)<transacts><decides>: void

  @experimental
  (InCameraBehavior: camera_component).DeactivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex: int)<transacts><decides>: void

  # Module import path: /Fortnite.com/Game/Abilities
  Abilities<public> := module {
    # Module import path: /Fortnite.com/Game/Abilities/AbilityComponent
    AbilityComponent<public> := module {
      GetAbilityComponentForCharacter<native><public>(__dupe___unnamed_parameter_183: fort_character)<transacts><decides>: vk_fort_ability_component

      GetAbilityComponentForPlayer<native><epic_internal>(__dupe___unnamed_parameter_182: player_component)<transacts><decides>: vk_fort_ability_component
    }

    activate_ability_result<native><public> := enum {
      # Ability was activated successfully
      Activated

      # Ability was activated and then was cancelled
      Canceled

      # Ability was activated and then ended naturally
      Completed

      # Ability failed to activate
      Failed

      # Ability asset was invalid
      Invalid

      # Ability could not be activated because it was not added
      NotOwned
    }

    add_ability_result<native><public> := enum {
      # Ability was successfully added
      Added

      # Ability was already added
      AlreadyOwned

      # Ability asset was invalid
      Invalid
    }

    gameplay_ability_asset<native><public> := class<computes><final>(asset) {}

    gameplay_effect_asset<native><public> := class<computes><final>(asset) {}

    remove_ability_result<native><public> := enum {
      # Ability asset was invalid
      Invalid

      # Ability could not be removed because it was not added
      NotOwned

      # Ability was successfully removed
      Removed
    }

    vk_fort_ability_component<native><public> := class<final>(vk_component) {
      ActivateAbility<native><public>(
        AbilityAsset: gameplay_ability_asset,
        ?Target: ?agent = external {}
      )<suspends>: activate_ability_result

      AddAbility<native><public>(AbilityAsset: gameplay_ability_asset): add_ability_result

      ApplyGameplayEffect<native><public>(EffectAsset: gameplay_effect_asset, Magnitude: float): void

      RemoveAbility<native><public>(AbilityAsset: gameplay_ability_asset): remove_ability_result
    }
  }

  # Module import path: /Fortnite.com/Game/Attributes
  Attributes<public> := module {
    gameplay_attribute<native><public> := class<abstract><epic_internal>(gameplay_attribute_base) {
      AttributePathString<native><epic_internal>: string
    }

    @import_as("/Script/VerseFortniteGameplayAbilities.UVerseGameplayAttribute")
    gameplay_attribute_base<native><epic_internal> := class<abstract> {}

    health_attribute<public> := class<final>(gameplay_attribute) {
      AttributePathString<override>: string = external {}
    }
  }

  @experimental
  GetPlayerCameraView<native><epic_internal>(Player: player)<transacts><decides>: fort_player_camera_view

  @experimental
  GetPlayerCameraViewByIndex<native><epic_internal>(PlayerIndex: int)<transacts><decides>: fort_player_camera_view

  HandleTeleportToResult<epic_internal>(
    Result: teleport_to_result,
    TargetTragsform: transform
  )<transacts><decides>: void = external {}

  # Module import path: /Fortnite.com/Game/Movement
  Movement<public> := module {
    projectile_movement_component<native><public> := class<final>(vk_component) {
      SetBounciness<native><public>(Bounciness: float): void

      SetDirection<native><public>(Direction: vector3): void

      SetFriction<native><public>(Friction: float): void

      SetGravity<native><public>(Gravity: float): void

      SetShouldBounce<native><public>(ShouldBounce: logic): void

      SetSpeed<native><public>(Speed: float): void
    }
  }

  # Module import path: /Fortnite.com/Game/Player
  Player<public> := module {
    # Fortnite player attributes
    PlayerAttribute<native><public> := enum {
      # Fortnite current player health
      CurrentHealth

      # Fortnite currentplayer shield
      CurrentShield

      # Fortnite transient player damage
      Damage

      # Fortnite initial player health
      InitialHealth

      # Fortnite initial player health
      InitialShield

      # Fortnite transient player shield damage
      ShieldDamage
    }

    # Fortnite player attribute operations
    PlayerAttributeOperation<native><public> := enum {
      Add

      Divide

      Multiply

      Override

      SetMax

      SetMin
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerAttributes
    # Fortnite player attribute utility module
    PlayerAttributes<public> := module {
      # Add to the specified player attribute.
      AddToNumericAttribute<native><public>(TargetPlayer: player, attributeID: PlayerAttribute, amount: float): void

      # Get the specified player attribute.
      GetNumericAttributeValue<native><public>(TargetPlayer: player, attributeID: PlayerAttribute): float

      # Modify the specified player attribute.
      ModifyNumericAttribute<native><public>(
        TargetPlayer: player,
        attributeID: PlayerAttribute,
        op: PlayerAttributeOperation,
        amount: float
      ): void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerInventory
    PlayerInventory<public> := module {
      # Clear all droppable items from a player inventory
      ClearDroppableItems<native><public>(PlayerHandle: player): void

      # Remove an inventory item from a player
      RemoveFromInventory<native><public>(PlayerHandle: player, AssetPath: string, Quantity: int): logic

      # Add an inventory item to a player
      TryAddItemToInventory<native><public>(
        PlayerHandle: player,
        ItemDefinition: fort_item_definition,
        Quantity: int,
        NotifyPlayerClient: logic
      )<transacts><decides>: void

      # Add an inventory item to a player
      TryAddToInventory<native><public>(
        PlayerHandle: player,
        AssetPath: string,
        Quantity: int,
        NotifyPlayerClient: logic
      ): void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerInvulnerable
    # Player Invulnerability Utilities
    PlayerInvulnerable<public> := module {
      # Gets players current invulnerability state
      IsPlayerInvulnerable<native><public>(InPlayer: player)<decides>: void

      # Set player invulnerability state
      SetPlayerInvulnerability<native><public>(InPlayer: player, IsInvulnerable: logic): void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerSpectator
    # Player Spectator Utilities
    PlayerSpectator<public> := module {
      # Returns array of players currently spectating this player
      GetPlayersSpectatingTarget<native><public>(TargetPlayer: player)<transacts>: []player

      # Sets a player to spectator
      SetSpectator<native><public>(InPlayer: player)<transacts><decides>: void

      # Sets the player's eliminator as who a player should spectate
      SpectateEliminator<native><public>(InPlayer: player)<transacts><decides>: void

      # Sets who a player should spectate
      SpectatePlayer<native><public>(InPlayer: player, PlayerToSpectate: player)<transacts><decides>: void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerStartComponent
    PlayerStartComponent<public> := module {
      findAllInPlayspaceWithTags<native><epic_internal>(
        contextObject: vk_component,
        searchTags: []string
      ): []player_start_component
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerStasis
    # Player stasis utilities
    PlayerStasis<public> := module {
      # Put the specified player into stasis
      PutInStasis<native><public>(TargetPlayer: player): void

      # Put the specified player into stasis, with options to set what is allowed in stasis. NOTE: Allowing turning currently also allows falling.
      PutInStasisAdvanced<native><public>(
        InPlayer: player,
        AllowTurning: logic,
        AllowFalling: logic,
        AllowEmotes: logic
      ): void

      # Release the player from stasis
      ReleaseFromStasis<native><public>(TargetPlayer: player): void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerStatus
    PlayerStatus<epic_internal> := module {
      getStatus<native><public>(TargetPlayer: player_component, statusType: player_status_type): logic
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerTeam
    # Fornite Team Utilities
    PlayerTeam<public> := module {
      # Succeeds if the team contains human players.
      ContainsHumanPlayers<native><public>(Team: player_team)<decides>: void

      # Returns true if the teams are the same.
      Equals<native><public>(Team1: player_team, Team2: player_team)<computes>: logic

      # Get the first team
      GetFirstTeam<native><public>()<converges>: player_team

      # Get the invalid team
      GetInvalidTeam<native><public>()<converges>: player_team

      # Get the next team
      GetNextTeam<native><public>(Team: player_team)<converges>: player_team

      # Get the player team
      GetTeam<native><public>(TargetPlayer: player): player_team

      # Returns the color for a team
      GetTeamColor<native><epic_internal>(Team: player_team): color

      # Returns a team's members
      GetTeamMembers<native><public>(Team: player_team): []player

      # Returns the size of a team
      GetTeamSize<native><public>(Team: player_team): int

      # Pick a team for the player
      PickTeam<native><public>(TargetPlayer: player, PreferredTeam: player_team): player_team

      # Set the player team. Returns true if the team was set. False otherwise.
      SetTeam<native><public>(InPlayer: player, Team: player_team): logic
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerTravel
    # Method to control a player's travel in the game client
    PlayerTravel<public> := module {
      # Send the specified player back to the main game lobby
      SendToLobby<native><public>(TargetPlayer: player): void
    }

    # Module import path: /Fortnite.com/Game/Player/PlayerVisibility
    # Player visibility utilities.
    PlayerVisibility<public> := module {
      # Hide the specified player from view
      SetIsHidden<native><public>(InPlayer: player, IsHidden: logic): void
    }

    fort_player_component<native><public> := class(player_component) {
      GetUniqueID<native><public>(): string

      IsActive<native><public>(state: string): logic

      PopActiveState<native><public>(stateToRemove: string): logic

      PushActiveState<native><public>(stateToAdd: string): logic
    }

    player_start_component<native><public> := class<final>(vk_component) {
      addTags<native><public>(newTags: []string): void

      getPosition<native><public>(): vector3

      @editable
      var tags<native><public>: []string
    }

    player_status_type<native><epic_internal> := enum {
      AimingDownSights

      InStasis

      InVehicle

      OnGround

      Shooting

      Skydiving

      UsingGlider
    }

    # Player Team
    player_team<native><public> := struct {}
  }

  PlayerSettingState<native><public> := enum {
    PlayerAllow

    PlayerDefault

    PlayerDisallow
  }

  # Module import path: /Fortnite.com/Game/StormController
  StormController<public> := module {
    storm_controller_component<native><public> := class<final>(vk_component) {
      begin<native><public>(): void

      end<native><public>(): void

      exists<native><public>(): logic

      pause<native><public>(): void

      reset<public>(): void = external {}

      setBattleRoyalePhases<public>(): void = external {}

      var boundsRadius<native><public>: float

      var phases<native><public>: []storm_phase

      var startRadius<native><public>: float
    }

    storm_phase<native><public> := class<final> {
      damageIndex<native><public>: int = external {}

      endLocation<native><public>: vector3

      endRadius<native><public>: float = external {}

      endRadiusPercentage<native><public>: float = external {}

      maxMovementDistance<native><public>: float = external {}

      maxMovementDistancePercentage<native><public>: float = external {}

      minMovementDistance<native><public>: float = external {}

      minMovementDistancePercentage<native><public>: float = external {}

      moves<native><public>: logic = external {}

      shrinkTime<native><public>: float = external {}

      waitTime<native><public>: float = external {}
    }
  }

  # Module import path: /Fortnite.com/Game/VerseFortniteHacks
  VerseFortniteHacks<epic_internal> := module {
    GetPawnCollisionEntityID<native><public>(__dupe___unnamed_parameter_182: player_component): int

    getAllComponentsOfType<native><epic_internal>(contextObject: vk_component, Type: subtype(vk_component)): []vk_component

    respawnPlayer<native><public>(TargetPlayer: player_component, spawnPoint: player_start_component): void

    setAutoRespawnEnabled<native><epic_internal>(contextObject: vk_component, Enabled: logic): void
  }

  # Implementation of the `game_action_instigator` interface for `agent`s.
  agent_instigator_impl<native><epic_internal> := class(game_action_instigator) {
    TheAgent<native><epic_internal>: agent
  }

  # Parameters for common damage functions on Fortnite objects.
  damage_args<native><public> := struct {
    # Amount of damage to apply to the object.
    Amount<native><public>: float

    # Player, agent, etc. that instigated the damage to the object.
    Instigator<native><public>: ?game_action_instigator = external {}

    # Player, weapon, vehicle, etc. that damaged the object.
    Source<native><public>: ?game_action_causer = external {}
  }

  # Results for damage events on Fortnite objects.
  damage_result<native><public> := struct<epic_internal> {
    # Amount of damage applied to `Target`.
    Amount<native><public>: float

    # Player, agent, etc. that instigated the damage to `Target`. Can be false when damage is instigated by code, the environment, etc.
    Instigator<native><public>: ?game_action_instigator = external {}

    # Player, weapon, vehicle, etc. that damaged `Target`. Can be false when damage is caused by code, the environment, etc.
    Source<native><public>: ?game_action_causer = external {}

    # Object that was damaged.
    Target<native><public>: damageable
  }

  # Implemented by Fortnite objects that can be damaged.
  damageable<native><public> := interface<epic_internal> {
    # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.
    # Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
    Damage<public>(Amount: float): void

    # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
    Damage<public>(Args: damage_args): void

    # Signaled when damage is applied to the `damageable` object.
    DamagedEvent<public>(): listenable(damage_result)
  }

  # Result data for `fort_character` elimination events.
  elimination_result<native><public> := struct<epic_internal> {
    # The `fort_character` eliminated from the match by `EliminatingCharacter`.
    EliminatedCharacter<native><public>: fort_character

    # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be false when `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
    EliminatingCharacter<native><public>: ?fort_character
  }

  @experimental
  fort_ability_component<native><epic_internal> := class(ability_component) {}

  fort_building_settings_component<native><public> := class<final>(vk_component) {
    setBuilding<native><public>(state: PlayerSettingState): void

    setBuildingOnWater<native><public>(state: PlayerSettingState): void

    setEditing<native><public>(state: PlayerSettingState): void

    setEditingHostile<native><public>(state: PlayerSettingState): void

    setTrapPlacement<native><public>(state: PlayerSettingState): void
  }

  @experimental
  fort_damageable_component<native><epic_internal> := class(damageable_component) {
    @experimental
    DamagedEventWithAgent<native><epic_internal>: listenable(tuple(float, ?agent)) = external {}

    @editable
    @experimental
    MaxHealth<native><epic_internal>: float = external {}

    @experimental
    var Health<native><public>: float = external {}
  }

  @experimental
  fort_game_component<native><epic_internal> := class<abstract>(component) {
    OnBeginSimulation<native><override>(): void

    OnEndSimulation<native><override>(): void

    @experimental
    # Override to add custom logic when the game experience begins.
    OnRoundBegin<native_callable><protected>()<suspends>: void = external {}

    @experimental
    # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
    OnRoundEnd<native_callable><protected>(): void = external {}
  }

  fort_item_definition<native><public> := class<computes>(asset) {}

  @experimental
  # Component used to associate a camera behavior component with a player
  fort_player_camera_view<native><epic_internal> := class<epic_internal>(player_camera_view) {}

  fort_playspace_component<native><epic_internal> := class(playspace_component) {
    _WaitForPlayerEliminated<native><public>()<suspends>: player_eliminated_result
  }

  fortnite_building_component<native><public> := class<final>(vk_component) {
    canBeDamaged<native><public>(): logic

    canBeReplaced<native><public>(): logic

    setCanBeDamaged<native><public>(canDamage: logic): void

    setCanBeReplaced<native><public>(canReplace: logic): void

    wasPlayerBuilt<native><public>()<transacts>: logic
  }

  # Implemented by Fortnite objects that can be passed through game action events, such as damage and heal.
  # For example: player, vehicle, or weapon.
  #
  # Event Listeners often use `game_action_causer` to pass along additional information about what weapon caused the damage.
  # Systems will then use that information for completing quests or processing game specific event logic.
  game_action_causer<native><public> := interface {}

  # Implemented by Fortnite objects that initiate game actions, such as damage and heal. For example, player or agents.
  # Event listeners often use `game_action_instigators` to calculate player damage scores.
  game_action_instigator<native><public> := interface<epic_internal> {}

  # Implemented by Fortnite objects that can be healed.
  healable<native><public> := interface<epic_internal> {
    # Heal the `healable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no healing.
    # Use `Heal(:healing_args):void` when healing is being applied from a known instigator and source.
    Heal<public>(Amount: float): void

    # Cause `Args.Amount` damage to the `damageable` object. Setting `Amount` to less than 0 will cause no damage.
    Heal<public>(Args: healing_args): void

    # Signaled when healing is applied to the `healable` object.
    HealedEvent<public>(): listenable(healing_result)
  }

  # Parameters for common healing functions on Fortnite objects.
  healing_args<native><public> := struct {
    # Amount of healing to apply to the object.
    Amount<native><public>: float

    # Player, agents, etc. that instigated the healing of the object.
    Instigator<native><public>: ?game_action_instigator = external {}

    # Player, weapon, vehicle, etc. that healed the object.
    Source<native><public>: ?game_action_causer = external {}
  }

  # Results for healing events on Fortnite objects.
  healing_result<native><public> := struct<epic_internal> {
    # Amount of healing applied to `Target`.
    Amount<native><public>: float

    # Player, agent, etc. that instigated healing of the `Target`. Can be false when damage is instigated by code, the environment, etc.
    Instigator<native><public>: ?game_action_instigator = external {}

    # Player, weapon, vehicle, etc. that healed `Target`. Can be false when damage is caused by code, the environment, etc.
    Source<native><public>: ?game_action_causer = external {}

    # Object that was healed.
    Target<native><public>: healable
  }

  # Implemented by Fortnite objects that have health state and can be eliminated.
  healthful<native><public> := interface<epic_internal> {
    # Returns the health state of the object. This value will between 0.0 and `GetMaxHealth`
    GetHealth<public>()<transacts>: float

    # Returns the maximum health of the object. This value will be between 1.0 and Inf.
    GetMaxHealth<public>()<transacts>: float

    # Sets the health state of the object to `Health`.
    #  * Health state will be clamped between 1.0 and `GetMaxHealth`.
    #  * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the `damageable.Damage` functions instead.
    SetHealth<public>(Health: float)<transacts>: void

    # Sets the maximum health state of the object.
    #  * MaxHealth will be clamped between 1.0 and Inf.
    #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
    SetMaxHealth<public>(MaxHealth: float)<transacts>: void
  }

  match_stats<native><public> := class<final>(stat_container) {
    GetMatchStat<native><public>(StatIndex: int): int

    GetPlayerStat<native><public>(InPlayer: player, StatIndex: int)<transacts>: int

    GetTeamStat<native><public>(Team: player_team, StatIndex: int): int

    IncrementMatchStat<native><public>(StatIndex: int, Increase: int): logic

    IncrementPlayerStat<native><public>(InPlayer: player, StatIndex: int, Increase: int): logic

    IncrementTeamStat<native><public>(Team: player_team, StatIndex: int, Increase: int): logic

    Reset<native><public>(): void

    SetMatchStat<native><public>(StatIndex: int, NewValue: int): void

    SetPlayerStat<native><public>(InPlayer: player, StatIndex: int, NewValue: int): void

    SetTeamStat<native><public>(Team: player_team, StatIndex: int, NewValue: int): void
  }

  player_eliminated_result<native><epic_internal> := class {
    EliminatedPlayer<native><public>: player_component

    Eliminator<native><public>: ?player_component
  }

  # A stat container that is associated with a particular player.
  player_stat_values<native><public> := class<final>(stat_container) {
    # The player this collection of stats is for.
    OwningPlayer<native><public>: player
  }

  # Implemented by objects to allow reading position information.
  positional<native><public> := interface<epic_internal> {
    # Returns the transform of the object.
    GetTransform<public>()<transacts>: transform
  }

  # Implemented by Fortnite objects that have shields. A shield is a method of protection that can take incoming damage while leaving the health state unchanged.
  shieldable<native><public> := interface<epic_internal> {
    # Signaled when the shield is damaged.
    DamagedShieldEvent<public>(): listenable(damage_result)

    # Returns the maximum shield state of the object. This value will be between 0.0 and Inf.
    GetMaxShield<public>()<transacts>: float

    # Returns the shield state of the object. This value will between 0.0 and `MaxShield`
    GetShield<public>()<transacts>: float

    # Signaled when the shield is healed.
    HealedShieldEvent<public>(): listenable(healing_result)

    # Sets the maximum shield state of the object.
    #  * MaxShield will be clamped between 0.0 and Inf.
    #  * Current shield state will be scaled up or down based on the scale difference between the old and new MaxShield state.
    SetMaxShield<public>(MaxShield: float)<transacts>: void

    # Sets the shield state of the object.
    #  * Shield state will be clamped between 0.0 and `MaxShield`.
    SetShield<public>(Shield: float)<transacts>: void
  }

  # A container object that stores a collection of stats
  stat_container<native><public> := class {
    # Get a player stat value.
    GetStatValue<native><public>(StatIndex: int): int

    # Returns true if the player stat was successfully updated (increment can be negative!).
    IncrementStat<native><public>(StatIndex: int, IncrementAmount: int): logic

    # Returns true if the player stat was successfully set or updated.
    SetStatValue<native><public>(StatIndex: int, NewValue: int): logic
  }

  team_stat_values<native><public> := class<final>(stat_container) {
    GetPlayerStat<native><public>(InPlayer: player, StatIndex: int)<transacts>: int

    IncrementPlayerStat<native><public>(InPlayer: player, StatIndex: int, Increase: int): logic

    SetPlayerStat<native><public>(InPlayer: player, StatIndex: int, NewValue: int): void

    # The team this collection of stats corresponds to.
    Team<native><public>: player_team
  }

  teleport_to_debug_log<epic_internal> := class(log_channel) {}

  # Results for `TeleportTo` of creative objects and devices.
  teleport_to_result<native><epic_internal> := enum {
    # There is something colliding with the requested destination.
    CollidingDestination

    # The destination would cause the object to be at least partially outside the island's boundaries.
    DestinationOutOfBounds

    # `NaN` or `Infinity` in the requested destination.
    InvalidDestination

    # The object being moved is no longer valid. Example invalid states:
    #  * The object has been destroyed during gameplay.
    #  * The object has been destroyed by Verse.
    #  * The object has the *Register with Structural Grid* option set in UEFN.
    InvalidObject

    # Success.
    Ok

    # The object being moved cannot be scaled.
    ScaleNotAllowed

    # An unknown error occurred. If this happens frequently, contact Epic support.
    UnknownError
  }
}

using { /Fortnite.com/Game/Player }
using { /UnrealEngine.com/Playspace }
Itemization<public> := module {
  @experimental
  (Inventory: inventory_component).GetKeyForParameterCollection<native><public>()<transacts><decides>: int

  @experimental
  (InventoryCollection: inventory_collection_component).GetKeyForParameterCollection<native><public>()<transacts><decides>: int

  @experimental
  (Item: item).GetKeyForParameterCollection<native><public>()<transacts><decides>: int

  InventoryCollectionParameterCollection<epic_internal> := class(parameterized_parameter_collection) {
    UE5Class<override>: parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_CollectionKey_Changed<epic_internal>(): void = external {}

    ___ParameterCollection_On_CollectionName_Changed<epic_internal>(): void = external {}
  }

  InventoryCollectionParameterCollection_asset<epic_internal>: parameter_collection_UE5_definition = external {}

  InventoryItemParameterCollection<public> := class<public>(parameterized_parameter_collection) {
    UE5Class<override>: parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_Amount_Changed<epic_internal>(): void = external {}

    ___ParameterCollection_On_IsActive_Changed<epic_internal>(): void = external {}

    ___ParameterCollection_On_ItemKey_Changed<epic_internal>(): void = external {}

    ___ParameterCollection_On_ItemName_Changed<epic_internal>(): void = external {}
  }

  InventoryItemParameterCollection_asset<epic_internal>: parameter_collection_UE5_definition = external {}

  InventoryParameterCollection<public> := class<public>(parameterized_parameter_collection) {
    UE5Class<override>: parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_InventoryKey_Changed<epic_internal>(): void = external {}

    ___ParameterCollection_On_InventoryName_Changed<epic_internal>(): void = external {}
  }

  InventoryParameterCollection_asset<epic_internal>: parameter_collection_UE5_definition = external {}

  @experimental
  active_item_limit_behavior<native><public> := enum<persistable> {
    Block

    UnequipLeastRecentlyUsed
  }

  @experimental
  add_inventory_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    InventoryCollection<native><public>: inventory_collection_component
  }

  @experimental
  add_items_result<native><public> := struct<epic_internal> {
    AddedItems<native><public>: []item

    Inventory<native><public>: inventory_component

    InventoryCollection<native><public>: inventory_collection_component
  }

  @experimental
  change_items_slot_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    InventoryCollection<native><public>: inventory_collection_component

    SlotChangedItems<native><public>: []item_slot_change
  }

  @experimental
  equippable_inventory_component<native><public> := class(inventory_component) {
    @editable
    AutoEquipRequirementList<native><public>: []item_requirement_base = external {}

    CanEquipItem<native><public>(Item: item)<decides>: void

    EquipItem<native><public>(Item: item)<transacts><decides>: void

    @editable
    EquipmentRestrictionList<native><public>: []equippable_item_restriction_base = external {}

    @editable
    ShowSlotBindings<native><public>: logic = external {}

    @editable
    SlotBindingList<native><epic_internal>: []tuple(enhanced_input_action, int) = external {}

    UnequipItem<native><public>(Item: item)<transacts><decides>: void

    var ActiveItemList<native><public>: []item = external {}
  }

  @experimental
  equippable_inventory_hotbar_component<native><public> := class(equippable_inventory_component) {
    AutoEquipRequirementList<override>: []item_requirement_base = external {}

    EquipmentRestrictionList<override>: []equippable_item_restriction_base = external {}

    var TotalSlots<override>: int = external {}
  }

  @experimental
  equippable_inventory_slot_component<native><public> := class(equippable_inventory_component) {
    AutoEquipRequirementList<override>: []item_requirement_base = external {}

    EquipmentRestrictionList<override>: []equippable_item_restriction_base = external {}

    var TotalSlots<override>: int = external {}
  }

  @experimental
  equippable_item_restriction<native><public> := class(equippable_item_restriction_base) {
    @editable
    ActiveLimitBehaviour<native><public>: active_item_limit_behavior = external {}

    @editable
    ActiveSlotLimit<native><public>: int = external {}

    AppliesTo<native><public>(Item: item)<transacts><decides>: void

    GetActiveLimitBehaviour<native><public>(Item: item)<transacts><decides>: active_item_limit_behavior

    GetActiveSlotLimit<native><public>(Item: item)<transacts><decides>: int

    @editable
    ItemRequirement<native><public>: ?item_requirement_base = external {}
  }

  @import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
  @experimental
  equippable_item_restriction_base<native><public> := class<unique><concrete> {}

  @experimental
  inventory_add_items_result<native><public> := struct<epic_internal> {
    AddedItems<native><public>: []item

    Inventory<native><public>: inventory_component
  }

  @experimental
  inventory_add_result<native><public> := struct {
    AmountAdded<native><public>: int

    ModifiedItemList<native><public>: []item
  }

  @experimental
  inventory_backpack_component<public> := class(inventory_component) {
    var TotalSlots<override>: int = external {}
  }

  @experimental
  inventory_collection_component<native><public> := class<epic_internal>(component) {
    AddInventory<native><public>(InventoryClass: subtype(inventory_component))<transacts><decides>: inventory_component

    GetItemList<epic_internal>(): []item = external {}

    InventoryAddedEvent<native><public>: listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><public>: listenable(remove_inventory_result) = external {}

    @editable
    InventorySetupData<native><protected>: ?inventory_setup_data = external {}

    IsAllowedOnClient<override>(): logic = external {}

    ItemsAddedEvent<native><public>: listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>: listenable(remove_items_result) = external {}

    ItemsSlotChangedEvent<native><public>: listenable(change_items_slot_result) = external {}

    RemoveInventory<native><public>(Inventory: inventory_component)<transacts><decides>: void

    var<private> InventoryList<native><public>: []inventory_component = external {}
  }

  @experimental
  inventory_collection_view_model_component<native><public> := class<final>(component) {
    GetParameterCollection<native_callable><epic_internal>(): InventoryCollectionParameterCollection = external {}

    HandleInventoryAdded<protected>(AddInventoryResult: add_inventory_result): void = external {}

    HandleInventoryRemoved<protected>(RemoveInventoryResult: remove_inventory_result): void = external {}

    HandleItemSlotsChanged<protected>(ChangeItemsSlotResult: change_items_slot_result): void = external {}

    HandleItemsAdded<protected>(AddItemsResult: add_items_result): void = external {}

    HandleItemsRemoved<protected>(RemoveItemsResult: remove_items_result): void = external {}

    InitializeViewModel<native_callable><public>(Collection: inventory_collection_component): void = external {}

    ParameterCollection<epic_internal>: InventoryCollectionParameterCollection = external {}
  }

  @experimental
  inventory_component<native><public> := class(component) {
    CanAcceptItem<native><public>(Item: item)<decides>: void

    DisposeAllItems<native><public>(): void

    DuplicateItem<native><public>(Item: item, ?Amount: int = external {})<transacts><decides>: inventory_add_result

    GetItemList<native><public>(): []item

    @editable
    @replicated("")
    InventoryDescription<native><public>: string = external {}

    IsAllowedOnClient<override>(): logic = external {}

    @editable
    ItemRequirement<native><public>: ?item_requirement_base = external {}

    ItemsAddedEvent<native><public>: listenable(add_items_result) = external {}

    ItemsChangedSlotEvent<native><public>: listenable(change_items_slot_result) = external {}

    ItemsRemovedEvent<native><public>: listenable(remove_items_result) = external {}

    RemoveItem<native><public>(Item: item, ?Amount: int = external {})<transacts><decides>: int

    TakeItem<native><public>(Item: item)<transacts><decides>: int

    @editable
    VerseGameplayTags<native><epic_internal>: tag_container = external {}

    @editable
    @replicated("")
    var EnableItemStacking<native><public>: logic = external {}

    @replicated("")
    var InventoryMaxStackSizeOverride<native><public>: int = external {}

    @editable
    @replicated("")
    var InventoryName<native><public>: string = external {}

    @replicated("")
    var InventoryType<native><public>: inventory_creation_type = external {}

    @editable
    @replicated("")
    var PickupPriority<native><public>: int = external {}

    @editable
    @replicated("")
    var TotalSlots<native><protected>: int = external {}
  }

  using { /UnrealEngine.com/EpicGamesRestricted/Network }
  using { /Verse.org/Colors }
  using { /Verse.org/Simulation }
  using { /Verse.org/Simulation/Tags }
  @experimental
  inventory_creation_type<native><public> := enum<persistable> {
    Runtime

    SetupData
  }

  @experimental
  inventory_item_entry_view_model<public> := class<final>(inventory_item_entry_view_model_base) {
    InitializeViewModel<public>(Item: item): void = external {}

    ParameterCollection<public>: InventoryItemParameterCollection = external {}
  }

  @import_as("/Script/ItemizationCoreUI.UVerseInventoryItemEntryViewModelBase")
  inventory_item_entry_view_model_base<native><epic_internal> := class<abstract> {}

  @experimental
  inventory_setup_data<native><public> := class<concrete> {
    ApplyTo<native><public>(Target: inventory_collection_component)<decides>: inventory_setup_data_result

    @editable
    InventorySetupDataName<native><public>: string = external {}
  }

  @experimental
  inventory_setup_data_result<native><public> := struct<epic_internal> {
    AddedInventoryMap<native><public>: []tuple(inventory_component, []item)

    InventoryCollection<native><public>: inventory_collection_component
  }

  @experimental
  inventory_view_model<epic_internal> := class<final>(inventory_view_model_base) {
    InitializeViewModel<public>(InInventory: inventory_component): void = external {}

    ParameterCollection<public>: InventoryParameterCollection = external {}
  }

  @import_as("/Script/ItemizationCoreUI.UVerseInventoryViewModelBase")
  inventory_view_model_base<native><epic_internal> := class<abstract> {}

  @experimental
  item<native><public> := class(entity) {}

  @experimental
  item_amount_change<native><public> := struct<epic_internal> {
    Item<native><public>: item

    NewAmount<native><public>: int

    PreviousAmount<native><public>: int
  }

  @experimental
  item_component<native><public> := class<epic_internal>(component) {
    OnItemStateChanged<native><public>(Item: item)<transacts><decides>: void

    ShouldBeUnique<native><public>()<decides>: void
  }

  @experimental
  item_rarity<native><public> := class<unique><concrete> {
    @editable
    RarityColor<native><public>: color = external {}

    @editable
    RarityDescription<native><public>: string = external {}

    @editable
    RarityName<native><public>: string = external {}

    @editable
    RarityTier<native><public>: float = external {}
  }

  @experimental
  item_rarity_component<native><final><public> := class(item_component) {
    @editable
    var<private> Rarity<native><public>: ?item_rarity
  }

  @experimental
  item_requirement<native><public> := class(item_requirement_base) {
    CanAcceptItem<native><public>(Item: item)<transacts><decides>: void

    @editable
    RequirementDescription<native><public>: string = external {}

    @editable
    RequirementName<native><public>: string = external {}
  }

  @import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
  @experimental
  item_requirement_base<native><public> := class<unique><concrete> {}

  @experimental
  item_slot_change<native><public> := struct<epic_internal> {
    Item<native><public>: item

    NewSlot<native><public>: int

    PreviousSlot<native><public>: int
  }

  @experimental
  item_state<native><public> := enum {
    Equipped

    InInventory

    NotInInventory
  }

  @experimental
  item_state_change<native><public> := struct<epic_internal> {
    Item<native><public>: item

    NewState<native><public>: item_state

    PreviousState<native><public>: item_state
  }

  @experimental
  item_state_component<native><final><public> := class(item_component) {
    GetItemName<native><epic_internal>(): string

    IsAllowedOnClient<override>(): logic = external {}

    ItemChangedAmountEvent<native><public>: listenable(item_amount_change) = external {}

    ItemChangedSlotEvent<native><public>: listenable(item_slot_change) = external {}

    ItemChangedStateEvent<native><public>: listenable(item_state_change) = external {}

    var<private> Amount<native><public>: int = external {}

    var<private> Slot<native><public>: int = external {}

    var<private> State<native><public>: item_state = external {}
  }

  @experimental
  item_type<native><public> := class<concrete><unique> {
    @editable
    ItemTypeDescription<native><public>: string = external {}

    @editable
    ItemTypeName<native><public>: string = external {}
  }

  @experimental
  item_type_component<native><final><public> := class(item_component) {
    GetItemTypeTags<native><epic_internal>(): tag_container

    HasItemType<native_callable><public>(SearchItemType: item_type)<decides>: void = external {}

    @editable
    var<private> ItemTypeList<native><public>: []item_type
  }

  item_type_metal_tag<native><public> := class(item_type_tag) {}

  item_type_stone_tag<native><public> := class(item_type_tag) {}

  item_type_tag<native><public> := class(tag) {}

  item_type_wood_tag<native><public> := class(item_type_tag) {}

  using { /UnrealEngine.com/Temporary/Diagnostics }
  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /Verse.org/Assets }
  using { /Verse.org/Native }
  itemization_log<epic_internal> := class(log_channel) {}

  @experimental
  remove_inventory_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    InventoryCollection<native><public>: inventory_collection_component
  }

  @experimental
  remove_items_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    InventoryCollection<native><public>: inventory_collection_component

    RemovedItems<native><public>: []item
  }
}

# Module import path: /Fortnite.com/Playspaces
Playspaces<public> := module {
  @experimental
  # Returns an associated `fort_playspace` for this entity.  * Fails if this entity is not in the scene, and therefore not associated with a playspace.
  (InEntity: entity).GetPlayspaceForEntity<native><public>()<transacts><decides>: fort_playspace

  # A nested container that scopes objects, style, gameplay rules, visuals, etc. All objects and players in an experience will belong to a fort_playspace. There is typically one `fort_playspace` for an entire experience, though this may change in the future as the platform evolves.
  #
  # To access the `fort_playspace` for a `creative_device` use `creative_device.GetPlayspace`.
  fort_playspace<native><public> := interface<epic_internal> {
    # Get all `agent`s that are participating in the current `fort_playspace`.
    GetParticipants<epic_internal>()<transacts>: []agent

    # Get all `player`s that are in the current `fort_playspace`.
    GetPlayers<public>()<transacts>: []player

    # Get the `fort_team_collection` for the current `fort_playspace`.
    GetTeamCollection<public>()<transacts>: fort_team_collection

    # Signaled when a participant `agent` joins the `fort_playspace`. Returns a subscribable with a payload of the`agent` that entered the `fort_playspace`.
    ParticipantAddedEvent<epic_internal>(): listenable(agent)

    # Signaled when a participant `agent` leaves the `fort_playspace`. Returns a subscribable with a payload of the`agent` that left the `fort_playspace`.
    ParticipantRemovedEvent<epic_internal>(): listenable(agent)

    # Signaled when a `player` joins the `fort_playspace`. Returns a subscribable with a payload of the`player` that entered the `fort_playspace`.
    PlayerAddedEvent<public>(): listenable(player)

    # Signaled when a `player` leaves the `fort_playspace`. Returns a subscribable with a payload of the`player` that left the `fort_playspace`.
    PlayerRemovedEvent<public>(): listenable(player)
  }
}

# Module import path: /Fortnite.com/Teams
Teams<public> := module {
  # Collection used to manage `team`s and `agent`s on those teams.
  # Use `fort_playspace.GetTeamCollection()` to get the `team_collection` for the active experience.
  fort_team_collection<native><public> := interface<epic_internal> {
    @experimental
    # Adds `InEntity` to the team that matches `InTeamTag`.
    # Fails if `InTeamTag` is not a registered team in the `fort_team_collection`.
    AddToTeam<native_callable><epic_internal>(InEntity: entity, InTeamTag: team_tag)<transacts><decides>: void

    # Adds `InAgent` to `InTeam`.
    # Fails if `InTeam` is not part of the `fort_team_collection`.
    AddToTeam<public>(InAgent: agent, InTeam: team)<transacts><decides>: void

    # Returns an array of all `agent`s on `InTeam`.
    # Fails if `InTeam` is not part of the `fort_team_collection`.
    GetAgents<public>(InTeam: team)<transacts><decides>: []agent

    @experimental
    # Returns an array of all `entities on `InTeam`.
    # Fails if `InTeam` is not part of the `fort_team_collection`.
    GetEntities<epic_internal>(InTeam: team)<transacts><decides>: []entity

    @experimental
    # Get the `team` that `InEntity` is on.
    # Fails if `InEntity` is not on a team in this `fort_team_collection`.
    GetTeam<epic_internal>(InEntity: entity)<transacts><decides>: team

    # Get the `team` that `InAgent` is on.
    # Fails if `InAgent` is not on a team in this `fort_team_collection`.
    GetTeam<public>(InAgent: agent)<transacts><decides>: team

    @experimental
    # Returns the `team_attitude` between `Agent` and `Entity`.
    # Fails if:
    #  * `Agent` is not on a team in this `fort_team_collection`.
    #  * `Entity` is not on a team in this `fort_team_collection`.
    GetTeamAttitude<epic_internal>(Agent: agent, Entity: entity)<transacts><decides>: team_attitude

    @experimental
    # Returns the `team_attitude` between `Entity1` and `Entity2`.
    # Fails if:
    #  * `Entity1` is not on a team in this `fort_team_collection`.
    #  * `Entity2` is not on a team in this `fort_team_collection`.
    GetTeamAttitude<epic_internal>(Entity1: entity, Entity2: entity)<transacts><decides>: team_attitude

    # Returns the `team_attitude` between `Agent1` and `Agent2`.
    # Fails if:
    #  * `Agent1` is not on a team in this `fort_team_collection`.
    #  * `Agent2` is not on a team in this `fort_team_collection`.
    GetTeamAttitude<public>(Agent1: agent, Agent2: agent)<transacts><decides>: team_attitude

    # Returns the `team_attitude` between `Team1` and `Team2`.
    # Fails if:
    #  * `Team1` is not in this `fort_team_collection`.
    #  * `Team2` is not in this `fort_team_collection`.
    GetTeamAttitude<public>(Team1: team, Team2: team)<transacts><decides>: team_attitude

    @experimental
    # Get the team associated with the tag `InTag`. Fails if no such team is associated with `InTag`
    GetTeamByTag<epic_internal>(InTeamTag: team_tag)<transacts><decides>: team

    # Get all of the tags associated with the team `InTeam`. Fails if `InTeam` is not a valid team within the team collection
    GetTeamTags<epic_internal>(InTeam: team)<transacts><decides>: tag_container

    # Returns an array of all the `team`s known to this `fort_team_collection`
    GetTeams<public>()<transacts>: []team

    @experimental
    # Succeeds if `InEntity` is on `InTeam`.
    # Fails if:
    #  * `InEntity` is not on `InTeam`.
    #  * `InTeam` is not part of the `fort_team_collection`.
    IsOnTeam<epic_internal>(InEntity: entity, InTeam: team)<transacts><decides>: void

    # Succeeds if `InAgent` is on `InTeam`.
    # Fails if:
    #  * `InAgent` is not on `InTeam`.
    #  * `InTeam` is not part of the `fort_team_collection`.
    IsOnTeam<public>(InAgent: agent, InTeam: team)<transacts><decides>: void

    @experimental
    # Register a team component with the team collection, so that its team can automatically be changed as teams are associated with its tag.
    # Fails if:
    #  * The team component's tag is not set
    #  * The team component is not attached to an entity
    #  * The owning entity of the team component is already registered.
    RegisterTeamComponent<native_callable><epic_internal>(InTeamComponent: team_component)<transacts><decides>: void

    @experimental
    # Associate the team `InTeam` with the tag `InTeamTag`, so that it can be accessed by team_component. Fails if `InTeam` is not a valid team within the team collection
    SetTaggedTeam<epic_internal>(InTeamTag: team_tag, InTeam: team)<transacts><decides>: void

    @experimental
    # Unregister a team component from the team collection. Fails if the team component is not registered with the team collection
    UnregisterTeamComponent<native_callable><epic_internal>(InTeamComponent: team_component)<transacts><decides>: void
  }

  # A generic set of team attitudes. Use this enum to model relationship behavior between your experience's agents/teams.
  team_attitude<native><public> := enum {
    # Agents/teams are friends. In Fortnite games two `agent`s on the same `team` are `friendly`.
    Friendly

    # Agents/teams are hostile. In fortnite games two `agent`s on opposing `team`s are `hostile`.
    Hostile

    # Agents/teams are neutral. In Fortnite games items and AI not belonging to a `friendly` or `hostile` team are `neutral`.
    Neutral
  }

  @experimental
  team_component<native><epic_internal> := class<final>(component) {
    # Get the team object for the team this entity is on - Fails if team is not registered. team_pvp_01_tag, team_pvp_02_tag and team_monster_tag are registered already by default
    GetTeam<native><public>()<transacts><decides>: team

    OnSimulate<override>()<suspends>: void = external {}

    @experimental
    # Tag that uniquely identifies the team this entity is on
    var TeamTag<public>: team_tag = external {}
  }

  @experimental
  team_monster_tag<native><epic_internal> := class<concrete>(team_tag) {}

  @experimental
  team_pvp_01_tag<native><epic_internal> := class<concrete>(team_tag) {}

  @experimental
  team_pvp_02_tag<native><epic_internal> := class<concrete>(team_tag) {}

  @experimental
  team_tag<native><epic_internal> := class<concrete>(tag) {}
}

using { /Fortnite.com/Devices }
using { /Fortnite.com/Playspaces }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /UnrealEngine.com/Temporary/UI }
using { /Verse.org/Colors }
using { /Verse.org/Native }
# Module import path: /Fortnite.com/UI
UI<public> := module {
  # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().HideElements()`.
  # Hides a set of HUD elements.
  (PlayerUI: player_ui).HideHUDElements<native><public>(HUDElements: []hud_element_identifier): void

  # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ResetElementVisibility()`.
  # Resets the visibility for a set of HUD elements.
  (PlayerUI: player_ui).ResetHUDElementVisibility<native><public>(HUDElements: []hud_element_identifier): void

  # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ShowElements()`.
  # Shows a set of HUD elements.
  (PlayerUI: player_ui).ShowHUDElements<native><public>(HUDElements: []hud_element_identifier): void

  # Get the `fort_hud_controller` for the current `fort_playspace`.
  (Playspace: fort_playspace).GetHUDController<native><public>(): fort_hud_controller

  # Text button with big and loud styling applied.
  button_loud<native><public> := class<final>(text_button_base) {}

  # Text button with quiet styling applied.
  button_quiet<native><public> := class<final>(text_button_base) {}

  # Text button with normal styling applied.
  button_regular<native><public> := class<final>(text_button_base) {}

  creative_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}

    TreatAsChildTagCollection<override>: logic = external {}
  }

  creative_hud_identifier_build_menu<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_crafting_resources<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_elimination_counter<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_equipped_item<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_experience_level<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_experience_supercharged<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_experience_ui<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_health<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_health_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_hud_info<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_interaction_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_map_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_mimimap<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_minimap<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_pickup_stream<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_player_count<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_player_inventory<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_round_info<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_round_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_shield_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_shields<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_shileds<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_storm_notifications<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_storm_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  creative_hud_identifier_team_info<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}
  }

  # Editable text widget. Allows the user to type in a custom text. Only permits a single line of text to be entered.
  editable_text<native><epic_internal> := class<final>(editable_text_base) {}

  # Editable text block widget common base class. Allows the user to type in a custom text.
  editable_text_base<native><epic_internal> := class<abstract>(text_base) {
    # Called whenever the text is committed. This happens when the user presses enter or the text box loses focus.
    OnTextCommitted<public>(): listenable(widget_message) = external {}
  }

  # Editable text widget contained in a box. Allows the user to type in a custom text. Only permits a single line of text to be entered.
  editable_text_box<native><epic_internal> := class<final>(editable_text_base) {}

  # A HUD controller that allows for showing and hiding of HUD elements.
  fort_hud_controller<native><public> := interface<epic_internal> {
    # Hides a set of HUD elements.
    HideElements<public>(HUDElements: []hud_element_identifier): void

    # Resets the visibility for a set of HUD elements.
    ResetElementVisibility<public>(HUDElements: []hud_element_identifier): void

    # Shows a set of HUD elements.
    ShowElements<public>(HUDElements: []hud_element_identifier): void
  }

  @import_as("/Script/VerseFortniteUI.UVerseFortniteWidgetViewmodel")
  # Verse interface to native `widget viewmodel`.
  fortnite_widget_viewmodel<native><epic_internal> := class<abstract> {}

  function_parameter_fortnite_widget_viewmodel<native><epic_internal> := class<computes>(function_parameter_base) {
    Value<native><epic_internal>: ?fortnite_widget_viewmodel
  }

  # Base class for hud elements assosiated with game phase hud elements
  hud_element_game_phase_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier) {
    # Internal index converted to EAthenaGamePhaseStep
    InternalIndex<native><epic_internal>: int
  }

  # Base class for hud elements identified by a gameplay tag
  hud_element_gameplay_tag_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier) {
    # Internal string used to make a lookup of an FGameplayTag
    InternalTag<native><epic_internal>: string

    # If set to true the only child tags from the InternalTag will be included in the identifier
    TreatAsChildTagCollection<native><epic_internal>: logic = external {}
  }

  # Used to identify a HUD element.
  hud_element_identifier<native><public> := class<abstract><epic_internal> {}

  # Base class for hud elements assosiated with world resource hud elements
  hud_element_world_resource_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier) {
    # Internal index converted to EFortResourceType
    InternalIndex<native><epic_internal>: int
  }

  hud_identifier_game_phase_bus_flying<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_bus_locked<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_end_game<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_final_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_none<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_setup<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_storm_forming<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_storm_holding<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_storm_shrinking<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_game_phase_warmup<epic_internal> := class<final>(hud_element_game_phase_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_gold_currency<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_ingredient<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_metal<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_permanite<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_stone<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  hud_identifier_world_resource_wood<public> := class<final>(hud_element_world_resource_identifier_base) {
    InternalIndex<override>: int = external {}
  }

  player_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base) {
    InternalTag<override>: string = external {}

    TreatAsChildTagCollection<override>: logic = external {}
  }

  # Slider with a text value. Displays a slider, its progress bar and value.
  slider_regular<native><public> := class<final>(widget) {
    # The maximum value that the slider can haver. Used only during initialization of the widget and not modified by SetMaxValue.
    DefaultMaxValue<native><public>: float = external {}

    # The minimum value that the slider can haver. Used only during initialization of the widget and not modified by SetMinValue.
    DefaultMinValue<native><public>: float = external {}

    # The amount to adjust the value by, when using a controller or keyboard. Used only during initialization of the widget and not modified by SetStepSize.
    DefaultStepSize<native><public>: float = external {}

    # The value to display to the user. Used only during initialization of the widget and not modified by SetValue.
    DefaultValue<native><public>: float = external {}

    # Gets the maximum value of the slider.
    GetMaxValue<native><public>(): float

    # Gets the minimum value of the slider.
    GetMinValue<native><public>(): float

    # Gets the amount to adjust the value by.
    GetStepSize<native><public>(): float

    # Gets the value of the slider.
    GetValue<native><public>(): float

    # Subscribable event that fires when the value of the slider has changed.
    OnValueChanged<public>(): listenable(widget_message) = external {}

    # Sets the maximum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
    SetMaxValue<native><public>(InMaxValue: float): void

    # Sets the minimum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
    SetMinValue<native><public>(InMinValue: float): void

    # Sets the amount to adjust the value by, when using a controller or keyboard.
    SetStepSize<native><public>(InValue: float): void

    # Sets the value of the slider, will clamp the value to be within the sliders minimum and maximum value.
    SetValue<native><public>(InValue: float): void
  }

  # Text block widget. Displays text to the user.
  text_block<native><public> := class<final>(text_base) {
    # The color of the shadow. Used only during initialization of the widget and not modified by SetShadowColor.
    DefaultShadowColor<native><public>: color = external {}

    # The direction the shadow is cast. Used only during initialization of the widget and not modified by SetShadowOffset.
    DefaultShadowOffset<native><public>: ?vector2 = external {}

    # The opacity of the shadow. Used only during initialization of the widget and not modified by SetShadowOpacity.
    DefaultShadowOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

    # Gets the color of the shadow.
    GetShadowColor<native><public>(): color

    # Gets the direction the shadow is cast.
    GetShadowOffset<native><public>(): ?vector2

    # Gets the opacity of the shadow.
    GetShadowOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

    # Sets the color of the shadow.
    SetShadowColor<native><public>(InColor: color): void

    # Sets the direction the shadow is cast.
    SetShadowOffset<native><public>(InShadowOffset: ?vector2): void

    # Sets the opacity of the shadow.
    SetShadowOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
  }

  # Button with text message common base class. Displays a button with a custom message string.
  text_button_base<native><public> := class<abstract><epic_internal>(widget) {
    # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
    DefaultText<localizes><native><public>: message = external {}

    # Gets the text currently in the widget.
    GetText<native><public>(): string

    # Subscribable event that fires when the button is clicked.
    OnClick<public>(): listenable(widget_message) = external {}

    # Sets the text displayed in the widget.
    SetText<native><public>(InText: message): void
  }
}

using { /Fortnite.com/AI }
using { /Fortnite.com/Assets }
using { /Fortnite.com/Game }
using { /Fortnite.com/Teams }
using { /Fortnite.com/Vehicles }
using { /UnrealEngine.com/Abilities }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SceneGraph }
using { /UnrealEngine.com/Temporary/SceneGraph/VerseCamera }
using { /Verse.org/Simulation/Tags }
# Module import path: /Fortnite.com/Vehicles
Vehicles<public> := module {
  # Returns the `fort_vehicle` for `InCharacter`.
  # Fails if `InCharacter` is not associated with a `fort_vehicle`.
  (InCharacter: fort_character).GetVehicle<native><public>()<transacts><decides>: fort_vehicle

  # Main API implemented by Fortnite vehicles.
  fort_vehicle<native><public> := interface<unique><epic_internal>(positional, healthful, damageable, game_action_causer) {
    @experimental
    GetEntity<epic_internal>()<transacts><decides>: entity

    # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
    GetFuelCapacity<public>()<transacts>: float

    # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
    GetFuelRemaining<public>()<transacts>: float

    # Returns an array with all the passengers of the vehicle.
    GetPassengers<public>(): []fort_character

    # Succeeds if this `fort_vehicle` is standing in air.
    IsInAir<public>()<transacts><decides>: void

    # Succeeds if this `fort_vehicle` is standing in water.
    IsInWater<public>()<transacts><decides>: void

    # Succeeds if this `fort_vehicle` is standing on ground.
    IsOnGround<public>()<transacts><decides>: void
  }

  @hide_in_editor
  @experimental
  fort_vehicle_component<native><epic_internal> := class(component, fort_vehicle) {
    @experimental
    (fort_vehicle:)GetEntity<override>()<transacts><decides>: entity = external {}

    @experimental
    Damage<override>(Amount: float): void = external {}

    @experimental
    Damage<override>(Args: damage_args): void = external {}

    @experimental
    DamagedEvent<override>(): listenable(damage_result) = external {}

    @experimental
    FortVehicle<native><public>: fort_vehicle

    @experimental
    # Returns the maximum fuel capacity of the vehicle. If the vehicle uses fuel, this value will be between 1.0 and Inf. Otherwise, this value will be -1.0.
    GetFuelCapacity<override>()<transacts>: float = external {}

    @experimental
    # Returns the fuel state of the vehicle. If the vehicle uses fuel, this value will be between 0.0 and `GetFuelCapacity`. Otherwise, this value will be -1.0.
    GetFuelRemaining<override>()<transacts>: float = external {}

    @experimental
    GetHealth<override>()<transacts>: float = external {}

    @experimental
    GetMaxHealth<override>()<transacts>: float = external {}

    @experimental
    GetPassengers<override>(): []fort_character = external {}

    @experimental
    GetTransform<override>()<transacts>: transform = external {}

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>(): logic = external {}

    @experimental
    IsInAir<override>()<transacts><decides>: void = external {}

    @experimental
    IsInWater<override>()<transacts><decides>: void = external {}

    @experimental
    IsOnGround<override>()<transacts><decides>: void = external {}

    @experimental
    SetHealth<override>(Health: float)<transacts>: void = external {}

    @experimental
    SetMaxHealth<override>(MaxHealth: float)<transacts>: void = external {}
  }
}

using { /UnrealEngine.com/VGameplayRst/Components }
using { /UnrealEngine.com/VGameplayRst/Geometry }
using { /UnrealEngine.com/VGameplayRst/Messaging }
using { /UnrealEngine.com/VGameplayRst/Physics }
using { /UnrealEngine.com/VGameplayRst/Transform }
using { /Verse.org/VerseEngine/Entity }
# Module import path: /Fortnite.com/VerseFortniteGameScript
VerseFortniteGameScript<public> := module {
  # Module import path: /Fortnite.com/VerseFortniteGameScript/FortModel
  FortModel<public> := module {
    MakeFromEntity<public>(Entity: vk_entity): ?fort_model = external {}

    MakeFromStaticMesh<epic_internal>(InTransform: transform, Name: string, Mesh: mesh): ?fort_model = external {}

    MakeFromStaticMeshAndMaterial<epic_internal>(
      InTransform: transform,
      Name: string,
      Mesh: mesh,
      Material: material
    ): ?fort_model = external {}
  }

  # Module import path: /Fortnite.com/VerseFortniteGameScript/FortSceneObject
  FortSceneObject<public> := module {
    MakeFromEntity<public>(Entity: vk_entity): ?fort_scene_object = external {}
  }

  fort_game_script_base<epic_internal> := class<abstract>(script_component) {
    CreateStormController<protected>(Location: vector3): void = external {}

    HACK_getAllScriptObjectsOfType<protected>(Type: subtype(vk_component)): []vk_component = external {}

    IsSoloGame<protected>()<transacts>: logic = external {}

    LogMessage<epic_internal>(
      VLogLevel: log_level,
      InChannel: subtype(log_channel),
      Message: string,
      ShowOnScreen: logic,
      InColor: color,
      InDuration: float
    ): void = external {}

    OnBegin<override>(): void = external {}

    OnCreate<override>(): void = external {}

    OnInitialize<protected>(): void = external {}

    OnMatchBegin<protected>(): void = external {}

    OnPlayerEliminated<protected>(ElimResult: player_eliminated_result): void = external {}

    OnPlayerJoined<protected>(__dupe___unnamed_parameter_228: player_component): void = external {}

    OnPlayerLeft<protected>(__dupe___unnamed_parameter_229: player_component): void = external {}

    OnPostCreate<override>(): void = external {}

    SetBuildingAllowed<protected>(): void = external {}

    SetBuildingDisallowed<protected>(): void = external {}

    WaitForDebugCommand<protected>(CommandId: string)<suspends>: string = external {}

    var DebugCommands<epic_internal>: ?debug_command_component

    var FortBuildingSettings<epic_internal>: ?fort_building_settings_component

    var FortPlayspace<public>: ?fort_playspace_component

    var Players<epic_internal>: ?fort_playspace_player_helper
  }

  fort_model<public> := class<internal> {
    DisableCollision<public>(): void = external {}

    EnableCollision<public>(): void = external {}

    GetCollisionComponent<public>()<transacts>: vk_collision_component = external {}

    GetEntity<public>()<transacts>: vk_entity = external {}

    GetMeshComponent<public>(): fixed_mesh_component = external {}

    GetPosition<public>()<transacts>: vector3 = external {}

    GetPositionComponent<public>()<transacts>: position_component = external {}

    GetRotation<public>(): rotation = external {}

    GetRotationComponent<public>()<transacts>: rotation_component = external {}

    GetScale<public>()<transacts>: vector3 = external {}

    GetTransform<public>(): transform = external {}

    Hide<public>(): void = external {}

    IsVisible<public>(): logic = external {}

    SetPosition<public>(NewPosition: vector3)<transacts>: void = external {}

    SetRotation<public>(NewRotation: rotation)<transacts>: void = external {}

    SetScale<public>(NewScale: vector3)<transacts>: void = external {}

    SetTransform<public>(NewTransform: transform): void = external {}

    Show<public>(): void = external {}
  }

  fort_playspace_player_helper<epic_internal> := class {
    AddToInventory<public>(
      PlayerHandle: player,
      ItemDefinition: fort_item_definition,
      Quantity: int,
      NotifyPlayerClient: logic
    )<transacts><decides>: void = external {}

    ClearInventory<public>(PlayerHandle: player): void = external {}

    CountActive<public>()<transacts>: int = external {}

    CountAll<public>()<transacts>: int = external {}

    CountSpectators<public>(): int = external {}

    GetActive<public>(): []player_component = external {}

    GetAll<public>()<transacts>: []player_component = external {}

    GetPawnCollisionEntityID<public>(PlayerArg: player_component): int = external {}

    GetPlayerStarts<public>(): []vk_component = external {}

    GetPlayersSpectatingTarget<public>(Target: player)<transacts>: []player = external {}

    GetSpectators<public>(): []player_component = external {}

    GetTeam<public>(PlayerHandle: player): player_team = external {}

    Init<public>(InPlayspace: fort_playspace_component): void = external {}

    PutAllInStasis<public>(): void = external {}

    PutAllInStasisAllowEmotes<public>(): void = external {}

    PutInStasis<public>(PlayerHandle: player): void = external {}

    PutInStasisWithEmotes<public>(PlayerHandle: player): void = external {}

    ReleaseFromStasis<public>(PlayerHandle: player): void = external {}

    RemoveAllFromStasis<public>(): void = external {}

    ResetHealth<public>(PlayerHandle: player): void = external {}

    ResetShield<public>(PlayerHandle: player): void = external {}

    Respawn<public>(PlayerArg: player_component, SpawnPoint: player_start_component): void = external {}

    SendAllToLobby<public>(): void = external {}

    SendToLobby<public>(PlayerHandle: player): void = external {}

    SetAllEndRound<public>(): void = external {}

    SetAllInRound<public>(): void = external {}

    SetAllInvulnerable<public>(IsInvulnerable: logic): void = external {}

    SetCurrentHealth<public>(PlayerHandle: player, HealthValue: float): void = external {}

    SetCurrentShield<public>(PlayerHandle: player, ShieldValue: float): void = external {}

    SetEndRound<public>(PlayerArg: player_component): void = external {}

    SetInRound<public>(PlayerArg: player_component): void = external {}

    SetInvulnerable<public>(PlayerHandle: player, IsInvulnerable: logic): void = external {}

    SetIsHidden<public>(PlayerHandle: player, IsHidden: logic): void = external {}

    SetTeam<public>(PlayerHandle: player, Team: player_team): void = external {}

    SpectateAny<public>(PlayerHandle: player): void = external {}

    SpectateEliminator<public>(PlayerHandle: player)<transacts><decides>: void = external {}

    SpectatePlayer<public>(PlayerHandle: player, Target: player)<transacts><decides>: void = external {}
  }

  fort_scene_object<public> := class<internal> {
    GetEntity<public>(): vk_entity = external {}

    GetPosition<public>(): vector3 = external {}

    GetRotation<public>(): rotation = external {}

    GetScale<public>(): vector3 = external {}

    GetTransform<public>(): transform = external {}

    SetPosition<public>(NewPosition: vector3)<transacts>: void = external {}

    SetRotation<public>(NewRotation: rotation): void = external {}

    SetScale<public>(NewScale: vector3): void = external {}

    SetTransform<public>(NewTransform: transform): void = external {}
  }
}

VerseInternalTesting<public> := module {
  # Module import path: /Fortnite.com/VerseInternalTesting/NexusFramework
  NexusFramework<public> := module {
    example_nexus_device<epic_internal> := class(nexus_test_device) {
      OnBegin<override>()<suspends>: void = external {}

      OnEnd<override>(): void = external {}
    }

    nexus_test_device<epic_internal> := class(creative_device) {
      AddCheck<epic_internal>(IsPassed: logic, TestName: string, ContextString: string): void = external {}

      AddFail<epic_internal>(TestName: string, ContextString: string): void = external {}

      AddPass<epic_internal>(TestName: string, ContextString: string): void = external {}

      AddResults<epic_internal>(TestName: string, Passed: logic, ContextString: string): void = external {}

      AddSkip<epic_internal>(IsPassed: logic, TestName: string, ContextString: string): void = external {}

      OnBegin<override>()<suspends>: void = external {}

      OnEnd<override>(): void = external {}

      @editable
      var TestRunner<public>: nexus_test_runner = external {}
    }

    nexus_test_runner<epic_internal> := class(creative_device) {
      OnEnd<override>(): void = external {}
    }
  }

  using { /Fortnite.com/Characters }
  using { /Fortnite.com/Devices }
  using { /UnrealEngine.com/Temporary/Diagnostics }
  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Simulation }
  # Module import path: /Fortnite.com/VerseInternalTesting/VerseFramework
  VerseFramework<public> := module {
    device_event_agent_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(agent)): void = external {}

      var ArgAgent<public>: ?agent = external {}
    }

    device_event_agent_int_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(tuple(agent, int))): void = external {}

      var ArgAgent<public>: ?agent = external {}

      var ArgInt<public>: int = external {}
    }

    device_event_ai_interaction_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(device_ai_interaction_result)): void = external {}

      var ArgSource<public>: ?agent = external {}

      var ArgTarget<public>: ?agent = external {}
    }

    device_event_optional_agent_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(?agent)): void = external {}

      var ArgAgent<public>: ?agent = external {}
    }

    device_event_optional_agent_int_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(tuple(?agent, int))): void = external {}

      var ArgAgent<public>: ?agent = external {}

      var ArgInt<public>: int = external {}
    }

    device_event_void_handler_mock<public> := class(test_device_event_handler_mock) {
      Subscribe<public>(Event: listenable(tuple())): void = external {}
    }

    test_case<public> := struct {
      Category<public>: []string

      Func<public>: type { __()<suspends>: void }

      Name<public>: string

      TimeoutOverride<public>: ?float = external {}
    }

    test_device<epic_internal> := class(creative_device) {
      AfterAll<public>()<suspends>: void = external {}

      AfterEach<public>()<suspends>: void = external {}

      BeforeAll<public>()<suspends>: void = external {}

      BeforeEach<public>()<suspends>: void = external {}

      OnBegin<override>(): void = external {}

      RegisterTests<public>(): void = external {}

      SuiteName<public>: string = external {}

      TestCases<public>(): []test_case = external {}

      var TestRunner<public>: test_runner = external {}
    }

    test_device_event_handler_mock<public> := class<concrete> {
      Await<public>()<suspends>: void = external {}

      Cancel<public>()<transacts>: void = external {}

      GetCallCount<public>(): int = external {}

      ResetCallCount<public>(): void = external {}
    }

    test_runner<epic_internal> := class<reads><allocates> {
      AddExcludeFilter<public>(Filter: string)<transacts>: void = external {}

      AddIncludeFilter<public>(Filter: string)<transacts>: void = external {}

      CheckArrayContains<public>(ActualArray: []string, Expected: string, Message: string): void = external {}

      CheckArrayDoesNotContain<public>(ActualArray: []string, Expected: string, Message: string): void = external {}

      CheckEqual<public>(
        Actual: creative_object,
        Expected: transform,
        Message: string,
        ?Tolerance: float = external {},
        ?Timeout: float = external {}
      )<suspends>: void = external {}

      CheckEqual<public>(
        ActualFortCharacter: fort_character,
        ExpectedTranslation: vector3,
        Message: string,
        ?Tolerance: float = external {},
        ?Timeout: float = external {},
        ?CompareX: logic = external {},
        ?CompareY: logic = external {},
        ?CompareZ: logic = external {}
      )<suspends>: void = external {}

      CheckEqual<public>(Expected: agent, Actual: agent, Message: string): void = external {}

      CheckEqual<public>(Expected: float, Actual: float, Message: string): void = external {}

      CheckEqual<public>(Expected: int, Actual: int, Message: string): void = external {}

      CheckEqual<public>(Expected: string, Actual: string, Message: string): void = external {}

      CheckEqual<public>(
        Expected: transform,
        Actual: transform,
        Message: string,
        ?Tolerance: float = external {}
      ): void = external {}

      CheckEqualFloatArray<public>(Expected: []float, Actual: []float, Message: string): void = external {}

      CheckEqualIntArray<public>(Expected: []int, Actual: []int, Message: string): void = external {}

      CheckFailure<public>(TestFuncEval: ?any, FuncName: string)<decides>: void = external {}

      CheckNotEqual<public>(
        Actual: creative_object,
        Expected: transform,
        Message: string,
        ?Tolerance: float = external {},
        ?Timeout: float = external {}
      )<suspends>: void = external {}

      CheckNotEqual<public>(Expected: agent, Actual: agent, Message: string): void = external {}

      CheckNotEqual<public>(Expected: float, Actual: float, Message: string): void = external {}

      CheckNotEqual<public>(Expected: int, Actual: int, Message: string): void = external {}

      CheckNotEqual<public>(Expected: string, Actual: string, Message: string): void = external {}

      CheckNotEqual<public>(
        Expected: transform,
        Actual: transform,
        Message: string,
        ?Tolerance: float = external {}
      ): void = external {}

      CheckNotTrue<public>(Actual: logic, Message: string): void = external {}

      CheckTrue<public>(Actual: logic, Message: string): void = external {}

      ClearLastTestResult<public>(): void = external {}

      ClearLogOutput<public>(): void = external {}

      ClearTests<public>()<transacts>: void = external {}

      DefaultSetupFunctionTimeoutInSeconds<public>: float = external {}

      DefaultTestTimeoutInSeconds<public>: float = external {}

      GetDisplayTime<public>(DurationInSec: float): string = external {}

      IsTestCaseIncluded<public>(TestCase: test_case)<transacts><decides>: void = external {}

      Log<public>(Level: log_level, Message: string)<transacts>: void = external {}

      PrintLogOutput<public>()<transacts>: void = external {}

      RaiseFunctionFailure<public>(FuncName: string)<transacts>: void = external {}

      RecordFlakinessTestResult<public>(TestName: string, Succeeded: logic)<transacts>: void = external {}

      RegisterTests<public>(TestSuite: test_suite)<transacts>: void = external {}

      Require<public>(OptionalAgent: ?agent, Message: string)<transacts><decides>: agent = external {}

      ResetExcludeFilters<public>()<transacts>: void = external {}

      ResetIncludeFilters<public>()<transacts>: void = external {}

      Run<public>()<suspends>: void = external {}

      RunTestSuites<public>()<suspends>: void = external {}

      var EnableDebugOutput<public>: logic = external {}

      var EnableFlakinessEvaluation<public>: logic = external {}

      var EnableLogOutput<public>: logic = external {}

      var EnableTimeTracking<public>: logic = external {}

      var EnableVerboseOutput<public>: logic = external {}

      var FlakinessRunCount<public>: int = external {}

      var LastTestErrors<public>: []string = external {}

      var LogOutput<public>: []string = external {}

      var SetupFunctionTimeoutInSeconds<public>: float = external {}

      var TargetTestSuite<public>: string = external {}

      var TestTimeoutInSeconds<public>: float = external {}
    }

    test_runner_device<epic_internal> := class(creative_device) {
      OnBegin<override>()<suspends>: void = external {}

      TestRunner<public>: test_runner = external {}

      var Status<public>: test_runner_status = external {}
    }

    test_runner_status<public> := enum {
      Complete

      Pending

      Running

      Setup
    }

    test_suite<public> := struct {
      AfterAllFunc<public>: type { __()<suspends>: void }

      AfterEachFunc<public>: type { __()<suspends>: void }

      BeforeAllFunc<public>: type { __()<suspends>: void }

      BeforeEachFunc<public>: type { __()<suspends>: void }

      Cases<public>: []test_case

      Name<public>: string
    }
  }
}