using {/Verse.org/Simulation}
using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/UnrealEngine.com/Temporary/SceneGraph}
# Module import path: /UnrealEngine.com/VerseCamera
VerseCamera<public> := module:
    camera_behavior_component<native><epic_internal> := class(component):
        @replicated("")
        var CameraDirector<native><public>:camera_director_interface = external {}

        @replicated("")
        var DefaultEvaluatorContext<native><public>:?camera_evaluator_context = external {}

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    camera_component<native><epic_internal> := class(basic_camera_component):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    camera_layer_tag<native><epic_internal> := class(tag):


    camera_layer_gameplay_tag<native><epic_internal> := class(camera_layer_tag):


    camera_director_interface<native><epic_internal> := interface:
        DetermineActiveCameraMode<native_callable><public>(CameraStackLayer:tag):?camera_mode

        AddCameraMode<native_callable><public>(CameraMode:camera_mode):void

        RemoveCameraMode<native_callable><public>(CameraMode:camera_mode):void

        AddSubDirector<native_callable><public>(Director:camera_director_interface):void

        RemoveSubDirector<native_callable><public>(Director:camera_director_interface):void

    camera_director_default<native><epic_internal> := class(camera_director_interface):
        DetermineActiveCameraMode<native><override>(CameraStackLayer:tag):?camera_mode

        AddCameraMode<native><override>(CameraMode:camera_mode):void

        RemoveCameraMode<native><override>(CameraMode:camera_mode):void

        AddSubDirector<native><override>(Director:camera_director_interface):void

        RemoveSubDirector<native><override>(Director:camera_director_interface):void

    @import_as("/Script/VerseCamera.UVerseCameraEvaluatorContext")
    camera_evaluator_context_base<native><epic_internal> := class<abstract>:


    camera_evaluator_context<native><epic_internal> := class<unique>(camera_evaluator_context_base):


    entity_camera_evaluator_context<native><epic_internal> := class<unique>(camera_evaluator_context):
        @replicated("")
        var CameraEntity<native><public>:?entity = external {}

        @replicated("")
        var TargetEntity<native><public>:?entity = external {}

    camera_mode_tag<native><epic_internal> := class(tag):


    camera_mode_default_tag<native><epic_internal> := class(tag):


    camera_boom_collision_type<native><epic_internal> := enum:
        Instant
        Predictive

    camera_dead_zone_shape<native><epic_internal> := enum:
        Sphere
        Cylinder
        Rectangle

    camera_blend_mode<native><epic_internal> := enum:
        Linear
        Cubic
        EaseInOut
        EaseIn
        EaseOut

    camera_offset_space<native><epic_internal> := enum:
        TargetSpace
        WorldSpace
        CameraSpace

    camera_mode_blend_params<native><epic_internal> := struct<concrete>:
        @editable
        BlendFunction<native><epic_internal>:camera_blend_mode = external {}

        @editable
        BlendExponent<native><epic_internal>:float = external {}

        @editable
        BlendTime<native><epic_internal>:float = external {}

        @editable
        BlendPriority<native><epic_internal>:float = external {}

    @import_as("/Script/VerseCamera.UVerseCameraMode")
    camera_mode_base<native><epic_internal> := class<abstract>:


    camera_mode<native><epic_internal> := class<concrete><unique>:
        UpdateCameraModeParameters<native><public>():void

        var CameraModeTag<native><public>:tag = external {}

        @editable
        @replicated("")
        var Priority<native><public>:float = external {}

        @editable
        @replicated("")
        var BlendInParams<native><public>:camera_mode_blend_params = external {}

        @editable
        @replicated("")
        var BlendOutParams<native><public>:camera_mode_blend_params = external {}

        SetEvaluatorContext<native><public>(OverriddenEvaluatorContext:camera_evaluator_context):void

        ClearEvaluatorContext<native><public>():void

    camera_fixed_angle_follow_type<native><epic_internal> := enum:
        InterpolationFollow
        SpringFollow

    camera_mode_fixed_angle_tag<native><epic_internal> := class(camera_mode_tag):


    camera_mode_fixed_angle<native><epic_internal> := class<unique>(camera_mode):
        var CameraModeTag<override>:tag = external {}

        @editable
        var CameraDistance<native><public>:float = external {}

        var OffsetSpace<native><public>:camera_offset_space = external {}

        @editable
        var OffsetHorizontal<native><public>:float = external {}

        @editable
        var OffsetVertical<native><public>:float = external {}

        @editable
        var CameraAngleYaw<native><public>:float = external {}

        @editable
        var CameraAnglePitch<native><public>:float = external {}

        @editable
        var FieldOfViewDegrees<native><public>:float = external {}

        @editable
        var FollowType<native><public>:camera_fixed_angle_follow_type = external {}

        @editable
        var InterpolationFollowSpeed<native><public>:float = external {}

        @editable
        var InterpolationFollowMaxDistance<native><public>:float = external {}

        @editable
        var SpringFollowStiffness<native><public>:float = external {}

        @editable
        var SpringFollowMaxDistance<native><public>:float = external {}

        @editable
        var DeadZoneEnabled<native><public>:logic = external {}

        @editable
        var DeadzoneType<native><public>:camera_dead_zone_shape = external {}

        @editable
        var DeadzoneDiameter<native><public>:float = external {}

        @editable
        var DeadzoneWidth<native><public>:float = external {}

        @editable
        var DeadzoneHeight<native><public>:float = external {}

        @editable
        var CollisionType<native><public>:camera_boom_collision_type = external {}

        @editable
        var CollisionInTime<native><public>:float = external {}

        @editable
        var CollisionOutTime<native><public>:float = external {}

        @editable
        var CollisionSize<native><public>:float = external {}

        @editable
        var CollisionCutoutSize<native><public>:float = external {}

    camera_mode_fixed_point_tag<native><epic_internal> := class(camera_mode_tag):


    camera_mode_fixed_point<native><epic_internal> := class<unique>(camera_mode):
        var CameraModeTag<override>:tag = external {}

        @editable
        var FieldOfViewDegrees<native><public>:float = external {}

        @editable
        var LookAtTargetEnabled<native><public>:logic = external {}

        @editable
        var LookAtTargetOffsetDistance<native><public>:float = external {}

        @editable
        var LookAtTargetOffsetHorizontal<native><public>:float = external {}

        @editable
        var LookAtTargetOffsetVertical<native><public>:float = external {}

        @editable
        var LookAtOffsetSpace<native><public>:camera_offset_space = external {}

        @editable
        var ClampEnabled<native><public>:logic = external {}

        @editable
        var ClampPitchMin<native><public>:float = external {}

        @editable
        var ClampPitchMax<native><public>:float = external {}

        @editable
        var ClampYawMin<native><public>:float = external {}

        @editable
        var ClampYawMax<native><public>:float = external {}

        @editable
        var DeadzoneEnabled<native><public>:logic = external {}

        @editable
        var DeadzonePitch<native><public>:float = external {}

        @editable
        var DeadzoneYaw<native><public>:float = external {}

        @editable
        var DeadzonePitchOffset<native><public>:float = external {}

        @editable
        var DeadzoneYawOffset<native><public>:float = external {}

    camera_mode_third_person_tag<native><epic_internal> := class(camera_mode_tag):


    camera_mode_third_person<native><epic_internal> := class<unique>(camera_mode):
        var CameraModeTag<override>:tag = external {}

        UpdateCameraModeParameters<override><native>():void

        @editable
        var CameraDistance<native><public>:float = external {}

        @editable
        var CameraOffsetHorizontal<native><public>:float = external {}

        @editable
        var CameraOffsetVertical<native><public>:float = external {}

        @editable
        var CameraOffsetSpace<native><public>:camera_offset_space = external {}

        @editable
        var LookAtTargetOffsetDistance<native><public>:float = external {}

        @editable
        var LookAtTargetOffsetHorizontal<native><public>:float = external {}

        @editable
        var LookAtTargetOffsetVertical<native><public>:float = external {}

        @editable
        var LookAtOffsetSpace<native><public>:camera_offset_space = external {}

        @editable
        var IsSpringFollowEnabled<native><public>:logic = external {}

        @editable
        var SpringFollowStiffness<native><public>:float = external {}

        @editable
        var SpringFollowMaxDistance<native><public>:float = external {}

        @editable
        var FieldOfViewDegrees<native><public>:float = external {}

        var CollisionType<native><public>:camera_boom_collision_type = external {}

        var CollisionInTime<native><public>:float = external {}

        var CollisionOutTime<native><public>:float = external {}

        var CollisionSize<native><public>:float = external {}

        var CollisionCutoutSize<native><public>:float = external {}

    GetPlayerCameraView<native><epic_internal>(Player:player)<transacts><decides>:player_camera_view

    GetPlayerCameraViewByIndex<native><epic_internal>(PlayerIndex:int)<transacts><decides>:player_camera_view

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    player_camera_view_base<native><epic_internal> := class<abstract>:


    player_camera_view<native><epic_internal> := class(player_camera_view_base):
        SetCameraBehavior<native><epic_internal>(CameraBehavior:camera_behavior_component):void

        GetCameraBehavior<native><epic_internal>():?camera_behavior_component