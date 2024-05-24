using {/UnrealEngine.com/Temporary/SceneGraph}
ability<native><public> := class:
    GameplayAbilityPath<native><epic_internal>:?string = external {}

    PropertyLinks<native><epic_internal>:[]ability_property_link = external {}

    Activate<native><protected>()<suspends>:void

ability_component<native><public> := class(component):


ability_property_link<native><epic_internal> := struct:
    VersePropertyName<native><public>:string

    NativePropertyName<native><public>:string