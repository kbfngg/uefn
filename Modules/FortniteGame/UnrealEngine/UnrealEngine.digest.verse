# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-31.40-CL-36874825
#################################################

using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Verse.org/Assets }
# Module import path: /UnrealEngine.com/Assets
Assets<public> := module {
  SpawnParticleSystem<native><public>(
    Asset: particle_system,
    Position: vector3,
    ?Rotation: rotation = external {},
    ?StartDelay: float = external {}
  )<transacts>: cancelable
}

Temporary<public> := module {
  # Module import path: /UnrealEngine.com/Temporary/Curves
  Curves<public> := module {
    editable_curve<native><public> := class<final><concrete> {
      # Evaluates this float curve at the specified time and returns the result as a float
      Evaluate<native><public>(Time: float): float
    }
  }

  # Module import path: /UnrealEngine.com/Temporary/Diagnostics
  Diagnostics<public> := module {
    # debug draw class to draw debug shapes on screen.
    debug_draw<native><public> := class {
      # Channel will be used to clear specific debug draw.
      Channel<native><public>: subtype(debug_draw_channel) = external {}

      # Clears all debug draw from this debug_draw instance.
      Clear<native><public>()<transacts>: void

      # Clears all debug draw for the channel.
      ClearChannel<native><public>()<transacts>: void

      # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
      DrawArrow<native><public>(
        Start: vector3,
        End: vector3,
        ?ArrowSize: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a box at the named location, and using the provided draw parameters
      DrawBox<native><public>(
        Center: vector3,
        Rotation: rotation,
        ?Extent: vector3 = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a capsule at the named location, and using the provided draw parameters.
      DrawCapsule<native><public>(
        Center: vector3,
        Rotation: rotation,
        ?Height: float = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cone at the named location, and using the provided draw parameters.
      DrawCone<native><public>(
        Origin: vector3,
        Direction: vector3,
        ?Height: float = external {},
        ?NumSides: int = external {},
        ?AngleWidthRadians: float = external {},
        ?AngleHeightRadians: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cylinder at the named location, and using the provided draw parameters.
      DrawCylinder<native><public>(
        Start: vector3,
        End: vector3,
        ?NumSegments: int = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a line from Start to End locations, and using the provided draw parameters.
      DrawLine<native><public>(
        Start: vector3,
        End: vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a point at the named location, and using the provided draw parameters.
      DrawPoint<native><public>(
        Position: vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a sphere at the named location, and using the provided draw parameters.
      DrawSphere<native><public>(
        Center: vector3,
        ?Radius: float = external {},
        ?Color: color = external {},
        ?NumSegments: int = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Hide Debug Draw for the channel for all users.
      HideChannel<native><public>()<transacts>: void

      # Show Debug Draw for the channel for all users.
      ShowChannel<native><public>()<transacts>: void
    }

    # debug_draw_channel is the base class used to define debug draw channels.
    debug_draw_channel<native><public> := class<abstract> {}

    # Enumerated presets for policies describing a desired draw duration.
    debug_draw_duration_policy<native><public> := enum {
      FiniteDuration

      Persistent

      SingleFrame
    }

    # log class to send messages to the default log
    log<native><public> := class {
      # Print message using the given log level
      (log:)Print<native><public>(Message: string, ?Level: log_level = external {})<computes>: void

      # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
      Channel<native><public>: subtype(log_channel)

      # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
      DefaultLevel<native><public>: log_level = external {}

      # Prints current script call stack using the give log level
      PrintCallStack<native><public>(?Level: log_level = external {})<computes>: void
    }

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract> {}

    # log levels available for various log commands
    log_level<native><public> := enum {
      Debug

      Error

      Normal

      Verbose

      Warning
    }
  }

  SceneGraph<public> := module {
    @experimental
    # Finds all components attached to entities below and including `InEntity` of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindComponents<native><public>(ComponentType: subtype(component))<transacts>: []ComponentType

    @experimental
    # Finds all entities below and including `InEntity` of type `EntityType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntities<native><public>(EntityType: subtype(entity))<transacts>: []EntityType

    @experimental
    # Finds all entities below and including `InEntity` whose `transform_component.Translation` is inside `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesOriginInside<native><public>(Shape: convex_volume3)<transacts>: []entity

    @experimental
    # Finds all entities below and including `InEntity` whose `collision_component` shape overlaps with `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesOverlapping<native><public>(Shape: convex_volume3)<transacts>: []entity

    @experimental
    # Finds all entities below and including `InEntity` containing a component of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesWithComponent<native><public>(ComponentType: subtype(component))<transacts>: []entity

    @experimental
    # Finds all entities below and including `InEntity` with `Tag` present in their `tag_component`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindEntitiesWithTag<native><public>(Tag: tag)<transacts>: []entity

    @experimental
    # Finds all components attached to parent entities above `InEntity` of type `ComponentType`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentComponents<native><public>(ComponentType: subtype(component))<transacts>: []ComponentType

    @experimental
    # Finds all parent entities above `InEntity` of type `EntityType`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntities<native><public>(EntityType: subtype(entity))<transacts>: []EntityType

    @experimental
    # Finds all parent entities above `InEntity` whose `transform_component.Translation` is inside `Shape`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesOriginInside<native><public>(Shape: convex_volume3)<transacts>: []entity

    @experimental
    # Finds all parent entities above `InEntity` whose `collision_component` shape overlaps with `Shape`.The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesOverlapping<native><public>(Shape: convex_volume3)<transacts>: []entity

    @experimental
    # Finds all parent entities above `InEntity` containing a component of type `ComponentType`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesWithComponent<native><public>(ComponentType: subtype(component))<transacts>: []entity

    @experimental
    # Finds all parent entities above `InEntity` with `Tag` present in their `tag_component`.The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindParentEntitiesWithTag<native><public>(Tag: tag)<transacts>: []entity

    @experimental
    # Returns the simulation entity parent for this entity.  * The simulation entity is the rootmost entity in an experience.  * Fails if this entity is not currently in the scene.
    (InEntity: entity).GetSimulationEntity<native><public>()<transacts><decides>: entity

    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/NamedCollisionChannels
    NamedCollisionChannels<public> := module {
      @experimental
      Camera<public>: collision_channel = external {}

      @experimental
      Destructible<public>: collision_channel = external {}

      @experimental
      Pawn<public>: collision_channel = external {}

      @experimental
      PhysicsBody<public>: collision_channel = external {}

      @experimental
      Vehicle<public>: collision_channel = external {}

      @experimental
      Visibility<public>: collision_channel = external {}

      @experimental
      WorldDynamic<public>: collision_channel = external {}

      @experimental
      WorldStatic<public>: collision_channel = external {}
    }

    using { /UnrealEngine.com/Temporary/SpatialMath }
    using { /Verse.org/Simulation/Tags }
    @experimental
    # Axis aligned box volume.
    axis_aligned_box3<native><public> := class<final><concrete>(convex_volume3) {
      # Center point of the box.
      Center<native><public>: vector3 = external {}

      # Extent of the box.
      Extent<native><public>: vector3 = external {}
    }

    @experimental
    collision_channel<native><public> := struct<concrete><computes><epic_internal> {}

    @experimental
    collision_channel_response<native><public> := enum {
      Block

      Ignore

      Overlap
    }

    @experimental
    collision_channel_responses<native><public> := class<concrete><epic_internal> {}

    @experimental
    # Used to make an entity collide with other scene objects, including preventing players and NPCs from passing through the entity.Overlap queries can only find entities with enabled `collision_components`.Dependencies:  * `transform_component` on the entity positions the `collision_component`.  * `mesh_component` on the entity provides the collision shape for the `collision_component`.
    collision_component<native><public> := class<final>(component, enableable) {
      # Disables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
      Disable<native><override>(): void

      # Enables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
      Enable<native><override>(): void

      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      # Sets up collision simulation for the entity.
      OnBeginSimulation<native><override>(): void

      # Tears down collision simulation for the entity.
      OnEndSimulation<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      OnUninitializing<native><override>(): void
    }

    @experimental
    collision_profile<native><public> := class<concrete><epic_internal> {
      GetChannel<native><public>(): collision_channel

      GetName<native><public>(): string

      GetResponses<native><public>(): collision_channel_responses

      SetChannel<native><public>(Channel: collision_channel): void

      SetName<native><public>(Name: string): void

      SetResponses<native><public>(Responses: collision_channel_responses): void
    }

    @experimental
    collision_query_params<native><public> := struct<epic_internal> {
      # True to have the query return Blocking hits
      DetectBlocking<native><public>: logic = external {}

      # True to have the query return Overlapping hits
      DetectOverlapping<native><public>: logic = external {}

      # A set of components to ignore in the query
      IgnoredComponents<native><public>: []collision_component = external {}
    }

    @experimental
    # Base class for authoring logic and data in the SceneGraph. Using components youcan author re-usable building blocks of logic and data which can then be added toentities in the scene.Components are a very low level building block which can be used in many ways.For example:  * Exposing engine level concepts like mesh or sound  * Adding gameplay capabilities like damage or interaction  * Storing an inventory for a character in the gameAs components are generic there is no specific way that they must be used.It is up to the needs of your experience if you use one big game componentor if you break up logic into many small components.Currently UEFN will not allow you to add more than one component of a givensubclass of component (for example, only one type of light_component). This restrictionwill be relaxed in the future where components will be able to decide if theywish to allow only one instance or many instances of the same component to existtogether on one entity.==============================================================================Component Lifetime  Components move through a series of lifetime functions as they are added  to entities, added to the scene, and begin running in the simulation. Components  should override these methods to perform setup and run their simulation.  As a component shuts down it will then move through shutdown version of these  functions, giving users the opportunity to clean up any retained state on the  component before it is disposed.  Lifetime Methods:    OnInitialized       OnAddedToScene         OnBeginSimulation -> OnSimulate<suspends>         OnEndSimulation       OnRemovingFromScene    OnUninitializing==============================================================================
    component<native><public> := class<abstract><unique>(disposable) {
      @experimental
      # Disposes of the component and all its resources.  * Disposed components are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
      Dispose<native><override><final>(): void

      @experimental
      # The parent entity of this component.  * Components must have a parent entity pointer provided when being constructed.  * Components cannot be moved between parents.  * The parent pointer remains valid even after the component has been disposed.
      Entity<native><public>: entity

      @experimental
      # Determines if the component has been disposed from the `Dispose` method. Disposed components cannot be added back to the scene.
      IsDisposed<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently in the scene.  * After `OnAddedToScene` is called this call succeeds.  * After `OnRemovingFromScene` is called this call fails.
      IsInScene<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently initialized with its parent entity.  * After `OnInitialized` is called this call succeeds.  * After `OnUninitializing` is called this call fails.
      IsInitialized<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently simulating.  * After `OnBeginSimulation` is called this call succeeds.  * After `OnEndSimulation` is called this call fails.
      IsSimulating<native><final><public>()<transacts><decides>: void

      @experimental
      # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.  * Querying for components in the scene is valid after this phase completes.  * `OnInitialized` is guaranteed to run before `OnAddedToScene`.
      OnAddedToScene<native><native_callable><protected>(): void

      @experimental
      # Called when the component begins simulating within the scene.  * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.  * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
      OnBeginSimulation<native><native_callable><protected>(): void

      @experimental
      # Called when the component ends simulation within the scene.  * Simulation ends on a component when the experience resets, the parent entity is removed from the scene, or the component is disposed.  * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.  * `OnSimulate` task will be canceled before `OnEndSimulation` is called.  * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
      OnEndSimulation<native><native_callable><protected>(): void

      @experimental
      # Called when the component is added to an entity using `entity.AddEntities`.  * Components can check for dependent sibling components at this stage through `entity.GetComponents`.  * Components can add additional components at this stage using `entity.AddComponents`
      OnInitialized<native><native_callable><protected>(): void

      @experimental
      # Called when the component is about to be removed from the scene.  * Components are removed from a scene when the parent entity is removed from the scene or the component is disposed.  * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
      OnRemovingFromScene<native><native_callable><protected>(): void

      @experimental
      # Called when the component begins simulating within the scene.  * Use this to add asynchronous/suspends update logic for a component.  * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.  * `OnSimulate` will be cancelled before `OnEndSimulation`
      OnSimulate<native_callable><protected>()<suspends>: void = external {}

      @experimental
      # Called when the component is about to be removed from the parent entity.  * Components are removed from their parent entity when they are disposed.  * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
      OnUninitializing<native><native_callable><protected>(): void

      @experimental
      # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updatesbefore and after physics is updated on your object.
      var<private> TickEvents<protected>: tick_events = external {}
    }

    @experimental
    # Base class for all convex volumes.
    convex_volume3<native><public> := class<epic_internal>(volume3) {
      # Determines if `Point` falls within the boundaries of this `convex_volume3`.
      Contains<native><public>(Point: vector3)<computes><decides><reads>: void
    }

    using { /Verse.org/Assets }
    using { /Verse.org/Colors }
    using { /Verse.org/Simulation }
    @experimental
    # A `directional_light_component` simulates light that is being emitted from a source that is infinitelyfar away. This means that all shadows cast by this light will be parallel, making this the ideal choicefor simulating sunlight.
    directional_light_component<native><public> := class<final>(light_component) {
      @experimental
      # Controls the amount of shadow occlusion. A value of 0.0 means no occlusion, thus no shadow.
      var ShadowOpacity<public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}
    }

    @experimental
    # Entities are the base object in the SceneGraph.  * Objects in experiences are constructed of one or more entities.  * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.  * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.  * The structure and content of entities is dynamic and be changed at any time through your experience.==============================================================================Deriving from entity  In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you  want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are  authored through the editor, with their Verse classes generated as part of the build into the projects  Assets.digest.verse file.  While you can create base prefabs for common game object types like a vehicle or character, we highly recommended  that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in  components allows you to restructure your prefabs throughout production of your experience, without needing to massively  refactor your class structure.
    entity<native><public> := class<concrete><unique><transacts>(disposable) {
      @experimental
      # Adds the provided components to the entity.   * If a component is not allowed to be added to this entity it is skipped.  * Components are added following these rules:      1. All components are added to the entity child list.      2. All components have `OnInitialized` called.      3. All components have `OnAddedToScene` called (if this entity is in the scene).      4. All components have `OnBeginSimulation` called (if this entity is simulating).
      AddComponents<native><final><public>(Components: []component): void

      @experimental
      # Adds the provided entities as children of this entity.  * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.  * Added child entities will move through their lifetime methods until they match the state of the new parent.
      AddEntities<native><final><public>(NewChildEntities: []entity): void

      @experimental
      # Disposes of the entity and all its resources.  * Disposed entities are removed from the scene and cannot be added back.  * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
      Dispose<native><override><final>(): void

      @experimental
      # Returns the child components of type ComponentType.  * To get all child components use `GetComponents(component)`.  * To get a single component use `GetComponent(some_component)[0]`.
      GetComponents<native><final><public>(ComponentType: subtype(component))<transacts>: []ComponentType

      @experimental
      # Returns the child entities belonging to this entity which are accessible from the calling context.  * This method only gets the direct entity children. To query multiple levels down the entity structure use    the Find* query methods instead.
      GetEntities<native><final><public>()<transacts>: []entity

      @experimental
      # Returns the parent entity of this entity.  * The parent entity controls the lifetime of its child entities and components. When an entity    is removed from the scene, all its child entities and components will be removed as well.  * Some entities may choose to re-parent child entities before being disposed For example,    a vehicle might drop an attached wheel vs. having the wheel entity be removed with the vehicle.  * Method fails if there is currently no parent entity.
      GetParent<native><final><public>()<transacts><decides>: entity

      @experimental
      # Succeeds if the entity has been disposed by the `Dispose` method. Disposed entities cannot be added back to the scene.
      IsDisposed<native><final><public>()<transacts><decides>: void

      @experimental
      # Removes this entity from its parent. This is used to remove entities from the scene temporarily.  * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.  * Entity can be added back later by using `NewParent.AddEntities`.  * If this entity is no longer needed then consider using `Dispose` instead of `RemoveFromParent`.
      RemoveFromParent<native><final><public>(): void
    }

    @experimental
    # Reference type to editor defined prefab. Only generated digest code should reference this type.
    entity_prefab<native><public> := class<computes><epic_internal> {}

    @experimental
    # Used to subscribe a callback to a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventuallyclean up your subscription and your callback will stop being invoked.
    execution_subscribable<native><public> := class<epic_internal>(subscribable(float)) {
      @experimental
      # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that haspassed between the last update and the current update.
      Subscribe<native><override>(Callback: type { __(: float): void })<transacts>: cancelable
    }

    @experimental
    # A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
    float_range<native><public> := struct<concrete> {
      @editable
      Maximum<native><public>: float = external {}

      Minimum<native><public>: float = external {}
    }

    @experimental
    # Base class for light components in the SceneGraph.Dependencies:  * `transform_component` on the entity positions the light.Examples of components implementing `light_component`:  * `directional_light_component`  * `point_light_component`  * `rect_light_component`  * `spot_light_component`
    light_component<native><public> := class<abstract><epic_internal>(component) {
      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void

      @experimental
      # If the light affects global illumination, when ray-traced global illumination is enabled.
      var AffectGlobalIllumination<public>: logic = external {}

      @experimental
      # If the light affects objects in reflections, when ray-traced reflection is enabled.
      var AffectReflection<public>: logic = external {}

      @experimental
      # If the light casts high quality shadows, such that hair-strands are self-shadowing. When this option is enabled, there is an extra GPU cost for this light.
      var CastDeepShadows<public>: logic = external {}

      @experimental
      # If the light casts any shadows.
      var CastShadows<public>: logic = external {}

      @experimental
      # If the light casts shadows on volumetric fog. Disabling this can save GPU time.
      var CastVolumetricShadow<public>: logic = external {}

      @experimental
      # The total energy the light emits in candela. The renderer clamps between 0.0 and 20.0.
      var Intensity<public>: float = external {}
    }

    @experimental
    # Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapesin the world such as:  * foliage and terrain decorations  * movers (for example, doors and lifts)  * procedurally created buildingsDependencies:  * `transform_component` on the entity positions the mesh.
    mesh_component<native><public> := class(component, enableable) {
      @experimental
      # Disables rendering of this mesh.
      Disable<native><override>(): void

      @experimental
      # Enables rendering of this mesh.
      Enable<native><override>(): void

      @experimental
      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      @experimental
      # A material to be applied to this mesh. If this is set to `false` the base material on the mesh asset will be used.
      var Material<native><public>: ?material = external {}

      @editable
      @experimental
      # The `mesh` to be rendered by this `mesh_component`.
      var Mesh<native><public>: mesh = external {}
    }

    @experimental
    overlap_hit<native><public> := struct<epic_internal> {
      Component<native><public>: ?component = external {}
    }

    @experimental
    overlap_hit_container<native><public> := struct<epic_internal> {
      Hits<native><public>: []overlap_hit
    }

    @experimental
    # Constrains the transform of this entity so it is always offset relatively from its parent entity.Any changes made to the parent entity's `transform_component` will automatically cause this entity to change too.Dependencies:  * `transform_component` on the entity provides the world transform to be constrained.
    parent_constraint_component<native><public> := class(component) {
      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void
    }

    @experimental
    # Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate whilethe `particle_system_component` is in the scene.Dependencies:  * `transform_component` on the entity positions the `particle_system`.
    particle_system_component<native><public> := class<final>(component, enableable) {
      @editable
      @experimental
      # Controls if the `particle_system_component` should start enabled.
      AutoEnable<native><public>: logic = external {}

      @experimental
      # Disables the simulation and rendering of this `particle_system`.
      Disable<native><override>(): void

      @experimental
      # Enables the simulation and rendering of this `particle_system`.
      Enable<native><override>(): void

      @experimental
      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<override>()<transacts><decides>: void = external {}

      OnAddedToScene<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      OnUninitializing<native><override>(): void

      @editable
      # Controls if the `particle_system_component` should run a simulation preview in UEFN. This isseparate from `AutoEnable` so users can control what starts in the game separately from the editor.
      PreviewInEditor<native><public>: logic = external {}

      @editable
      @experimental
      # The `particle_system` to be created by this component.
      var ParticleSystem<native><public>: particle_system = external {}
    }

    @experimental
    # A `point_light_component` emits light equally in all directions from a single point in space.
    point_light_component<native><public> := class<final>(light_component) {}

    @experimental
    # A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use theseto simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lightingfixtures, or wall sconces.
    rect_light_component<native><public> := class<final>(light_component) {
      @experimental
      # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.This clamping of the light's influence is not physically correct but very important for performance. Larger lights cost more. Clamped between 8.0 and 16384.0.
      var AttenuationRadius<public>: float = external {}

      @experimental
      # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
      var BarnDoorAngle<public>: float = external {}

      @experimental
      # The length of the barn door attached to the light source rect. Clamped to a minimum of 0.0 cm.
      var BarnDoorLength<public>: float = external {}

      @experimental
      # The height of the light source rect. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
      var SourceHeight<public>: float = external {}

      @experimental
      # The width of the light source rect. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
      var SourceWidth<public>: float = external {}
    }

    @experimental
    # Base class for all three-dimensional shapes.
    shape3<native><public> := class<epic_internal> {}

    @experimental
    # A sphere in three-dimensional space.
    sphere3<native><public> := class<final><concrete>(convex_volume3) {
      # Center point of the sphere.
      Center<native><public>: vector3 = external {}

      # Radius of the sphere.
      Radius<native><public>: float = external {}
    }

    @experimental
    # A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngle`and `OuterConeAngle`. Within the `InnerConeAngle` the light achieves full brightness. As you go from the extent of the inner radius to theextents of the `OuterConeAngle` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc ofillumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
    spot_light_component<native><public> := class<final>(light_component) {
      @experimental
      # The light’s inner cone shaped angle in degrees. Clamped between 1.0 and 80.00.
      var InnerConeAngle<public>: float = external {}

      @experimental
      # The light's 'outer cone shaped angle in degrees. Clamped between 1.0 and 80.00.
      var OuterConeAngle<public>: float = external {}
    }

    @experimental
    # Used to add tags to an entity. Tagged entities can then be queried using `entity.FindEntitiesWithTag` and `entity.FindParentEntitiesWithTag`.  * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
    tag_component<native><public> := class<final>(component) {
      # Adds a tag to this component.
      AddTag<native><public>(TagToAdd: tag)<transacts>: void

      # Returns the tags associated with this component. These may be specified in the editor.
      GetTags<native><public>()<transacts>: tag_view

      OnAddedToScene<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      # Removes a tag from this component. Returns `true` if the tag was present.
      RemoveTag<native><public>(TagToRemove: tag)<transacts>: logic
    }

    @experimental
    # Used to render a string at the location of this entity.Dependencies:  * `transform_component` on the entity positions the `text_display_component`.
    text_display_component<native><public> := class<final>(component, enableable) {
      # Disable this object.
      Disable<native><override>(): void

      # Enable this object.
      Enable<native><override>(): void

      # Succeeds if the component is enabled, fails if it is disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToScene<native><override>(): void

      OnBeginSimulation<native><override>(): void

      OnEndSimulation<native><override>(): void

      OnInitialized<native><override>(): void

      OnRemovingFromScene<native><override>(): void

      @editable
      # The color with which to display the text.
      var Color<native><public>: color = external {}

      @experimental
      @editable
      # Text to be displayed on the entity.
      var Text<native><public>: string = external {}
    }

    @experimental
    # Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run codebefore or after the physics system has updated your object, allowing you to affect or react to these updates.
    tick_events<native><public> := class<epic_internal> {
      # Subscribe callbacks to `PostPhysics` to run your code after the physics system has updated your object this frame.
      PostPhysics<native><public>: execution_subscribable = external {}

      # Subscribe callbacks to `PrePhysics` to run your code before the physics system has updated your object this frame.
      PrePhysics<native><public>: execution_subscribable = external {}
    }

    @experimental
    trace_hit<native><public> := struct<epic_internal> {
      # The component that we was hit by the traced component
      HitComponent<native><public>: ?component = external {}

      # The face normal at the ContactLocation. For a face contact this is the same as ContactNormal, but for edge and vertex contacts this will be the most opposing face sharing that edge or vertex
      HitFaceNormal<native><public>: vector3 = external {}

      # The normal at which the TracedComponent touched the HitComponent
      HitNormal<native><public>: vector3 = external {}

      # The point at which the TracedComponent touched the HitComponent
      HitPosition<native><public>: vector3 = external {}

      # The collision_channel_response based on the trace and HitComponent collision_channel and collision_responses
      HitResponse<native><public>: collision_channel_response = external {}

      # The distance traveled by the traced object when it hit the HitComponent
      TraceHitDistance<native><public>: float = external {}

      # The position of the traced object when it hit the HitComponent
      TraceHitPosition<native><public>: vector3 = external {}
    }

    @experimental
    trace_hit_container<native><public> := struct<epic_internal> {
      Hits<native><public>: []trace_hit
    }

    @experimental
    # Stores the world transform for an entity, which is used to position the entity.  * If you wish for an entity to update its transform when its parent entity transform changes then    you must also add a `parent_constraint_component` to the entity.
    transform_component<native><public> := class<final>(component) {
      @experimental
      # Returns the world transform of the entity.
      GetTransform<native><public>()<transacts>: transform

      OnInitialized<native><override>(): void

      OnUninitializing<native><override>(): void

      @experimental
      # Sets the world transform of the entity.
      SetTransform<native><public>(NewTransform: transform): void

      @editable
      @experimental
      # The value of `InitialRelativeTransform` is used when spawning an entity into the scene.  * When spawning an entity with a `transform_component`, the entity is offset by `InitialRelativeOffset` from the new parent entity's transform.  * When spawning an entity with a `transform_component` as a child of the simulation entity the entity is offset by `InitialRelativeOffset` from the simulation entity's transform.  * When spawning a prefab each sub-entity with a `transform_component` is offset by `InitialRelativeTransform` from its parent entities transform.
      var InitialRelativeTransform<native><public>: transform = external {}
    }

    @experimental
    # Base class for all three-dimensional volumes.
    volume3<native><public> := class<epic_internal>(shape3) {}
  }

  # Stably sort `Array` using `Less` where `Less` succeeding indicates `Left` should precede `Right`
  SortBy<native><public>(Array: []t, Less: type { __(: t, : t)<computes><decides>: void } where t: type)<computes>: []t

  using { /Verse.org/Native }
  # Module import path: /UnrealEngine.com/Temporary/SpatialMath
  SpatialMath<public> := module {
    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyLocalRotationY<public>(AngleRadians: float)<transacts>: rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyLocalRotationZ<public>(AngleRadians: float)<transacts>: rotation = external {}

    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyPitch<native><public>(PitchUpRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyRoll<native><public>(RollClockwiseRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationX<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationY<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyWorldRotationZ<native><public>(AngleRadians: float)<transacts>: rotation

    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: rotation).ApplyYaw<native><public>(YawRightRadians: float)<transacts>: rotation

    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation: rotation).RotateBy<native><public>(AdditionalRotation: rotation)<transacts>: rotation

    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation: rotation).UnrotateBy<native><public>(RotationToRemove: rotation)<transacts>: rotation

    # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation: rotation).GetAngle<native><public>()<computes><reads>: float

    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
    (Rotation: rotation).GetAxis<native><public>()<computes><reads>: vector3

    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
    (Rotation: rotation).GetLocalForward<public>()<transacts>: vector3 = external {}

    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
    (Rotation: rotation).GetLocalRight<public>()<transacts>: vector3 = external {}

    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
    (Rotation: rotation).GetLocalUp<public>()<transacts>: vector3 = external {}

    # Makes an `[]float` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation: rotation).GetYawPitchRollDegrees<native><public>()<computes><reads>: []float

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation: rotation).Invert<native><public>()<transacts>: rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation: rotation).IsFinite<native><public>()<converges><decides>: rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation: rotation).RotateVector<native><public>(Vector: vector3)<transacts>: vector3

    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation: rotation).UnrotateVector<native><public>(Vector: vector3)<transacts>: vector3

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: vector2).IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: vector2).IsFinite<public>()<computes><decides>: vector2 = external {}

    # Returns the length of `V`.
    (V: vector2).Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: vector2).LengthSquared<public>()<computes><reads>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: vector2).MakeUnitVector<native><public>()<computes><decides><reads>: vector2

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: vector3).IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: vector3).IsFinite<public>()<computes><decides>: vector3 = external {}

    # Returns the length of `V`.
    (V: vector3).Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: vector3).LengthSquared<public>()<computes>: float = external {}

    # Returns the squared length of `V` as if `V.Z = 0.0`.
    (V: vector3).LengthSquaredXY<public>()<computes><reads>: float = external {}

    # Returns the length of `V` as if `V.Z = 0.0`.
    (V: vector3).LengthXY<public>()<computes><reads>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: vector3).MakeUnitVector<native><public>()<computes><decides><reads>: vector3

    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    AngularDistance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

    # Returns the cross product of `V1` and `V2`.
    CrossProduct<native><public>(V1: vector3, V2: vector3)<computes><reads>: vector3

    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees: float)<computes><reads>: float = external {}

    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
    DistanceSquaredXY<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
    DistanceXY<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    DotProduct<public>(V1: vector2i, V2: vector2i)<computes>: int = external {}

    # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
    # Fails if any component of `V1` does not equal the corresponding component of `V2`.
    Equals<public>(V1: vector2i, V2: vector2i)<computes><decides>: vector2i = external {}

    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>: rotation

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1: vector2, V2: vector2, AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1: vector3, V2: vector3, AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From: vector2, To: vector2, Parameter: float)<computes><reads>: vector2 = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From: vector3, To: vector3, Parameter: float)<computes><reads>: vector3 = external {}

    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    MakeComponentWiseDeltaRotation<native><public>(RotationA: rotation, RotationB: rotation)<transacts>: rotation

    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    MakeRotation<native><public>(Axis: vector3, AngleRadians: float)<converges><reads>: rotation

    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    MakeRotationFromYawPitchRollDegrees<native><public>(
      YawRightDegrees: float,
      PitchUpDegrees: float,
      RollClockwiseDegrees: float
    )<converges><reads>: rotation

    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialRotation: rotation, FinalRotation: rotation)<transacts>: rotation

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector: vector3, FinalVector: vector3)<transacts>: rotation

    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians: float)<computes><reads>: float = external {}

    # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction: vector2, SurfaceNormal: vector2)<computes><decides><reads>: vector2

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction: vector3, SurfaceNormal: vector3)<computes><decides><reads>: vector3

    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    Slerp<native><public>(
      InitialRotation: rotation,
      FinalRotation: rotation,
      Parameter: float
    )<transacts><decides>: rotation

    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
    ToString<native><public>(Rotation: rotation)<computes><reads>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector2)<computes><reads>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector2i)<computes>: string

    # Makes a `string` representation of `V`.
    ToString<native><public>(V: vector3)<computes><reads>: string

    # Makes a `vector2` by converting the components of `V` to `float`s.
    ToVector2<public>(V: vector2i)<transacts>: vector2 = external {}

    # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
    ToVector2i<public>(V: vector2)<computes><decides><reads>: vector2i = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    TransformVector<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    TransformVectorNoScale<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

    # Makes a `vector2` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: float, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: float, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left: int, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left: vector2i, Right: int)<computes>: vector2i = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

    # Makes a `vector2` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand: vector3)<computes>: vector3 = external {}

    @editable
    @import_as("/Script/EpicGamesTemporary.FVerseRotation")
    rotation<native><public> := struct<concrete> {}

    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes> {
      @editable
      # The rotation of this `transform`.
      Rotation<native><public>: rotation = external {}

      @editable
      # The scale of this `transform`.
      Scale<native><public>: vector3 = external {}

      @editable
      # The location of this `transform`.
      Translation<native><public>: vector3 = external {}
    }

    # 2-dimensional vector with `float` components.
    vector2<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}
    }

    # 2-dimensional vector with `int` components.
    vector2i<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: int = external {}

      @editable
      Y<native><public>: int = external {}
    }

    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}

      @editable
      Z<native><public>: float = external {}
    }
  }

  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Assets }
  using { /Verse.org/Colors }
  using { /Verse.org/Simulation }
  # Module import path: /UnrealEngine.com/Temporary/UI
  UI<public> := module {
    # Returns the `player_ui` vk_component associated with `Player`.
    # Fails if there is no `player_ui` associated with `Player`.
    GetPlayerUI<native><public>(Player: player)<transacts><decides>: player_ui

    # Make a canvas slot for fixed position widget.
    # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
    # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
    # The widget is not anchored and will not move if the parent is resized.
    # The Anchors is set to zero.
    MakeCanvasSlot<native><public>(Widget: widget, Position: vector2, ?Size: vector2 = external {}, ?ZOrder: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}, ?Alignment: vector2 = external {})<computes>: canvas_slot

    # The anchors of a `widget` determine its the position and sizing relative to its parent.
    # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
    anchors<native><public> := struct {
      # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
      Maximum<native><public>: vector2 = external {}

      # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
      Minimum<native><public>: vector2 = external {}
    }

    # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
    button<native><public> := class<final>(widget) {
      # Subscribable event that fires when the button is clicked.
      OnClick<public>(): listenable(widget_message) = external {}

      # Sets the child widget slot.
      SetWidget<native><public>(InSlot: button_slot): void

      # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
      Slot<native><public>: button_slot
    }

    # Slot for button widget.
    button_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
    canvas<native><public> := class<final>(widget) {
      # Adds a new child slot to the canvas.
      AddWidget<native><public>(Slot: canvas_slot): void

      # Removes a slot containing the given widget.
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []canvas_slot = external {}
    }

    # Slot for a canvas widget.
    canvas_slot<native><public> := struct {
      # Alignment is the pivot/origin point of the widget.
      # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
      Alignment<native><public>: vector2 = external {}

      # The border for the margin and how the widget is resized with its parent.
      # Values are defined between 0.0 and 1.0.
      Anchors<native><public>: anchors = external {}

      # The offset that defined the size and position of the widget.
      # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X, the Offsets.Bottom represent the distance in pixel from the Anchors Maximum.Y, effectively controlling the desired widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position and Offsets.Right and Offset.Bottom represent the widget size.
      Offsets<native><public>: margin = external {}

      # When true we use the widget's desired size. The size calculated by the Offsets is ignored.
      SizeToContent<native><public>: logic = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget

      # Z Order of this slot relative to other slots in this canvas panel.
      # Higher values are rendered last (and so they will appear to be on top)
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # A solid color widget.
    color_block<native><public> := class<final>(widget) {
      # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
      DefaultColor<native><public>: color = external {}

      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
      DefaultOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the widget's color.
      GetColor<native><public>(): color

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the widget's opacity.
      GetOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the widget's color.
      SetColor<native><public>(InColor: color): void

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the widgets's opacity.
      SetOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # `widget` horizontal alignment mode.
    horizontal_alignment<native><public> := enum {
      # Center `widget` horizontally within the slot.
      Center

      # `widget` fills the slot horizontally.
      Fill

      # Align `widget` to the left of the slot.
      Left

      # Align `widget` to the right of the slot.
      Right
    }

    # Tiling options values
    image_tiling<native><public> := enum {
      # Repeat/Wrap the image to fill the available space.
      Repeat

      # Stretch the image to fit the available space.
      Stretch
    }

    # Specifies the gap outside each edge separating a `widget` from its neighbors.
    # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
    margin<native><public> := struct {
      # The bottom edge spacing.
      Bottom<native><public>: float = external {}

      # The left edge spacing.
      Left<native><public>: float = external {}

      # The right edge spacing.
      Right<native><public>: float = external {}

      # The top edge spacing.
      Top<native><public>: float = external {}
    }

    # Used by`widget` orientation modes.
    orientation<native><public> := enum {
      # Orient `widget`s from left to right.
      Horizontal

      # Orient `widget`s from top to bottom.
      Vertical
    }

    # Overlay is a container consisting of widgets stacked on top of each other.
    overlay<native><public> := class<final>(widget) {
      # Add a new child slot to the overlay. Slots are added at the end.
      AddWidget<native><public>(Slot: overlay_slot): void

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []overlay_slot = external {}
    }

    # Slot for an overlay widget
    overlay_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # The main interface for adding and removing `widget`s to a player's UI.
    player_ui<native><public> := class<final><epic_internal> {
      # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
      AddWidget<native><public>(Widget: widget): void

      # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
      AddWidget<native><public>(Widget: widget, Slot: player_ui_slot): void

      # Removes `Widget` from this `player_ui`.
      RemoveWidget<native><public>(Widget: widget): void
    }

    # `widget` creation configuration options.
    player_ui_slot<native><public> := struct {
      # Controls `widget` input event consumption.
      InputMode<native><public>: ui_input_mode = external {}

      # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # Stack box is a container of a list of widgets stacked either vertically or horizontally.
    stack_box<native><public> := class<final>(widget) {
      # Add a new child slot to the stack box. Slots are added at the end.
      AddWidget<native><public>(Slot: stack_box_slot): void

      # The orientation of the stack box. Either stack widgets horizontal or vertical.
      Orientation<native><public>: orientation

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []stack_box_slot = external {}
    }

    # Slot for a stack_box widget
    stack_box_slot<native><public> := struct {
      # The available space will be distributed proportionally.
      # If not set, the slot will use the desired size of the widget.
      Distribution<native><public>: ?float = external {}

      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Base widget for text widget.
    text_base<native><public> := class<abstract>(widget) {
      # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
      DefaultJustification<native><public>: text_justification = external {}

      # The policy that determine what happens when the text is longer than its allowed length.
      # Used only during initialization of the widget and not modified by SetOverflowPolicy.
      DefaultOverflowPolicy<native><public>: text_overflow_policy = external {}

      # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
      DefaultText<native><localizes><public>: message = external {}

      # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
      DefaultTextColor<native><public>: color = external {}

      # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
      DefaultTextOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the text justification in the widget.
      GetJustification<native><public>(): text_justification

      # Gets the policy that determine what happens when the text is longer than its allowed length.
      GetOverflowPolicy<native><public>(): text_overflow_policy

      # Gets the text currently in the widget.
      GetText<native><public>(): string

      # Gets the color of the displayed text.
      GetTextColor<native><public>(): color

      # Gets the opacity of the displayed text.
      GetTextOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the text justification in the widget.
      SetJustification<native><public>(InJustification: text_justification): void

      # Sets the policy that determine what happens when the text is longer than its allowed length.
      SetOverflowPolicy<native><public>(InOverflowPolicy: text_overflow_policy): void

      # Sets the text displayed in the widget.
      SetText<native><public>(InText: message): void

      # Sets the color of the displayed text.
      SetTextColor<native><public>(InColor: color): void

      # Sets the opacity of the displayed text.
      SetTextOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # Text justification values:
    #   Left: Justify the text logically to the left based on current culture.
    #   Center: Justify the text in the center.
    #   Right: Justify the text logically to the right based on current culture.
    # The Left and Right value will flip when the local culture is right-to-left.
    text_justification<native><public> := enum {
      Center

      InvariantLeft

      InvariantRight

      Left

      Right
    }

    # Text overflow policy values:
    #   Clip: Overflowing text will be clipped.
    #   Ellipsis: Overflowing text will be replaced with an ellipsis.
    text_overflow_policy<native><public> := enum {
      Clip

      Ellipsis
    }

    # A widget to display a texture.
    texture_block<native><public> := class(widget) {
      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The horizontal tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultHorizontalTiling<native><public>: image_tiling = external {}

      # The image to render. Used only during initialization of the widget and not modified by SetImage.
      DefaultImage<native><public>: texture

      # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
      DefaultTint<native><public>: color = external {}

      # The vertical tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultVerticalTiling<native><public>: image_tiling = external {}

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the image to render.
      GetImage<native><public>(): texture

      # Gets the tiling option.
      GetTiling<native><public>(): tuple(image_tiling, image_tiling)

      # Gets the tint applied to the image.
      GetTint<native><public>(): color

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the image to render.
      SetImage<native><public>(InImage: texture): void

      # Sets the tiling option when the image is smaller than the allocated size.
      SetTiling<native><public>(InHorizontalTiling: image_tiling, InVerticalTiling: image_tiling): void

      # Sets the tint applied to the image.
      SetTint<native><public>(InColor: color): void
    }

    # `widget` input consumption mode.
    ui_input_mode<native><public> := enum {
      # `widget` consumes all inputs
      All

      # `widget` does not consume any input.
      None
    }

    # `widget` vertical alignment mode.
    vertical_alignment<native><public> := enum {
      # Align `widget` to the bottom of the slot.
      Bottom

      # Center `widget` vertically within the slot.
      Center

      # `widget` fills the slot vertically.
      Fill

      # Align `widget` to the top of the slot.
      Top
    }

    # Base class for all UI elements drawn on the `player`'s screen.
    widget<native><public> := class<abstract><unique><epic_internal> {
      # Returns the `widget`'s parent `widget`.
      # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
      GetParentWidget<native><public>()<transacts><decides>: widget

      # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
      # Fails if this `widget` is not in the `player_ui`.
      GetRootWidget<native><public>()<transacts><decides>: widget

      # Returns the current `widget_visibility` state.
      GetVisibility<native><public>(): widget_visibility

      # `true` if this `widget` can be modified interactively by the player.
      IsEnabled<native><public>(): logic

      # Enables or disables whether the `player` can interact with this `widget`.
      SetEnabled<native><public>(InIsEnabled: logic): void

      # Shows or hides the `widget` without removing itself from the containing `player_ui`.
      # See `widget_visibility` for details.
      SetVisibility<native><public>(InVisibility: widget_visibility): void
    }

    # Parameters for `event`s signalled by a `widget`.
    widget_message<native><public> := struct {
      # The `player` that triggered the `event`.
      Player<native><public>: player

      # The `widget` that triggered the `event`.
      Source<native><public>: widget
    }

    # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
    widget_visibility<native><public> := enum {
      # The `widget` is invisible and does not occupy layout space.
      Collapsed

      # The `widget` is invisible and occupies layout space.
      Hidden

      # The `widget` is visible and occupies layout space.
      Visible
    }
  }
}