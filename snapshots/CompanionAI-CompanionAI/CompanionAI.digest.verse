using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/AI/CompanionAI/PingCommand}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Entity}
using {/Fortnite.com/AI/VerseNPC}
using {/Fortnite.com/AI/VerseCreature}
using {/Fortnite.com/Characters}
using {/Fortnite.com/AI/VerseAIBase}
# Module import path: /Fortnite.com/AI/CompanionAI
CompanionAI<public> := module:
    companion_ai<epic_internal> := class(npc_behavior):
        OnBegin<override>()<suspends>:void = external {}

    companion_creature<epic_internal> := class(npc_behavior):
        EngageThreatsWithinDistance<public>:float = external {}

        OnBegin<override>()<suspends>:void = external {}

    default_npc_behavior<epic_internal> := class(npc_behavior):
        OnBegin<override>()<suspends>:void = external {}

    fort_br_character_actions_interface<native><epic_internal> := interface(fort_character_actions_interface):
        # Run the NPC default behavior
        RunDefaultBehavior<epic_internal>()<suspends>:action_result

        IsFollowingBehaviorEnabled<public>()<transacts>:logic

    # Get the current fort_br_character_actions_interface for the specified character
    (InCharacter:fort_character).GetFortBRCharacterActions<native><epic_internal>()<transacts><decides>:fort_br_character_actions_interface

    fort_br_creature_actions_interface<native><epic_internal> := interface(fort_creature_actions_interface):
        # Run the creature default behavior
        RunDefaultBehavior<epic_internal>()<suspends>:action_result

    # Get the current fort_br_creature_actions_interface for the specified character
    (InCharacter:fort_character).GetFortBRCreatureActions<native><epic_internal>()<transacts><decides>:fort_br_creature_actions_interface

    # Fortnite Creature AI Management
    fort_creature_component<native><epic_internal> := class(creature_component, fort_br_creature_actions_interface):
        # Run the Creature default behavior
        RunDefaultBehavior<native><override>()<suspends>:action_result

    # Fortnite NPC AI Management
    fort_npc_component<native><epic_internal> := class(npc_component, fort_br_character_actions_interface):
        # Run the NPC default behavior
        RunDefaultBehavior<native><override>()<suspends>:action_result

        IsFollowingBehaviorEnabled<native><override>()<transacts>:logic

    (InEntity:entity).GetAgent<native><epic_internal>()<transacts>:?agent

    (Agent:agent).GetTeamMembers<native><epic_internal>()<transacts>:[]agent

    Compare<native><epic_internal>(Obstacle:fort_obstacle_info, Target:entity)<transacts>:logic

    (Character:fort_character).IsBeingDBNOCarried<native><epic_internal>()<transacts><decides>:void

    (Character:fort_character).GetNPCLeashRadius<native><epic_internal>()<transacts>:tuple(float, float)

    fort_ping_interface<native><epic_internal> := interface:
        AreNPCCommandsEnabled<epic_internal>()<transacts>:logic

        CanAcceptPingCommand<epic_internal>()<transacts>:logic

        EnableCommandWheel<epic_internal>(Enabled:logic):void

        GetCurrentNPCCommand<epic_internal>()<transacts><decides>:ping_info

        OnNPCCommand<epic_internal>()<suspends>:?ping_info

        DeclineNPCCommand<epic_internal>(PlayUnableToPerformAction:logic):void

        IsAttackCommandEnabled<epic_internal>()<transacts>:logic

        ConvertPingToAttack<epic_internal>(AttackTarget:agent):void

        ConvertedEvent<epic_internal>():subscribable(tuple())

        UnconvertedEvent<epic_internal>():subscribable(tuple())

    # Get the current fort_ping_interface for the specified character
    (InCharacter:fort_character).GetFortPing<native><epic_internal>()<transacts><decides>:fort_ping_interface

    ping_component<native><epic_internal> := class(component, fort_ping_interface):
        AreNPCCommandsEnabled<native><override>()<transacts>:logic

        CanAcceptPingCommand<native><override>()<transacts>:logic

        EnableCommandWheel<native><override>(Enabled:logic):void

        GetCurrentNPCCommand<native><override>()<transacts><decides>:ping_info

        OnNPCCommand<native><override>()<suspends>:?ping_info

        DeclineNPCCommand<native><override>(PlayUnableToPerformAction:logic):void

        IsAttackCommandEnabled<native><override>()<transacts>:logic

        ConvertPingToAttack<native><override>(AttackTarget:agent):void

        ConvertedEvent<override>():subscribable(tuple()) = external {}

        UnconvertedEvent<override>():subscribable(tuple()) = external {}

    # Module import path: /Fortnite.com/AI/CompanionAI/PingCommand
    PingCommand<epic_internal> := module:
        command_type<native><epic_internal> := enum:
            go_to
            back_to_me
            back_to_default
            hold_position
            revive
            invalid

        entity_type<native><epic_internal> := enum:
            pawn
            pickup
            weapon
            container
            player_built_actor
            building_actor
            undefined

    ToString<epic_internal>(Type:command_type)<transacts>:[]char = external {}

    ToString<epic_internal>(Type:entity_type)<transacts>:[]char = external {}

    ping_info<native><epic_internal> := struct:
        Type<native><epic_internal>:command_type

        EntityType<native><epic_internal>:entity_type

        Location<native><epic_internal>:vector3

        LocationOnHorizontalSurface<native><epic_internal>:logic

        Target<native><epic_internal>:?entity

        Emitter<native><epic_internal>:?agent