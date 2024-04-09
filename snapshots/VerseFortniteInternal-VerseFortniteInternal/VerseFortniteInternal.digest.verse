using {/Verse.org/Assets}
using {/UnrealEngine.com/Playspace}
using {/Fortnite.com/Game/Player}
using {/Verse.org/Colors}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/VerseEngine/Component}
# Module import path: /Fortnite.com/Game
Game<public> := module:
    # Module import path: /Fortnite.com/Game/StormController
    StormController<public> := module:
        storm_controller_component<native><public> := class<final>(vk_component):
            begin<native><public>():void

            end<native><public>():void

            pause<native><public>():void

            reset<public>():void = external {}

            setBattleRoyalePhases<public>():void = external {}

            exists<native><public>():logic

            var startRadius<native><public>:float

            var boundsRadius<native><public>:float

            var phases<native><public>:[]storm_phase

        storm_phase<native><public> := class<final>:
            waitTime<native><public>:float = external {}

            shrinkTime<native><public>:float = external {}

            endRadius<native><public>:float = external {}

            endRadiusPercentage<native><public>:float = external {}

            damageIndex<native><public>:int = external {}

            moves<native><public>:logic = external {}

            minMovementDistance<native><public>:float = external {}

            maxMovementDistance<native><public>:float = external {}

            minMovementDistancePercentage<native><public>:float = external {}

            maxMovementDistancePercentage<native><public>:float = external {}

            endLocation<native><public>:vector3

    # Module import path: /Fortnite.com/Game/Player
    Player<public> := module:
        fort_player_component<native><public> := class(player_component):
            PushActiveState<native><public>(stateToAdd:string):logic

            PopActiveState<native><public>(stateToRemove:string):logic

            IsActive<native><public>(state:string):logic

            GetUniqueID<native><public>():string

        # Fortnite player attributes
        PlayerAttribute<native><public> := enum:
            # Fortnite current player health
            CurrentHealth
            # Fortnite currentplayer shield
            CurrentShield
            # Fortnite initial player health
            InitialHealth
            # Fortnite initial player health
            InitialShield
            # Fortnite transient player damage
            Damage
            # Fortnite transient player shield damage
            ShieldDamage

        # Fortnite player attribute operations
        PlayerAttributeOperation<native><public> := enum:
            Add
            Multiply
            Divide
            Override
            SetMax
            SetMin

        # Module import path: /Fortnite.com/Game/Player/PlayerAttributes
        # Fortnite player attribute utility module
        PlayerAttributes<public> := module:
            # Modify the specified player attribute.
            ModifyNumericAttribute<native><public>(TargetPlayer:player, attributeID:PlayerAttribute, op:PlayerAttributeOperation, amount:float):void

            # Add to the specified player attribute.
            AddToNumericAttribute<native><public>(TargetPlayer:player, attributeID:PlayerAttribute, amount:float):void

            # Get the specified player attribute.
            GetNumericAttributeValue<native><public>(TargetPlayer:player, attributeID:PlayerAttribute):float

        # Module import path: /Fortnite.com/Game/Player/PlayerInventory
        PlayerInventory<public> := module:
            # Add an inventory item to a player
            TryAddToInventory<native><public>(PlayerHandle:player, AssetPath:string, Quantity:int, NotifyPlayerClient:logic):void

            # Add an inventory item to a player
            TryAddItemToInventory<native><public>(PlayerHandle:player, ItemDefinition:fort_item_definition, Quantity:int, NotifyPlayerClient:logic)<transacts><decides>:void

            # Remove an inventory item from a player
            RemoveFromInventory<native><public>(PlayerHandle:player, AssetPath:string, Quantity:int):logic

            # Clear all droppable items from a player inventory
            ClearDroppableItems<native><public>(PlayerHandle:player):void

        # Module import path: /Fortnite.com/Game/Player/PlayerInvulnerable
        # Player Invulnerability Utilities
        PlayerInvulnerable<public> := module:
            # Set player invulnerability state
            SetPlayerInvulnerability<native><public>(InPlayer:player, IsInvulnerable:logic):void

            # Gets players current invulnerability state
            IsPlayerInvulnerable<native><public>(InPlayer:player)<decides>:void

        # Module import path: /Fortnite.com/Game/Player/PlayerSpectator
        # Player Spectator Utilities
        PlayerSpectator<public> := module:
            # Sets a player to spectator
            SetSpectator<native><public>(InPlayer:player)<transacts><decides>:void

            # Sets who a player should spectate
            SpectatePlayer<native><public>(InPlayer:player, PlayerToSpectate:player)<transacts><decides>:void

            # Sets the player's eliminator as who a player should spectate
            SpectateEliminator<native><public>(InPlayer:player)<transacts><decides>:void

            # Returns array of players currently spectating this player
            GetPlayersSpectatingTarget<native><public>(TargetPlayer:player)<transacts>:[]player

        player_start_component<native><public> := class<final>(vk_component):
            @editable
            var tags<native><public>:[]string

            addTags<native><public>(newTags:[]string):void

            getPosition<native><public>():vector3

        # Module import path: /Fortnite.com/Game/Player/PlayerStartComponent
        PlayerStartComponent<public> := module:
            findAllInPlayspaceWithTags<native><epic_internal>(contextObject:vk_component, searchTags:[]string):[]player_start_component

        # Module import path: /Fortnite.com/Game/Player/PlayerStasis
        # Player stasis utilities
        PlayerStasis<public> := module:
            # Put the specified player into stasis
            PutInStasis<native><public>(TargetPlayer:player):void

            # Put the specified player into stasis, with options to set what is allowed in stasis. NOTE: Allowing turning currently also allows falling.
            PutInStasisAdvanced<native><public>(InPlayer:player, AllowTurning:logic, AllowFalling:logic, AllowEmotes:logic):void

            # Release the player from stasis
            ReleaseFromStasis<native><public>(TargetPlayer:player):void

        player_status_type<native><epic_internal> := enum:
            OnGround
            Skydiving
            UsingGlider
            InVehicle
            Shooting
            AimingDownSights
            InStasis

        # Module import path: /Fortnite.com/Game/Player/PlayerStatus
        PlayerStatus<epic_internal> := module:
            getStatus<native><public>(TargetPlayer:player_component, statusType:player_status_type):logic

        # Player Team
        player_team<native><public> := struct:


        # Module import path: /Fortnite.com/Game/Player/PlayerTeam
        # Fornite Team Utilities
        PlayerTeam<public> := module:
            # Returns true if the teams are the same.
            Equals<native><public>(Team1:player_team, Team2:player_team)<computes>:logic

            # Set the player team. Returns true if the team was set. False otherwise.
            SetTeam<native><public>(InPlayer:player, Team:player_team):logic

            # Get the player team
            GetTeam<native><public>(TargetPlayer:player):player_team

            # Pick a team for the player
            PickTeam<native><public>(TargetPlayer:player, PreferredTeam:player_team):player_team

            # Get the first team
            GetFirstTeam<native><public>()<converges>:player_team

            # Get the next team
            GetNextTeam<native><public>(Team:player_team)<converges>:player_team

            # Get the invalid team
            GetInvalidTeam<native><public>()<converges>:player_team

            # Returns the color for a team
            GetTeamColor<native><epic_internal>(Team:player_team):color

            # Returns the size of a team
            GetTeamSize<native><public>(Team:player_team):int

            # Returns a team's members
            GetTeamMembers<native><public>(Team:player_team):[]player

            # Succeeds if the team contains human players.
            ContainsHumanPlayers<native><public>(Team:player_team)<decides>:void

        # Module import path: /Fortnite.com/Game/Player/PlayerTravel
        # Method to control a player's travel in the game client
        PlayerTravel<public> := module:
            # Send the specified player back to the main game lobby
            SendToLobby<native><public>(TargetPlayer:player):void

        # Module import path: /Fortnite.com/Game/Player/PlayerVisibility
        # Player visibility utilities.
        PlayerVisibility<public> := module:
            # Hide the specified player from view
            SetIsHidden<native><public>(InPlayer:player, IsHidden:logic):void

    # Module import path: /Fortnite.com/Game/Movement
    Movement<public> := module:
        projectile_movement_component<native><public> := class<final>(vk_component):
            SetDirection<native><public>(Direction:vector3):void

            SetSpeed<native><public>(Speed:float):void

            SetGravity<native><public>(Gravity:float):void

            SetShouldBounce<native><public>(ShouldBounce:logic):void

            SetBounciness<native><public>(Bounciness:float):void

            SetFriction<native><public>(Friction:float):void

    # Module import path: /Fortnite.com/Game/Item
    Item<public> := module:
        item_type<native><public> := class:


        player_pickup_component<native><epic_internal> := class(vk_component):
            givePickupTo<native><public>(TargetPlayer:player_component):void

            tossPickup<native><public>(finalLocation:vector3, owner:?player_component):void

            getNumOfItemType<native><public>(Type:item_type):int

            attemptPartialCollect<native><public>(Type:item_type, count:int, TargetPlayer:player_component):void

            getPrimaryItemType<native><public>():item_type

        # Module import path: /Fortnite.com/Game/Item/PlayerPickupComponent
        PlayerPickupComponent<epic_internal> := module:
            createPickup<native><epic_internal>(contextObject:vk_component, itemDefinition:fort_item_definition, count:int, location:vector3):?player_pickup_component

    match_stats<native><public> := class<final>(stat_container):
        SetPlayerStat<native><public>(InPlayer:player, StatIndex:int, NewValue:int):void

        GetPlayerStat<native><public>(InPlayer:player, StatIndex:int)<transacts>:int

        IncrementPlayerStat<native><public>(InPlayer:player, StatIndex:int, Increase:int):logic

        SetTeamStat<native><public>(Team:player_team, StatIndex:int, NewValue:int):void

        GetTeamStat<native><public>(Team:player_team, StatIndex:int):int

        IncrementTeamStat<native><public>(Team:player_team, StatIndex:int, Increase:int):logic

        SetMatchStat<native><public>(StatIndex:int, NewValue:int):void

        GetMatchStat<native><public>(StatIndex:int):int

        IncrementMatchStat<native><public>(StatIndex:int, Increase:int):logic

        Reset<native><public>():void

    # A stat container that is associated with a particular player.
    player_stat_values<native><public> := class<final>(stat_container):
        # The player this collection of stats is for.
        OwningPlayer<native><public>:player

    # A container object that stores a collection of stats
    stat_container<native><public> := class:
        # Get a player stat value.
        GetStatValue<native><public>(StatIndex:int):int

        # Returns true if the player stat was successfully set or updated.
        SetStatValue<native><public>(StatIndex:int, NewValue:int):logic

        # Returns true if the player stat was successfully updated (increment can be negative!).
        IncrementStat<native><public>(StatIndex:int, IncrementAmount:int):logic

    team_stat_values<native><public> := class<final>(stat_container):
        # The team this collection of stats corresponds to.
        Team<native><public>:player_team

        SetPlayerStat<native><public>(InPlayer:player, StatIndex:int, NewValue:int):void

        GetPlayerStat<native><public>(InPlayer:player, StatIndex:int)<transacts>:int

        IncrementPlayerStat<native><public>(InPlayer:player, StatIndex:int, Increase:int):logic

    PlayerSettingState<native><public> := enum:
        PlayerDefault
        PlayerAllow
        PlayerDisallow

    fort_building_settings_component<native><public> := class<final>(vk_component):
        setBuilding<native><public>(state:PlayerSettingState):void

        setBuildingOnWater<native><public>(state:PlayerSettingState):void

        setEditing<native><public>(state:PlayerSettingState):void

        setEditingHostile<native><public>(state:PlayerSettingState):void

        setTrapPlacement<native><public>(state:PlayerSettingState):void

    fort_playspace_component<native><epic_internal> := class(playspace_component):
        _WaitForPlayerEliminated<native><public>()<suspends>:player_eliminated_result

    player_eliminated_result<native><epic_internal> := class:
        EliminatedPlayer<native><public>:player_component

        Eliminator<native><public>:?player_component

    # Module import path: /Fortnite.com/Game/VerseFortniteHacks
    VerseFortniteHacks<epic_internal> := module:
        getAllComponentsOfType<native><epic_internal>(contextObject:vk_component, Type:subtype(vk_component)):[]vk_component

        respawnPlayer<native><public>(TargetPlayer:player_component, spawnPoint:player_start_component):void

        setAutoRespawnEnabled<native><epic_internal>(contextObject:vk_component, Enabled:logic):void

        GetPawnCollisionEntityID<native><public>(__dupe___unnamed_parameter_169:player_component):int

    fortnite_building_component<native><public> := class<final>(vk_component):
        wasPlayerBuilt<native><public>()<transacts>:logic

        canBeDamaged<native><public>():logic

        canBeReplaced<native><public>():logic

        setCanBeDamaged<native><public>(canDamage:logic):void

        setCanBeReplaced<native><public>(canReplace:logic):void

    fort_item_definition<native><public> := class<computes>(asset):
