using {/Verse.org/Simulation}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/Native}
component<native><epic_internal> := class<abstract><unique>(disposable):
    var<private> Entity<public>:entity = external {}

    # The component is being initialized, called when it is attached to an entity
    OnInitialized<native><native_callable><protected>():void

    # Notification called then the component owner entity was added to a scene
    OnAddedToScene<native><native_callable><protected>():void

    # Called when the componnet starts simulating. Use this to set up tick updates or other setup that must be guaranteed to complete immediately.
    OnBeginSimulation<native><native_callable><protected>():void

    # Called after `OnBeginSimulation`. Code running in `OnSimulate` will be cancelled before `OnEndSimulation` runs.
    OnSimulate<native_callable><protected>()<suspends>:void = external {}

    # Notification called when the game simulation has ended
    OnEndSimulation<native><native_callable><protected>():void

    # Notification called when the component owner entity is about to be removed from a scene
    OnRemovingFromScene<native><native_callable><protected>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><native_callable><protected>():void

    Dispose<native><override><final>():void

    # Determines if the component has been Disposed.
    IsDisposed<native><final><public>()<transacts><decides>:void

    # Determines if the component has been Initialized.
    IsInitialized<native><final><public>()<transacts><decides>:void

    # Determines if the component has been placed in the scene.
    IsInScene<native><final><public>()<transacts><decides>:void

    # Determines if the component is currently simulating.
    IsSimulating<native><final><public>()<transacts><decides>:void

    var<private> TickEvents<protected>:tick_events = external {}

    IsAllowedOnClient<native_callable><epic_internal>():logic = external {}

@import_as("/Script/Entity.UBaseEntity")
base_entity<native><public> := class<abstract>:


entity<native><epic_internal> := class<concrete><unique><transacts>(base_entity, disposable):
    GetParent<native><final><public>()<transacts><decides>:entity

    UnsetParent<native><final><public>():void

    AttachEntities<native><final><public>(NewChildEntities:[]entity):void

    GetEntities<native><final><public>()<transacts>:[]entity

    GetComponents<native><final><public>(ComponentType:subtype(component))<transacts>:[]ComponentType

    AttachComponents<native><final><public>(Components:[]component):void

    Dispose<native><override><final>():void

    IsDisposed<native><final><public>()<decides>:void

entity_prefab<native><epic_internal> := class<computes>(asset):


replication_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnAddedToScene<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

tick_events<native><epic_internal> := class:
    PrePhysics<native><public>:execution_subscribable = external {}

    StartPhysics<native><epic_internal>:execution_subscribable = external {}

    DuringPhysics<native><epic_internal>:execution_subscribable = external {}

    EndPhysics<native><epic_internal>:execution_subscribable = external {}

    PostPhysics<native><public>:execution_subscribable = external {}

    EndFrame<native><epic_internal>:execution_subscribable = external {}

transform_component<native><epic_internal> := class<final>(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Utility method to set the transform of an entity and notifying listeners
    SetTransform<native><public>(NewTransform:transform):void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @replicated("RepNotify")
    # Current transform of the entity, relative to the world
    var Transform<native><public>:transform = external {}

    @editable
    # Initial value of the transform of the entity, relative to its owner if any
    var InitialRelativeTransform<native><public>:transform = external {}

@hide_in_editor
typed_element_component<native><epic_internal> := class(component):
