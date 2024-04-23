using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
ai_navigation_relevant_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to the scene
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from the scene
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    # If set, navigation data will not be generated under the surface of the geometry
    var FillCollisionUnderneathForNavData<native><public>:logic = external {}