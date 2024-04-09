using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Native}
# Module import path: /Verse.org/Simulation/Tags
Tags<public> := module:
    # A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor.
    tag<native><public> := class<abstract>:


    @import_as("/Script/VerseGameplayTags.FVerseGameplayTag")
    # Utility structure which allows users to select a gameplay tag when exposed to editor
    tag_selector<native><epic_internal> := struct<concrete>:


    # Get a string representation of the gameplay tag. Useful for debugging.
    ToString<native><epic_internal>(__dupe___unnamed_parameter_46:tag)<computes>:string

    # Succeeds if Left and Right are equal.
    Equals<native><epic_internal>(Left:tag, Right:tag)<transacts><decides>:void

    # Utility function to allow for easy construction from subclass
    MakeGameplayTagFromSubClass<native><epic_internal>(Type:subtype(tag))<transacts><decides>:tag

    # Utility function to allow for easy construction from editor exposable tag_selector
    MakeGameplayTag<native><epic_internal>(Selector:tag_selector)<transacts><decides>:tag

    # A queryable collection of gameplay tags.
    tag_view<native><public> := interface<epic_internal>:
        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<public>(TagToCheck:tag)<transacts><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<public>(InTags:[]tag)<transacts><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<public>(InTags:[]tag)<transacts><decides>:void

    # A mutable collection of gameplay tags.
    tag_container<native><epic_internal> := class<concrete>(tag_view):
        # Add the specified tag to the container.
        Add<native><epic_internal>(Tag:tag):void

        # Remove the specified tag from the container.
        Remove<native><epic_internal>(Tag:tag)<decides>:void

        # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
        Add<native><epic_internal>(TagsToAdd:[]tag):void

        # Removes all tags in TagsToRemove from this container.
        Remove<native><epic_internal>(TagsToRemove:[]tag):void

        # Adds all the tags from one container to this container NOTE: From set theory, this effectively is the union of the container this is called on with TagsToAdd.
        Add<native><epic_internal>(TagsToAdd:tag_container):void

        # Removes all tags in TagsToRemove from this container.
        Remove<native><epic_internal>(TagsToRemove:tag_container):void

        # Remove all tags from the container. Will maintain slack by default.
        Reset<native><epic_internal>():void

        # Remove all tags from the container. Update the amount of slack pre-allocated for tags.
        ResetWithSlack<native><epic_internal>(slack:int):void

        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<native><override>(TagToCheck:tag)<transacts><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<native><override>(InTags:[]tag)<transacts><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<native><override>(InTags:[]tag)<transacts><decides>:void

        # Returns the number of explicitly added tags.
        Num<native><epic_internal>()<transacts>:int

    # Returns abbreviated human readable Tag list. Useful for debugging.
    ToString<native><epic_internal>(__dupe___unnamed_parameter_49:tag_container)<computes>:string

    @import_as("/Script/VerseGameplayTags.FVerseGameplayTagContainer")
    # Utility structure which allows users to select a gameplay tag when exposed to editor
    tag_selector_container<native><epic_internal> := struct<concrete>:


    # Create a tag container from an array of gameplay_tag.
    MakeTagContainer<native><constructor><epic_internal>(InTags:[]tag):tag_container

    # Succeeds if all tags in Left are found in Right and all tags in Right are found in Left.
    Equals<native><epic_internal>(Left:tag_container, Right:tag_container)<transacts><decides>:void

    # Utility function to allow for easy construction from editor exposable tag_selector_container
    MakeTagContainer<native><epic_internal>(Selector:tag_selector_container)<transacts><decides>:tag_container

    tag_search_sort_type<native><public> := enum:
        Unsorted
        Sorted

    # Advanced tag search criteria
    tag_search_criteria<native><public> := class:
        # Tags required to be on the object.
        RequiredTags<native><public>:[]tag = external {}

        # Tags that are used if no required tags are specified. These are treated as if any of them will do.
        PreferredTags<native><public>:[]tag = external {}

        # Tags that may NOT be on the object. All items with these tags are excluded from the search.
        ExclusionTags<native><public>:[]tag = external {}

        # Flag to request sorting the results by tag.
        SortType<native><public>:tag_search_sort_type = external {}

    # Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
    vk_tag_container_component<native><epic_internal> := class<final>(vk_component):
        # Get the tags associated with this vk_component. These may be specified in the editor.
        GetTags<native><epic_internal>():tag_container

        # Set the tags associated with this vk_component.
        SetTags<native><epic_internal>(InTags:tag_container):void

        # Add a single tag to this vk_component.
        AddTag<native><epic_internal>(TagToAdd:tag):void

        # Remove a single tag from this vk_component.
        RemoveTag<native><epic_internal>(TagToRemove:tag):logic

    # Get a list of components that match the specified tag.
    FindObjectWithTag<native><epic_internal>(Tag:tag)<transacts><decides>:vk_component

    # Get a list of components that match the specified tag.
    FindObjectsWithTag<native><epic_internal>(Tag:tag)<transacts>:[]vk_component

    # Get a list of components that match the specified criteria.
    FindObjectsWithTags<native><epic_internal>(SearchCriteria:tag_search_criteria):[]vk_component