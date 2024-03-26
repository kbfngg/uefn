using {/UnrealEngine.com/Temporary/SceneGraph}
ability<native><public> := class:
    GameplayAbilityPath<native><epic_internal>:?string = external {}

    PropertyLinks<native><epic_internal>:[]ability_property_link = external {}

    Activate<native><protected>()<suspends>:void

ability_component<native><public> := class(component):
    GiveAbility<native><public>(Ability:subtype(ability))<transacts><decides>:void

    ActivateAbility<native><public>(Ability:subtype(ability)):void

    GiveAbility<native><epic_internal>(Ability:ability)<transacts><decides>:void

    ActivateAbility<native><epic_internal>(Ability:ability):void

ability_property_link<native><epic_internal> := struct:
    VersePropertyName<native><epic_internal>:string

    NativePropertyName<native><epic_internal>:string