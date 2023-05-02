# Module import path: /Verse.org/Simulation/Tags
Tags<public> := module:
    # A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor.
    tag<native><public> := class<abstract>:


    # A queryable collection of gameplay tags.
    tag_view<native><public> := interface<epic_internal>:
        # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
        Has<public>(TagToCheck:tag)<transacts><decides>:void

        # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
        HasAny<public>(InTags:[]tag)<transacts><decides>:void

        # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
        HasAll<public>(InTags:[]tag)<transacts><decides>:void

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