using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/EntityFramework/Entity}
using {/Verse.org/Native}
# Module import path: /UnrealEngine.com/VerseQuery
VerseQuery<public> := module:
    @import_as("/Script/VerseQuery.UQueryIteratorBase")
    query_iterator_base<native><epic_internal> := class:


    query_iterator<native><epic_internal> := interface:
        IsValid<public>():logic

        Next<public>():?entity

    null_query_iterator<native><epic_internal> := class(query_iterator):
        IsValid<native><override>():logic

        Next<native><override>():?entity

    core_entity_query_iterator<native><epic_internal> := class(query_iterator, query_iterator_base):
        IsValid<native><override>():logic

        Next<native><override>():?entity

    @import_as("/Script/VerseQuery.UEntityQueryManager")
    entity_query_manager<native><epic_internal> := class:


    @hide_in_editor
    playspace_association_component<native><epic_internal> := class(component):


    (InEntity:entity).FindChildEntities<native><epic_internal>(EntityType:subtype(entity))<varies>:[]EntityType

    (InEntity:entity).FindChildEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<varies>:[]entity

    (InEntity:entity).FindChildEntitiesWithTag<native><epic_internal>(Tag:tag)<varies>:[]entity

    (InEntity:entity).FindChildEntitiesIn<native><epic_internal>(Shape:query_shape)<varies>:[]entity

    (InEntity:entity).FindChildComponents<native><epic_internal>(ComponentType:subtype(component))<varies>:[]ComponentType

    (InEntity:entity).FindParentEntities<native><epic_internal>(EntityType:subtype(entity))<varies>:[]EntityType

    (InEntity:entity).FindParentEntitiesWithComponent<native><epic_internal>(ComponentType:subtype(component))<varies>:[]entity

    (InEntity:entity).FindParentEntitiesWithTag<native><epic_internal>(Tag:tag)<varies>:[]entity

    (InEntity:entity).FindParentEntitiesIn<native><epic_internal>(Shape:query_shape)<varies>:[]entity

    (InEntity:entity).FindParentComponents<native><epic_internal>(ComponentType:subtype(component))<varies>:[]ComponentType

    # Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
    tag_component<native><epic_internal> := class<final>(tag_component_base):
        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Set the tags associated with this component.
        SetTags<native><override>(InTags:tag_container):void

        # Add a single tag to this component.
        AddTag<native><override>(TagToAdd:tag):void

        # Remove a single tag from this component.
        RemoveTag<native><override>(TagToRemove:tag):logic

    tag_component_base<native><epic_internal> := class<abstract>(component):
        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Get the tags associated with this component. These may be specified in the editor.
        GetTags<native><epic_internal>():tag_container

        # Set the tags associated with this component.
        SetTags<native><epic_internal>(InTags:tag_container):void

        # Add a single tag to this component.
        AddTag<native><epic_internal>(TagToAdd:tag):void

        # Remove a single tag from this component.
        RemoveTag<native><epic_internal>(TagToRemove:tag):logic

    # Abstract base representation of a shape. SHOULD EVENTUALLY BE REPALCED BY WHETEVER PHYSICS TYPES WE WANT TO EXPOSE
    query_shape<native><epic_internal> := class<abstract>:


    # Axis aligned box volume
    query_shape_box<native><epic_internal> := class<concrete>(query_shape):
        Origin<native><public>:vector3 = external {}

        Extent<native><public>:vector3 = external {}