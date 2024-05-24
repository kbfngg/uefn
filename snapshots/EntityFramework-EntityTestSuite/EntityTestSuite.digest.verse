using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    test_component<native><epic_internal> := class(component):


    @hide_in_editor
    lambda_test_component<native><epic_internal> := class(component):
        OnInitialized<native><override>():void

        OnAddedToScene<native><override>():void

        OnBeginSimulation<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

        OnEndSimulation<native><override>():void

        OnRemovingFromScene<native><override>():void

        OnUninitializing<native><override>():void

    @hide_in_editor
    lambda_test_component_2<native><epic_internal> := class(component):
        OnInitialized<native><override>():void

        OnAddedToScene<native><override>():void

        OnBeginSimulation<native><override>():void

        OnSimulate<override>()<suspends>:void = external {}

        OnEndSimulation<native><override>():void

        OnRemovingFromScene<native><override>():void

        OnUninitializing<native><override>():void