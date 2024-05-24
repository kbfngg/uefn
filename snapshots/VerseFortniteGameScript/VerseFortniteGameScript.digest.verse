using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/UnrealEngine.com/VGameplayRst/Messaging}
using {/UnrealEngine.com/VGameplayRst/Components}
using {/Verse.org/Assets}
using {/UnrealEngine.com/VGameplayRst/Transform}
using {/UnrealEngine.com/VGameplayRst/Physics}
using {/UnrealEngine.com/VGameplayRst/Geometry}
using {/Fortnite.com/Game/Player}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Simulation}
using {/Fortnite.com/Game}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/VerseEngine/Entity}
# Module import path: /Fortnite.com/VerseFortniteGameScript
VerseFortniteGameScript<public> := module:
    fort_scene_object<public> := class<internal>:
        GetEntity<public>():vk_entity = external {}

        GetPosition<public>():vector3 = external {}

        SetPosition<public>(NewPosition:vector3)<transacts>:void = external {}

        GetRotation<public>():rotation = external {}

        SetRotation<public>(NewRotation:rotation):void = external {}

        GetScale<public>():vector3 = external {}

        SetScale<public>(NewScale:vector3):void = external {}

        GetTransform<public>():transform = external {}

        SetTransform<public>(NewTransform:transform):void = external {}

    # Module import path: /Fortnite.com/VerseFortniteGameScript/FortSceneObject
    FortSceneObject<public> := module:
        MakeFromEntity<public>(Entity:vk_entity):?fort_scene_object = external {}

    fort_playspace_player_helper<epic_internal> := class:
        Init<public>(InPlayspace:fort_playspace_component):void = external {}

        GetAll<public>()<transacts>:[]player_component = external {}

        CountAll<public>()<transacts>:int = external {}

        GetSpectators<public>():[]player_component = external {}

        CountSpectators<public>():int = external {}

        GetActive<public>():[]player_component = external {}

        CountActive<public>()<transacts>:int = external {}

        SpectateAny<public>(PlayerHandle:player):void = external {}

        SpectatePlayer<public>(PlayerHandle:player, Target:player)<transacts><decides>:void = external {}

        SpectateEliminator<public>(PlayerHandle:player)<transacts><decides>:void = external {}

        GetPlayersSpectatingTarget<public>(Target:player)<transacts>:[]player = external {}

        GetPlayerStarts<public>():[]vk_component = external {}

        ResetHealth<public>(PlayerHandle:player):void = external {}

        SetCurrentHealth<public>(PlayerHandle:player, HealthValue:float):void = external {}

        ResetShield<public>(PlayerHandle:player):void = external {}

        SetCurrentShield<public>(PlayerHandle:player, ShieldValue:float):void = external {}

        Respawn<public>(PlayerArg:player_component, SpawnPoint:player_start_component):void = external {}

        PutInStasis<public>(PlayerHandle:player):void = external {}

        PutInStasisWithEmotes<public>(PlayerHandle:player):void = external {}

        ReleaseFromStasis<public>(PlayerHandle:player):void = external {}

        PutAllInStasis<public>():void = external {}

        PutAllInStasisAllowEmotes<public>():void = external {}

        RemoveAllFromStasis<public>():void = external {}

        SetIsHidden<public>(PlayerHandle:player, IsHidden:logic):void = external {}

        SendToLobby<public>(PlayerHandle:player):void = external {}

        SendAllToLobby<public>():void = external {}

        SetAllInRound<public>():void = external {}

        SetAllEndRound<public>():void = external {}

        SetInvulnerable<public>(PlayerHandle:player, IsInvulnerable:logic):void = external {}

        SetAllInvulnerable<public>(IsInvulnerable:logic):void = external {}

        SetTeam<public>(PlayerHandle:player, Team:player_team):void = external {}

        GetTeam<public>(PlayerHandle:player):player_team = external {}

        ClearInventory<public>(PlayerHandle:player):void = external {}

        AddToInventory<public>(PlayerHandle:player, ItemDefinition:fort_item_definition, Quantity:int, NotifyPlayerClient:logic)<transacts><decides>:void = external {}

        SetInRound<public>(PlayerArg:player_component):void = external {}

        SetEndRound<public>(PlayerArg:player_component):void = external {}

        GetPawnCollisionEntityID<public>(PlayerArg:player_component):int = external {}

    fort_model<public> := class<internal>:
        GetEntity<public>()<transacts>:vk_entity = external {}

        GetMeshComponent<public>():fixed_mesh_component = external {}

        GetCollisionComponent<public>()<transacts>:vk_collision_component = external {}

        GetPositionComponent<public>()<transacts>:position_component = external {}

        GetRotationComponent<public>()<transacts>:rotation_component = external {}

        Show<public>():void = external {}

        Hide<public>():void = external {}

        EnableCollision<public>():void = external {}

        DisableCollision<public>():void = external {}

        IsVisible<public>():logic = external {}

        GetPosition<public>()<transacts>:vector3 = external {}

        SetPosition<public>(NewPosition:vector3)<transacts>:void = external {}

        GetRotation<public>():rotation = external {}

        SetRotation<public>(NewRotation:rotation)<transacts>:void = external {}

        GetScale<public>()<transacts>:vector3 = external {}

        SetScale<public>(NewScale:vector3)<transacts>:void = external {}

        GetTransform<public>():transform = external {}

        SetTransform<public>(NewTransform:transform):void = external {}

    # Module import path: /Fortnite.com/VerseFortniteGameScript/FortModel
    FortModel<public> := module:
        MakeFromEntity<public>(Entity:vk_entity):?fort_model = external {}

        MakeFromStaticMesh<epic_internal>(InTransform:transform, Name:string, Mesh:mesh):?fort_model = external {}

        MakeFromStaticMeshAndMaterial<epic_internal>(InTransform:transform, Name:string, Mesh:mesh, Material:material):?fort_model = external {}

    fort_game_script_base<epic_internal> := class<abstract>(script_component):
        var FortPlayspace<public>:?fort_playspace_component

        var FortBuildingSettings<epic_internal>:?fort_building_settings_component

        var DebugCommands<epic_internal>:?debug_command_component

        var Players<epic_internal>:?fort_playspace_player_helper

        OnCreate<override>():void = external {}

        OnPostCreate<override>():void = external {}

        OnInitialize<protected>():void = external {}

        OnBegin<override>():void = external {}

        IsSoloGame<protected>()<transacts>:logic = external {}

        LogMessage<epic_internal>(VLogLevel:log_level, InChannel:subtype(log_channel), Message:string, ShowOnScreen:logic, InColor:color, InDuration:float):void = external {}

        HACK_getAllScriptObjectsOfType<protected>(Type:subtype(vk_component)):[]vk_component = external {}

        OnMatchBegin<protected>():void = external {}

        OnPlayerEliminated<protected>(ElimResult:player_eliminated_result):void = external {}

        OnPlayerJoined<protected>(__dupe___unnamed_parameter_214:player_component):void = external {}

        WaitForDebugCommand<protected>(CommandId:string)<suspends>:string = external {}

        OnPlayerLeft<protected>(__dupe___unnamed_parameter_215:player_component):void = external {}

        SetBuildingAllowed<protected>():void = external {}

        SetBuildingDisallowed<protected>():void = external {}

        CreateStormController<protected>(Location:vector3):void = external {}

    # Module import path: /Fortnite.com/VerseFortniteGameScript/fort_constants
    fort_constants<public> := module:
