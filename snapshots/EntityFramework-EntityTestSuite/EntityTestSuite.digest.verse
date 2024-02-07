using {/Verse.org/Simulation}
using {/UnrealEngine.com/EntityFramework/Entity}
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    test_component<native><epic_internal> := class(core_entity_component):


    @hide_in_editor
    lambda_test_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Notification called when the game simulation has started
        BeginPlay<native><override>():void

        # Notification called when the game simulation has ended
        EndPlay<native><override>():void

    @hide_in_editor
    init_test_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void