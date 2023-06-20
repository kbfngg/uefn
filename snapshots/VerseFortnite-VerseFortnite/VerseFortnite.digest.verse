using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/Teams}
using {/Verse.org/Simulation}
using {/Fortnite.com/Game}
using {/Fortnite.com/Characters}
# Module import path: /Fortnite.com/Vehicles
Vehicles<public> := module:
    # Returns the `fort_vehicle` for `InCharacter`.Fails if `InCharacter` is not associated with a `fort_vehicle`.
    (InCharacter:fort_character).GetVehicle<native><public>()<transacts><decides>:fort_vehicle

    # Main API implemented by Fortnite vehicles.
    fort_vehicle<native><public> := interface<unique><epic_internal>(positional, healthful, damageable):
        # Succeeds if this `fort_vehicle` is standing on ground.
        IsOnGround<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in air.
        IsInAir<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in water.
        IsInWater<public>()<transacts><decides>:void

        # Returns an array with all the passengers of the vehicle.
        GetPassengers<public>():[]fort_character

# Module import path: /Fortnite.com/Teams
Teams<public> := module:
    # A generic set of team attitudes. Use this enum to model relationship behavior between your experience'sagents/teams.
    team_attitude<native><public> := enum:
        # Agents/teams are friends. In Fortnite games two `agent`s on the same `team` are `friendly`.
        Friendly
        # Agents/teams are neutral. In Fortnite games items and AI not belonging to a `friendly` or `hostile`team are `neutral`.
        Neutral
        # Agents/teams are hostile. In fortnite games two `agent`s on opposing `team`s are `hostile`.
        Hostile

    # Collection used to manage `team`s and `agent`s on those teams.Use `fort_playspace.GetTeamCollection()` to get the `team_collection` for the active experience.
    fort_team_collection<native><public> := interface:
        # Returns an array of all the `team`s known to this `fort_team_collection`
        GetTeams<public>()<transacts>:[]team

        # Adds `InAgent` to `InTeam`.Fails if `InTeam` is not part of the `fort_team_collection`.
        AddToTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        # Succeeds if `InAgent` is on `InTeam`.Fails if: * `InAgent` is not on `InTeam`. * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        # Returns an array of all `agent`s on `InTeam`.Fails if `InTeam` is not part of the `fort_team_collection`.
        GetAgents<public>(InTeam:team)<transacts><decides>:[]agent

        # Get the `team` that `InAgent` is on.Fails if `InAgent` is not on a team in this `fort_team_collection`.
        GetTeam<public>(InAgent:agent)<transacts><decides>:team

        # Returns the `team_attitude` between `Team1` and `Team2`.Fails if: * `Team1` is not in this `fort_team_collection`. * `Team2` is not in this `fort_team_collection`.
        GetTeamAttitude<public>(Team1:team, Team2:team)<transacts><decides>:team_attitude

        # Returns the `team_attitude` between `Agent1` and `Agent2`.Fails if: * `Agent1` is not on a team in this `fort_team_collection`. * `Agent2` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<public>(Agent1:agent, Agent2:agent)<transacts><decides>:team_attitude

# Module import path: /Fortnite.com/Playspaces
Playspaces<public> := module:
    # A nested container that scopes objects, style, gameplay rules, visuals, etc. All objectsand players in an experience will belong to a fort_playspace. There is typically one `fort_playspace`for an entire experience, though this may change in the future as the platform evolves. To access the `fort_playspace` for a `creative_device` use `creative_device.GetPlayspace`.
    fort_playspace<native><public> := interface:
        # Get an `[]player`s in the current `fort_playspace`.
        GetPlayers<public>()<transacts>:[]player

        # Get the `fort_team_collection` for the current `fort_playspace`.
        GetTeamCollection<public>()<transacts>:fort_team_collection

        # Signaled when a `player` joins the `fort_playspace`. Returns a subscribable with a payload of the`fort_character` that entered the `fort_playspace`.
        PlayerAddedEvent<public>():subscribable(player)

        # Signaled when a `player` leaves the `fort_playspace`. Returns a subscribable with a payload of the`fort_character` that left the `fort_playspace`.
        PlayerRemovedEvent<public>():subscribable(player)

# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Result data for `fort_character` elimination events.
    elimination_result<native><public> := struct<epic_internal>:
        # The `fort_character` eliminated from the match by `EliminatingCharacter`.
        EliminatedCharacter<native><public>:fort_character

        # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be falsewhen `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
        EliminatingCharacter<native><public>:?fort_character

    # Implemented by objects to allow reading position information.
    positional<native><public> := interface<epic_internal>:
        # Returns the transform of the object.
        GetTransform<public>()<transacts>:transform

    # Implemented by Fortnite objects that have health state and can be eliminated.
    healthful<native><public> := interface<epic_internal>:
        # Returns the health state of the object. This value will between 0.0 and `GetMaxHealth`
        GetHealth<public>()<transacts>:float

        # Sets the health state of the object to `Health`. * Health state will be clamped between 1.0 and `GetMaxHealth`. * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the   `damageable.Damage` functions instead.
        SetHealth<public>(Health:float)<transacts>:void

        # Returns the maximum health of the object. This value will be between 1.0 and Inf.
        GetMaxHealth<public>()<transacts>:float

        # Sets the maximum health state of the object. * MaxHealth will be clamped between 1.0 and Inf. * Current health state will be scaled up or down based on the scale difference between the old and new   MaxHealth state.
        SetMaxHealth<public>(MaxHealth:float)<transacts>:void

    # Implemented by Fortnite objects that have shields. A shield is a method of protection that can take incomingdamage while leaving the health state unchanged.
    shieldable<native><public> := interface<epic_internal>:
        # Returns the shield state of the object. This value will between 0.0 and `MaxShield`
        GetShield<public>()<transacts>:float

        # Sets the shield state of the object. * Shield state will be clamped between 0.0 and `MaxShield`.
        SetShield<public>(Shield:float)<transacts>:void

        # Returns the maximum shield state of the object. This value will be between 0.0 and Inf.
        GetMaxShield<public>()<transacts>:float

        # Sets the maximum shield state of the object. * MaxShield will be clamped between 0.0 and Inf. * Current shield state will be scaled up or down based on the scale difference between the old and new   MaxShield state.
        SetMaxShield<public>(MaxShield:float)<transacts>:void

        # Signaled when the shield is damaged.
        DamagedShieldEvent<public>():listenable(damage_result)

        # Signaled when the shield is healed.
        HealedShieldEvent<public>():listenable(healing_result)

    # Implemented by Fortnite objects that can be damaged.
    damageable<native><public> := interface<epic_internal>:
        # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
        Damage<public>(Amount:float):void

        # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
        Damage<public>(Args:damage_args):void

        # Signaled when damage is applied to the `damageable` object.
        DamagedEvent<public>():listenable(damage_result)

    # Implemented by Fortnite objects that can be healed.
    healable<native><public> := interface<epic_internal>:
        # Heal the `healable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no healing.Use `Heal(:healing_args):void` when healing is being applied from a known instigator and source.
        Heal<public>(Amount:float):void

        # Cause `Args.Amount` damage to the `damageable` object. Setting `Amount` to less than 0 will cause no damage.
        Heal<public>(Args:healing_args):void

        # Signaled when healing is applied to the `healable` object.
        HealedEvent<public>():listenable(healing_result)

    # Parameters for common damage functions on Fortnite objects.
    damage_args<native><public> := struct:
        # Player, agent, etc. that instigated the damage to the object.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that damaged the object.
        Source<native><public>:?game_action_causer = external {}

        # Amount of damage to apply to the object.
        Amount<native><public>:float

    # Results for damage events on Fortnite objects.
    damage_result<native><public> := struct<epic_internal>:
        # Object that was damaged.
        Target<native><public>:damageable

        # Amount of damage applied to `Target`.
        Amount<native><public>:float

        # Player, agent, etc. that instigated the damage to `Target`. Can be false when damage is instigated bycode, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that damaged `Target`. Can be false when damage is caused by code, theenvironment, etc.
        Source<native><public>:?game_action_causer = external {}

    # Parameters for common healing functions on Fortnite objects.
    healing_args<native><public> := struct:
        # Player, agents, etc. that instigated the healing of the object.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that healed the object.
        Source<native><public>:?game_action_causer = external {}

        # Amount of healing to apply to the object.
        Amount<native><public>:float

    # Results for healing events on Fortnite objects.
    healing_result<native><public> := struct<epic_internal>:
        # Object that was healed.
        Target<native><public>:healable

        # Amount of healing applied to `Target`.
        Amount<native><public>:float

        # Player, agent, etc. that instigated healing of the `Target`. Can be false when damage is instigated bycode, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that healed `Target`. Can be false when damage is caused by code, theenvironment, etc.
        Source<native><public>:?game_action_causer = external {}

    # Implemented by Fortnite objects that initiate game actions, such as damage and heal. For example, player or agents.Event listeners often use `game_action_instigators` to calculate player damage scores.
    game_action_instigator<native><public> := interface<epic_internal>:


    # Implemented by Fortnite objects that can be passed through game action events, such as damage and heal.For example: player, vehicle, or weapon.Event Listeners often use `game_action_causer` to pass along additional information about what weapon caused the damage.Systems will then use that information for completing quests or processing game specific event logic.
    game_action_causer<native><public> := interface:


# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module:
    # Sends `InPlayer` back to the main game lobby.
    (InPlayer:player).SendToLobby<native><public>()<transacts>:void

    # Succeeds if `InPlayer` is spectating the experience. Fails otherwise.
    (InPlayer:player).IsSpectator<native><public>()<transacts><decides>:void

    # Returns an `[]player`s currently spectating `InPlayer`.
    (InPlayer:player).GetPlayersSpectating<native><public>()<transacts>:[]player

    # Respawns the character for `InAgent` at the provided `RespawnPosition` and `RespawnRotation`.
    (InAgent:agent).Respawn<native><public>(RespawnPosition:vector3, RespawnRotation:rotation)<transacts>:void

# Module import path: /Fortnite.com/Characters
Characters<public> := module:
    # Main API implemented by Fortnite characters.
    fort_character<native><public> := interface<unique><epic_internal>(positional, healable, healthful, damageable, shieldable, game_action_instigator, game_action_causer):
        # Returns the agent associated with this `fort_character`. Use this when interacting with APIs that require an `agent` reference.
        GetAgent<public>()<transacts><decides>:agent

        # Signaled when this `fort_character` is eliminated from the match.
        EliminatedEvent<public>():listenable(elimination_result)

        # Returns the rotation where this `fort_character` is looking or aiming at.
        GetViewRotation<public>()<transacts>:rotation

        # Returns the location where this `fort_character` is looking or aiming from.
        GetViewLocation<public>()<transacts>:vector3

        # Signaled when this `fort_character` jumps. Returns a listenable with a payload of this `fort_character`.
        JumpedEvent<public>():listenable(fort_character)

        # Signaled when this `fort_character` changes crouch state.Sends `tuple` payload: - 0: the `fort_character` that changed crouch states. - 1: `true` if the character is crouching. `false` if the character is not crouching.
        CrouchedEvent<public>():listenable(tuple(fort_character, logic))

        # Signaled when this `fort_character` changes sprint state.Sends `tuple` payload: - 0: the `fort_character` that changed sprint state. - 1: `true` if the character is sprinting. `false` if the character stopped sprinting.
        SprintedEvent<public>():listenable(tuple(fort_character, logic))

        # Succeeds if this `fort_character` is in the world and has not been eliminated. Most fort_character actions will silently fail if this fails. Please test IsActive if you want to handle these failure cases rather than allow them to silently fail.
        IsActive<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in the 'Down But Not Out' state. In this state the character is down butcan still be revived by teammates for a period of time.
        IsDownButNotOut<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is crouching.
        IsCrouching<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is standing on the ground.
        IsOnGround<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is standing in the air.
        IsInAir<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is inside water volume.
        IsInWater<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in falling locomotion state.
        IsFalling<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in gliding locomotion state.
        IsGliding<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in flying locomotion state.
        IsFlying<public>()<transacts><decides>:void

        # Puts this `fort_character` into stasis, preventing certain types of movement specificed by `Args`.
        PutInStasis<public>(Args:stasis_args)<transacts>:void

        # Release this `fort_character` from stasis.
        ReleaseFromStasis<public>()<transacts>:void

        # Sets this `fort_character` visibility to visible.
        Show<public>():void

        # Sets this `fort_character` visibility to invisible.
        Hide<public>():void

        # Control if this `fort_character` can be damaged.
        SetVulnerability<public>(Vulnerable:logic)<transacts>:void

        # Succeeds if this `fort_character` can be damaged. Fails if this `fort_character` cannot be damaged.
        IsVulnerable<public>()<transacts><decides>:void

    # Returns the `fort_character` for `InAgent`. Fails if `InAgent` is not a `fort_character`.
    (InAgent:agent).GetFortCharacter<native><public>()<transacts><decides>:fort_character

    # Returns a `game_action_intigator` interface for `InAgent`.
    (InAgent:agent).GetInstigator<native><public>()<transacts>:game_action_instigator

    # Returns the `agent` for `InInstigator`. Fails if `InInstigator` is not an `agent`.
    (InInstigator:game_action_instigator).GetInstigatorAgent<native><public>()<transacts><decides>:agent

    # Parameters for `fort_character.PutInStasis` function.
    stasis_args<native><public> := struct:
        # Controls if `fort_character` can still turn while in stasis.
        AllowTurning<native><public>:logic = external {}

        # Controls if `fort_character` can still fall while in stasis.
        AllowFalling<native><public>:logic = external {}

        # Controls if `fort_character` can still perform emotes while in stasis.
        AllowEmotes<native><public>:logic = external {}

# Module import path: /Fortnite.com/AI
AI<public> := module:
    focus_interface<native><public> := interface:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<native><public>()<transacts><decides>:focus_interface

    fort_leashable<native><public> := interface:
        # Set custom leash position. 'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters). 'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<public>(Location:vector3, InnerRadius:float, OuterRadius:float):void

        # Set the agent to be the new center of the leash. 'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters). 'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<public>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        # Removes the current leash.
        ClearLeash<public>():void

    # Get the current fort_leashable interface for the specified character.
    (InCharacter:fort_character).GetFortLeashable<native><public>()<transacts><decides>:fort_leashable

    navigation_target<native><public> := class<epic_internal>:


    # Generate a navigation_target from any position
    MakeNavigationTarget<constructor><native><public>(Position:vector3):navigation_target

    # Generate a navigation_target from an agent
    MakeNavigationTarget<constructor><native><public>(Target:agent):navigation_target

    # Result of a navigation request
    navigation_result<native><public> := enum:
        # The destination has been reached
        Reached
        # The destination has been partially reached (AllowPartialPath was used)
        PartiallyReached
        # Navigation has been interrupted before completion
        Interrupted
        # The navigating agent is blocked
        Blocked
        # The destination cannot be reached
        Unreachable

    navigatable<native><public> := interface:
        # Return the current destination of the NPC
        GetCurrentDestination<public>()<transacts><decides>:vector3

        # Navigate toward the specified target
        NavigateTo<public>(Target:navigation_target, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        # Stop navigation
        StopNavigation<public>():void

        # Wait for a specific duration
        Wait<public>(?Duration:float = external {})<suspends>:void

    # Get the navigatable interface for the specified character.
    (InCharacter:fort_character).GetNavigatable<native><public>()<transacts><decides>:navigatable