using {/Verse.org/VerseEngine/Component}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /UnrealEngine.com/EpicGamesRestricted
EpicGamesRestricted<public> := module:
    # Module import path: /UnrealEngine.com/EpicGamesRestricted/Spline
    Spline<public> := module:
        spline_query_result<native><public> := struct:
            out_transform<native><public>:transform

            tangent<native><public>:vector3

        spline_component<native><public> := class<final>(vk_component):
            # Returns the length of the spline
            GetSplineLength<native><public>():float

            # Given a distance along the length of this spline, return the associated data values at that point
            QueryAtDistanceAlongSpline<native><public>(DistanceAlongSpline:float, bIsWorldSpace:logic)<transacts><decides>:spline_query_result

            # Given a time from 0 to the spline duration, return the corresponding data values at that point
            QueryAtTime<native><public>(Time:float, bIsWorldSpace:logic)<transacts><decides>:spline_query_result

            # Given a world position, find the closest spline input key
            FindClosestInputKeyToWorldPosition<native><public>(Position:vector3)<transacts><decides>:float

            # Given a spline input key, find the spline distance
            FindDistanceAlongSplineAtInputKey<native><public>(InputKey:float)<transacts><decides>:float

            # Given a spline input key, find the spline distance
            GetInputKeyAtDistanceAlongSpline<native><public>(DistanceAlongSpline:float)<transacts><decides>:float

    # Module import path: /UnrealEngine.com/EpicGamesRestricted/Network
    Network<public> := module:
        @attribscope_data
        @customattribhandler
        replicated_attribute<epic_internal> := class(attribute):


        replicated<epic_internal>(ReplicationArgs:string)<computes>:replicated_attribute