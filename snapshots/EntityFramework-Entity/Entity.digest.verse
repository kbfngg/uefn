using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
@experimental
# Base class for authoring logic and data in the SceneGraph. Using components youcan author re-usable building blocks of logic and data which can then be added toentities in the scene.Components are a very low level building block which can be used in many ways.For example:  * Exposing engine level concepts like mesh or sound  * Adding gameplay capabilities like damage or interaction  * Storing an inventory for a character in the gameAs components are generic there is no specific way that they must be used.It is up to the needs of your experience if you use one big game componentor if you break up logic into many small components.Currently UEFN will not allow you to add more than one component of a givensubclass of component (for example, only one type of light_component). This restrictionwill be relaxed in the future where components will be able to decide if theywish to allow only one instance or many instances of the same component to existtogether on one entity.==============================================================================Component Lifetime  Components move through a series of lifetime functions as they are added  to entities, added to the scene, and begin running in the simulation. Components  should override these methods to perform setup and run their simulation.  As a component shuts down it will then move through shutdown version of these  functions, giving users the opportunity to clean up any retained state on the  component before it is disposed.  Lifetime Methods:    OnInitialized       OnAddedToScene         OnBeginSimulation -> OnSimulate<suspends>         OnEndSimulation       OnRemovingFromScene    OnUninitializing==============================================================================
component<native><public> := class<abstract><unique>(disposable):
    @experimental
    @allow_self_reference
    @experimental_always_overridden
    # The parent entity of this component.  * Components must have a parent entity pointer provided when being constructed.  * Components cannot be moved between parents.  * The parent pointer remains valid even after the component has been disposed.
    Entity<native><public>:entity

    @experimental
    # Called when the component is added to an entity using `entity.AddEntities`.  * Components can check for dependent sibling components at this stage through `entity.GetComponents`.  * Components can add additional components at this stage using `entity.AddComponents`
    OnInitialized<native><native_callable><protected>():void

    @experimental
    # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.  * Querying for components in the scene is valid after this phase completes.  * `OnInitialized` is guaranteed to run before `OnAddedToScene`.
    OnAddedToScene<native><native_callable><protected>():void

    @experimental
    # Called when the component begins simulating within the scene.  * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.  * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
    OnBeginSimulation<native><native_callable><protected>():void

    @experimental
    # Called when the component begins simulating within the scene.  * Use this to add asynchronous/suspends update logic for a component.  * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.  * `OnSimulate` will be cancelled before `OnEndSimulation`
    OnSimulate<native_callable><protected>()<suspends>:void = external {}

    @experimental
    # Called when the component ends simulation within the scene.  * Simulation ends on a component when the experience resets, the parent entity is removed from the scene, or the component is disposed.  * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.  * `OnSimulate` task will be canceled before `OnEndSimulation` is called.  * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
    OnEndSimulation<native><native_callable><protected>():void

    @experimental
    # Called when the component is about to be removed from the scene.  * Components are removed from a scene when the parent entity is removed from the scene or the component is disposed.  * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
    OnRemovingFromScene<native><native_callable><protected>():void

    @experimental
    # Called when the component is about to be removed from the parent entity.  * Components are removed from their parent entity when they are disposed.  * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
    OnUninitializing<native><native_callable><protected>():void

    @experimental
    # Disposes of the component and all its resources.  * Disposed components are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
    Dispose<native><override><final>():void

    @experimental
    # Determines if the component has been disposed from the `Dispose` method. Disposed components cannot be added back to the scene.
    IsDisposed<native><final><public>()<transacts><decides>:void

    @experimental
    # Succeeds if the component is currently initialized with its parent entity.  * After `OnInitialized` is called this call succeeds.  * After `OnUninitializing` is called this call fails.
    IsInitialized<native><final><public>()<transacts><decides>:void

    @experimental
    # Succeeds if the component is currently in the scene.  * After `OnAddedToScene` is called this call succeeds.  * After `OnRemovingFromScene` is called this call fails.
    IsInScene<native><final><public>()<transacts><decides>:void

    @experimental
    # Succeeds if the component is currently simulating.  * After `OnBeginSimulation` is called this call succeeds.  * After `OnEndSimulation` is called this call fails.
    IsSimulating<native><final><public>()<transacts><decides>:void

    @experimental
    # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updatesbefore and after physics is updated on your object.
    var<private> TickEvents<protected>:tick_events = external {}

    IsAllowedOnClient<native_callable><epic_internal>():logic = external {}

@import_as("/Script/Entity.UBaseEntity")
@experimental
base_entity<native><epic_internal> := class<abstract>:


@experimental
# Entities are the base object in the SceneGraph.  * Objects in experiences are constructed of one or more entities.  * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.  * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.  * The structure and content of entities is dynamic and be changed at any time through your experience.==============================================================================Deriving from entity  In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you  want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are  authored through the editor, with their Verse classes generated as part of the build into the projects  Assets.digest.verse file.  While you can create base prefabs for common game object types like a vehicle or character, we highly recommended  that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in  components allows you to restructure your prefabs throughout production of your experience, without needing to massively  refactor your class structure.
entity<native><public> := class<concrete><unique><transacts>(base_entity, disposable):
    @experimental
    # Returns the parent entity of this entity.  * The parent entity controls the lifetime of its child entities and components. When an entity    is removed from the scene, all its child entities and components will be removed as well.  * Some entities may choose to re-parent child entities before being disposed For example,    a vehicle might drop an attached wheel vs. having the wheel entity be removed with the vehicle.  * Method fails if there is currently no parent entity.
    GetParent<native><final><public>()<transacts><decides>:entity

    @experimental
    # Removes this entity from its parent. This is used to remove entities from the scene temporarily.  * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.  * Entity can be added back later by using `NewParent.AddEntities`.  * If this entity is no longer needed then consider using `Dispose` instead of `RemoveFromParent`.
    RemoveFromParent<native><final><public>():void

    @experimental
    # Adds the provided entities as children of this entity.  * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.  * Added child entities will move through their lifetime methods until they match the state of the new parent.
    AddEntities<native><final><public>(NewChildEntities:[]entity):void

    @experimental
    # Returns the child entities belonging to this entity which are accessible from the calling context.  * This method only gets the direct entity children. To query multiple levels down the entity structure use    the Find* query methods instead.
    GetEntities<native><final><public>()<transacts>:[]entity

    @experimental
    # Returns the child components of type ComponentType.  * To get all child components use `GetComponents(component)`.  * To get a single component use `GetComponent(some_component)[0]`.
    GetComponents<native><final><public>(ComponentType:subtype(component))<transacts>:[]ComponentType

    @experimental
    # Adds the provided components to the entity.   * If a component is not allowed to be added to this entity it is skipped.  * Components are added following these rules:      1. All components are added to the entity child list.      2. All components have `OnInitialized` called.      3. All components have `OnAddedToScene` called (if this entity is in the scene).      4. All components have `OnBeginSimulation` called (if this entity is simulating).
    AddComponents<native><final><public>(Components:[]component):void

    @experimental
    # Disposes of the entity and all its resources.  * Disposed entities are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
    Dispose<native><override><final>():void

    @experimental
    # Succeeds if the entity has been disposed by the `Dispose` method. Disposed entities cannot be added back to the scene.
    IsDisposed<native><final><public>()<transacts><decides>:void

@experimental
# Reference type to editor defined prefab. Only generated digest code should reference this type.
entity_prefab<native><public> := class<computes><epic_internal>(asset):


@experimental
replication_component<native><epic_internal> := class(component):
    @editable
    # Internal only flag to make this entity always relevant for replication to clients
    AlwaysRelevant<native><epic_internal>:logic = external {}

    # The component is being initialized, called when it is added to an entity
    OnAddedToScene<native><override>():void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

@hide_in_editor
@experimental
simulation_entity<native><epic_internal> := class<concrete><unique><transacts>(entity):


@experimental
# Returns the simulation entity parent for this entity.  * The simulation entity is the rootmost entity in an experience.  * Fails if this entity is not currently in the scene.
(InEntity:entity).GetSimulationEntity<native><public>()<transacts><decides>:entity

@experimental
# Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run codebefore or after the physics system has updated your object, allowing you to affect or react to these updates.
tick_events<native><public> := class<epic_internal>:
    # Subscribe callbacks to `PrePhysics` to run your code before the physics system has updated your object this frame.
    PrePhysics<native><public>:execution_subscribable = external {}

    StartPhysics<native><epic_internal>:execution_subscribable = external {}

    DuringPhysics<native><epic_internal>:execution_subscribable = external {}

    EndPhysics<native><epic_internal>:execution_subscribable = external {}

    # Subscribe callbacks to `PostPhysics` to run your code after the physics system has updated your object this frame.
    PostPhysics<native><public>:execution_subscribable = external {}

    EndFrame<native><epic_internal>:execution_subscribable = external {}

@experimental
# Stores the world transform for an entity, which is used to position the entity.  * If you wish for an entity to update its transform when its parent entity transform changes then    you must also add a `parent_constraint_component` to the entity.
transform_component<native><public> := class<final>(component):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    @experimental
    # Sets the world transform of the entity.
    SetTransform<native><public>(NewTransform:transform):void

    @experimental
    # Returns the world transform of the entity.
    GetTransform<native><public>()<transacts>:transform

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @experimental
    # The value of `InitialRelativeTransform` is used when spawning an entity into the scene.  * When spawning an entity with a `transform_component`, the entity is offset by `InitialRelativeOffset` from the new parent entity's transform.  * When spawning an entity with a `transform_component` as a child of the simulation entity the entity is offset by `InitialRelativeOffset` from the simulation entity's transform.  * When spawning a prefab each sub-entity with a `transform_component` is offset by `InitialRelativeTransform` from its parent entities transform.
    var InitialRelativeTransform<native><public>:transform = external {}

@hide_in_editor
@experimental
typed_element_component<native><epic_internal> := class(component):
