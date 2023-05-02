using {/Fortnite.com/Game}
using {/Fortnite.com/Playspaces}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /Fortnite.com/Devices
Devices<public> := module:
    # Module import path: /Fortnite.com/Devices/Animation
    Animation<public> := module:


    # Module import path: /Fortnite.com/Devices/CreativeAnimation
    CreativeAnimation<public> := module:
        # A structure for defining Bezier interpolation parameters.
        # See https://en.wikipedia.org/wiki/B%C3%A9zier_curve for more info on Bezier curves.
        cubic_bezier_parameters<native><public> := struct<computes>:
            # X value of the P1 control point. `0.0 <= X0 <= 1.0` or an error will be generated when
            # calling `animation_controller.SetAnimation`.
            X0<native><public>:float = external {}

            # Y value of the P1 control point.
            Y0<native><public>:float = external {}

            # X value of the P2 control point. `0.0 <= X1 <= 1.0 or an error will be generated when
            # calling `animation_controller.SetAnimation`.
            X1<native><public>:float = external {}

            # Y value of the P2 control point.
            Y1<native><public>:float = external {}

        # Module import path: /Fortnite.com/Devices/CreativeAnimation/InterpolationTypes
        # Convenience interpolation modes. These built in modes are based on the CSS animation standard:
        # https://www.w3.org/TR/css-easing-1/
        InterpolationTypes<public> := module:
            # `Linear` animations move at a constant speed.
            Linear<public>:cubic_bezier_parameters = external {}

            # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower
            # at the end than the start.
            Ease<public>:cubic_bezier_parameters = external {}

            # `EaseIn` animations start slow, then speed up towards the end.
            EaseIn<public>:cubic_bezier_parameters = external {}

            # `EaseOut` animations start fast, then slow down towards the end.
            EaseOut<public>:cubic_bezier_parameters = external {}

            # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
            EaseInOut<public>:cubic_bezier_parameters = external {}

        # Instead of specifying the actual keyframe positions, we specify the keyframe *deltas*. This allows us to
        # treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its
        # initial location. For a `animation_mode.Loop` animation, the net rotation and translation must both be zero.
        # Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s).
        keyframe_delta<native><public> := struct:
            # Target position of the `creative_prop`. This is a world-space coordinate in cm, with the
            # initial position of the `creative_prop` acting as coordinate (0,0).
            DeltaLocation<native><public>:vector3

            # Target rotation for the `creative_prop`. Rotations are relative to the starting rotation of
            # the `creative_prop`
            DeltaRotation<native><public>:rotation

            # Time in seconds the `creative_prop` should animate between its last frame and this frame.
            Time<native><public>:float

            # Interpolation mode for this `keyframe_delta`. See `InterpolationTypes` for standard interpolation
            # options. See `cubic_bezier_parameters` for authoring custom interpolations.
            # 
            # Default = `InterpolationTypes.Linear`
            Interpolation<native><public>:cubic_bezier_parameters = external {}

        # Animation play modes.
        animation_mode<native><public> := enum:
            # Stop after playing the animation once.
            OneShot
            # Reverse direction after reaching the final `keyframe_delta`, then play the animation in reverse.
            PingPong
            # Play the animation in a loop. This requires the animation ends exactly where it began.
            Loop

        # `animation_controller` states.
        animation_controller_state<native><public> := enum:
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject
            # No animation has been successfully set via `animation_controller.SetAnimation`, or that animation has
            # been cleared by a failed call to `animation_controller.SetAnimation`.
            AnimationNotSet
            # Animation has either never started, finished, or was explicitly stopped.
            Stopped
            # Animation is playing.
            Playing
            # Animation is paused.
            Paused

        # Results for `animation_controller.AwaitNextKeyframe` function.
        await_next_keyframe_result<native><public> := enum:
            # The next keyframe has been reached successfully.
            KeyframeReached
            # No animation is currently playing and this function call has returned immediately.
            NotPlaying
            # The animation was canceled either due to the object being destroyed, becoming invalid, or because it
            # was moved via some other API.
            AnimationAborted

        # Used to move and animate the position of `creative_prop` objects.
        #  * See `creative_prop.GetAnimationController` for information on acquiring an instance of an
        #    `animation_controller` for a given `creative_prop`.
        #  * See `SetAnimation` for details on authoring movement and animations.
        animation_controller<native><public> := class<epic_internal>:
            # Suspends at the callsite until the next `keyframe_delta` is finished. This will also return if the
            # animation is aborted or not playing. See `await_next_keyframe_result` if your code needs to take
            # different paths based on why `AwaitNextKeyframe` returned.
            AwaitNextKeyframe<native><public>()<suspends>:await_next_keyframe_result

            # Starts or resumes playback of the animation.
            Play<public>():void = external {}

            # Pauses the animation if it is already playing.
            Pause<public>():void = external {}

            # Stops playback and resets the animation to the first keyframe. Also resets the prop transform. Calling 
            # this method is valid while the animation is in the `Playing` or `Paused` states.
            Stop<public>():void = external {}

            # Returns the current state of this `animation_controller`.
            GetState<native><public>()<transacts>:animation_controller_state

            # Succeeds if this `animation_controller`s target is still valid (i.e., the target has not been disposed
            # of either via `Dispose` or through any external system.)
            IsValid<native><public>()<transacts><decides>:void

            # Sets the animation for the `animation_controller`. Animations are processed in the order provided in
            # `Keyframes`. See notes in `keyframe_delta` and `animation_mode` for more details on controlling the
            # animations.
            SetAnimation<public>(Keyframes:[]keyframe_delta, ?Mode:animation_mode):void = external {}

            # Signaled each time a keyframe is reached. Callback(KeyframeIndex:int, InReverse:logic). Note that the
            # KeyframeIndex in the callback is generally in [1, NumDeltaKeyframes] except that in a PingPong animation
            # the final keyframe played in reverse is identified as index 0. This is because SetAnimation takes *delta*
            # keyframes whereas this event notifies the listener that a specific keyframe has been reached.
            KeyframeReachedEvent<native><public>:subscribable(tuple(int, logic)) = external {}

            # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
            MovementCompleteEvent<native><public>:subscribable(tuple()) = external {}

            # Signaled when the state has changed. Use `GetState` to get the new state.
            StateChangedEvent<native><public>:subscribable(tuple()) = external {}

        # Returns an `animation_controller` used to animate `Prop`. Only a subset of `creative_prop` types can be
        # animated, though this may change in the future. A few examples of props that cannot be animated yet are:
        #  * Walls attached to buildings
        #  * Treasure chests
        #  * Loot llamas
        (Prop:creative_prop).GetAnimationController<public>()<transacts><decides>:animation_controller = external {}

    # Inherit from this to create a custom creative device. Inherited classes will appear in the UEFN content
    # browser the next time Verse compiles. Instances of your derived `creative_device` can then be placed in the
    # island by dragging them from the content browser into the scene.
    creative_device<native><public> := class<concrete>(creative_object_interface):
        # Override to add custom logic when the game experience begins.
        OnBegin<public>()<suspends>:void = external {}

        # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
        OnEnd<native_callable><public>():void = external {}

        # Returns the transform of the `creative_device` with units in cm.
        GetTransform<override><native>()<transacts>:transform

    # Returns an array containing all creative objects which have been marked with the specified `Tag`.
    GetCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:[]creative_object_interface

    # Returns an array containing creative objects which have tag(s) matching the specified `SearchCriteria`.
    GetCreativeObjectsWithTags<native><public>(SearchCriteria:tag_search_criteria)<transacts>:[]creative_object_interface

    # Returns a queryable `tag_view` which can be used to query the tags on `CreativeObject`.
    (CreativeObject:creative_object_interface).GetTags<native><public>():tag_view

    # Returns the `fort_playspace` that `CreativeObject` belongs to.
    (CreativeObject:creative_object_interface).GetPlayspace<native><public>()<transacts>:fort_playspace

    creative_object_interface<native><public> := interface<epic_internal>(positional):


    # Base class for creative devices and props.
    creative_object<native><public> := class<epic_internal>(creative_object_interface):
        # Returns the transform of the `creative_object` with units in cm. You must check `creative_object.IsValid`
        # before calling this if there is a possibility the object has been disposed or destroyed by gameplay.
        # Otherwise a runtime error will result.
        GetTransform<override><native>()<transacts>:transform

    # Base class for creative_device.
    creative_device_base<native><public> := class<abstract><epic_internal>(creative_object):


    # Results for `creative_prop.MoveTo`.
    move_to_result<public> := enum:
        # The destination has been reached.
        DestinationReached
        # The destination will not be reached. See debug log in UEFN for more info.
        WillNotReachDestination

    # Results for `SpawnProp`.
    spawn_prop_result<native><public> := enum:
        # Success.
        Ok
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # The spawn point contains NaN or Inf.
        InvalidSpawnPoint
        # The spawn point is outside the island's boundaries.
        SpawnPointOutOfBounds
        # The asset is not a valid `creative_prop`.
        InvalidAsset
        # More props have been spawned than are permitted by the island's rules (currently 100 per script device and 200 total per island).
        TooManyProps

    # A Fortnite prop that has been placed or spawned in the island.
    creative_prop<native><public> := class<concrete><final>(creative_object, invalidatable):
        # Teleport the `creative_prop` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

        # Destroy the `creative_prop` and remove it from the island.
        Dispose<native><override>():void

        # Succeeds if this object has not been disposed of either via `Dispose()` or through an external system.
        IsValid<native><override>()<transacts><decides>:void

        # Move the `creative_prop` to the specified `Position` and `Rotation` over the specified time. If an animation
        # is currently playing on the `creative_prop` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Asset used to spawn `creative_device` instances.
    creative_device_asset<native><public> := class<computes><final><epic_internal>:


    # Asset used to spawn `creative_prop` instances.
    creative_prop_asset<native><public> := class<computes><concrete><final><epic_internal>:


    # A default asset to be used when creating an editor-specified `creative_prop_asset` variable.
    DefaultCreativePropAsset<public>:creative_prop_asset = external {}

    # Spawns a `creative_prop` at the specified `Position` and `Rotation`. `Position` and `Rotation` units are in cm.
    # Returns tuple:
    #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
    #  1: Success or failure results.
    SpawnProp<native><public>(Asset:creative_prop_asset, Position:vector3, Rotation:rotation)<transacts>:tuple(?creative_prop, spawn_prop_result)