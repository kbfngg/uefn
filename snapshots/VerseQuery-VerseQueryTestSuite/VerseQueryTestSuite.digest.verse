using {/UnrealEngine.com/Temporary/SceneGraph}
using {/Verse.org/Simulation}
using {/Verse.org/Simulation/Tags}
# Module import path: /UnrealEngine.com/VerseQueryTestSuite
VerseQueryTestSuite<public> := module:
    @hide_in_editor
    tag_component_test_tag_vehicle<native><epic_internal> := class(tag):


    @hide_in_editor
    tag_component_test_tag_car<native><epic_internal> := class(tag_component_test_tag_vehicle):


    @hide_in_editor
    tag_component_test_tag_datsun<native><epic_internal> := class(tag_component_test_tag_car):


    @hide_in_editor
    tag_component_test_tag_bike<native><epic_internal> := class(tag_component_test_tag_vehicle):


    @hide_in_editor
    tag_component_test_tag_norton<native><epic_internal> := class(tag_component_test_tag_bike):


    @hide_in_editor
    @experimental
    verse_query_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    @experimental
    verse_query_not_used_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    @experimental
    verse_query_test_component<native><epic_internal> := class(component):
        IsAllowedOnClient<override>():logic = external {}

    @hide_in_editor
    @experimental
    verse_query_other_test_component<native><epic_internal> := class(component):
        IsAllowedOnClient<override>():logic = external {}

    @hide_in_editor
    @experimental
    verse_query_unused_test_component<native><epic_internal> := class(component):
        IsAllowedOnClient<override>():logic = external {}

    @hide_in_editor
    verse_query_tag_animal<native><epic_internal> := class(tag):


    @hide_in_editor
    verse_query_tag_dog<native><epic_internal> := class(verse_query_tag_animal):


    @hide_in_editor
    verse_query_tag_kimchi_dog<native><epic_internal> := class(verse_query_tag_dog):


    @hide_in_editor
    verse_query_tag_pollo_dog<native><epic_internal> := class(verse_query_tag_dog):


    @hide_in_editor
    verse_query_tag_cat<native><epic_internal> := class(verse_query_tag_animal):


    @hide_in_editor
    verse_query_tag_cheddar_cat<native><epic_internal> := class(verse_query_tag_cat):


    @hide_in_editor
    verse_query_tag_jello_cat<native><epic_internal> := class(verse_query_tag_cat):
