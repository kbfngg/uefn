using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Entity}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Assets}
using {/Fortnite.com/Game/Abilities}
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

    # Module import path: /Fortnite.com/AI/VerseAIBase/FortCreatureActionsModule
    FortCreatureActionsModule<public> := module:
        GetGameplayAbility<public>(path:string)<transacts>:gameplay_ability_asset = external {}

    fort_inventory_item_asset<native><epic_internal> := class<computes><final>(asset):


    fort_item_tag<native><public> := class(tag):


    fort_weapon_tag<native><public> := class<epic_internal>(fort_item_tag):


    fort_melee_weapon_tag<native><public> := class<epic_internal>(fort_weapon_tag):


    fort_range_weapon_tag<native><public> := class<epic_internal>(fort_weapon_tag):


    fort_pickaxe_tag<native><public> := class(fort_melee_weapon_tag):


    fort_pistol_tag<native><public> := class(fort_range_weapon_tag):


    fort_shotgun_tag<native><public> := class(fort_range_weapon_tag):


    fort_rifle_tag<native><public> := class(fort_range_weapon_tag):


    fort_SMG_tag<native><public> := class(fort_range_weapon_tag):


    fort_sniper_tag<native><public> := class(fort_range_weapon_tag):


    fort_grenade_launcher_tag<native><public> := class(fort_range_weapon_tag):


    fort_rocket_launcher_tag<native><public> := class(fort_range_weapon_tag):


    fort_bow_tag<native><public> := class(fort_range_weapon_tag):


    fort_mini_gun_tag<native><public> := class(fort_range_weapon_tag):


    fort_LMG_tag<native><public> := class(fort_range_weapon_tag):


    fort_biplane_gun_tag<native><public> := class(fort_range_weapon_tag):


    fort_resource_tag<native><public> := class<epic_internal>(fort_item_tag):


    fort_wood_tag<native><public> := class(fort_resource_tag):


    fort_stone_tag<native><public> := class(fort_resource_tag):


    fort_metal_tag<native><public> := class(fort_resource_tag):


    fort_item_descriptor<native><epic_internal> := struct<epic_internal>:
        ItemType<native><public>:fort_item_tag

    fort_weapon_descriptor<native><epic_internal> := struct<epic_internal>:
        TotalAmmo<native><public>:int = external {}

        LoadedAmmo<native><public>:int = external {}

        MaxRange<native><public>:float = external {}

    # Module import path: /Fortnite.com/AI/VerseAIBase/fort_item_interface
    fort_item_interface<epic_internal> := module:
        HasTag<native><public>(Item:fort_item_descriptor, Tag:fort_item_tag)<transacts>:logic

    fort_inventory_interface<native><epic_internal> := interface<epic_internal>:
        AddItemToInventory<epic_internal>(InventoryAsset:fort_inventory_item_asset, Count:int)<transacts><decides>:fort_item_descriptor

        GetAllItems<public>()<transacts>:[]fort_item_descriptor

        DropItem<public>(Item:fort_item_descriptor):logic

        GetCurrentWeapon<public>()<transacts><decides>:fort_item_descriptor

        EquipWeapon<public>(Weapon:fort_item_descriptor)<transacts><decides>:void

        IsWeaponEquipped<public>(Weapon:fort_item_descriptor)<transacts>:logic

        GetWeaponDescriptor<public>(Weapon:fort_item_descriptor)<transacts><decides>:fort_weapon_descriptor

        RegisterUseSuggestedWeaponCallback<public>(Callback:type {__(:fort_item_descriptor):logic}):int

        UnregisterUseSuggestedWeaponCallback<public>(CallbackID:int):void

    # Get the current fort_inventory_interface for the specified character
    (InCharacter:fort_character).GetFortInventory<native><epic_internal>()<transacts><decides>:fort_inventory_interface

    fort_loot_type<native><epic_internal> := enum:
        pickup
        chest
        supply_drop
        unknown

    fort_loot_info<native><epic_internal> := struct<epic_internal>:
        Location<native><public>:vector3

        Type<native><public>:fort_loot_type

        Loot<native><epic_internal>:vk_entity

    MakeNavigationTarget<constructor><native><epic_internal>(LootInfo:fort_loot_info):navigation_target

    fort_loot_perception_interface<native><epic_internal> := interface<epic_internal>:
        # Get information about the potential best loot object
        GetBestObjectToLoot<public>()<transacts><decides>:fort_loot_info

        # Event when a new best object to loot is detected
        BestObjectToLootChangedEvent<public>():listenable(fort_loot_info)

    # Get the current fort_loot_perception_interface for the specified character
    (InCharacter:fort_character).GetFortLootPerception<native><epic_internal>()<transacts><decides>:fort_loot_perception_interface

    fort_character_actions_interface<native><epic_internal> := interface(emote_interface):
        # Revive the specified target
        Revive<public>(Target:agent)<suspends>:fallible_action_result

        # Navigate to and loot the specified object
        LootObject<epic_internal>(ObjectInfo:fort_loot_info)<suspends>:action_result

        # Start fighting with the specified target
        AttackThreat<public>(Threat:target_info)<suspends>:action_result

        # Attack the navigation obstacle
        AttackObstacle<epic_internal>(Obstacle:fort_obstacle_info)<suspends>:action_result

    # Get the current fort_character_actions_interface for the specified character
    (InCharacter:fort_character).GetFortCharacterActions<native><epic_internal>()<transacts><decides>:fort_character_actions_interface

    fort_obstacle_status<native><epic_internal> := enum:
        incoming_obstacle
        blocked_by_obstacle
        trap_obstacle

    fort_obstacle_info<native><epic_internal> := struct<epic_internal>:
        Location<native><public>:vector3

        Status<native><public>:fort_obstacle_status

        Obstacle<native><epic_internal>:vk_entity

    fort_obstacle_perception_interface<native><epic_internal> := interface<epic_internal>:
        # Get information about the potential current obstacle
        GetObstacleInfo<public>()<transacts><decides>:fort_obstacle_info

        # Event when a new best obstacle is detected
        ObstacleChangedEvent<public>():listenable(fort_obstacle_info)

    # Get the current fort_obstacle_perception_interface for the specified character
    (InCharacter:fort_character).GetFortObstaclePerception<native><epic_internal>()<transacts><decides>:fort_obstacle_perception_interface

    fort_weapon_actions_interface<native><epic_internal> := interface<epic_internal>:
        # Fire weapon
        Fire<public>():logic

        # Reload current weapon
        Reload<public>():logic

        # Throw a melee attack
        MeleeAttack<public>():logic

    # Get the current fort_weapon_actions_interface for the specified character
    (InCharacter:fort_character).GetFortWeaponActions<native><epic_internal>()<transacts><decides>:fort_weapon_actions_interface