using {/UnrealEngine.com/Temporary/SceneGraph}
using {/Verse.org/Native}
@import_as("/Script/FortniteGame.ULevelSaveRecord")
@experimental
level_save_record<native><epic_internal> := class<epic_internal>:


@experimental
bridge_component<native><public> := class<final>(component):
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    AsCreativeDevice<public>(Type:subtype(creative_device_base))<suspends>:?Type = external {}