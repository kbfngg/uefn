using {/Verse.org/VerseEngine}
using {/Fortnite.com/Game}
using {/Verse.org/Native}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/AI/VerseAIBase}
# Module import path: /Fortnite.com/AI/VerseCreature
VerseCreature<public> := module:
    # Fortnite Creature AI Management
    creature_component<native><epic_internal> := class(ai_actions_component, fort_navigatable, focus_interface):
        GetCurrentDestination<native><override>()<transacts><decides>:vector3

        NavigateTo<native><override>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        SetMovementSpeedMultiplier<native><override>(Multiplier:float):void

        StopNavigation<native><override>():void

        Wait<native><override>(?Duration:float = external {})<suspends>:void

        RoamAround<native><override>()<suspends>:navigation_result

        MoveInRangeToAttack<native><override>()<suspends>:action_result

        MaintainFocus<native><override>(Location:vector3)<suspends>:void

        MaintainFocus<native><override>(Agent:agent)<suspends>:void

    @import_as("/Script/VerseCreature.UCreaturePerceptionComponentBase")
    creature_perception_component_base<native><epic_internal> := class(component):


    creature_perception_component<native><epic_internal> := class(creature_perception_component_base, perception_interface):
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