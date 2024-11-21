using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /UnrealEngine.com/Tests/VersePrototypeGameplay
VersePrototypeGameplay<public> := module:
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