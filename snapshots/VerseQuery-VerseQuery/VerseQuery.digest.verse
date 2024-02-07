using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/VerseEngine/Component}
using {/UnrealEngine.com/EntityFramework/Entity}
using {/Verse.org/Native}
# Module import path: /UnrealEngine.com/VerseQuery
VerseQuery<public> := module:
    @import_as("/Script/VerseQuery.UQueryIteratorBase")
    query_iterator_base<native><epic_internal> := class:


    query_iterator<native><epic_internal> := interface:
        IsValid<public>():logic

        Next<public>():?core_entity

    null_query_iterator<native><epic_internal> := class(query_iterator):
        IsValid<native><override>():logic

        Next<native><override>():?core_entity

    core_entity_query_iterator<native><epic_internal> := class(query_iterator, query_iterator_base):
        IsValid<native><override>():logic

        Next<native><override>():?core_entity

    @import_as("/Script/VerseQuery.UEntityQueryManager")
    query_manager<native><epic_internal> := class:


    (Entity:core_entity).GetQueryManager<native><epic_internal>():query_manager

    (Component:core_entity_component).GetQueryManager<native><epic_internal>():query_manager

    (Component:component).GetQueryManager<native><epic_internal>():query_manager

    # Helper component used to associate a core_entity with a playspace
    playspace_association_component<native><epic_internal> := class(core_entity_component):


    (QueryManager:query_manager).EntitiesOfTypeIterator<native><epic_internal>(EntityClass:subtype(core_entity))<varies>:query_iterator

    (QueryManager:query_manager).EntitiesWithComponentsIterator<native><epic_internal>(ComponentClass:subtype(core_entity))<varies>:query_iterator

    (QueryManager:query_manager).EntitiesOfType<native><epic_internal>(EntityClass:subtype(core_entity))<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesWithComponents<native><epic_internal>(ComponentClass:subtype(core_entity_component))<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesWithTags<native><epic_internal>(AllRequiredTags:[]tag, AnyRequiredTag:[]tag, DisallowedTags:[]tag)<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesWithinVolume<native><epic_internal>(Volume:query_volume)<varies>:[]core_entity

    # Abstract base representation of volume
    query_volume<native><epic_internal> := class<abstract>:


    # Axis aligned box volume
    query_volume_box<native><epic_internal> := class<concrete>(query_volume):
        Origin<native><public>:vector3 = external {}

        Extent<native><public>:vector3 = external {}

    # Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
    tag_container_core_entity_component<native><epic_internal> := class<final>(core_entity_component):
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