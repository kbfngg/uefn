using {/Verse.org/VerseEngine}
using {/Fortnite.com/Assets}
using {/Fortnite.com/AI}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/UnrealEngine.com/Abilities}
using {/Fortnite.com/Teams}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/Temporary/SceneGraph}
using {/Fortnite.com/Game}
using {/Fortnite.com/Characters}
# Module import path: /Fortnite.com/Vehicles
Vehicles<public> := module:
    # Returns the `fort_vehicle` for `InCharacter`.
    # Fails if `InCharacter` is not associated with a `fort_vehicle`.
    (InCharacter:fort_character).GetVehicle<native><public>()<transacts><decides>:fort_vehicle

    # Main API implemented by Fortnite vehicles.
    fort_vehicle<native><public> := interface<unique><epic_internal>(positional, healthful, damageable, game_action_causer):
        # Succeeds if this `fort_vehicle` is standing on ground.
        IsOnGround<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in air.
        IsInAir<public>()<transacts><decides>:void

        # Succeeds if this `fort_vehicle` is standing in water.
        IsInWater<public>()<transacts><decides>:void

        # Returns an array with all the passengers of the vehicle.
        GetPassengers<public>():[]fort_character

        @experimental
        GetEntity<epic_internal>()<transacts><decides>:entity

    @hide_in_editor
    @experimental
    fort_vehicle_component<native><epic_internal> := class(component, fort_vehicle):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

        @experimental
        FortVehicle<native><public>:fort_vehicle

        @experimental
        IsOnGround<override>()<transacts><decides>:void = external {}

        @experimental
        IsInAir<override>()<transacts><decides>:void = external {}

        @experimental
        IsInWater<override>()<transacts><decides>:void = external {}

        @experimental
        GetPassengers<override>():[]fort_character = external {}

        @experimental
        Damage<override>(Amount:float):void = external {}

        @experimental
        Damage<override>(Args:damage_args):void = external {}

        @experimental
        GetHealth<override>()<transacts>:float = external {}

        @experimental
        SetHealth<override>(Health:float)<transacts>:void = external {}

        @experimental
        GetMaxHealth<override>()<transacts>:float = external {}

        @experimental
        SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

        @experimental
        GetTransform<override>()<transacts>:transform = external {}

        @experimental
        (fort_vehicle:)GetEntity<override>()<transacts><decides>:entity = external {}

        @experimental
        DamagedEvent<override>():listenable(damage_result) = external {}

# Module import path: /Fortnite.com/Teams
Teams<public> := module:
    # A generic set of team attitudes. Use this enum to model relationship behavior between your experience's agents/teams.
    team_attitude<native><public> := enum:
        # Agents/teams are friends. In Fortnite games two `agent`s on the same `team` are `friendly`.
        Friendly
        # Agents/teams are neutral. In Fortnite games items and AI not belonging to a `friendly` or `hostile` team are `neutral`.
        Neutral
        # Agents/teams are hostile. In fortnite games two `agent`s on opposing `team`s are `hostile`.
        Hostile

    # Collection used to manage `team`s and `agent`s on those teams.
    # Use `fort_playspace.GetTeamCollection()` to get the `team_collection` for the active experience.
    fort_team_collection<native><public> := interface<epic_internal>:
        # Returns an array of all the `team`s known to this `fort_team_collection`
        GetTeams<public>()<transacts>:[]team

        @experimental
        # Register a team component with the team collection, so that its team can automatically be changed as teams are associated with its tag. 
        # Fails if:
        #  * The team component's tag is not set
        #  * The team component is not attached to an entity
        #  * The owning entity of the team component is already registered.
        RegisterTeamComponent<native_callable><epic_internal>(InTeamComponent:team_component)<transacts><decides>:void

        @experimental
        # Unregister a team component from the team collection. Fails if the team component is not registered with the team collection
        UnregisterTeamComponent<native_callable><epic_internal>(InTeamComponent:team_component)<transacts><decides>:void

        @experimental
        # Associate the team `InTeam` with the tag `InTeamTag`, so that it can be accessed by team_component. Fails if `InTeam` is not a valid team within the team collection
        SetTaggedTeam<epic_internal>(InTeamTag:team_tag, InTeam:team)<transacts><decides>:void

        @experimental
        # Get the team associated with the tag `InTag`. Fails if no such team is associated with `InTag` 
        GetTeamByTag<epic_internal>(InTeamTag:team_tag)<transacts><decides>:team

        # Get all of the tags associated with the team `InTeam`. Fails if `InTeam` is not a valid team within the team collection
        GetTeamTags<epic_internal>(InTeam:team)<transacts><decides>:tag_container

        # Adds `InAgent` to `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        AddToTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        @experimental
        # Adds `InEntity` to the team that matches `InTeamTag`.
        # Fails if `InTeamTag` is not a registered team in the `fort_team_collection`.
        AddToTeam<native_callable><epic_internal>(InEntity:entity, InTeamTag:team_tag)<transacts><decides>:void

        # Succeeds if `InAgent` is on `InTeam`.
        # Fails if:
        #  * `InAgent` is not on `InTeam`.
        #  * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<public>(InAgent:agent, InTeam:team)<transacts><decides>:void

        @experimental
        # Succeeds if `InEntity` is on `InTeam`.
        # Fails if:
        #  * `InEntity` is not on `InTeam`.
        #  * `InTeam` is not part of the `fort_team_collection`.
        IsOnTeam<epic_internal>(InEntity:entity, InTeam:team)<transacts><decides>:void

        # Returns an array of all `agent`s on `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        GetAgents<public>(InTeam:team)<transacts><decides>:[]agent

        @experimental
        # Returns an array of all `entities on `InTeam`.
        # Fails if `InTeam` is not part of the `fort_team_collection`.
        GetEntities<epic_internal>(InTeam:team)<transacts><decides>:[]entity

        # Get the `team` that `InAgent` is on.
        # Fails if `InAgent` is not on a team in this `fort_team_collection`.
        GetTeam<public>(InAgent:agent)<transacts><decides>:team

        @experimental
        # Get the `team` that `InEntity` is on.
        # Fails if `InEntity` is not on a team in this `fort_team_collection`.
        GetTeam<epic_internal>(InEntity:entity)<transacts><decides>:team

        # Returns the `team_attitude` between `Team1` and `Team2`.
        # Fails if:
        #  * `Team1` is not in this `fort_team_collection`.
        #  * `Team2` is not in this `fort_team_collection`.
        GetTeamAttitude<public>(Team1:team, Team2:team)<transacts><decides>:team_attitude

        # Returns the `team_attitude` between `Agent1` and `Agent2`.
        # Fails if:
        #  * `Agent1` is not on a team in this `fort_team_collection`.
        #  * `Agent2` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<public>(Agent1:agent, Agent2:agent)<transacts><decides>:team_attitude

        @experimental
        # Returns the `team_attitude` between `Entity1` and `Entity2`.
        # Fails if:
        #  * `Entity1` is not on a team in this `fort_team_collection`.
        #  * `Entity2` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<epic_internal>(Entity1:entity, Entity2:entity)<transacts><decides>:team_attitude

        @experimental
        # Returns the `team_attitude` between `Agent` and `Entity`.
        # Fails if:
        #  * `Agent` is not on a team in this `fort_team_collection`.
        #  * `Entity` is not on a team in this `fort_team_collection`.
        GetTeamAttitude<epic_internal>(Agent:agent, Entity:entity)<transacts><decides>:team_attitude

    @experimental
    team_tag<native><epic_internal> := class<concrete>(tag):


    @experimental
    team_pvp_01_tag<native><epic_internal> := class<concrete>(team_tag):


    @experimental
    team_pvp_02_tag<native><epic_internal> := class<concrete>(team_tag):


    @experimental
    team_monster_tag<native><epic_internal> := class<concrete>(team_tag):


    @experimental
    team_component<native><epic_internal> := class<final>(component):
        OnSimulate<override>()<suspends>:void = external {}

        @experimental
        # Tag that uniquely identifies the team this entity is on
        var TeamTag<public>:team_tag = external {}

        # Get the team object for the team this entity is on - Fails if team is not registered. team_pvp_01_tag, team_pvp_02_tag and team_monster_tag are registered already by default
        GetTeam<native><public>()<transacts><decides>:team

# Module import path: /Fortnite.com/Playspaces
Playspaces<public> := module:
    # A nested container that scopes objects, style, gameplay rules, visuals, etc. All objects and players in an experience will belong to a fort_playspace. There is typically one `fort_playspace` for an entire experience, though this may change in the future as the platform evolves.
    # 
    # To access the `fort_playspace` for a `creative_device` use `creative_device.GetPlayspace`.
    fort_playspace<native><public> := interface<epic_internal>:
        # Get an `[]player`s in the current `fort_playspace`.
        GetPlayers<public>()<transacts>:[]player

        # Get the `fort_team_collection` for the current `fort_playspace`.
        GetTeamCollection<public>()<transacts>:fort_team_collection

        # Signaled when a `player` joins the `fort_playspace`. Returns a subscribable with a payload of the`fort_character` that entered the `fort_playspace`.
        PlayerAddedEvent<public>():listenable(player)

        # Signaled when a `player` leaves the `fort_playspace`. Returns a subscribable with a payload of the`fort_character` that left the `fort_playspace`.
        PlayerRemovedEvent<public>():listenable(player)

    @experimental
    # Returns an associated `fort_playspace` for this entity.  * Fails if this entity is not in the scene, and therefore not associated with a playspace.
    (InEntity:entity).GetPlayspaceForEntity<native><public>()<transacts><decides>:fort_playspace

# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Result data for `fort_character` elimination events.
    elimination_result<native><public> := struct<epic_internal>:
        # The `fort_character` eliminated from the match by `EliminatingCharacter`.
        EliminatedCharacter<native><public>:fort_character

        # `fort_character` that eliminated `EliminatedCharacter` from the match. `EliminatingCharacter` will be false when `EliminatedCharacter` was eliminated through non-character actions, such as environmental damage.
        EliminatingCharacter<native><public>:?fort_character

    @experimental
    fort_ability_component<native><epic_internal> := class(ability_component):


    @experimental
    fort_damageable_component<native><epic_internal> := class(damageable_component):
        @editable
        @experimental
        MaxHealth<native><epic_internal>:float = external {}

        @experimental
        var Health<native><public>:float = external {}

        @experimental
        DamagedEventWithAgent<native><epic_internal>:listenable(tuple(float, ?agent)) = external {}

    @experimental
    fort_game_component<native><epic_internal> := class<abstract>(component):
        OnBeginSimulation<native><override>():void

        OnEndSimulation<native><override>():void

        @experimental
        # Override to add custom logic when the game experience begins.
        OnRoundBegin<native_callable><protected>()<suspends>:void = external {}

        @experimental
        # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
        OnRoundEnd<native_callable><protected>():void = external {}

    # Implemented by objects to allow reading position information.
    positional<native><public> := interface<epic_internal>:
        # Returns the transform of the object.
        GetTransform<public>()<transacts>:transform

    # Implemented by Fortnite objects that have health state and can be eliminated.
    healthful<native><public> := interface<epic_internal>:
        # Returns the health state of the object. This value will between 0.0 and `GetMaxHealth`
        GetHealth<public>()<transacts>:float

        # Sets the health state of the object to `Health`.
        #  * Health state will be clamped between 1.0 and `GetMaxHealth`.
        #  * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the `damageable.Damage` functions instead.
        SetHealth<public>(Health:float)<transacts>:void

        # Returns the maximum health of the object. This value will be between 1.0 and Inf.
        GetMaxHealth<public>()<transacts>:float

        # Sets the maximum health state of the object.
        #  * MaxHealth will be clamped between 1.0 and Inf.
        #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
        SetMaxHealth<public>(MaxHealth:float)<transacts>:void

    # Implemented by Fortnite objects that have shields. A shield is a method of protection that can take incoming damage while leaving the health state unchanged.
    shieldable<native><public> := interface<epic_internal>:
        # Returns the shield state of the object. This value will between 0.0 and `MaxShield`
        GetShield<public>()<transacts>:float

        # Sets the shield state of the object.
        #  * Shield state will be clamped between 0.0 and `MaxShield`.
        SetShield<public>(Shield:float)<transacts>:void

        # Returns the maximum shield state of the object. This value will be between 0.0 and Inf.
        GetMaxShield<public>()<transacts>:float

        # Sets the maximum shield state of the object.
        #  * MaxShield will be clamped between 0.0 and Inf.
        #  * Current shield state will be scaled up or down based on the scale difference between the old and new MaxShield state.
        SetMaxShield<public>(MaxShield:float)<transacts>:void

        # Signaled when the shield is damaged.
        DamagedShieldEvent<public>():listenable(damage_result)

        # Signaled when the shield is healed.
        HealedShieldEvent<public>():listenable(healing_result)

    # Implemented by Fortnite objects that can be damaged.
    damageable<native><public> := interface<epic_internal>:
        # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.
        # Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
        Damage<public>(Amount:float):void

        # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
        Damage<public>(Args:damage_args):void

        # Signaled when damage is applied to the `damageable` object.
        DamagedEvent<public>():listenable(damage_result)

    # Implemented by Fortnite objects that can be healed.
    healable<native><public> := interface<epic_internal>:
        # Heal the `healable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no healing.
        # Use `Heal(:healing_args):void` when healing is being applied from a known instigator and source.
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

        # Player, agent, etc. that instigated the damage to `Target`. Can be false when damage is instigated by code, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that damaged `Target`. Can be false when damage is caused by code, the environment, etc.
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

        # Player, agent, etc. that instigated healing of the `Target`. Can be false when damage is instigated by code, the environment, etc.
        Instigator<native><public>:?game_action_instigator = external {}

        # Player, weapon, vehicle, etc. that healed `Target`. Can be false when damage is caused by code, the environment, etc.
        Source<native><public>:?game_action_causer = external {}

    # Implemented by Fortnite objects that initiate game actions, such as damage and heal. For example, player or agents.
    # Event listeners often use `game_action_instigators` to calculate player damage scores.
    game_action_instigator<native><public> := interface<epic_internal>:


    # Implemented by Fortnite objects that can be passed through game action events, such as damage and heal.
    # For example: player, vehicle, or weapon.
    # 
    # Event Listeners often use `game_action_causer` to pass along additional information about what weapon caused the damage.
    # Systems will then use that information for completing quests or processing game specific event logic.
    game_action_causer<native><public> := interface:


    # Implementation of the `game_action_instigator` interface for `agent`s.
    agent_instigator_impl<native><epic_internal> := class(game_action_instigator):
        TheAgent<native><epic_internal>:agent

    teleport_to_debug_log<epic_internal> := class(log_channel):


    # Results for `TeleportTo` of creative objects and devices.
    teleport_to_result<native><epic_internal> := enum:
        # Success.
        Ok
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # `NaN` or `Infinity` in the requested destination.
        InvalidDestination
        # There is something colliding with the requested destination.
        CollidingDestination
        # The object being moved is no longer valid. Example invalid states:
        #  * The object has been destroyed during gameplay.
        #  * The object has been destroyed by Verse.
        #  * The object has the *Register with Structural Grid* option set in UEFN.
        InvalidObject
        # The object being moved cannot be scaled.
        ScaleNotAllowed
        # The destination would cause the object to be at least partially outside the island's boundaries.
        DestinationOutOfBounds

    HandleTeleportToResult<epic_internal>(Result:teleport_to_result, TargetTragsform:transform)<transacts><decides>:void = external {}

# Module import path: /Fortnite.com/FortPlayerUtilities
FortPlayerUtilities<public> := module:
    # Sends `InPlayer` back to the main game lobby.
    (InPlayer:player).SendToLobby<native><public>()<transacts>:void

    # Succeeds if `InPlayer` is spectating the experience. Fails otherwise.
    (InPlayer:player).IsSpectator<native><public>()<transacts><decides>:void

    # Returns an `[]player`s currently spectating `InPlayer`.
    (InPlayer:player).GetPlayersSpectating<native><public>()<transacts>:[]player

    # Respawns the character for `InAgent` at the provided `RespawnPosition` and applies the yaw of `RespawnRotation`.
    (InAgent:agent).Respawn<native><public>(RespawnPosition:vector3, RespawnRotation:rotation)<transacts>:void

# Module import path: /Fortnite.com/Characters
Characters<public> := module:
    npc_character_modifier<native><epic_internal> := class<abstract>:
        ModifyCharacter<native_callable><public>(Character:fort_character):void

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

        # Signaled when this `fort_character` changes crouch state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed crouch states.
        #  - 1: `true` if the character is crouching. `false` if the character is not crouching.
        CrouchedEvent<public>():listenable(tuple(fort_character, logic))

        # Signaled when this `fort_character` changes sprint state.
        # Sends `tuple` payload:
        #  - 0: the `fort_character` that changed sprint state.
        #  - 1: `true` if the character is sprinting. `false` if the character stopped sprinting.
        SprintedEvent<public>():listenable(tuple(fort_character, logic))

        # Succeeds if this `fort_character` is in the world and has not been eliminated. Most fort_character actions will silently fail if this fails. Please test IsActive if you want to handle these failure cases rather than allow them to silently fail.
        IsActive<public>()<transacts><decides>:void

        # Succeeds if this `fort_character` is in the 'Down But Not Out' state. In this state the character is down but can still be revived by teammates for a period of time.
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

        # Puts this `fort_character` into stasis, preventing certain types of movement specified by `Args`.
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

        # Teleports this `fort_character` to the provided `Position` and applies the yaw of `Rotation`. Will fail if the `Position` specified is e.g. outside of the playspace or specifies a place where the character cannot fit.
        TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void

        @experimental
        GetEntity<epic_internal>()<transacts><decides>:entity

    # Returns the `fort_character` for `InAgent`. Fails if `InAgent` is not a `fort_character`.
    (InAgent:agent).GetFortCharacter<native><public>()<transacts><decides>:fort_character

    # Returns a `game_action_instigator` interface for `InAgent`.
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

    @hide_in_editor
    @experimental
    fort_character_component<native><epic_internal> := class<final>(component, fort_character):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

        @experimental
        FortCharacter<native><public>:fort_character

        @experimental
        Damage<override>(Amount:float):void = external {}

        @experimental
        Damage<override>(Args:damage_args):void = external {}

        @experimental
        Heal<override>(Amount:float):void = external {}

        @experimental
        Heal<override>(Args:healing_args):void = external {}

        @experimental
        IsActive<override>()<transacts><decides>:void = external {}

        @experimental
        IsDownButNotOut<override>()<transacts><decides>:void = external {}

        @experimental
        IsCrouching<override>()<transacts><decides>:void = external {}

        @experimental
        IsOnGround<override>()<transacts><decides>:void = external {}

        @experimental
        IsInAir<override>()<transacts><decides>:void = external {}

        @experimental
        IsInWater<override>()<transacts><decides>:void = external {}

        @experimental
        IsFalling<override>()<transacts><decides>:void = external {}

        @experimental
        IsGliding<override>()<transacts><decides>:void = external {}

        @experimental
        IsFlying<override>()<transacts><decides>:void = external {}

        @experimental
        GetHealth<override>()<transacts>:float = external {}

        @experimental
        GetMaxHealth<override>()<transacts>:float = external {}

        @experimental
        SetHealth<override>(Health:float)<transacts>:void = external {}

        @experimental
        SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

        @experimental
        GetShield<override>()<transacts>:float = external {}

        @experimental
        GetMaxShield<override>()<transacts>:float = external {}

        @experimental
        SetShield<override>(Shield:float)<transacts>:void = external {}

        @experimental
        SetMaxShield<override>(MaxShield:float)<transacts>:void = external {}

        @experimental
        GetAgent<override>()<transacts><decides>:agent = external {}

        @experimental
        GetTransform<override>()<transacts>:transform = external {}

        @experimental
        GetViewRotation<override>()<transacts>:rotation = external {}

        @experimental
        GetViewLocation<override>()<transacts>:vector3 = external {}

        @experimental
        PutInStasis<override>(Args:stasis_args)<transacts>:void = external {}

        @experimental
        ReleaseFromStasis<override>()<transacts>:void = external {}

        @experimental
        Show<override>():void = external {}

        @experimental
        Hide<override>():void = external {}

        @experimental
        SetVulnerability<override>(Vulnerable:logic)<transacts>:void = external {}

        @experimental
        IsVulnerable<override>()<transacts><decides>:void = external {}

        @experimental
        TeleportTo<override>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

        @experimental
        (fort_character:)GetEntity<override>()<transacts><decides>:entity = external {}

        DamagedEvent<override>():listenable(damage_result) = external {}

        DamagedShieldEvent<override>():listenable(damage_result) = external {}

        HealedEvent<override>():listenable(healing_result) = external {}

        HealedShieldEvent<override>():listenable(healing_result) = external {}

        CrouchedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        JumpedEvent<override>():listenable(fort_character) = external {}

        SprintedEvent<override>():listenable(tuple(fort_character, logic)) = external {}

        EliminatedEvent<override>():listenable(elimination_result) = external {}

# Module import path: /Fortnite.com/Building
Building<public> := module:
    @experimental
    building_component<native><epic_internal> := class<final>(component):
        IsAllowedOnClient<override>():logic = external {}

        @experimental
        Damage<native><public>(Amount:float):void

        @experimental
        IsPlayerBuilt<native><public>()<decides>:void

        @experimental
        var CanBeDamaged<public>:logic = external {}

        @experimental
        var CanBeReplaced<public>:logic = external {}

# Module import path: /Fortnite.com/Assets
Assets<public> := module:
    emote<native><epic_internal> := class<computes><concrete><final>(asset):


# Module import path: /Fortnite.com/Animation
Animation<public> := module:
    # Module import path: /Fortnite.com/Animation/PlayAnimation
    PlayAnimation<public> := module:
        # Result of a PlayAndAwait request.
        play_animation_result<native><public> := enum:
            # The animation completed successfully.
            Completed
            # The animation was interrupted whilst playing.
            Interrupted
            # The animation encountered an error during initialization or whilst playing.
            Error

        # An interface for playing an animation on an object.
        play_animation_controller<native><public> := interface<epic_internal>:
            # Play an animation sequence.
            PlayAndAwait<public>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {})<suspends>:play_animation_result

            # Start an animation sequence and obtain an instance to query and manipulate.
            Play<public>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {}):play_animation_instance

        # An animation instance created from play_animation_controller.Play that can be queried and manipulated.
        play_animation_instance<native><public> := class<epic_internal>:
            # Returns the state of the animation playback.
            GetState<native><public>()<transacts>:play_animation_state

            # Stops the animation.
            Stop<native><public>():void

            # Event triggered when the animation is completed.
            CompletedEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation is interrupted.
            InterruptedEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation has finished to blend out.
            BlendedInEvent<native><public>:listenable(tuple()) = external {}

            # Event triggered when the animation is beginning to blend out.
            BlendingOutEvent<native><public>:listenable(tuple()) = external {}

            # Helper function that waits for the animation to complete or be interrupted.
            Await<public>()<suspends>:play_animation_result = external {}

            # Helper function that succeeds if the state is Playing, BlendingIn, or BlendingOut.
            IsPlaying<public>()<transacts><decides>:void = external {}

        # The potential states of a play animation instance.
        play_animation_state<native><public> := enum:
            # The animation is blending in.
            BlendingIn
            # The animation has blended in, is playing, and has not begun blending out.
            Playing
            # The animation is playing and is blending out.
            BlendingOut
            # The animation completed successfully.
            Completed
            # The animation was stopped internally.
            Stopped
            # The animation was interrupted externally.
            Interrupted
            # An error occurred at creation or during playback.
            Error

        # Get the play_animation_controller for the specified character.
        (InCharacter:fort_character).GetPlayAnimationController<native><public>()<transacts><decides>:play_animation_controller

        @experimental
        @hide_in_editor
        npc_play_animation_component<native><epic_internal> := class<epic_internal>(ai_actions_component, play_animation_controller):
            PlayAndAwait<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {})<suspends>:play_animation_result = external {}

            Play<override>(AnimationSequence:animation_sequence, ?PlayRate:float = external {}, ?StartPositionSeconds:float = external {}, ?BlendInTime:float = external {}, ?BlendOutTime:float = external {}):play_animation_instance = external {}

            CanPlayAnimation<native><epic_internal>(AnimationSequence:animation_sequence)<transacts><decides>:void

            PlayAnimationInternal<native><epic_internal>(AnimationSequence:animation_sequence, PlayAnimationInstance:play_animation_instance, EndsOnBlendOut:logic, PlayRate:float, StartPositionSeconds:float, BlendInTime:float, BlendOutTime:float)<suspends>:play_animation_result

# Module import path: /Fortnite.com/AI
AI<public> := module:
    # Result of an action that cannot fail
    action_result<native><epic_internal> := enum:
        # The action has been successfully executed
        Success
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    # Result of an action that can fail
    fallible_action_result<native><epic_internal> := enum:
        # The action has been successfully executed
        Success
        # The action has failed during its execution
        Failure
        # The action has been canceled before completion
        Canceled
        # The action was not allowed to start
        Disallowed

    @experimental
    ai_component<native><epic_internal> := class<abstract>(component):


    @experimental
    ai_actions_component<native><epic_internal> := class<abstract>(ai_component):


    @experimental
    ai_target_component<native><epic_internal> := class<final>(component):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    # Result of a play emote action.
    play_emote_result<native><epic_internal> := enum:
        # The emote has been played successfully.
        Success
        # The character was not able to play the emote.
        Error
        # The emote has started but was interrupted before completion.
        Interrupted

    focus_interface<native><public> := interface<epic_internal>:
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<public>(Location:vector3)<suspends>:void

        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<public>(Agent:agent)<suspends>:void

    # Get the focus_interface interface for the specified character.
    (InCharacter:fort_character).GetFocusInterface<native><public>()<transacts><decides>:focus_interface

    @experimental
    @hide_in_editor
    fort_leashable_component<native><epic_internal> := class<epic_internal>(ai_component, fort_leashable):
        @experimental
        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<native><override>(Location:vector3, InnerRadius:float, OuterRadius:float):void

        @experimental
        # Set the agent to be the new center of the leash.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<native><override>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        @experimental
        # Removes the current leash.
        ClearLeash<native><override>():void

    fort_leashable<native><public> := interface<epic_internal>:
        # Set custom leash position.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashPosition<public>(Location:vector3, InnerRadius:float, OuterRadius:float):void

        # Set the agent to be the new center of the leash.
        #  'InnerRadius' ranges from 0.0 to 20000.0 (in centimeters).
        #  'OuterRadius' ranges from 0.0 to 20000.0 (in centimeters) and no less than 'InnerRadius'.
        SetLeashAgent<public>(Agent:agent, InnerRadius:float, OuterRadius:float):void

        # Removes the current leash.
        ClearLeash<public>():void

    # Get the current fort_leashable interface for the specified character.
    (InCharacter:fort_character).GetFortLeashable<native><public>()<transacts><decides>:fort_leashable

    @experimental
    @hide_in_editor
    # Fortnite NPC AI Management
    fort_guard_actions_component<native><epic_internal> := class(npc_actions_component):
        @experimental
        # Roam around the current position. Use the leash to specify the radius, else will roam anywhere.
        RoamAround<native><epic_internal>()<suspends>:navigation_result

        @experimental
        # Move in range to attack the current target
        MoveInRangeToAttack<native><epic_internal>()<suspends>:action_result

        @experimental
        # Change stance to crouch
        Crouch<native><epic_internal>()<suspends>:fallible_action_result

        @experimental
        # Go back to standing
        StandUp<native><epic_internal>():action_result

        @experimental
        # Change movement speed to sprint and switch to tactical sprint when energy is full.
        TacticalSprint<native><epic_internal>()<suspends>:action_result

        @experimental
        # Play a random emote from the character emotes bank
        PlayRandomEmote<native><epic_internal>()<suspends>:play_emote_result

        @experimental
        # Play an emote
        PlayEmote<native><epic_internal>(Emote:emote)<suspends>:play_emote_result

        @experimental
        # Revive the specified target
        Revive<native><epic_internal>(Target:agent)<suspends>:fallible_action_result

        @experimental
        # Attack the target
        Attack<native><epic_internal>(Target:target_info)<suspends>:action_result

        @experimental
        # Attack the navigation obstacle
        Attack<native><epic_internal>(Target:fort_obstacle_info)<suspends>:action_result

    @experimental
    @hide_in_editor
    fort_guard_perception_component<native><epic_internal> := class<epic_internal>(npc_perception_component):
        @experimental
        # Get information about the current target.
        GetCurrentTargetInfo<native><epic_internal>()<transacts><decides>:target_info

        @experimental
        # Get the current alert level of the guard.
        GetAlertLevel<native><epic_internal>()<transacts>:fort_guard_alert_level

        @experimental
        # Get the current alert level of a target for the guard.
        GetAlertLevel<native><epic_internal>(TargetInfo:target_info)<transacts>:fort_guard_alert_level

        @experimental
        # Event when the alert level of the guard has changed.
        AlertLevelChangedEvent<epic_internal>():listenable(fort_guard_alert_level) = external {}

        @experimental
        # Event when the current target has changed.
        CurrentTargetChangedEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Get the current sight settings of the guard for an alert level.
        GetSightSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level)<transacts>:sight_perception_settings

        @experimental
        # Set the current sight settings of the guard for an alert level.
        SetSightSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level, SightSettings:sight_perception_settings):void

        @experimental
        # Get the current hearing settings of the guard for an alert level.
        GetHearingSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level)<transacts>:hearing_perception_settings

        @experimental
        # Set the current hearing settings of the guard for an alert level.
        SetHearingSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level, HearingSettings:hearing_perception_settings):void

        @experimental
        # Get the current touch settings of the guard for an alert level.
        GetTouchSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level)<transacts>:touch_perception_settings

        @experimental
        # Set the current touch settings of the guard for an alert level
        SetTouchSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level, TouchSettings:touch_perception_settings):void

        @experimental
        # Get the current damage settings of the guard for an alert level.
        GetDamageSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level)<transacts>:damage_perception_settings

        @experimental
        # Set the current damage settings of the guard for an alert level.
        SetDamageSettings<native><epic_internal>(GuardAlertLevel:fort_guard_alert_level, DamageSettings:damage_perception_settings):void

        @experimental
        # Get information about the potential current obstacle
        GetObstacleInfo<native><epic_internal>()<transacts><decides>:fort_obstacle_info

        @experimental
        # Event when a new best obstacle is detected
        ObstacleChangedEvent<epic_internal>():listenable(fort_obstacle_info) = external {}

        CurrentTargetChangedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        AlertLevelChangedEventInternal<native><epic_internal>:subscribable_event(fort_guard_alert_level) = external {}

        ObstacleChangedEventInternal<native><epic_internal>:subscribable_event(fort_obstacle_info) = external {}

    navigation_target<native><public> := class<epic_internal>:


    # Generate a navigation_target from any position
    MakeNavigationTarget<native><public>(Position:vector3):navigation_target

    # Generate a navigation_target from an agent
    MakeNavigationTarget<native><public>(Target:agent):navigation_target

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

    movement_style<native><epic_internal> := enum:
        Walking
        Running

    movement_type<native><public> := class<concrete><final><computes><epic_internal>:
        MovementStyle<native><epic_internal>:movement_style = external {}

    # Module import path: /Fortnite.com/AI/movement_types
    movement_types<public> := module:
        Walking<public>:movement_type = external {}

        Running<public>:movement_type = external {}

    navigatable<native><public> := interface<epic_internal>:
        # Return the current destination of the character
        GetCurrentDestination<public>()<transacts><decides>:vector3

        # Navigate toward the specified target
        NavigateTo<public>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        # Stop navigation
        StopNavigation<public>():void

        # Wait for a specific duration
        Wait<public>(?Duration:float = external {})<suspends>:void

        # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
        SetMovementSpeedMultiplier<public>(Multiplier:float):void

    # Get the navigatable interface for the specified character
    (InCharacter:fort_character).GetNavigatable<native><public>()<transacts><decides>:navigatable

    @experimental
    @hide_in_editor
    # Fortnite NPC AI Management
    npc_actions_component<native><epic_internal> := class<epic_internal>(ai_actions_component, navigatable, focus_interface):
        @experimental
        # Return the current destination of the character
        GetCurrentDestination<native><override>()<transacts><decides>:vector3

        @experimental
        # Navigate toward the specified target
        NavigateTo<native><override>(Target:navigation_target, ?MovementType:movement_type = external {}, ?ReachRadius:float = external {}, ?AllowPartialPath:logic = external {})<suspends>:navigation_result

        @experimental
        # Apply a multiplier on the movement speed (Multiplier is clamped between 0.5 and 2)
        SetMovementSpeedMultiplier<native><override>(Multiplier:float):void

        @experimental
        # Stop navigation
        StopNavigation<native><override>():void

        @experimental
        # Wait for a specific duration
        Wait<native><override>(?Duration:float = external {})<suspends>:void

        @experimental
        # Look At specified location. Will never complete unless interrupted.
        MaintainFocus<native><override>(Location:vector3)<suspends>:void

        @experimental
        # Look At specified Agent. Will never complete unless interrupted.
        MaintainFocus<native><override>(Agent:agent)<suspends>:void

    # Inherit from this to create a custom NPC behavior.
    # The npc_behavior can be defined for a character in a CharacterDefinition asset, or in a npc_spawner_device.
    npc_behavior<native><public> := class<abstract>:
        # This function is called when the NPC is added to the simulation.
        OnBegin<native_callable><public>()<suspends>:void = external {}

        # This function is called when the NPC is removed from the simulation.
        OnEnd<native_callable><public>():void = external {}

        # Returns the agent associated with this behavior.
        GetAgent<native><public>()<transacts><decides>:agent

    # Returns the `npc_behavior` for `InAgent`.
    (InAgent:agent).GetNPCBehavior<native><public>()<transacts><decides>:npc_behavior

    @hide_in_editor
    @experimental
    npc_behavior_component<native><epic_internal> := class<epic_internal>(ai_component):
        @experimental
        NPCBehavior<native><public>:npc_behavior

    @experimental
    # Returns the `entity` for `InNPCBehavior`.
    (InNPCBehavior:npc_behavior).GetEntity<native><epic_internal>()<transacts>:entity

    @experimental
    @hide_in_editor
    npc_perception_component<native><epic_internal> := class<epic_internal>(ai_component):
        @experimental
        # Get information about all detected targets.
        GetDetectedTargets<native><epic_internal>()<transacts>:[]target_info

        @experimental
        # Get information about a specific agent.
        GetDetectedTarget<native><epic_internal>(Agent:agent)<transacts><decides>:target_info

        @experimental
        # Event when a target is added.
        TargetAddedEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Event when the info about a target has been updated.
        TargetInfoUpdatedEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Event when a target was removed.
        TargetRemovedEvent<epic_internal>():listenable(entity) = external {}

        @experimental
        # Event when a target is seen. Sight sense must be active.
        TargetSeenEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Event when a target is heard. Hearing sense must be active.
        TargetHeardEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Event when a target is touched. Touch sense must be active.
        TargetTouchedEvent<epic_internal>():listenable(target_info) = external {}

        @experimental
        # Get the current sight settings.
        GetSightSettings<native><epic_internal>()<transacts>:sight_perception_settings

        @experimental
        # Set the current sight settings.
        SetSightSettings<native><epic_internal>(SightSettings:sight_perception_settings):void

        @experimental
        # Get the current hearing settings.
        GetHearingSettings<native><epic_internal>()<transacts>:hearing_perception_settings

        @experimental
        # Set the current hearing settings.
        SetHearingSettings<native><epic_internal>(HearingSettings:hearing_perception_settings):void

        @experimental
        # Get the current touch perception settings.
        GetTouchSettings<native><epic_internal>()<transacts>:touch_perception_settings

        @experimental
        # Set the current touch perception settings.
        SetTouchSettings<native><epic_internal>(TouchSettings:touch_perception_settings):void

        @experimental
        # Get the current damage perception settings.
        GetDamageSettings<native><epic_internal>()<transacts>:damage_perception_settings

        @experimental
        # Set the current damage perception settings.
        SetDamageSettings<native><epic_internal>(DamageSettings:damage_perception_settings):void

        TargetAddedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetInfoUpdatedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetRemovedEventInternal<native><epic_internal>:subscribable_event(entity) = external {}

        TargetSeenEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetHeardEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

        TargetTouchedEventInternal<native><epic_internal>:subscribable_event(target_info) = external {}

    @experimental
    # The different alert levels of a guard.
    fort_guard_alert_level<native><epic_internal> := enum:
        # The guard has not detected any hostile target.
        Unaware
        # The guard has seen a hostile target but hasn't identified it yet.
        Suspicious
        # The guard has identified a hostile target but can't see it any more.
        LostTarget
        # The guard has identified a hostile target.
        Alerted

    @experimental
    # Information about a perceived target.
    target_info<native><epic_internal> := struct<epic_internal>:
        @experimental
        # The source of the detection stimuli.
        Target<native><public>:entity

        @experimental
        # True if the target can be seen.
        HasLineOfSight<native><public>:logic

        @experimental
        # Attitude toward this target.
        Attitude<native><public>:team_attitude

        LastKnownPosition<native><public>:vector3 = external {}

        AlertLevel<native><public>:fort_guard_alert_level = external {}

    @experimental
    fort_obstacle_status<native><epic_internal> := enum:
        incoming_obstacle
        blocked_by_obstacle
        trap_obstacle

    @experimental
    fort_obstacle_info<native><epic_internal> := struct<epic_internal>:
        @experimental
        Location<native><public>:vector3

        @experimental
        Status<native><public>:fort_obstacle_status

        @experimental
        Obstacle<native><public>:entity

    @experimental
    # Get the last known position of the target.
    (InTarget:target_info).GetLastKnownPosition<native><epic_internal>()<transacts>:vector3

    @experimental
    # Create a `navigation_target` from a `target_info`.
    MakeNavigationTarget<native><epic_internal>(TargetInfo:target_info):navigation_target

    @experimental
    # Perception settings for sight.
    sight_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Maximum sight distance in meters to notice a target.
        # This value will be clamped between 0 and 300 meters.
        SightRadius<native><public>:float = external {}

        @experimental
        @editable
        # Maximum sight distance in meters to keep on seeing a target.
        # This value will be clamped between 'SightRadius' and 300 meters.
        LoseSightRadius<native><public>:float = external {}

        @experimental
        @editable
        # How far to the side AI can see, in radians.
        # The value represents the angle measured in relation to the forward vector, not the whole range.
        PeripheralVisionAngle<native><public>:float = external {}

        @experimental
        @editable
        # Specifies duration in seconds after sight stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if sight is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for hearing.
    hearing_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Maximum hearing distance in meters to notice a target.
        HearingRange<native><public>:float = external {}

        @experimental
        @editable
        # Specifies duration in seconds after audio stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if hearing is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for touch.
    touch_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Specifies duration in seconds after touch stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if touch perception is enabled.
        SenseEnabled<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect enemies.
        EnemiesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect friendlies.
        FriendliesDetected<native><public>:logic = external {}

        @experimental
        @editable
        # Specifies if this sense is able to detect neutral targets.
        NeutralsDetected<native><public>:logic = external {}

    @experimental
    # Perception settings for damage.
    damage_perception_settings<native><epic_internal> := class<final><concrete>:
        @experimental
        @editable
        # Specifies duration in seconds after damage stimuli generated by this sense become forgotten. 0 means never.
        MaxStimulusDuration<native><public>:float = external {}

        @experimental
        @editable
        # Specifies if damage perception is enabled.
        SenseEnabled<native><public>:logic = external {}