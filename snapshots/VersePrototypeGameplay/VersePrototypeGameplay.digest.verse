using {/UnrealEngine.com/VGameplayRst/Components}
using {/Verse.org/Assets}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/VGameplayRst/Transform}
using {/UnrealEngine.com/VGameplayRst/Physics}
using {/UnrealEngine.com/VGameplayRst/Geometry}
using {/Verse.org/VerseEngine/Entity}
using {/UnrealEngine.com/VGameplayRst/GameObjects}
# Module import path: /UnrealEngine.com/Tests/VersePrototypeGameplay
VersePrototypeGameplay<public> := module:
    model_advanced<public> := class<internal>(mutable_model_interface):
        GetEntity<public>():vk_entity = external {}

        GetMeshComponent<public>():fixed_mesh_component = external {}

        GetCollisionComponent<public>():vk_collision_component = external {}

        GetPositionComponent<public>():position_component = external {}

        GetRotationComponent<public>():rotation_component = external {}

        Show<public>():void = external {}

        Hide<public>():void = external {}

        EnableCollision<public>():void = external {}

        DisableCollision<public>():void = external {}

        IsVisible<public>():logic = external {}

        GetPosition<override>()<transacts>:vector3 = external {}

        SetPosition<override>(NewPosition:vector3)<transacts>:void = external {}

        Rotation<override>()<transacts>:rotation = external {}

        ForwardVector<override>()<transacts>:vector3 = external {}

        UpVector<override>()<transacts>:vector3 = external {}

        RightVector<override>()<transacts>:vector3 = external {}

        SetRotation<override>(r:rotation)<transacts>:void = external {}

        ApplyAdditionalRotation<override>(r:rotation):void = external {}

        SetForwardVectorFromXY<override>(x:vector3, y:vector3):void = external {}

        GetScale<override>()<transacts>:vector3 = external {}

        SetScale<override>(NewScale:vector3)<transacts>:void = external {}

        GetTransform<public>():transform = external {}

        SetTransform<public>(NewTransform:transform):void = external {}

        Destroy<public>():void = external {}

    CreateModelAdvanced<public>(Entity:vk_entity):?model_advanced = external {}

    CreateModelAdvanced<public>(TagToFind:tag):?model_advanced = external {}

    CreateModelAdvanced<public>(InEntity:vk_entity, AddComponentClasses:[]subtype(vk_component)):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(InTransform:transform, Name:string, Mesh:mesh):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(AddComponentClasses:[]subtype(vk_component), InTransform:transform, Name:string, Mesh:mesh):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(InTransform:transform, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(AddComponentClasses:[]subtype(vk_component), InTransform:transform, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(InPosition:vector3, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(InPosition:vector3, InRotation:rotation, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(InPosition:vector3, InRotation:rotation, InScale:vector3, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    CreateModelAdvanced<epic_internal>(AddComponentClasses:[]subtype(vk_component), InPosition:vector3, InRotation:rotation, InScale:vector3, Name:string, Mesh:mesh, Material:material):?model_advanced = external {}

    # This method is used for calculating the cost from the specified node to the target position. See SimpleManhattanDistance2D for an example.
    navigation_cost_delegate<public> := type {__(:vector2i, :vector2i)<transacts>:float}

    # Interface used for determining if a specific grid cell is considered occupied.
    i_grid_occupancy<public> := interface:
        # Fails if the grid location is not occupied.
        IsOccupied<public>(Location:vector2i)<transacts><decides>:void

    # Build a path from the StartLocation to the EndLocation using GridSize and GridOccupany.
    BuildPathUsingAStarSimple<public>(GridOccupancy:i_grid_occupancy, GridSize:vector2i, StartLocation:vector2i, EndLocation:vector2i)<transacts><decides>:[]vector2i = external {}

    build_path_astar_args<public> := struct:
        GridOccupancy<public>:i_grid_occupancy

        GridSize<public>:vector2i

        StartLocation<public>:vector2i

        EndLocation<public>:vector2i

        EstimatedNavigationCost<public>:navigation_cost_delegate

        ActualNavigationCost<public>:navigation_cost_delegate

    # Build a path from the StartLocation to the EndLocation using GridSize, GridOccupany, and navigation cost hueristics. Pop from the returned object_stack like so: "{if (Node:= i_nav_grid_node_2d[ReturnedPath.Pop[]]) #Use Node.GetLocation() }"
    BuildPathUsingAStar<public>(Args:build_path_astar_args)<transacts><decides>:[]vector2i = external {}

    SimpleManhattanDistance2D<public>(NodePosition:vector2i, NavTargetPosition:vector2i)<transacts>:float = external {}

    SimpleDistanceNavCost<public>(NodePosition:vector2i, NeighborPosition:vector2i)<transacts>:float = external {}

    simple_grid_occupancy<public> := class(i_grid_occupancy):
        var OccupancyGrid<public>:[][]logic

        var GridSize<public>:int

        Init<public>(InGridSize:int):void = external {}

        IsOccupied<override>(Location:vector2i)<transacts><decides>:void = external {}

        SetOccupancy<public>(X:int, Y:int, Occupied:logic):void = external {}

    simple_gameplay_script_component<public> := class(script_component):
        OnCreate<final><override>():void = external {}

        OnPostCreate<final><override>():void = external {}

        OnBegin<final><override>():void = external {}

        HandleOnCreate<protected>():void = external {}

        HandleOnPostCreate<protected>():void = external {}

        HandleOnBegin<protected>():void = external {}

        Show<public>():void = external {}

        Hide<public>():void = external {}

        EnableCollision<public>():void = external {}

        DisableCollision<public>():void = external {}

        IsVisible<public>():logic = external {}

        GetPosition<public>()<transacts>:vector3 = external {}

        SetPosition<public>(NewPosition:vector3)<transacts>:void = external {}

        AddToPosition<public>(NewPosition:vector3):void = external {}

        GetRotation<public>():rotation = external {}

        SetRotation<public>(NewRotation:rotation)<transacts>:void = external {}

        ApplyAdditionalRotation<public>(RotationToAdd:rotation):void = external {}

        GetScale<public>()<transacts>:vector3 = external {}

        SetScale<public>(NewScale:vector3):void = external {}

        SetMaterial<epic_internal>(NewMaterial:material):void = external {}

        SetDefaultMesh<public>(DefaultMesh:default_mesh_type):void = external {}

        SetMesh<epic_internal>(Mesh:mesh):void = external {}

        GetTransform<public>():transform = external {}

        SetTransform<public>(NewTransform:transform):void = external {}