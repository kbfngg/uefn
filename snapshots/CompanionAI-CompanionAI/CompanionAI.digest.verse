using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/AI/CompanionAI/PingCommand}
using {/Fortnite.com/Characters}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /Fortnite.com/AI/CompanionAI
CompanionAI<public> := module:
    companion_ai<epic_internal> := class(npc_behavior):
        OnBegin<override>()<suspends>:void = external {}

    default_npc_behavior<epic_internal> := class(npc_behavior):
        OnBegin<override>()<suspends>:void = external {}

    # Fortnite NPC AI Management
    fort_guard_actions_component<native><epic_internal> := class(guard_actions_component):
        # Run the NPC default behavior
        RunDefaultBehavior<native><epic_internal>()<suspends>:action_result

        IsFollowingBehaviorEnabled<native><epic_internal>()<transacts>:logic

    (InEntity:entity).GetAgent<native><epic_internal>()<transacts>:?agent

    (Agent:agent).GetTeamMembers<native><epic_internal>()<transacts>:[]agent

    (Character:fort_character).IsBeingDBNOCarried<native><epic_internal>()<transacts><decides>:void

    (Character:fort_character).GetNPCLeashRadius<native><epic_internal>()<transacts>:tuple(float, float)

    # Fortnite Creature AI Management
    fort_npc_actions_component<native><epic_internal> := class(npc_actions_component):
        # Run the Creature default behavior
        RunDefaultBehavior<native><epic_internal>()<suspends>:action_result

    ping_component<native><epic_internal> := class<epic_internal>(ai_component):
        AreNPCCommandsEnabled<native><epic_internal>()<transacts>:logic

        CanAcceptPingCommand<native><epic_internal>()<transacts>:logic

        EnableCommandWheel<native><epic_internal>(Enabled:logic):void

        GetCurrentNPCCommand<native><epic_internal>()<transacts><decides>:ping_info

        OnNPCCommand<native><epic_internal>()<suspends>:?ping_info

        DeclineNPCCommand<native><epic_internal>(PlayUnableToPerformAction:logic):void

        IsAttackCommandEnabled<native><epic_internal>()<transacts>:logic

        ConvertPingToAttack<native><epic_internal>(AttackTarget:agent):void

        ConvertedEvent<epic_internal>():subscribable(tuple()) = external {}

        UnconvertedEvent<epic_internal>():subscribable(tuple()) = external {}

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

    ToString<epic_internal>(Type:command_type)<transacts>:string = external {}

    ToString<epic_internal>(Type:entity_type)<transacts>:string = external {}

    ping_info<native><epic_internal> := struct:
        Type<native><epic_internal>:command_type

        EntityType<native><epic_internal>:entity_type

        Location<native><epic_internal>:vector3

        LocationOnHorizontalSurface<native><epic_internal>:logic

        Target<native><epic_internal>:?entity

        Emitter<native><epic_internal>:?agent