using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/VerseQueryTestSuite
VerseQueryTestSuite<public> := module:
    @hide_in_editor
    verse_query_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    verse_query_not_used_test_entity<native><epic_internal> := class(entity):


    @hide_in_editor
    verse_query_test_component<native><epic_internal> := class(component):


    @hide_in_editor
    verse_query_other_test_component<native><epic_internal> := class(component):


    @hide_in_editor
    verse_query_unused_test_component<native><epic_internal> := class(component):


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
