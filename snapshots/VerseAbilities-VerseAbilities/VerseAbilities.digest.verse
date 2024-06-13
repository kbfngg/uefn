using {/UnrealEngine.com/Temporary/SceneGraph}
ability<native><public> := class:
    GameplayAbilityPath<native><epic_internal>:?string = external {}

    Activate<native><protected>()<suspends>:void

@experimental
ability_component<native><public> := class(component):
    GiveAbility<native><public>(Ability:subtype(ability))<transacts><decides>:void

    ActivateAbility<native><public>(Ability:subtype(ability)):void

    GiveAbility<native><epic_internal>(Ability:ability)<transacts><decides>:void

    ActivateAbility<native><epic_internal>(Ability:ability):void

@attribscope_data
@customattribhandler
ability_link<epic_internal> := class(attribute):
    Name<epic_internal>:string = external {}