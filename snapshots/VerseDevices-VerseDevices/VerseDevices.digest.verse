using {/Verse.org/Colors}
using {/Fortnite.com/Vehicles}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/UnrealEngine.com/VerseQuery}
using {/Fortnite.com/Playspaces}
using {/Verse.org/Simulation/Tags}
using {/Fortnite.com/Game}
using {/Verse.org/Native}
using {/Verse.org/Assets}
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
            # X value of the P1 control point. `0.0 <= X0 <= 1.0` or an error will be generated when calling `animation_controller.SetAnimation`.
            X0<native><public>:float = external {}

            # Y value of the P1 control point.
            Y0<native><public>:float = external {}

            # X value of the P2 control point. `0.0 <= X1 <= 1.0 or an error will be generated when calling `animation_controller.SetAnimation`.
            X1<native><public>:float = external {}

            # Y value of the P2 control point.
            Y1<native><public>:float = external {}

        # Module import path: /Fortnite.com/Devices/CreativeAnimation/InterpolationTypes
        # Convenience interpolation modes. These built in modes are based on the CSS animation standard: https://www.w3.org/TR/css-easing-1/
        InterpolationTypes<public> := module:
            # `Linear` animations move at a constant speed.
            Linear<public>:cubic_bezier_parameters = external {}

            # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
            Ease<public>:cubic_bezier_parameters = external {}

            # `EaseIn` animations start slow, then speed up towards the end.
            EaseIn<public>:cubic_bezier_parameters = external {}

            # `EaseOut` animations start fast, then slow down towards the end.
            EaseOut<public>:cubic_bezier_parameters = external {}

            # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
            EaseInOut<public>:cubic_bezier_parameters = external {}

        # Instead of specifying the actual keyframe positions, we specify the keyframe *deltas*. This allows us to treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its initial location. For a `animation_mode.Loop` animation, the net rotation and translation must both be zero. Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s).
        keyframe_delta<native><public> := struct:
            # Target position of the `creative_prop`. This is a world-space coordinate in cm, with the initial position of the `creative_prop` acting as coordinate (0,0).
            DeltaLocation<native><public>:vector3

            # Target rotation for the `creative_prop`. Rotations are relative to the starting rotation of the `creative_prop`
            DeltaRotation<native><public>:rotation

            # Target scale for the `creative_prop`. Scale is multiplicative to the starting Scale of the `creative_prop`
            DeltaScale<native><public>:vector3 = external {}

            # Time in seconds the `creative_prop` should animate between its last frame and this frame.
            Time<native><public>:float

            # Interpolation mode for this `keyframe_delta`. See `InterpolationTypes` for standard interpolation options. See `cubic_bezier_parameters` for authoring custom interpolations. 
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

        # Results for `animation_controller.SetAnimation` function.
        set_animation_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # An unknown error has occurred.
            UnknownError
            # No keyframes were provided.
            NoKeyframes
            # The animation mode was 'Loop' but there was a net translation or rotation in the keyframes.
            LoopingAnimationDoesNotLoop
            # The animation would cause the object to at least partially leave the boundaries of play.
            KeyframeOutOfBounds
            # The translation component of a keyframe contained a NaN or Inf.
            InvalidLocation
            # The delta time value of a keyframe was negative.
            InvalidTime
            # See the documentation for cubic_bezier_parameters for more information.
            InvalidInterpolationParameters
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # Results for `animation_controller.GetAnimationController' function.
        get_animation_controller_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # An unknown error has occurred.
            UnknownError
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # Results for `animation_controller`s play, pause, and stop functions.
        playstoppause_result<native><epic_internal> := enum:
            # Function succeeded.
            Ok
            # No animation has been successfully set via SetAnimation, or that animation has been cleared by a failed call to SetAnimation.
            AnimationNotSet
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject

        # `animation_controller` states.
        animation_controller_state<native><public> := enum:
            # The target of the animation is not an animatable prop. This could be because:
            #  * It is not a `creative_prop` that can be animated.
            #  * It was disposed or otherwise destroyed.
            #  * It has the 'Register with Structural Grid' option set in UEFN.
            InvalidObject
            # No animation has been successfully set via `animation_controller.SetAnimation`, or that animation has been cleared by a failed call to `animation_controller.SetAnimation`.
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
            # The animation was canceled either due to the object being destroyed, becoming invalid, or because it was moved via some other API.
            AnimationAborted

        # Used to move and animate the position of `creative_prop` objects.
        #  * See `creative_prop.GetAnimationController` for information on acquiring an instance of an
        #    `animation_controller` for a given `creative_prop`.
        #  * See `SetAnimation` for details on authoring movement and animations.
        animation_controller<native><public> := class<epic_internal>:
            # Suspends at the callsite until the next `keyframe_delta` is finished. This will also return if the animation is aborted or not playing. See `await_next_keyframe_result` if your code needs to take different paths based on why `AwaitNextKeyframe` returned.
            AwaitNextKeyframe<native><public>()<suspends>:await_next_keyframe_result

            # Native implementation of `Play`.
            PlayInternal<native><epic_internal>():playstoppause_result

            # Starts or resumes playback of the animation.
            Play<public>():void = external {}

            # Native implementation of `Pause`.
            PauseInternal<native><epic_internal>():playstoppause_result

            # Pauses the animation if it is already playing.
            Pause<public>():void = external {}

            # Native implementation of `Stop`.
            StopInternal<native><epic_internal>():playstoppause_result

            # Stops playback and resets the animation to the first keyframe. Also resets the prop transform. Calling this method is valid while the animation is in the `Playing` or `Paused` states.
            Stop<public>():void = external {}

            # Returns the current state of this `animation_controller`.
            GetState<native><public>()<transacts>:animation_controller_state

            # Succeeds if this `animation_controller`s target is still valid (i.e., the target has not been disposed of either via `Dispose` or through any external system.)
            IsValid<native><public>()<transacts><decides>:void

            # Native implementation of `SetAnimation`.
            SetAnimationInternal<native><epic_internal>(Keyframes:[]keyframe_delta, ?AnimationMode:animation_mode = external {}):set_animation_result

            # Sets the animation for the `animation_controller`. Animations are processed in the order provided in `Keyframes`. See notes in `keyframe_delta` and `animation_mode` for more details on controlling the animations.
            SetAnimation<public>(Keyframes:[]keyframe_delta, ?Mode:animation_mode):void = external {}

            # Signaled each time a keyframe is reached. Callback(KeyframeIndex:int, InReverse:logic). Note that the KeyframeIndex in the callback is generally in [1, NumDeltaKeyframes] except that in a PingPong animation the final keyframe played in reverse is identified as index 0. This is because SetAnimation takes *delta* keyframes whereas this event notifies the listener that a specific keyframe has been reached.
            KeyframeReachedEvent<native><public>:listenable(tuple(int, logic)) = external {}

            # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
            MovementCompleteEvent<native><public>:listenable(tuple()) = external {}

            # Signaled when the state has changed. Use `GetState` to get the new state.
            StateChangedEvent<native><public>:listenable(tuple()) = external {}

        # Native implementation of `GetAnimationController`.
        GetAnimationController<native><epic_internal>(MovableObject:creative_movable_object_base)<transacts>:tuple(?animation_controller, get_animation_controller_result)

        # Returns an `animation_controller` used to animate `Prop`. Only a subset of `creative_prop` types can be animated, though this may change in the future. A few examples of props that cannot be animated yet are:
        #  * Walls attached to buildings
        #  * Treasure chests
        #  * Loot llamas
        (Prop:creative_prop).GetAnimationController<public>()<transacts><decides>:animation_controller = external {}

    # Inherit from this to create a custom creative device. Inherited classes will appear in the UEFN content browser the next time Verse compiles. Instances of your derived `creative_device` can then be placed in the island by dragging them from the content browser into the scene.
    creative_device<native><public> := class<concrete>(creative_movable_object_base, creative_object_interface):
        # Override to add custom logic when the game experience begins.
        OnBegin<public>()<suspends>:void = external {}

        # Override to add custom logic when the game experience ends. Any coroutines spawned inside `OnEnd` may never execute.
        OnEnd<native_callable><public>():void = external {}

        # Returns the transform of the `creative_device` with units in cm.
        GetTransform<override>()<transacts>:transform = external {}

        # Teleports the `creative_device` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

        # Teleports the `creative_device` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}

        # Moves the `creative_device` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

        # Moves the `creative_device` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_device` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}

        # Shows this device in the world.
        Show<native><public>()<transacts>:void

        # Hides this device in the world.
        Hide<native><public>()<transacts>:void

    # Base class for creative_device.
    creative_device_base<native><public> := class<abstract><epic_internal>(creative_object):
        # Set this device visible in the world.
        Show_Internal<native><epic_internal>()<transacts>:void

        # Set this device invisible in the world.
        Hide_Internal<native><epic_internal>()<transacts>:void

    # Internal asset for representing creative devices.
    creative_device_asset<native><public> := class<computes><final><epic_internal>(asset):


    @import_as("/Script/VerseDevices.UVerseMovableObjectBase")
    creative_movable_object_base<native><epic_internal> := class<abstract><epic_internal>:


    (MovableObject:creative_movable_object_base).GetTransformInternalImpl<native><epic_internal>()<transacts>:transform

    (MovableObject:creative_movable_object_base).TeleportToInternalImpl<native><epic_internal>(Transform:transform)<transacts>:teleport_to_result

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).TeleportToInternal<epic_internal>(Transform:transform)<transacts><decides>:void = external {}

    (MovableObject:creative_movable_object_base).MoveToInternalImpl<epic_internal>(TargetTransform:transform, OverTime:float)<suspends>:move_to_internal_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Position` and `Rotation` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

    # Moves the `creative_movable_object_base` to the specified `Transform` over the specified time. If an animation is currently playing on the `creative_movable_object_base` it will be stopped and put into the `AnimationNotSet` state.
    (MovableObject:creative_movable_object_base).MoveToInternal<epic_internal>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}

    creative_object_interface<native><public> := interface<epic_internal>(positional):


    # Base class for creative devices and props.
    creative_object<native><public> := class<epic_internal>(creative_movable_object_base, creative_object_interface):
        # Returns the transform of the `creative_object` with units in cm. You must check `creative_object.IsValid` before calling this if there is a possibility the object has been disposed or destroyed by gameplay.
        # Otherwise a runtime error will result.
        GetTransform<override>()<transacts>:transform = external {}

        # Teleports the `creative_object` to the specified `Position` and `Rotation`.
        TeleportTo<public>(Position:vector3, Rotation:rotation)<transacts><decides>:void = external {}

        # Teleports the `creative_object` to the specified location defined by `Transform`, also applies rotation and scale accordingly.
        TeleportTo<public>(Transform:transform)<transacts><decides>:void = external {}

        # Moves the `creative_object` to the specified `Position` and `Rotation` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Position:vector3, Rotation:rotation, OverTime:float)<suspends>:move_to_result = external {}

        # Moves the `creative_object` to the specified `Transform` over the specified time, in seconds. If an animation is currently playing on the `creative_object` it will be stopped and put into the `AnimationNotSet` state.
        MoveTo<public>(Transform:transform, OverTime:float)<suspends>:move_to_result = external {}

    # Returns an array containing all creative objects which have been marked with the specified `Tag`.
    GetCreativeObjectsWithTag<native><public>(Tag:tag)<transacts>:[]creative_object_interface

    # Returns an array containing creative objects which have tag(s) matching the specified `SearchCriteria`.
    GetCreativeObjectsWithTags<native><public>(SearchCriteria:tag_search_criteria)<transacts>:[]creative_object_interface

    # Returns a queryable `tag_view` which can be used to query the tags on `CreativeObject`.
    (CreativeObject:creative_object_interface).GetTags<native><public>():tag_view

    # Returns the `fort_playspace` that `CreativeObject` belongs to.
    (CreativeObject:creative_object_interface).GetPlayspace<native><public>()<transacts>:fort_playspace

    # Returns the `query_manager` that corresponds to the `CreativeObject`
    (CreativeObject:creative_object_interface).GetQueryManagerFromObject<native><epic_internal>()<transacts>:query_manager

    # A Fortnite prop that has been placed or spawned in the island.
    creative_prop<native><public> := class<concrete><final>(creative_object, invalidatable):
        # Destroys the `creative_prop` and remove it from the island.
        Dispose<native><override>():void

        # Succeeds if this object has not been disposed of either via `Dispose()` or through an external system.
        IsValid<native><override>()<transacts><decides>:void

        # Changes the Mesh used by this instance.
        SetMesh<native><public>(Mesh:mesh)<transacts>:void

        # Changes the Material of the Mesh used by this instance. Optionally can specify which Mesh element index to apply the material to, otherwise defaults to the 0 (default) Mesh element
        SetMaterial<native><public>(Material:material, ?Index:int = external {})<transacts>:void

        # Shows the `creative_prop` in the world and enable collisions.
        Show<native><public>()<transacts>:void

        # Hides the `creative_prop` in the world and disable collisions.
        Hide<native><public>()<transacts>:void

        # Returns true if the `creative_prop` is hidden in the world.
        IsHidden<native><epic_internal>()<transacts>:logic

    # Asset used to spawn `creative_prop` instances.
    creative_prop_asset<native><public> := class<computes><concrete><final><epic_internal>:


    # A default asset to be used when creating an editor-specified `creative_prop_asset` variable.
    DefaultCreativePropAsset<public>:creative_prop_asset = external {}

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

    # Spawns a `creative_prop` at the specified `Position` and `Rotation`. `Position` and `Rotation` units are in cm.
    # Returns tuple:
    #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
    #  1: Success or failure results.
    SpawnProp<native><public>(Asset:creative_prop_asset, Position:vector3, Rotation:rotation)<transacts>:tuple(?creative_prop, spawn_prop_result)

    # Spawns a `creative_prop` at the specified `Transform`. `Units are in cm.
    # Returns tuple:
    #  0: Instance of a `creative_prop`. False if no `creative_prop` could be created. See `spawn_prop_result` for failure cases.
    #  1: Success or failure results.
    SpawnProp<native><public>(Asset:creative_prop_asset, Transform:transform)<transacts>:tuple(?creative_prop, spawn_prop_result)

    creative_prop_debug_log<epic_internal> := class(log_channel):


    # Base implementation for events on `creative_device`s.
    device_event<native><epic_internal>(t:type)<computes> := class<abstract>(listenable(t)):
        EventName<native><public>:[]char

    # Partial implementation of `device_event(:type)` with no return payload.
    device_event<epic_internal>()<computes> := device_event(tuple())

    # Implementation of `device_event(:type)` with no payload.
    device_event_void<native><epic_internal> := class(device_event(tuple())):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__():void})<transacts>:cancelable

        Await<native><override>()<suspends>:tuple()

    # Implementation of `device_event(:type)` with required `agent` payload.
    device_event_agent<native><epic_internal> := class(device_event(agent)):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:agent):void})<transacts>:cancelable

        Await<native><override>()<suspends>:agent

    # Implementation of `device_event(:type)` with optional `agent` payload.
    device_event_optional_agent<native><epic_internal> := class(device_event(?agent)):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:?agent):void})<transacts>:cancelable

        Await<native><override>()<suspends>:?agent

    # Implementation of `device_event(:type)` with a `tuple(agent, int)` payload.
    device_event_agent_int<native><epic_internal> := class(device_event(tuple(agent, int))):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:agent, :int):void})<transacts>:cancelable

        Await<native><override>()<suspends>:tuple(agent, int)

    # Implementation of `device_event(:type)` with a `tuple(agent, float)` payload.
    device_event_agent_float<native><epic_internal> := class(device_event(tuple(agent, float))):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:agent, :float):void})<transacts>:cancelable

        Await<native><override>()<suspends>:tuple(agent, float)

    # Implementation of `device_event(:type)` with a `tuple(?agent, int)` payload.
    device_event_optional_agent_int<native><epic_internal> := class(device_event(tuple(?agent, int))):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:?agent, :int):void})<transacts>:cancelable

        Await<native><override>()<suspends>:tuple(?agent, int)

    # Implementation of `device_event(:type)` with required `fort_vehicle` payload.
    device_event_vehicle<native><epic_internal> := class(device_event(fort_vehicle)):
        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:fort_vehicle):void})<transacts>:cancelable

        Await<native><override>()<suspends>:fort_vehicle

    # Payload of `device_event_ai_interaction`.
    device_ai_interaction_result<native><public> := struct<epic_internal>:
        # Optional agent that triggered the interaction
        Source<native><public>:?agent

        # Optional agent targeted by `Source`.
        Target<native><public>:?agent

    # Implementation of `device_event(:type)` with `device_ai_interaction_result` payload.
    device_event_ai_interaction<native><epic_internal> := class(device_event(device_ai_interaction_result)):
        SourceName<native><public>:[]char

        TargetName<native><public>:[]char

        # Subscribes Callback to this event. That same Callback will only be triggered once per event even if it is called with Subscribe more than once.
        Subscribe<native><override>(Callback:type {__(:device_ai_interaction_result):void})<transacts>:cancelable

        Await<native><override>()<suspends>:device_ai_interaction_result

    function_parameter_base<native><epic_internal> := class<abstract><computes>:


    function_parameter_int<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:int

    function_parameter_string<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:[]char

    function_parameter_message<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?message

    function_parameter_color<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:color

    function_parameter_float<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:float

    function_parameter_agent<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?agent

    function_parameter_logic<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:logic

    function_parameter_vector3<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:vector3

    device_function<native><epic_internal> := class:
        FunctionName<native><epic_internal>:[]char

        Invoke<native><epic_internal>():void

        Invoke<native><epic_internal>(InAgent:agent):void

    device_function_set_base<native><epic_internal> := class<abstract>:
        FunctionName<native><epic_internal>:[]char

    device_function_set_int<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:int):void

    device_function_set_float<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:float):void

    device_function_set_logic<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:logic):void

    device_function_set_string<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:[]char):void

    device_function_set_message<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:message):void

    device_function_set_color<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:color):void

    device_function_set_agent<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(InAgent:?agent):void

    device_function_set_vector3<native><epic_internal> := class(device_function_set_base):
        Invoke<native><epic_internal>(Value:vector3):void

    device_function_get_base<native><epic_internal> := class<abstract>:
        FunctionName<native><epic_internal>:[]char

    device_function_get_int<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:int

    device_function_get_float<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:float

    device_function_get_logic<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:logic

    device_function_get_string<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:[]char

    device_function_get_color<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:color

    device_function_get_agent<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:?agent

    device_function_get_vector3<native><epic_internal> := class(device_function_get_base):
        Invoke<native><epic_internal>()<varies>:vector3

    device_function_set_multi_parameter_base<native><epic_internal> := class<abstract>(device_function_set_base):
        ReturnType<native><epic_internal>:?subtype(function_parameter_base) = external {}

    device_function_set_params_by_name<native><epic_internal> := class(device_function_set_multi_parameter_base):
        Invoke<native><epic_internal>(NamedParameters:[[]char]function_parameter_base)<transacts>:?function_parameter_base

        ParameterTypes<native><epic_internal>:[[]char]subtype(function_parameter_base)

    device_function_set_params_by_name_const<native><epic_internal> := class(device_function_set_params_by_name):
        InvokeConst<native><epic_internal>(NamedParameters:[[]char]function_parameter_base)<varies>:?function_parameter_base

    device_function_set_params_by_type<native><epic_internal> := class(device_function_set_multi_parameter_base):
        Invoke<native><epic_internal>(TypeExclusiveParameters:[]function_parameter_base)<transacts>:?function_parameter_base

        ParameterTypes<native><epic_internal>:[]subtype(function_parameter_base)

    device_function_set_params_by_type_const<native><epic_internal> := class(device_function_set_params_by_type):
        InvokeConst<native><epic_internal>(TypeExclusiveParameters:[]function_parameter_base)<varies>:?function_parameter_base

    move_to_debug_log<epic_internal> := class(log_channel):


    # Results for `MoveTo`.
    move_to_result<public> := enum:
        # The destination has been reached.
        DestinationReached
        # The destination will not be reached. See debug log in UEFN for more info.
        WillNotReachDestination

    # Results for `MoveToInternal`.
    move_to_internal_result<epic_internal> := enum:
        # The destination has been reached.
        DestinationReached
        # The move was terminated before completion (e.g., via the `animation_controller` API).
        WillNotReachDestination
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # NaN or Infinity in the requested destination.
        InvalidDestination
        # The `OverTime` parameter was not a float greater than zero.
        InvalidTime
        # The object being moved is no longer valid. Example invalid states:
        #  * The object has been destroyed during gameplay.
        #  * The object has been destroyed by Verse.
        #  * The object has the 'Register with Structural Grid' option set in UEFN.
        InvalidObject
        # The destination would cause the object to be at least partially outside the island's boundaries.
        DestinationOutOfBounds

    HandleMoveToInternalResult<epic_internal>(Result:move_to_internal_result):move_to_result = external {}

    # Returns a `string` representation of `move_to_internal_result` objects.
    ToString<epic_internal>(MoveToInternalResult:move_to_internal_result)<computes>:[]char = external {}

    teleport_to_debug_log<epic_internal> := class(log_channel):


    # Results for `TeleportTo` of creative objects and devices.
    teleport_to_result<native><epic_internal> := enum:
        # Success.
        Ok
        # An unknown error occurred. If this happens frequently, contact Epic support.
        UnknownError
        # `NaN` or `Infinity` in the requested destination.
        InvalidDestination
        # The object being moved is no longer valid. Example invalid states:
        #  * The object has been destroyed during gameplay.
        #  * The object has been destroyed by Verse.
        #  * The object has the *Register with Structural Grid* option set in UEFN.
        InvalidObject
        # The destination would cause the object to be at least partially outside the island's boundaries.
        DestinationOutOfBounds

    HandleTeleportToResult<epic_internal>(Result:teleport_to_result)<transacts><decides>:void = external {}