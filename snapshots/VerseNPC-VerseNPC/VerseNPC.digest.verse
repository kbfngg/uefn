using {/Verse.org/VerseEngine}
using {/Fortnite.com/Game}
using {/Fortnite.com/Assets}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/AI/VerseAIBase}
using {/Verse.org/Native}
using {/Verse.org/VerseEngine/Component}
# Module import path: /Fortnite.com/AI/VerseNPC
VerseNPC<public> := module:
    @import_as("/Script/VerseNPC.UInventoryComponentBase")
    inventory_component_base<native><epic_internal> := class(component):


    inventory_component<native><epic_internal> := class(inventory_component_base, fort_inventory_interface):
        GetAllItems<native><override>()<transacts>:[]fort_item_descriptor

        AddItemToInventory<native><override>(InventoryAsset:fort_inventory_item_asset, Count:int)<transacts><decides>:fort_item_descriptor

        DropItem<native><override>(Item:fort_item_descriptor):logic

        GetCurrentWeapon<native><override>()<transacts><decides>:fort_item_descriptor

        EquipWeapon<native><override>(Weapon:fort_item_descriptor)<transacts><decides>:void

        IsWeaponEquipped<native><override>(Weapon:fort_item_descriptor)<transacts>:logic

        GetWeaponDescriptor<native><override>(Weapon:fort_item_descriptor)<transacts><decides>:fort_weapon_descriptor

        RegisterUseSuggestedWeaponCallback<native><override>(Callback:type {__(:fort_item_descriptor):logic}):int

        UnregisterUseSuggestedWeaponCallback<native><override>(CallbackID:int):void

    @import_as("/Script/VerseNPC.ULeashComponentBase")
    leash_component_base<native><epic_internal> := class(component):


    leash_component<native><epic_internal> := class(leash_component_base, fort_leashable):
        SetLeashPosition<native><override>(Location:vector3, InnerRadius:float, OuterRadius:float):void

        SetLeashAgent<native><override>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        ClearLeash<native><override>():void

    # Fortnite NPC AI Management
    npc_component<native><epic_internal> := class(ai_actions_component, fort_navigatable, fort_character_movement_interface, fort_character_actions_interface, focus_interface, fort_weapon_actions_interface):
        NavigateTo<native><override>(Target:navigation_target, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        Wait<native><override>(?Duration:float = external {})<suspends>:void

        RoamAround<native><override>()<suspends>:navigation_result

        MoveInRangeToAttack<native><override>()<suspends>:action_result

        StopNavigation<native><override>():void

        GetCurrentDestination<native><override>()<transacts><decides>:vector3

        Crouch<native><override>()<suspends>:fallible_action_result

        Walk<native><override>()<suspends>:action_result

        Sprint<native><override>()<suspends>:action_result

        TacticalSprint<native><override>()<suspends>:action_result

        Jump<native><override>()<suspends>:action_result

        Slide<native><override>()<suspends>:action_result

        StandUp<native><override>():action_result

        PlayRandomEmote<native><override>()<suspends>:play_emote_result

        PlayEmote<native><override>(Emote:emote)<suspends>:play_emote_result

        Revive<native><override>(Target:agent)<suspends>:fallible_action_result

        MaintainFocus<native><override>(Location:vector3)<suspends>:void

        MaintainFocus<native><override>(Target:agent)<suspends>:void

        LootObject<native><override>(ObjectInfo:fort_loot_info)<suspends>:action_result

        AttackThreat<native><override>(Threat:target_info)<suspends>:action_result

        AttackObstacle<native><override>(Obstacle:fort_obstacle_info)<suspends>:action_result

        Fire<native><override>():logic

        Reload<native><override>():logic

        MeleeAttack<native><override>():logic

    @import_as("/Script/VerseNPC.UNPCPerceptionComponentBase")
    npc_perception_component_base<native><epic_internal> := class(component):


    npc_perception_component<native><epic_internal> := class(npc_perception_component_base, guard_perception_interface, fort_obstacle_perception_interface, fort_loot_perception_interface):
        GetDetectedTargets<native><override>()<transacts>:[]target_info

        GetDetectedTarget<native><override>(Agent:agent)<transacts><decides>:target_info

        TargetAddedEvent<override>():listenable(target_info) = external {}

        TargetInfoUpdatedEvent<override>():listenable(target_info) = external {}

        TargetRemovedEvent<override>():listenable(game_action_instigator) = external {}

        TargetSeenEvent<override>():listenable(target_info) = external {}

        TargetHeardEvent<override>():listenable(target_info) = external {}

        TargetTouchedEvent<override>():listenable(target_info) = external {}

        GetSightSettings<native><override>()<transacts>:sight_perception_settings

        SetSightSettings<native><override>(SightSettings:sight_perception_settings):void

        GetHearingSettings<native><override>()<transacts>:hearing_perception_settings

        SetHearingSettings<native><override>(HearingSettings:hearing_perception_settings):void

        GetTouchSettings<native><override>()<transacts>:touch_perception_settings

        SetTouchSettings<native><override>(TouchSettings:touch_perception_settings):void

        GetDamageSettings<native><override>()<transacts>:damage_perception_settings

        SetDamageSettings<native><override>(DamageSettings:damage_perception_settings):void

        TargetAddedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetInfoUpdatedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetRemovedEventInternal<native><epic_internal>:subscribable_event(game_action_instigator) = external {}

        TargetSeenEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetHeardEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetTouchedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        GetCurrentTargetInfo<native><override>()<transacts><decides>:target_info

        GetAlertLevel<native><override>()<transacts>:guard_alert_level

        GetAlertLevel<native><override>(TargetInfo:target_info)<transacts>:guard_alert_level

        AlertLevelChangedEvent<override>():listenable(guard_alert_level) = external {}

        CurrentTargetChangedEvent<override>():listenable(target_info) = external {}

        CurrentTargetChangedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        AlertLevelChangedEventInternal<native><epic_internal>:subscribable_event(guard_alert_level) = external {}

        GetSightSettings<native><override>(GuardAlertLevel:guard_alert_level)<transacts>:sight_perception_settings

        SetSightSettings<native><override>(GuardAlertLevel:guard_alert_level, SightSettings:sight_perception_settings):void

        GetHearingSettings<native><override>(GuardAlertLevel:guard_alert_level)<transacts>:hearing_perception_settings

        SetHearingSettings<native><override>(GuardAlertLevel:guard_alert_level, HearingSettings:hearing_perception_settings):void

        GetTouchSettings<native><override>(GuardAlertLevel:guard_alert_level)<transacts>:touch_perception_settings

        SetTouchSettings<native><override>(GuardAlertLevel:guard_alert_level, TouchSettings:touch_perception_settings):void

        GetDamageSettings<native><override>(GuardAlertLevel:guard_alert_level)<transacts>:damage_perception_settings

        SetDamageSettings<native><override>(GuardAlertLevel:guard_alert_level, DamageSettings:damage_perception_settings):void

        GetObstacleInfo<native><override>()<transacts><decides>:fort_obstacle_info

        ObstacleChangedEvent<override>():listenable(fort_obstacle_info) = external {}

        ObstacleChangedEventInternal<native><epic_internal>:subscribable_event(fort_obstacle_info) = external {}

        GetBestObjectToLoot<native><override>()<transacts><decides>:fort_loot_info

        BestObjectToLootChangedEvent<override>():listenable(fort_loot_info) = external {}

        BestObjectToLootChangedEventInternal<native><epic_internal>:subscribable_event(fort_loot_info) = external {}