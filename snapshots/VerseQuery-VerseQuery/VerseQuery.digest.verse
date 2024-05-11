using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Axis aligned box volume
axis_aligned_box3<native><epic_internal> := class<final><concrete>(convex_hull3):
    Center<native><public>:vector3 = external {}

    Extent<native><public>:vector3 = external {}

    DebugDraw<native><override>()<computes><reads>:void

overlap_result<native><epic_internal> := struct:
    CollisionComponent<native><public>:?collision_component

    Entities<native><public>:[]entity

collision_override<native><epic_internal> := class<abstract><epic_internal>:


no_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):


volume_collision_override<native><epic_internal> := class<concrete><final><epic_internal>(collision_override):
    CollisionVolume<native><public>:convex_hull3 = external {}

collision_component<native><epic_internal> := class<final>(component, enableable):
    Enable<native><override>():void

    Disable<native><override>():void

    IsEnabled<native><override>()<transacts><decides>:void

    BeginOverlap<native><final><public>:listenable(overlap_result) = external {}

    EndOverlap<native><final><public>:listenable(overlap_result) = external {}

    @editable
    var SendOverlapEvents<native><public>:logic = external {}

    var CollisionOverride<public>:collision_override = external {}

component_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:component

null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:component

convex_hull3<native><epic_internal> := class<epic_internal>(volume3):
    Contains<native><public>(Point:vector3)<computes><decides><reads>:void

entity_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
    NextValue<native_callable><public>()<transacts><decides>:entity

null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
    NextValue<native><override>()<transacts><decides>:entity

@hide_in_editor
playspace_association_component<native><epic_internal> := class<epic_internal>(component):


shape2<native><epic_internal> := class<epic_internal>:


shape3<native><epic_internal> := class<epic_internal>:
    DebugDraw<native><public>()<computes><reads>:void

sphere3<native><epic_internal> := class<final><concrete>(convex_hull3):
    Center<native><public>:vector3 = external {}

    Radius<native><public>:float = external {}

    DebugDraw<native><override>()<computes><reads>:void

# Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
tag_component<native><epic_internal> := class<final>(component):
    # Notification called then the component owner entity was added to a Scene
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from Scene
    OnRemovingFromScene<native><override>():void

    # Get the tags associated with this component. These may be specified in the editor.
    GetTags<native><epic_internal>()<transacts>:tag_view

    # Add a single tag to this component.
    AddTag<native><epic_internal>(TagToAdd:tag)<transacts>:void

    # Remove a single tag from this component.
    RemoveTag<native><epic_internal>(TagToRemove:tag)<transacts>:logic

(InEntity:entity).FindEntities<native><epic_internal>(EntityType:subtype(entity))<transacts>:[]EntityType

(InEntity:entity).FindEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<transacts>:[]entity

(InEntity:entity).FindEntitiesWithTag<native><epic_internal>(Tag:tag)<transacts>:[]entity

(InEntity:entity).FindComponents<native><epic_internal>(ComponentType:subtype(component))<transacts>:[]ComponentType

(InEntity:entity).FindEntitiesInside<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

(InEntity:entity).FindEntitiesOverlapping<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

(InEntity:entity).FindEntitiesOriginInside<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

(InEntity:entity).FindParentEntities<native><epic_internal>(EntityType:subtype(entity))<transacts>:[]EntityType

(InEntity:entity).FindParentEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<transacts>:[]entity

(InEntity:entity).FindParentEntitiesWithTag<native><epic_internal>(Tag:tag)<transacts>:[]entity

(InEntity:entity).FindParentComponents<native><epic_internal>(ComponentType:subtype(component))<transacts>:[]ComponentType

(InEntity:entity).FindParentEntitiesInside<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

(InEntity:entity).FindParentEntitiesOverlapping<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

(InEntity:entity).FindParentEntitiesOriginInside<native><epic_internal>(Shape:convex_hull3)<transacts>:[]entity

volume3<native><epic_internal> := class<epic_internal>(shape3):
