using {/Verse.org/Simulation}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/Execution}
using {/Verse.org/Assets}
using {/Verse.org/Native}
# Module import path: /UnrealEngine.com/EntityFramework/Entity
Entity<public> := module:
    component<native><epic_internal> := class<abstract><unique>:
        # Returns the owner of this component
        GetOwner<native><public>()<transacts><decides>:entity

        # The component is being initialized, called when it is attach to an entity
        Initialize<native><native_callable><protected>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><native_callable><protected>():void

        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><native_callable><protected>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><native_callable><protected>():void

        # Notification called when the game simulation has started
        BeginPlay<native><native_callable><protected>():void

        # Notification called when the game simulation has ended
        EndPlay<native><native_callable><protected>():void

        IsAllowedOnClient<native_callable><epic_internal>():logic = external {}

    @import_as("/Script/Entity.UBaseEntity")
    base_entity<native><public> := class<abstract>:


    entity<native><epic_internal> := class<concrete><unique><transacts>(base_entity):
        # Returns the owner of this entity if any
        GetOwner<native><public>()<transacts><decides>:entity

        # Returns any accessible child entities of this entity
        GetEntities<native><final><public>()<transacts>:[]entity

        # Adds an owned entity to an entity
        AddEntity<native><public>(InEntity:entity)<transacts><decides>:void

        # Removes an owned entity from an entity
        RemoveEntity<native><public>(InEntity:entity)<transacts><decides>:void

        # Add a component to the list of component, it will fail if the component type is already in the list
        AddComponent<native><public>(InComponent:component)<transacts><decides>:void

        # Remove a component from the entity
        RemoveComponent<native><public>(InComponent:component)<transacts><decides>:void

        # Retreive a component of a specified type
        GetComponentByType<native><public>(ComponentType:subtype(component))<transacts><decides>:ComponentType

        # Destroy the entity
        Dispose<native><public>():void

        # Determine if the entity has been disposed
        IsDisposed<native><public>()<decides>:void

    entity_prefab<native><epic_internal> := class<computes>(asset):


    # Module import path: /UnrealEngine.com/EntityFramework/Entity/entity_initializer
    entity_initializer<epic_internal> := module:
        mode<native><public> := enum:
            get
            get_or_create

        # Tells that specified component type need to be initialized before
        InitializeDependency<native><public>(OwnerEntity:entity, ComponentType:subtype(component), Mode:mode)<transacts><decides>:ComponentType

    engine_execution_subscribables<native><public> := class:
        PrePhysics<native><public>:execution_subscribable = external {}

        StartPhysics<native><public>:execution_subscribable = external {}

        DuringPhysics<native><public>:execution_subscribable = external {}

        EndPhysics<native><public>:execution_subscribable = external {}

        PostPhysics<native><public>:execution_subscribable = external {}

        EndFrame<native><public>:execution_subscribable = external {}

    # Module import path: /UnrealEngine.com/EntityFramework/Entity/engine_execution
    engine_execution<public> := module:
        GetSubscribables<native><epic_internal>(ForEntity:entity):engine_execution_subscribables

    replication_component<native><epic_internal> := class(component):
        # The component is being initialized, called when it is attach to an entity
        AddedToWorld<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        RemovingFromWorld<native><override>():void

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    transform_component<native><epic_internal> := class(component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

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

    typed_element_component<native><epic_internal> := class(component):
