using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/VerseQuery
VerseQuery<public> := module:
    component_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
        NextValue<native_callable><public>()<transacts><decides>:component

    null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:component

    slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:component

    entity_query_iterator_interface<native><epic_internal> := interface<epic_internal>:
        NextValue<native_callable><public>()<transacts><decides>:entity

    null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface):
        NextValue<native><override>()<transacts><decides>:entity

    @import_as("/Script/VerseQuery.UEntityQueryManager")
    entity_query_manager<native><epic_internal> := class:


    @hide_in_editor
    playspace_association_component<native><epic_internal> := class(component):


    (InEntity:entity).FindChildEntities<native><epic_internal>(EntityType:subtype(entity))<varies>:entity_query_iterator_interface

    (InEntity:entity).FindChildEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<varies>:entity_query_iterator_interface

    (InEntity:entity).FindChildEntitiesWithTag<native><epic_internal>(Tag:tag)<varies>:entity_query_iterator_interface

    (InEntity:entity).FindChildComponents<native><epic_internal>(ComponentType:subtype(component))<varies>:component_query_iterator_interface

    (InEntity:entity).FindChildEntitiesInside<native><epic_internal>(Shape:volume3):entity_query_iterator_interface

    (InEntity:entity).FindChildEntitiesOverlapping<native><epic_internal>(Shape:shape3):entity_query_iterator_interface

    (InEntity:entity).FindChildEntitiesOriginInside<native><epic_internal>(Shape:volume3):entity_query_iterator_interface

    (InEntity:entity).FindParentEntities<native><epic_internal>(EntityType:subtype(entity))<varies>:entity_query_iterator_interface

    (InEntity:entity).FindParentEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<varies>:entity_query_iterator_interface

    (InEntity:entity).FindParentEntitiesWithTag<native><epic_internal>(Tag:tag)<varies>:entity_query_iterator_interface

    (InEntity:entity).FindParentComponents<native><epic_internal>(ComponentType:subtype(component))<varies>:component_query_iterator_interface

    (InEntity:entity).FindParentEntitiesInside<native><epic_internal>(Shape:volume3):entity_query_iterator_interface

    (InEntity:entity).FindParentEntitiesOverlapping<native><epic_internal>(Shape:shape3):entity_query_iterator_interface

    (InEntity:entity).FindParentEntitiesOriginInside<native><epic_internal>(Shape:volume3):entity_query_iterator_interface

    # Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
    tag_component<native><epic_internal> := class<final>(tag_component_base):
        # Notification called then the component owner entity was added to a Scene
        OnAddedToScene<native><override>():void

        # Notification called when the component owner entity is about to be removed from Scene
        OnRemovingFromScene<native><override>():void

        # Set the tags associated with this component.
        SetTags<native><override>(InTags:tag_container):void

        # Add a single tag to this component.
        AddTag<native><override>(TagToAdd:tag):void

        # Remove a single tag from this component.
        RemoveTag<native><override>(TagToRemove:tag):logic

    tag_component_base<native><epic_internal> := class<abstract>(component):
        # Notification called then the component owner entity was added to a Scene
        OnAddedToScene<native><override>():void

        # Notification called when the component owner entity is about to be removed from Scene
        OnRemovingFromScene<native><override>():void

        # Get the tags associated with this component. These may be specified in the editor.
        GetTags<native><epic_internal>():tag_container

        # Set the tags associated with this component.
        SetTags<native><epic_internal>(InTags:tag_container):void

        # Add a single tag to this component.
        AddTag<native><epic_internal>(TagToAdd:tag):void

        # Remove a single tag from this component.
        RemoveTag<native><epic_internal>(TagToRemove:tag):logic

    # Axis aligned box volume
    axis_aligned_box3<native><epic_internal> := class<final><concrete>(volume3):
        Origin<native><public>:vector3 = external {}

        Extent<native><public>:vector3 = external {}

    shape2<native><epic_internal> := class<epic_internal>:


    shape3<native><epic_internal> := class<epic_internal>:


    volume3<native><epic_internal> := class<epic_internal>(shape3):
