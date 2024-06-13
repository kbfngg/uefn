using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
@experimental
ai_navigation_relevant_component<native><public> := class(component):
    # The component is being initialized, called when it is added to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to the scene
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from the scene
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @experimental
    # If set, navigation data will not be generated under the surface of the geometry
    var FillCollisionUnderneathForNavData<native><epic_internal>:logic = external {}