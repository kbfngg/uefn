using {/UnrealEngine.com/Temporary/SceneGraph}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation}
using {/Fortnite.com/Characters}
# Module import path: /Fortnite.com/AI/VerseAIBase
VerseAIBase<public> := module:
    # Result of an action that cannot fail
    action_result<native><public> := enum:
        # The action has been successfully executed
        Success
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    # Result of an action that can fail
    fallible_action_result<native><public> := enum:
        # The action has been successfully executed
        Success
        # The action has failed during its execution
        Failure
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    fort_navigatable<native><epic_internal> := interface(navigatable):
        # Roam around the current position. Use the leash to specify the radius, else will roam anywhere.
        RoamAround<public>()<suspends>:navigation_result

        # Move in range to attack the current target
        MoveInRangeToAttack<public>()<suspends>:action_result

    # Get the fort_navigatable interface for the specified character
    (InCharacter:fort_character).GetFortNavigatable<native><epic_internal>()<transacts><decides>:fort_navigatable

    fort_character_movement_interface<native><epic_internal> := interface<epic_internal>:
        # Change stance to crouch
        Crouch<public>()<suspends>:fallible_action_result

        # Change movement speed to the walk speed.
        Walk<public>()<suspends>:action_result

        # Change movement speed to sprint.
        Sprint<public>()<suspends>:action_result

        # Change movement speed to sprint and switch to tactical sprint when energy is full.
        TacticalSprint<public>()<suspends>:action_result

        # Trigger a jump
        Jump<public>()<suspends>:action_result

        # Trigger a slide
        Slide<public>()<suspends>:action_result

        # Go back to standing
        StandUp<public>():action_result

    # Get the current fort_character_movement_interface for the specified character
    (InCharacter:fort_character).GetFortCharacterMovement<native><epic_internal>()<transacts><decides>:fort_character_movement_interface

    fort_creature_actions_interface<native><epic_internal> := interface<epic_internal>:


    # Get the current fort_br_creature_actions_interface for the specified character
    (InCharacter:fort_character).GetFortCreatureActions<native><epic_internal>()<transacts><decides>:fort_creature_actions_interface

    fort_character_actions_interface<native><epic_internal> := interface(emote_interface):
        # Revive the specified target
        Revive<public>(Target:agent)<suspends>:fallible_action_result

        # Start attacking the specified target
        Attack<epic_internal>(Target:target_info)<suspends>:action_result

        # Start attacking the specified target
        Attack<epic_internal>(Target:fort_obstacle_info)<suspends>:action_result

    # Get the current fort_character_actions_interface for the specified character
    (InCharacter:fort_character).GetFortCharacterActions<native><epic_internal>()<transacts><decides>:fort_character_actions_interface

    fort_obstacle_status<native><epic_internal> := enum:
        incoming_obstacle
        blocked_by_obstacle
        trap_obstacle

    fort_obstacle_info<native><epic_internal> := struct<epic_internal>:
        Location<native><public>:vector3

        Status<native><public>:fort_obstacle_status

        Obstacle<native><epic_internal>:entity

    fort_obstacle_perception_interface<native><epic_internal> := interface<epic_internal>:
        # Get information about the potential current obstacle
        GetObstacleInfo<public>()<transacts><decides>:fort_obstacle_info

        # Event when a new best obstacle is detected
        ObstacleChangedEvent<public>():listenable(fort_obstacle_info)

    # Get the current fort_obstacle_perception_interface for the specified character
    (InCharacter:fort_character).GetFortObstaclePerception<native><epic_internal>()<transacts><decides>:fort_obstacle_perception_interface