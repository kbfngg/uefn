using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
@experimental
# Axis aligned box volume.
axis_aligned_box3<native><public> := class<final><concrete>(convex_volume3):
    # Center point of the box.
    Center<native><public>:vector3 = external {}

    # Extent of the box.
    Extent<native><public>:vector3 = external {}

@experimental
collision_channel_response<native><public> := enum:
    Ignore
    Overlap
    Block

@experimental
collision_channel<native><public> := struct<concrete><computes><epic_internal>:


@experimental
collision_channel_responses<native><public> := class<concrete><epic_internal>:
    SetChannelResponse<native><epic_internal>(Channel:collision_channel, Response:collision_channel_response):void

    GetChannelResponse<native><epic_internal>(Channel:collision_channel):collision_channel_response

@experimental
collision_profile<native><public> := class<concrete><epic_internal>:
    GetName<native><public>():string

    SetName<native><public>(Name:string):void

    GetChannel<native><public>():collision_channel

    SetChannel<native><public>(Channel:collision_channel):void

    GetResponses<native><public>():collision_channel_responses

    SetResponses<native><public>(Responses:collision_channel_responses):void

@experimental
overlap_result<native><epic_internal> := struct<epic_internal>:
    ThisEntity<native><public>:?entity

    ThisComponent<native><public>:?component

    OtherEntity<native><public>:?entity

    OtherComponent<native><public>:?component

@experimental
collision_override<native><epic_internal> := class<epic_internal>:


@experimental
no_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):


@experimental
volume_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):
    CollisionVolume<native><public>:convex_volume3 = external {}

@experimental
# Used to make an entity collide with other scene objects, including preventing players and NPCs from passing through the entity.Overlap queries can only find entities with enabled `collision_components`.Dependencies:  * `transform_component` on the entity positions the `collision_component`.  * `mesh_component` on the entity provides the collision shape for the `collision_component`.
collision_component<native><public> := class<final>(component, enableable):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Sets up collision simulation for the entity.
    OnBeginSimulation<native><override>():void

    # Tears down collision simulation for the entity.
    OnEndSimulation<native><override>():void

    # Enables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
    Enable<native><override>():void

    # Disables the `collision_component`. Scene objects will pass through this entity if collision is disabled.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    var SendHitEvents<native><epic_internal>:logic = external {}

    # Event signaled when the component experiences a blocking hit.
    HitEvent<native><epic_internal>:listenable(hit_result) = external {}

    var SendOverlapEvents<native><epic_internal>:logic = external {}

    # Event signaled when something starts overlapping with the component.
    BeginOverlapEvent<native><epic_internal>:listenable(overlap_result) = external {}

    # Event signaled when something stops overlapping with the component.
    EndOverlapEvent<native><epic_internal>:listenable(overlap_result) = external {}

    SetCollisionProfile<native><epic_internal>(Profile:collision_profile):void

    GetCollisionProfile<native><epic_internal>():?collision_profile

    VisibilityChannelResponseOverride<native><epic_internal>:?collision_channel_response = external {}

    var CollisionOverride<epic_internal>:collision_override = external {}

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

@experimental
component_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:component

@experimental
null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

@experimental
slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

@experimental
# Base class for all convex volumes.
convex_volume3<native><public> := class<epic_internal>(volume3):
    # Determines if `Point` falls within the boundaries of this `convex_volume3`.
    Contains<native><public>(Point:vector3)<computes><decides><reads>:void

@experimental
entity_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:entity

@experimental
null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@experimental
entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@experimental
slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@hide_in_editor
@experimental
entity_query_manager_component<native><epic_internal> := class<epic_internal>(component):
    IsAllowedOnClient<override>():logic = external {}

# Module import path: /UnrealEngine.com/Temporary/SceneGraph/NamedCollisionChannels
NamedCollisionChannels<public> := module:
    @experimental
    WorldStatic<public>:collision_channel = external {}

    @experimental
    WorldDynamic<public>:collision_channel = external {}

    @experimental
    Pawn<public>:collision_channel = external {}

    @experimental
    Visibility<public>:collision_channel = external {}

    @experimental
    Camera<public>:collision_channel = external {}

    @experimental
    PhysicsBody<public>:collision_channel = external {}

    @experimental
    Vehicle<public>:collision_channel = external {}

    @experimental
    Destructible<public>:collision_channel = external {}

@experimental
collision_query_params<native><public> := struct<epic_internal>:
    # True to have the query return Overlapping hits
    DetectOverlapping<native><public>:logic = external {}

    # True to have the query return Blocking hits
    DetectBlocking<native><public>:logic = external {}

    # A set of components to ignore in the query
    IgnoredComponents<native><public>:[]collision_component = external {}

@experimental
trace_hit<native><public> := struct<epic_internal>:
    # The component that we was hit by the traced component
    HitComponent<native><public>:?component = external {}

    # The point at which the TracedComponent touched the HitComponent
    HitPosition<native><public>:vector3 = external {}

    # The normal at which the TracedComponent touched the HitComponent
    HitNormal<native><public>:vector3 = external {}

    # The face normal at the ContactLocation. For a face contact this is the same as ContactNormal, but for edge and vertex contacts this will be the most opposing face sharing that edge or vertex
    HitFaceNormal<native><public>:vector3 = external {}

    # The position of the traced object when it hit the HitComponent
    TraceHitPosition<native><public>:vector3 = external {}

    # The distance traveled by the traced object when it hit the HitComponent
    TraceHitDistance<native><public>:float = external {}

    # The collision_channel_response based on the trace and HitComponent collision_channel and collision_responses
    HitResponse<native><public>:collision_channel_response = external {}

@experimental
trace_hit_container<native><public> := struct<epic_internal>:
    Hits<native><public>:[]trace_hit

@experimental
overlap_hit<native><public> := struct<epic_internal>:
    Component<native><public>:?component = external {}

@experimental
overlap_hit_container<native><public> := struct<epic_internal>:
    Hits<native><public>:[]overlap_hit

@experimental
GetPhysicsSceneForEntity<native><epic_internal>(Entity:entity)<transacts><decides>:physics_scene_component

@experimental
(Entity:entity).GetPhysicsScene<epic_internal>()<transacts><decides>:physics_scene_component = external {}

@experimental
physics_scene_component<native><epic_internal> := class<final>(component):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    OnBeginSimulation<native><override>():void

    OnEndSimulation<native><override>():void

    # Trace a line through the scene and return all hits
    TraceLine<native><epic_internal>(StartPosition:vector3, EndPosition:vector3, TraceChannel:collision_channel, QueryParams:collision_query_params):trace_hit_container

    # Trace a shape through the scene and return all hits
    TraceShape<native><epic_internal>(Shape:convex_volume3, StartPosition:vector3, EndPosition:vector3, TraceChannel:collision_channel, QueryParams:collision_query_params):trace_hit_container

    # Trace a collision_component through the scene and return all hits
    TraceCollision<native><epic_internal>(Component:collision_component, StartPosition:vector3, EndPosition:vector3, Rotation:rotation):trace_hit_container

    # Find everything that overlaps a convex shape
    OverlapShape<native><epic_internal>(Shape:convex_volume3, Position:vector3, Rotation:rotation, TraceChannel:collision_channel, QueryParams:collision_query_params):overlap_hit_container

    # Find everything that overlaps a collision_component
    OverlapCollision<native><epic_internal>(Component:collision_component, Position:vector3, Rotation:rotation):overlap_hit_container

@experimental
# Base class for all two-dimensional shapes.
shape2<native><epic_internal> := class<epic_internal>:


@experimental
# Base class for all three-dimensional shapes.
shape3<native><public> := class<epic_internal>:


@experimental
# A sphere in three-dimensional space.
sphere3<native><public> := class<final><concrete>(convex_volume3):
    # Center point of the sphere.
    Center<native><public>:vector3 = external {}

    # Radius of the sphere.
    Radius<native><public>:float = external {}

@experimental
# Used to add tags to an entity. Tagged entities can then be queried using `entity.FindEntitiesWithTag` and `entity.FindParentEntitiesWithTag`.  * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
tag_component<native><public> := class<final>(component):
    IsAllowedOnClient<override>():logic = external {}

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Returns the tags associated with this component. These may be specified in the editor.
    GetTags<native><public>()<transacts>:tag_view

    # Adds a tag to this component.
    AddTag<native><public>(TagToAdd:tag)<transacts>:void

    # Removes a tag from this component. Returns `true` if the tag was present.
    RemoveTag<native><public>(TagToRemove:tag)<transacts>:logic

@experimental
# Finds all entities below and including `InEntity` of type `EntityType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntities<native><public>(EntityType:subtype(entity))<transacts>:[]EntityType

@experimental
# Finds all entities below and including `InEntity` containing a component of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntitiesWithComponent<native><public>(ComponentType:subtype(component))<transacts>:[]entity

@experimental
# Finds all entities below and including `InEntity` with `Tag` present in their `tag_component`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntitiesWithTag<native><public>(Tag:tag)<transacts>:[]entity

@experimental
# Finds all components attached to entities below and including `InEntity` of type `ComponentType`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindComponents<native><public>(ComponentType:subtype(component))<transacts>:[]ComponentType

@experimental
# Finds all entities below and including `InEntity` whose `collision_component` shape is inside `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntitiesInside<native><epic_internal>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Finds all entities below and including `InEntity` whose `collision_component` shape overlaps with `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntitiesOverlapping<native><public>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Finds all entities below and including `InEntity` whose `transform_component.Translation` is inside `Shape`.When querying from the simulation entity, the simulation entity itself is not included in the results.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindEntitiesOriginInside<native><public>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Finds all parent entities above `InEntity` of type `EntityType`.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindParentEntities<native><public>(EntityType:subtype(entity))<transacts>:[]EntityType

@experimental
# Finds all parent entities above `InEntity` containing a component of type `ComponentType`.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindParentEntitiesWithComponent<native><public>(ComponentType:subtype(component))<transacts>:[]entity

@experimental
# Finds all parent entities above `InEntity` with `Tag` present in their `tag_component`.The order of the returned entities is unspecified and subject to change.
(InEntity:entity).FindParentEntitiesWithTag<native><public>(Tag:tag)<transacts>:[]entity

@experimental
# Finds all components attached to parent entities above `InEntity` of type `ComponentType`.The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindParentComponents<native><public>(ComponentType:subtype(component))<transacts>:[]ComponentType

@experimental
# Finds all parent entities above `InEntity` whose `collision_component` shape is inside `Shape`.The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindParentEntitiesInside<native><epic_internal>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Finds all parent entities above `InEntity` whose `collision_component` shape overlaps with `Shape`.The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindParentEntitiesOverlapping<native><public>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Finds all parent entities above `InEntity` whose `transform_component.Translation` is inside `Shape`.The order of the returned components is unspecified and subject to change.
(InEntity:entity).FindParentEntitiesOriginInside<native><public>(Shape:convex_volume3)<transacts>:[]entity

@experimental
# Base class for all three-dimensional volumes.
volume3<native><public> := class<epic_internal>(shape3):
