using {/Fortnite.com/Characters}
using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Assets}
using {/Verse.org/Native}
# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Module import path: /Fortnite.com/Game/Attributes
    Attributes<public> := module:
        @import_as("/Script/VerseFortniteGameplayAbilities.UVerseGameplayAttribute")
        gameplay_attribute_base<native><epic_internal> := class<abstract>:


        gameplay_attribute<native><public> := class<abstract><epic_internal>(gameplay_attribute_base):
            AttributePathString<native><epic_internal>:[]char

        health_attribute<public> := class<final>(gameplay_attribute):
            AttributePathString<override>:[]char = external {}

    # Module import path: /Fortnite.com/Game/Abilities
    Abilities<public> := module:
        gameplay_ability_asset<native><public> := class<computes><final>(asset):


        gameplay_effect_asset<native><public> := class<computes><final>(asset):


        activate_ability_result<native><public> := enum:
            # Ability was activated successfully
            Activated
            # Ability was activated and then was cancelled
            Canceled
            # Ability was activated and then ended naturally
            Completed
            # Ability failed to activate
            Failed
            # Ability could not be activated because it was not added
            NotOwned
            # Ability asset was invalid
            Invalid

        add_ability_result<native><public> := enum:
            # Ability was successfully added
            Added
            # Ability was already added
            AlreadyOwned
            # Ability asset was invalid
            Invalid

        remove_ability_result<native><public> := enum:
            # Ability could not be removed because it was not added
            NotOwned
            # Ability was successfully removed
            Removed
            # Ability asset was invalid
            Invalid

        ability_component<native><public> := class<final>(component):
            AddAbility<native><public>(AbilityAsset:gameplay_ability_asset):add_ability_result

            RemoveAbility<native><public>(AbilityAsset:gameplay_ability_asset):remove_ability_result

            ActivateAbility<native><public>(AbilityAsset:gameplay_ability_asset, ?Target:?agent = external {})<suspends>:activate_ability_result

            ApplyGameplayEffect<native><public>(EffectAsset:gameplay_effect_asset, Magnitude:float):void

        # Module import path: /Fortnite.com/Game/Abilities/AbilityComponent
        AbilityComponent<public> := module:
            GetAbilityComponentForPlayer<native><epic_internal>(__dupe___unnamed_parameter_125:player_component)<transacts><decides>:ability_component

            GetAbilityComponentForCharacter<native><public>(__dupe___unnamed_parameter_126:fort_character)<transacts><decides>:ability_component