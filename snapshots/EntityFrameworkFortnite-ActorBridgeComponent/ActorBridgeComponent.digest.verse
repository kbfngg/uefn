using {/Fortnite.com/Devices}
using {/UnrealEngine.com/Temporary/SceneGraph}
using {/Verse.org/Native}
# Module import path: /UnrealEngine.com/EntityFramework/ActorBridgeComponent
ActorBridgeComponent<public> := module:
    @import_as("/Script/FortniteGame.ULevelSaveRecord")
    level_save_record<native><epic_internal> := class<epic_internal>:


    actor_bridge_component<native><epic_internal> := class(component):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

        RequestRootActorAsDevice<public>(Type:subtype(creative_device_base))<suspends>:?Type = external {}