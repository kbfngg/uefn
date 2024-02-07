using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Component}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/Temporary/Curves}
# Module import path: /UnrealEngine.com/Engine/VerseMovement
VerseMovement<public> := module:
    # Module import path: /UnrealEngine.com/Engine/VerseMovement/VerseMovementUtil
    VerseMovementUtil<public> := module:
        CarConfig<public>:move_config = external {}

    move_trigger_type<native><public> := enum:
        Input
        Constraint
        Physics
        Trace
        Constant
        move_trigger_type_MAX

    move_response_type<native><public> := enum:
        Linear
        Angular
        move_response_type_MAX

    move_response_frame<native><public> := enum:
        Absolute
        move_response_frame_Object
        move_response_frame_Camera
        move_response_frame_MAX

    move_response_effect<native><public> := enum:
        Force
        VelocityChange
        Transform
        move_response_effect_MAX

    move_response_modifier<native><public> := enum:
        move_response_modifier_Add
        TargetTransform
        TargetVelocity
        OverrideTransform
        OverrideVelocity
        move_response_modifier_MAX

    move_input_trigger_params<native><public> := struct<computes>:
        IsAxis<native><public>:logic = external {}

        Name<native><public>:[]char = external {}

        AxisToMagnitudeCurve<native><public>:?editable_curve = external {}

        AccumulateAxisInput<native><public>:logic = external {}

        ClampAxis<native><public>:vector2 = external {}

    move_physics_trigger_params<native><public> := struct<computes>:
        SpeedInDirection<native><public>:vector3 = external {}

    move_trace_trigger_params<native><public> := struct<computes>:
        Direction<native><public>:vector3 = external {}

        Frame<native><public>:move_response_frame = external {}

        TraceLength<native><public>:float = external {}

        ProportionalToHitDistance<native><public>:logic = external {}

        HitDistanceToMagnitudeCurve<native><public>:?editable_curve = external {}

    move_trigger<native><public> := struct<computes>:
        Type<native><public>:move_trigger_type = external {}

        InputParams<native><public>:move_input_trigger_params = external {}

        PhysicsParams<native><public>:move_physics_trigger_params = external {}

        TraceParams<native><public>:move_trace_trigger_params = external {}

    move_response<native><public> := struct<computes>:
        Vector<native><public>:vector3 = external {}

        Magnitude<native><public>:float = external {}

        MagnitudeCurve<native><public>:?editable_curve = external {}

        Type<native><public>:move_response_type = external {}

        Frame<native><public>:move_response_frame = external {}

        Effect<native><public>:move_response_effect = external {}

        Modifier<native><public>:move_response_modifier = external {}

        ClampVector<native><public>:vector3 = external {}

        ClampFrame<native><public>:move_response_frame = external {}

    move_config_entry<native><public> := struct<computes>:
        Name<native><public>:[]char = external {}

        Triggers<native><public>:[]move_trigger = external {}

        Responses<native><public>:[]move_response = external {}

    move_config<native><public> := struct<computes>:
        Entries<native><public>:[]move_config_entry = external {}

    move_config_asset<native><public> := class(asset):


    movement_component<native><epic_internal> := class<unique>(component):
        SetEnabled<native><public>(Enabled:logic):void

        SetConfig<native><public>(Config:move_config_asset):void

        SetConfig<native><public>(Config:move_config):void

        SetPosition<native><public>(Position:vector3):void

        SetRotation<native><public>(Rotation:rotation):void

        SetVelocity<native><public>(Velocity:vector3):void

        AddImpulse<native><public>(Impulse:vector3):void

        AddAngularImpulse<native><public>(Impulse:vector3):void

        EnableInput<native><public>(ThePlayer:player_component):void

        DisableInput<native><public>(ThePlayer:player_component):void

    GetPlayerMoveComponent<native><epic_internal>(Player:player_component)<transacts><decides>:movement_component