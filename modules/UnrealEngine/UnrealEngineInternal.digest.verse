# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-28.30-CL-31511038
#################################################

using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Assets
Assets<public> := module:
    SpawnParticleSystem<native><epic_internal>(Asset:particle_system, Position:vector3, ?Rotation:rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable

    spawn_particle_system_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

Engine<public> := module:
    using {/UnrealEngine.com/Temporary/Curves}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Assets}
    using {/Verse.org/Simulation}
    using {/Verse.org/VerseEngine/Component}
    # Module import path: /UnrealEngine.com/Engine/VerseMovement
    VerseMovement<public> := module:
        GetPlayerMoveComponent<native><epic_internal>(Player:player_component)<transacts><decides>:movement_component

        # Module import path: /UnrealEngine.com/Engine/VerseMovement/VerseMovementUtil
        VerseMovementUtil<public> := module:
            CarConfig<public>:move_config = external {}

        move_config<native><public> := struct<computes>:
            Entries<native><public>:[]move_config_entry = external {}

        move_config_asset<native><public> := class(asset):

        move_config_entry<native><public> := struct<computes>:
            Name<native><public>:[]char = external {}

            Responses<native><public>:[]move_response = external {}

            Triggers<native><public>:[]move_trigger = external {}

        move_input_trigger_params<native><public> := struct<computes>:
            AccumulateAxisInput<native><public>:logic = external {}

            AxisToMagnitudeCurve<native><public>:?editable_curve = external {}

            ClampAxis<native><public>:vector2 = external {}

            IsAxis<native><public>:logic = external {}

            Name<native><public>:[]char = external {}

        move_physics_trigger_params<native><public> := struct<computes>:
            SpeedInDirection<native><public>:vector3 = external {}

        move_response<native><public> := struct<computes>:
            ClampFrame<native><public>:move_response_frame = external {}

            ClampVector<native><public>:vector3 = external {}

            Effect<native><public>:move_response_effect = external {}

            Frame<native><public>:move_response_frame = external {}

            Magnitude<native><public>:float = external {}

            MagnitudeCurve<native><public>:?editable_curve = external {}

            Modifier<native><public>:move_response_modifier = external {}

            Type<native><public>:move_response_type = external {}

            Vector<native><public>:vector3 = external {}

        move_response_effect<native><public> := enum:
            Force

            Transform

            VelocityChange

            move_response_effect_MAX

        move_response_frame<native><public> := enum:
            Absolute

            move_response_frame_Camera

            move_response_frame_MAX

            move_response_frame_Object

        move_response_modifier<native><public> := enum:
            OverrideTransform

            OverrideVelocity

            TargetTransform

            TargetVelocity

            move_response_modifier_Add

            move_response_modifier_MAX

        move_response_type<native><public> := enum:
            Angular

            Linear

            move_response_type_MAX

        move_trace_trigger_params<native><public> := struct<computes>:
            Direction<native><public>:vector3 = external {}

            Frame<native><public>:move_response_frame = external {}

            HitDistanceToMagnitudeCurve<native><public>:?editable_curve = external {}

            ProportionalToHitDistance<native><public>:logic = external {}

            TraceLength<native><public>:float = external {}

        move_trigger<native><public> := struct<computes>:
            InputParams<native><public>:move_input_trigger_params = external {}

            PhysicsParams<native><public>:move_physics_trigger_params = external {}

            TraceParams<native><public>:move_trace_trigger_params = external {}

            Type<native><public>:move_trigger_type = external {}

        move_trigger_type<native><public> := enum:
            Constant

            Constraint

            Input

            Physics

            Trace

            move_trigger_type_MAX

        movement_component<native><epic_internal> := class<unique>(component):
            AddAngularImpulse<native><public>(Impulse:vector3):void

            AddImpulse<native><public>(Impulse:vector3):void

            DisableInput<native><public>(ThePlayer:player_component):void

            EnableInput<native><public>(ThePlayer:player_component):void

            SetConfig<native><public>(Config:move_config):void

            SetConfig<native><public>(Config:move_config_asset):void

            SetEnabled<native><public>(Enabled:logic):void

            SetPosition<native><public>(Position:vector3):void

            SetRotation<native><public>(Rotation:rotation):void

            SetVelocity<native><public>(Velocity:vector3):void

EntityFramework<public> := module:
    using {/UnrealEngine.com/EntityFramework/Entity}
    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Assets}
    using {/Verse.org/Colors}
    using {/Verse.org/Simulation}
    # Module import path: /UnrealEngine.com/EntityFramework/Component
    Component<public> := module:
        attachment_component<native><epic_internal> := class(core_entity_component):
            # Attaches the owner entity to the specified entity. This method will compute relative transform from the current world transform of both entity
            AttachTo<native><public>(InParentEntity:core_entity)<transacts><decides>:void

            # Attach the owner entity to the specified entity, use the specified transform as the relation to it
            AttachTo<native><public>(InParentEntity:core_entity, NewRelativeTransform:transform)<transacts><decides>:void

            # Automatically attach to owner at initialization
            AutoAttachToOwner<native><public>:logic = external {}

            # Detaches the owner entity if it was attached to an other entity
            DetachFrom<native><public>()<transacts><decides>:void

            # Retrieve the transform of the attachment
            GetAttachedTransform<native><public>()<decides>:transform

            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # Set relative transform
            SetRelativeTransform<native><public>(Transform:transform)<transacts><decides>:void

            # Set relative transform from a global transform
            SetRelativeTransformFromGlobal<native><public>(Transform:transform)<transacts><decides>:void

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

            # The relative transform to the attached entity
            var ParentEntity<native><public>:?core_entity = external {}

            # The relative transform to the attached entity
            var RelativeTransform<native><public>:?transform = external {}

        camera_entity_component<native><epic_internal> := class(core_entity_component):
            # Notification called then the component owner entity was added to a world
            AddedToWorld<native><override>():void

            # Notification called when the game simulation has started
            BeginPlay<native><override>():void

            GetAspectRatio<public>():float = external {}

            GetFieldOfView<public>():float = external {}

            GetIsActive<public>():logic = external {}

            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # Notification called when the component owner entity is about to be removed from world
            RemovingFromWorld<native><override>():void

            # Set the aspect ratio of the camera
            SetAspectRatio<public>(InAspectRatio:float):void = external {}

            # Set the field of view of the camera in degrees
            SetFieldOfView<public>(InFieldOfView:float):void = external {}

            # Enable or disable the camera
            SetIsActive<public>(InIsActive:logic):void = external {}

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

        @hide_in_editor
        light_entity_component<native><epic_internal> := class(core_entity_component):
            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

        @hide_in_editor
        mesh_component<native><epic_internal> := class(core_entity_component):
            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

        physics_component<native><epic_internal> := class(core_entity_component):
            # Notification called then the component owner entity was added to a world
            AddedToWorld<native><override>():void

            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # Notification called when the component owner entity is about to be removed from world
            RemovingFromWorld<native><override>():void

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

        point_light_entity_component<native><public> := class<final>(light_entity_component):
            GetAttenuationRadius<public>():float = external {}

            GetColor<public>():color = external {}

            GetIntensity<public>():float = external {}

            GetSourceLength<public>():float = external {}

            GetSourceRadius<public>():float = external {}

            SetAttenuationRadius<public>(NewRadius:float):void = external {}

            SetColor<public>(NewColor:color):void = external {}

            SetIntensity<public>(NewIntensity:float):void = external {}

            SetSourceLength<public>(NewLength:float):void = external {}

            SetSourceRadius<public>(NewRadius:float):void = external {}

        spot_light_entity_component<native><public> := class<final>(light_entity_component):
            GetAttenuationRadius<public>():float = external {}

            GetColor<public>():color = external {}

            GetInnerConeAngle<public>():float = external {}

            GetIntensity<public>():float = external {}

            GetOuterConeAngle<public>():float = external {}

            GetSourceLength<public>():float = external {}

            GetSourceRadius<public>():float = external {}

            SetAttenuationRadius<public>(NewRadius:float):void = external {}

            SetColor<public>(NewColor:color):void = external {}

            SetInnerConeAngle<public>(NewInnerConeAngle:float):void = external {}

            SetIntensity<public>(NewIntensity:float):void = external {}

            SetOuterConeAngle<public>(NewOuterConeAngle:float):void = external {}

            SetSourceLength<public>(NewLength:float):void = external {}

            SetSourceRadius<public>(NewRadius:float):void = external {}

        static_mesh_component<native><epic_internal> := class(mesh_component):
            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

            # The path to the material asset of a static mesh
            var Material<native><public>:?material = external {}

            # The path to the static mesh asset
            var Mesh<native><public>:mesh = external {}

    using {/UnrealEngine.com/EpicGamesRestricted/Network}
    using {/UnrealEngine.com/Execution}
    using {/Verse.org/Native}
    # Module import path: /UnrealEngine.com/EntityFramework/Entity
    Entity<public> := module:
        @import_as("/Script/Entity.UBaseCoreEntity")
        base_core_entity<native><public> := class<abstract>:

        core_entity<native><epic_internal> := class<concrete><unique><transacts>(base_core_entity):
            # Add a component to the list of component, it will fail if the component type is already in the list
            AddComponent<native><public>(InComponent:core_entity_component)<transacts><decides>:void

            # Adds an owned entity to an entity
            AddEntity<native><public>(InEntity:core_entity)<transacts><decides>:void

            # Create a component on the entity of the specified type
            CreateComponent<native><public>(ComponentType:subtype(core_entity_component))<transacts><decides>:ComponentType

            # Create and adds an owned entity to an entity
            CreateEntity<native><public>(EntityType:subtype(core_entity))<transacts>:EntityType

            # Destroy the entity
            Dispose<native><public>():void

            # Retreive a component of a specified type
            GetComponentByType<native><public>(ComponentType:subtype(core_entity_component))<transacts><decides>:ComponentType

            # Returns any accessible child entities of this entity
            GetEntities<native><final><public>()<transacts>:[]core_entity

            # Returns the owner of this entity if any
            GetOwner<native><public>()<transacts><decides>:core_entity

            # Determine if the entity has been disposed
            IsDisposed<native><public>()<decides>:void

            # Remove a component from the entity
            RemoveComponent<native><public>(InComponent:core_entity_component)<transacts><decides>:void

            # Removes an owned entity from an entity
            RemoveEntity<native><public>(InEntity:core_entity)<transacts><decides>:void

        core_entity_component<native><epic_internal> := class<abstract><unique>:
            # Notification called then the component owner entity was added to a world
            AddedToWorld<native><native_callable><protected>():void

            # Notification called when the game simulation has started
            BeginPlay<native><native_callable><protected>():void

            # Notification called when the game simulation has ended
            EndPlay<native><native_callable><protected>():void

            # Returns the owner of this component
            GetOwner<native><public>()<transacts><decides>:core_entity

            # The component is being initialized, called when it is attach to an entity
            Initialize<native><native_callable><protected>():void

            IsAllowedOnClient<native_callable><epic_internal>():logic = external {}

            # Notification called when the component owner entity is about to be removed from world
            RemovingFromWorld<native><native_callable><protected>():void

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><native_callable><protected>():void

        # Module import path: /UnrealEngine.com/EntityFramework/Entity/core_entity_initializer
        core_entity_initializer<epic_internal> := module:
            # Tells that specified component type need to be initialized before
            InitializeDependency<native><public>(OwnerEntity:core_entity, ComponentType:subtype(core_entity_component), Mode:mode)<transacts><decides>:ComponentType

            mode<native><public> := enum:
                get

                get_or_create

        # Module import path: /UnrealEngine.com/EntityFramework/Entity/engine_execution
        engine_execution<public> := module:
            GetSubscribables<native><epic_internal>(ForEntity:core_entity):engine_execution_subscribables

        engine_execution_subscribables<native><public> := class:
            DuringPhysics<native><public>:execution_subscribable = external {}

            EndFrame<native><public>:execution_subscribable = external {}

            EndPhysics<native><public>:execution_subscribable = external {}

            PostPhysics<native><public>:execution_subscribable = external {}

            PrePhysics<native><public>:execution_subscribable = external {}

            StartPhysics<native><public>:execution_subscribable = external {}

        replication_component<native><epic_internal> := class(core_entity_component):
            # The component is being initialized, called when it is attach to an entity
            AddedToWorld<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # The component is being uninitialized, called when it is about to be detached from an entity
            RemovingFromWorld<native><override>():void

        transform_component<native><epic_internal> := class(core_entity_component):
            # The component is being initialized, called when it is attach to an entity
            Initialize<native><override>():void

            # Internal epic method to know if this component is allowed on client
            IsAllowedOnClient<override>():logic = external {}

            # Utility method to set the transform of an entity and notifying listeners
            SetTransform<native><public>(NewTransform:transform):void

            # The component is being uninitialized, called when it is about to be detached from an entity
            Uninitialize<native><override>():void

            @editable
            # Initial value of the transform of the entity, relative to its owner if any
            var InitialRelativeTransform<native><public>:transform = external {}

            @replicated("RepNotify")
            # Current transform of the entity, relative to the world
            var Transform<native><public>:transform = external {}

        typed_element_component<native><epic_internal> := class(core_entity_component):

using {/UnrealEngine.com/EntityFramework/Entity}
# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module:
    @hide_in_editor
    init_test_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

    @hide_in_editor
    lambda_test_component<native><epic_internal> := class(core_entity_component):
        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the game simulation has started
        BeginPlay<native><override>():void

        # Notification called when the game simulation has ended
        EndPlay<native><override>():void

        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

    @hide_in_editor
    test_component<native><epic_internal> := class(core_entity_component):

# Module import path: /UnrealEngine.com/EpicGames
EpicGames<public> := module:
    # Module import path: /UnrealEngine.com/EpicGames/Input
    Input<public> := module:
        # Represents a type of event that can occur involving a verse_key
        input_event<native><public> := enum:
            Pressed

            Released

        # Enumerated list of available input 'key' bindings
        verse_key<native><public> := enum:
            E

            Eight

            Five

            Four

            Gamepad_DPad_Down

            Gamepad_DPad_Left

            Gamepad_DPad_Right

            Gamepad_DPad_Up

            Gamepad_FaceButton_Bottom

            Gamepad_FaceButton_Left

            Gamepad_FaceButton_Right

            Gamepad_FaceButton_Top

            Gamepad_LeftShoulder

            Gamepad_LeftTrigger

            Gamepad_LeftTriggerAxis

            Gamepad_LeftX

            Gamepad_LeftY

            Gamepad_RightShoulder

            Gamepad_RightTrigger

            Gamepad_RightTriggerAxis

            Gamepad_RightX

            Gamepad_RightY

            I

            J

            K

            Keyboard_Add

            Keyboard_Decimal

            Keyboard_Divide

            Keyboard_Down

            Keyboard_Enter

            Keyboard_Left

            Keyboard_LeftAlt

            Keyboard_LeftControl

            Keyboard_LeftShift

            Keyboard_Multiply

            Keyboard_Right

            Keyboard_RightAlt

            Keyboard_RightControl

            Keyboard_RightShift

            Keyboard_SpaceBar

            Keyboard_Subtract

            Keyboard_Up

            L

            Mouse_LeftButton

            Mouse_MiddleButton

            Mouse_RightButton

            Mouse_ScrollDown

            Mouse_ScrollUp

            Mouse_ThumbButton

            Mouse_ThumbButton2

            Mouse_WheelAxis

            Mouse_X

            Mouse_Y

            Nine

            NumPad_Eight

            NumPad_Five

            NumPad_Four

            NumPad_Nine

            NumPad_One

            NumPad_Seven

            NumPad_Six

            NumPad_Three

            NumPad_Two

            NumPad_Zero

            One

            Seven

            Six

            TAB

            Three

            Two

            Z

            Zero

        # Represents a type of event that can occur involving a verse_key
        verse_ue_input_component<native><public> := class<final>(component):
            # Requests that the input component adds a callback bound to whenever the action specified by ActionName occurs, in the manner specified by InputEvent e.g. press/release
            AddActionBinding<native><public>(ActionName:[]char, InputEvent:input_event, Callback:type {__():void}):void

            # Requests that the input component register an action mapping to the provided keys, with a description string provided for debugging/tracking
            AddActionMapping<native><public>(ActionName:[]char, Description:[]char, Keys:[]verse_key):void

            # Utility wrapper which both binds the specified Actionname to the keys + input event specified, and also registers an associated callback
            AddActionMappingAndBinding<public>(ActionName:[]char, Description:[]char, Keys:[]verse_key, InputEvent:input_event, Callback:type {__():void}):void = external {}

            # Requests that the input component adds a callback bound to whenever the Axis specified by AxisName changes value. The callback will be provided the current Axis value
            AddAxisBinding<native><public>(AxisName:[]char, Callback:?type {__(:float):void}):void

            # Requests that the input component register an axis mapping to the provided keys, with a description string provided for debugging/tracking
            AddAxisMapping<native><public>(ActionName:[]char, Description:[]char, Keys:[]verse_key, Scale:?float):void

            # Utility wrapper which both binds the specified Actionname to the Axis specified, and also registers an associated callback
            AddAxisMappingAndBinding<public>(AxisName:[]char, Description:[]char, Keys:[]verse_key, Scale:?float, Callback:?type {__(:float):void}):void = external {}

            # Clears all previously registered action mappings for the provided input component
            ClearActionMappings<native><public>():void

            # Clears all previously registered axis mappings for the provided input component
            ClearAxisMappings<native><public>():void

            # Clears all input bindings for the provided input component. This is the equivalent of clearing all action + axis mappings, and all bindings
            ClearInputBindings<native><public>():void

            # Utility wrapper which Clears action mappings, axis mappings, and input bindings
            ClearInputMappingsAndBindings<public>():void = external {}

            # Returns the current value associated with the specified AxisName. 0.0f if not currently being manipulated
            GetAxisValue<native><public>(AxisName:[]char):float

            # Removes a previously added action mapping and associated callback binding. Requires the Action name the action was added with
            RemoveActionBinding<native><public>(ActionName:[]char, InputEvent:input_event):void

            # Removes a previously added action mapping. Requires the Action name the action was added with
            RemoveActionMapping<native><public>(ActionName:[]char):void

            # Utility wrapper which both removes the specified Actionname and associated callback
            RemoveActionMappingAndBinding<public>(ActionName:[]char, InputEvent:input_event):void = external {}

            # Removes a previously added axis mapping. Requires the Action name the action was added with
            RemoveAxisBinding<native><public>(AxisName:[]char):void

            # Async function which continues execution when the associated ActionName occurs, and in the manner specified by InputEvent e.g. press/release
            WaitForAction<native><public>(InputComponent:verse_ue_input_component, ActionName:[]char, InputEvent:input_event)<suspends>:void

# Module import path: /UnrealEngine.com/EpicGamesRestricted
EpicGamesRestricted<public> := module:
    # Module import path: /UnrealEngine.com/EpicGamesRestricted/Network
    Network<public> := module:
        replicated<epic_internal>(ReplicationArgs:[]char)<computes>:replicated_attribute

        @attribscope_data
        @customattribhandler
        replicated_attribute<epic_internal> := class(attribute):

    # Module import path: /UnrealEngine.com/EpicGamesRestricted/Spline
    Spline<public> := module:
        spline_component<native><public> := class<final>(component):
            # Given a world position, find the closest spline input key
            FindClosestInputKeyToWorldPosition<native><public>(Position:vector3)<transacts><decides>:float

            # Given a spline input key, find the spline distance
            FindDistanceAlongSplineAtInputKey<native><public>(InputKey:float)<transacts><decides>:float

            # Given a spline input key, find the spline distance
            GetInputKeyAtDistanceAlongSpline<native><public>(DistanceAlongSpline:float)<transacts><decides>:float

            # Returns the length of the spline
            GetSplineLength<native><public>():float

            # Given a distance along the length of this spline, return the associated data values at that point
            QueryAtDistanceAlongSpline<native><public>(DistanceAlongSpline:float, bIsWorldSpace:logic)<transacts><decides>:spline_query_result

            # Given a time from 0 to the spline duration, return the corresponding data values at that point
            QueryAtTime<native><public>(Time:float, bIsWorldSpace:logic)<transacts><decides>:spline_query_result

        spline_query_result<native><public> := struct:
            out_transform<native><public>:transform

            tangent<native><public>:vector3

# Module import path: /UnrealEngine.com/Execution
Execution<public> := module:
    execution_subscribable<native><public> := class:
        Subscribe<native><public>(Callback:type {__():void}, ?Interval:float = external {})<transacts>:execution_subscription

        SubscribeWithTime<native><public>(Callback:type {__(:float):void}, ?Interval:float = external {})<transacts>:execution_subscription

    execution_subscription<native><public> := class(cancelable):
        Cancel<native><override>()<transacts>:void

        RunAfter<native><public>(__dupe___unnamed_parameter_42:execution_subscription)<transacts>:void

        RunBefore<native><public>(__dupe___unnamed_parameter_43:execution_subscription)<transacts>:void

# Module import path: /UnrealEngine.com/ExecutionTestSuite
ExecutionTestSuite<public> := module:

using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Component}
# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module:
    PlayerType<native><epic_internal> := enum:
        ActivePlayer

        All

        Spectator

    playspace_component<native><epic_internal> := class(component):
        SetPlayerComponentClass<native><public>(ComponentType:type):void

        _WaitForMatchBegin<native><public>()<suspends>:void

        _WaitForMatchEnd<native><public>()<suspends>:void

        _WaitForPlayerAdded<native><public>()<suspends>:player_component

        _WaitForPlayerRemoved<native><public>()<suspends>:player_component

        _WaitForSetupComplete<native><public>()<suspends>:void

        getPlayerCount<native><public>(Type:PlayerType)<transacts>:int

        getPlayers<native><public>(Type:PlayerType)<transacts>:[]player_component

        setQueueUserForRespawnWhenAdded<native><public>(spawnWhenAdded:logic):void

Temporary<public> := module:
    # Module import path: /UnrealEngine.com/Temporary/Curves
    Curves<public> := module:
        editable_curve<native><public> := class<final><concrete>:
            # Evaluates this float curve at the specified time and returns the result as a float
            Evaluate<native><public>(Time:float):float

    # Module import path: /UnrealEngine.com/Temporary/Diagnostics
    Diagnostics<public> := module:
        # debug draw class to draw debug shapes on screen.
        debug_draw<native><public> := class:
            # Channel will be used to clear specific debug draw.
            Channel<native><public>:subtype(debug_draw_channel) = external {}

            # Clears all debug draw from this debug_draw instance.
            Clear<native><public>()<transacts>:void

            # Clears all debug draw for the channel.
            ClearChannel<native><public>()<transacts>:void

            # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
            DrawArrow<native><public>(Start:vector3, End:vector3, ?ArrowSize:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a box at the named location, and using the provided draw parameters
            DrawBox<native><public>(Center:vector3, Rotation:rotation, ?Extent:vector3 = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a capsule at the named location, and using the provided draw parameters.
            DrawCapsule<native><public>(Center:vector3, Rotation:rotation, ?Height:float = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a cone at the named location, and using the provided draw parameters.
            DrawCone<native><public>(Origin:vector3, Direction:vector3, ?Height:float = external {}, ?NumSides:int = external {}, ?AngleWidthRadians:float = external {}, ?AngleHeightRadians:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a cylinder at the named location, and using the provided draw parameters.
            DrawCylinder<native><public>(Start:vector3, End:vector3, ?NumSegments:int = external {}, ?Radius:float = external {}, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a line from Start to End locations, and using the provided draw parameters.
            DrawLine<native><public>(Start:vector3, End:vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a point at the named location, and using the provided draw parameters.
            DrawPoint<native><public>(Position:vector3, ?Color:color = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Draws a sphere at the named location, and using the provided draw parameters.
            DrawSphere<native><public>(Center:vector3, ?Radius:float = external {}, ?Color:color = external {}, ?NumSegments:int = external {}, ?Thickness:float = external {}, ?DrawDurationPolicy:debug_draw_duration_policy = external {}, ?Duration:float = external {})<transacts>:void

            # Hide Debug Draw for the channel for all users.
            HideChannel<native><public>()<transacts>:void

            # Show Debug Draw for the channel for all users.
            ShowChannel<native><public>()<transacts>:void

        # debug_draw_channel is the base class used to define debug draw channels.
        debug_draw_channel<native><public> := class<abstract>:

        # Enumerated presets for policies describing a desired draw duration.
        debug_draw_duration_policy<native><public> := enum:
            FiniteDuration

            Persistent

            SingleFrame

        # log class to send messages to the default log
        log<native><public> := class:
            # Print message using the given log level
            (log:)Print<native><public>(Message:[]char, ?Level:log_level = external {})<computes>:void

            # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
            Channel<native><public>:subtype(log_channel)

            # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
            DefaultLevel<native><public>:log_level = external {}

            # Prints current script call stack using the give log level
            PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

        # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
        log_channel<native><public> := class<abstract>:

        # log levels available for various log commands
        log_level<native><public> := enum:
            Debug

            Error

            Normal

            Verbose

            Warning

    using {/Verse.org/Native}
    # Module import path: /UnrealEngine.com/Temporary/SpatialMath
    SpatialMath<public> := module:
        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyLocalRotationY<public>(AngleRadians:float)<transacts>:rotation = external {}

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyLocalRotationZ<public>(AngleRadians:float)<transacts>:rotation = external {}

        # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyPitch<native><public>(PitchUpRadians:float)<transacts>:rotation

        # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyRoll<native><public>(RollClockwiseRadians:float)<transacts>:rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyWorldRotationX<native><public>(AngleRadians:float)<transacts>:rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyWorldRotationY<native><public>(AngleRadians:float)<transacts>:rotation

        # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyWorldRotationZ<native><public>(AngleRadians:float)<transacts>:rotation

        # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
        (InitialRotation:rotation).ApplyYaw<native><public>(YawRightRadians:float)<transacts>:rotation

        # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
        (InitialRotation:rotation).RotateBy<native><public>(AdditionalRotation:rotation)<transacts>:rotation

        # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
        (InitialRotation:rotation).UnrotateBy<native><public>(RotationToRemove:rotation)<transacts>:rotation

        # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
        (Rotation:rotation).GetAngle<native><public>()<varies>:float

        # Makes a `vector3` from the axis of `rotation`.
        # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
        (Rotation:rotation).GetAxis<native><public>()<varies>:vector3

        # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
        (Rotation:rotation).GetLocalForward<public>()<transacts>:vector3 = external {}

        # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
        (Rotation:rotation).GetLocalRight<public>()<transacts>:vector3 = external {}

        # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
        # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
        (Rotation:rotation).GetLocalUp<public>()<transacts>:vector3 = external {}

        # Makes an `[]float` with three elements:
        #  * *yaw* degrees of `rotation`
        #  * *pitch* degrees of `rotation`
        #  * *roll* degrees of `rotation`
        # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
        (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<varies>:[]float

        # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
        (Rotation:rotation).Invert<native><public>()<transacts>:rotation

        # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
        (Rotation:rotation).IsFinite<native><public>()<computes><decides>:rotation

        # Makes a `vector3` by applying `Rotation` to `Vector`.
        (Rotation:rotation).RotateVector<native><public>(Vector:vector3)<transacts>:vector3

        # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
        (Rotation:rotation).UnrotateVector<native><public>(Vector:vector3)<transacts>:vector3

        # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
        (V:vector2).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Returns `V` if all components are finite.
        # Fails if any of the components are not finite.
        (V:vector2).IsFinite<public>()<computes><decides>:vector2 = external {}

        # Returns the length of `V`.
        (V:vector2).Length<public>()<varies>:float = external {}

        # Returns the squared length of `V`.
        (V:vector2).LengthSquared<public>()<varies>:float = external {}

        # Makes a unit length `vector3` pointing in the same direction of `V`.
        # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
        (V:vector2).MakeUnitVector<native><public>()<varies><decides>:vector2

        # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
        (V:vector3).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Returns `V` if all components are finite.
        # Fails if any of the components are not finite.
        (V:vector3).IsFinite<public>()<computes><decides>:vector3 = external {}

        # Returns the length of `V`.
        (V:vector3).Length<public>()<varies>:float = external {}

        # Returns the squared length of `V`.
        (V:vector3).LengthSquared<public>()<computes>:float = external {}

        # Returns the squared length of `V` as if `V.Z = 0.0`.
        (V:vector3).LengthSquaredXY<public>()<varies>:float = external {}

        # Returns the length of `V` as if `V.Z = 0.0`.
        (V:vector3).LengthXY<public>()<varies>:float = external {}

        # Makes a unit length `vector3` pointing in the same direction of `V`.
        # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
        (V:vector3).MakeUnitVector<native><public>()<varies><decides>:vector3

        # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
        AngularDistance<native><public>(Rotation1:rotation, Rotation2:rotation)<varies>:float

        # Returns the cross product of `V1` and `V2`.
        CrossProduct<native><public>(V1:vector3, V2:vector3)<varies>:vector3

        # Returns radians from `Degrees`.
        DegreesToRadians<public>(Degrees:float)<varies>:float = external {}

        # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
        #  * `0.0`, representing equivalent rotations and
        #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
        Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<varies>:float

        # Returns the Euclidean distance between `V1` and `V2`.
        Distance<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns the Euclidean distance between `V1` and `V2`.
        Distance<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the squared Euclidean distance between `V1` and `V2`.
        DistanceSquared<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns the squared Euclidean distance between `V1` and `V2`.
        DistanceSquared<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
        DistanceSquaredXY<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
        DistanceXY<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the dot product of `V1` and `V2`.
        DotProduct<native><public>(V1:vector2, V2:vector2)<varies>:float

        # Returns the dot product of `V1` and `V2`.
        DotProduct<native><public>(V1:vector3, V2:vector3)<varies>:float

        # Returns the dot product of `V1` and `V2`.
        DotProduct<public>(V1:vector2i, V2:vector2i)<computes>:int = external {}

        # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
        # Fails if any component of `V1` does not equal the corresponding component of `V2`.
        Equals<public>(V1:vector2i, V2:vector2i)<computes><decides>:vector2i = external {}

        # Makes the identity `rotation`.
        IdentityRotation<native><public>()<converges>:rotation

        # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
        IsAlmostEqual<public>(V1:vector2, V2:vector2, AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
        IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}

        # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
        # Returns `From*(1 - Parameter) + To*Parameter`.
        Lerp<public>(From:vector2, To:vector2, Parameter:float)<varies>:vector2 = external {}

        # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
        # Returns `From*(1 - Parameter) + To*Parameter`.
        Lerp<public>(From:vector3, To:vector3, Parameter:float)<varies>:vector3 = external {}

        # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by
        # the Euler angle components in `RotationB` and ensures the returned value is normalized.
        MakeComponentWiseDeltaRotation<native><public>(RotationA:rotation, RotationB:rotation)<transacts>:rotation

        # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
        MakeRotation<native><public>(Axis:vector3, AngleRadians:float)<varies>:rotation

        # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
        #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
        #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
        #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
        # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
        MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<varies>:rotation

        # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
        # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
        # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
        MakeShortestRotationBetween<native><public>(InitialRotation:rotation, FinalRotation:rotation)<transacts>:rotation

        # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
        # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
        # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
        MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<transacts>:rotation

        # Makes a `vector3` with all components `1.0`.
        Ones<epic_internal>()<computes>:vector3 = external {}

        # Returns degrees from `Radians`.
        RadiansToDegrees<public>(Radians:float)<varies>:float = external {}

        # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
        # Fails if `not SurfaceNormal.MakeUnitVector[]`.
        ReflectVector<native><public>(Direction:vector2, SurfaceNormal:vector2)<varies><decides>:vector2

        # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
        # Fails if `not SurfaceNormal.MakeUnitVector[]`.
        ReflectVector<native><public>(Direction:vector3, SurfaceNormal:vector3)<varies><decides>:vector3

        # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
        Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Parameter:float)<transacts><decides>:rotation

        # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
        # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
        ToString<native><public>(Rotation:rotation)<varies>:[]char

        # Makes a `string` representation of `V`.
        ToString<native><public>(V:vector2)<varies>:[]char

        # Makes a `string` representation of `V`.
        ToString<native><public>(V:vector2i)<computes>:[]char

        # Makes a `string` representation of `V`.
        ToString<native><public>(V:vector3)<varies>:[]char

        # Makes a `vector2` by converting the components of `V` to `float`s.
        ToVector2<public>(V:vector2i)<transacts>:vector2 = external {}

        # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
        ToVector2i<public>(V:vector2)<varies><decides>:vector2i = external {}

        # Makes a `vector3` by applying `InTransform` to `InVector`.
        TransformVector<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

        # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
        TransformVectorNoScale<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

        # Makes a unit `vector3` pointing in the positive X axis (forward)
        XAxis<epic_internal>()<computes>:vector3 = external {}

        # Makes a unit `vector3` pointing in the positive Y axis (right)
        YAxis<epic_internal>()<computes>:vector3 = external {}

        # Makes a unit `vector3` pointing in the positive Z axis (up)
        ZAxis<epic_internal>()<computes>:vector3 = external {}

        # Makes a `vector3` with all components `0.0`.
        Zero<epic_internal>()<computes>:vector3 = external {}

        # Makes a `vector2` by multiplying the components of `Right` by `Left`.
        operator'*'<public>(Left:float, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector3` by multiplying the components of `Right` by `Left`.
        operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

        # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
        operator'*'<public>(Left:int, Right:vector2i)<computes>:vector2i = external {}

        # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
        operator'*'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
        operator'*'<public>(Left:vector2i, Right:int)<computes>:vector2i = external {}

        # Makes a `vector3` by multiplying the components of `Left` by `Right`.
        operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

        # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
        operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Makes a `vector2` by component-wise addition of `Left` and `Right`.
        operator'+'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
        operator'+'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Makes a `vector3` by component-wise addition of `Left` and `Right`.
        operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
        operator'-'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
        operator'-'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

        # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
        operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Makes a `vector2` by dividing the components of `Left` by `Right`.
        operator'/'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

        # Makes a `vector2` by component-wise division of `Left` by `Right`.
        operator'/'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

        # Makes a `vector3` by dividing the components of `Left` by `Right`.
        operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

        # Makes a `vector3` by component-wise division of `Left` by `Right`.
        operator'/'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

        # Makes a `vector2` by inverting the signs of `Operand`.
        prefix'-'<public>(Operand:vector2)<computes>:vector2 = external {}

        # Makes a `vector2i` by inverting the signs of `Operand`.
        prefix'-'<public>(Operand:vector2i)<computes>:vector2i = external {}

        # Makes a `vector3` by inverting the signs of `Operand`.
        prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

        @editable
        @import_as("/Script/EpicGamesTemporary.FVerseRotation")
        rotation<native><public> := struct<concrete>:

        # A combination of scale, rotation, and translation, applied in that order.
        transform<native><public> := struct<concrete><computes>:
            @editable
            # The rotation of this `transform`.
            Rotation<native><public>:rotation = external {}

            @editable
            # The scale of this `transform`.
            Scale<native><public>:vector3 = external {}

            @editable
            # The location of this `transform`.
            Translation<native><public>:vector3 = external {}

        # 2-dimensional vector with `float` components.
        vector2<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

        # 2-dimensional vector with `int` components.
        vector2i<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:int = external {}

            @editable
            Y<native><public>:int = external {}

        # 3-dimensional vector with `float` components.
        vector3<native><public> := struct<concrete><computes><persistable>:
            @editable
            X<native><public>:float = external {}

            @editable
            Y<native><public>:float = external {}

            @editable
            Z<native><public>:float = external {}

    using {/Verse.org/Assets}
    using {/Verse.org/Colors}
    using {/Verse.org/VerseEngine/Component}
    # Module import path: /UnrealEngine.com/Temporary/UI
    UI<public> := module:
        # Returns the `player_ui` component associated with `Player`.
        # Fails if there is no `player_ui` associated with `Player`.
        GetPlayerUI<native><public>(Player:player)<transacts><decides>:player_ui

        # Make a canvas slot for fixed position widget.
        # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
        # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
        # The widget is not anchored and will not move if the parent is resized.
        # The Anchors is set to zero.
        MakeCanvasSlot<native><public>(Widget:widget, Position:vector2, ?Size:vector2 = external {}, ?ZOrder:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}, ?Alignment:vector2 = external {})<computes>:canvas_slot

        # The anchors of a `widget` determine its the position and sizing relative to its parent.
        # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
        anchors<native><public> := struct:
            # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
            Maximum<native><public>:vector2 = external {}

            # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
            Minimum<native><public>:vector2 = external {}

        # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
        button<native><public> := class<final>(widget):
            # Subscribable event that fires when the button is clicked.
            OnClick<public>():listenable(widget_message) = external {}

            # Sets the child widget slot.
            SetWidget<native><public>(InSlot:button_slot):void

            # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
            Slot<native><public>:button_slot

        # Slot for button widget.
        button_slot<native><public> := struct:
            # Horizontal alignment of the widget inside the slot.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

            # Vertical alignment of the widget inside the slot.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

        # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
        canvas<native><public> := class<final>(widget):
            # Adds a new child slot to the canvas.
            AddWidget<native><public>(Slot:canvas_slot):void

            # Removes a slot containing the given widget.
            RemoveWidget<native><public>(Widget:widget):void

            # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]canvas_slot = external {}

        # Slot for a canvas widget.
        canvas_slot<native><public> := struct:
            # Alignment is the pivot/origin point of the widget.
            # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
            Alignment<native><public>:vector2 = external {}

            # The border for the margin and how the widget is resized with its parent.
            # Values are defined between 0.0 and 1.0.
            Anchors<native><public>:anchors = external {}

            # The offset that defined the size and position of the widget.
            # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X, the Offsets.Bottom represent the distance in pixel from the Anchors Maximum.Y, effectively controlling the desired widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position and Offsets.Right and Offset.Bottom represent the widget size.
            Offsets<native><public>:margin = external {}

            # When true we use the widget's desired size. The size calculated by the Offsets is ignored.
            SizeToContent<native><public>:logic = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

            # Z Order of this slot relative to other slots in this canvas panel.
            # Higher values are rendered last (and so they will appear to be on top)
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

        # A solid color widget.
        color_block<native><public> := class<final>(widget):
            # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
            DefaultColor<native><public>:color = external {}

            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
            DefaultOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # Gets the widget's color.
            GetColor<native><public>():color

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

            # Gets the widget's opacity.
            GetOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

            # Sets the widget's color.
            SetColor<native><public>(InColor:color):void

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Sets the widgets's opacity.
            SetOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

        # `widget` horizontal alignment mode.
        horizontal_alignment<native><public> := enum:
            # Center `widget` horizontally within the slot.
            Center

            # `widget` fills the slot horizontally.
            Fill

            # Align `widget` to the left of the slot.
            Left

            # Align `widget` to the right of the slot.
            Right

        # Tiling options values
        image_tiling<native><public> := enum:
            # Repeat/Wrap the image to fill the available space.
            Repeat

            # Stretch the image to fit the available space.
            Stretch

        # Specifies the gap outside each edge separating a `widget` from its neighbors.
        # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
        margin<native><public> := struct:
            # The bottom edge spacing.
            Bottom<native><public>:float = external {}

            # The left edge spacing.
            Left<native><public>:float = external {}

            # The right edge spacing.
            Right<native><public>:float = external {}

            # The top edge spacing.
            Top<native><public>:float = external {}

        # A widget to display a material.
        material_block<native><epic_internal> := class(widget):
            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # The image to render. Used only during initialization of the widget and not modified by SetImage.
            DefaultImage<native><public>:material

            # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
            DefaultTint<native><public>:color = external {}

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

            # Gets the image to render.
            GetImage<native><public>():material

            # Gets the tint applied to the image.
            GetTint<native><public>():color

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Sets the image to render.
            SetImage<native><public>(InImage:material):void

            # Sets the tint applied to the image.
            SetTint<native><public>(InColor:color):void

        # Used by`widget` orientation modes.
        orientation<native><public> := enum:
            # Orient `widget`s from left to right.
            Horizontal

            # Orient `widget`s from top to bottom.
            Vertical

        # Overlay is a container consisting of widgets stacked on top of each other.
        overlay<native><public> := class<final>(widget):
            # Add a new child slot to the overlay. Slots are added at the end.
            AddWidget<native><public>(Slot:overlay_slot):void

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

            # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]overlay_slot = external {}

        # Slot for an overlay widget
        overlay_slot<native><public> := struct:
            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

        # The main interface for adding and removing `widget`s to a player's UI.
        player_ui<native><public> := class<final><epic_internal>(component):
            # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
            AddWidget<native><public>(Widget:widget):void

            # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
            AddWidget<native><public>(Widget:widget, Slot:player_ui_slot):void

            # Removes `Widget` from this `player_ui`.
            RemoveWidget<native><public>(Widget:widget):void

        # `widget` creation configuration options.
        player_ui_slot<native><public> := struct:
            # Controls `widget` input event consumption.
            InputMode<native><public>:ui_input_mode = external {}

            # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
            ZOrder<native><public>:type {_X:int where 0 <= _X, _X <= 2147483647} = external {}

        # For internal use only.
        simple_button_internal<native><epic_internal> := class<final>(widget):
            DefaultText<localizes><native><public>:message = external {}

            OnClick<public>():listenable(widget_message) = external {}

            SetText<native><public>(InText:message):void

        # Stack box is a container of a list of widgets stacked either vertically or horizontally.
        stack_box<native><public> := class<final>(widget):
            # Add a new child slot to the stack box. Slots are added at the end.
            AddWidget<native><public>(Slot:stack_box_slot):void

            # The orientation of the stack box. Either stack widgets horizontal or vertical.
            Orientation<native><public>:orientation

            # Removes a slot containing the given widget
            RemoveWidget<native><public>(Widget:widget):void

            # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
            Slots<native><public>:[]stack_box_slot = external {}

        # Slot for a stack_box widget
        stack_box_slot<native><public> := struct:
            # The available space will be distributed proportionally.
            # If not set, the slot will use the desired size of the widget.
            Distribution<native><public>:?float = external {}

            # Horizontal alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            HorizontalAlignment<native><public>:horizontal_alignment = external {}

            # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
            Padding<native><public>:margin = external {}

            # Vertical alignment of the widget inside the slot.
            # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
            VerticalAlignment<native><public>:vertical_alignment = external {}

            # The widget assigned to this slot.
            Widget<native><public>:widget

        # Base widget for text widget.
        text_base<native><public> := class<abstract>(widget):
            # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
            DefaultJustification<native><public>:text_justification = external {}

            # The policy that determine what happens when the text is longer than its allowed length.
            # Used only during initialization of the widget and not modified by SetOverflowPolicy.
            DefaultOverflowPolicy<native><public>:text_overflow_policy = external {}

            # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
            DefaultText<native><localizes><public>:message = external {}

            # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
            DefaultTextColor<native><public>:color = external {}

            # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
            DefaultTextOpacity<native><public>:type {_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

            # Gets the text justification in the widget.
            GetJustification<native><public>():text_justification

            # Gets the policy that determine what happens when the text is longer than its allowed length.
            GetOverflowPolicy<native><public>():text_overflow_policy

            # Gets the text currently in the widget.
            GetText<native><public>():[]char

            # Gets the color of the displayed text.
            GetTextColor<native><public>():color

            # Gets the opacity of the displayed text.
            GetTextOpacity<native><public>():type {_X:float where 0.000000 <= _X, _X <= 1.000000}

            # Sets the text justification in the widget.
            SetJustification<native><public>(InJustification:text_justification):void

            # Sets the policy that determine what happens when the text is longer than its allowed length.
            SetOverflowPolicy<native><public>(InOverflowPolicy:text_overflow_policy):void

            # Sets the text displayed in the widget.
            SetText<native><public>(InText:message):void

            # Sets the color of the displayed text.
            SetTextColor<native><public>(InColor:color):void

            # Sets the opacity of the displayed text.
            SetTextOpacity<native><public>(InOpacity:type {_X:float where 0.000000 <= _X, _X <= 1.000000}):void

        # Text block widget. Displays text to the user.
        text_block_internal<native><epic_internal> := class(text_base):

        # Text justification values:
        #   Left: Justify the text logically to the left based on current culture.
        #   Center: Justify the text in the center.
        #   Right: Justify the text logically to the right based on current culture.
        # The Left and Right value will flip when the local culture is right-to-left.
        text_justification<native><public> := enum:
            Center

            InvariantLeft

            InvariantRight

            Left

            Right

        # Text overflow policy values:
        #   Clip: Overflowing text will be clipped.
        #   Ellipsis: Overflowing text will be replaced with an ellipsis.
        text_overflow_policy<native><public> := enum:
            Clip

            Ellipsis

        # A widget to display a texture.
        texture_block<native><public> := class(widget):
            # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
            DefaultDesiredSize<native><public>:vector2 = external {}

            # The horizontal tiling option. Used only during initialization of the widget and not modified by SetTiling.
            DefaultHorizontalTiling<native><public>:image_tiling = external {}

            # The image to render. Used only during initialization of the widget and not modified by SetImage.
            DefaultImage<native><public>:texture

            # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
            DefaultTint<native><public>:color = external {}

            # The vertical tiling option. Used only during initialization of the widget and not modified by SetTiling.
            DefaultVerticalTiling<native><public>:image_tiling = external {}

            # Gets the size this widget desired to be displayed in.
            GetDesiredSize<native><public>():vector2

            # Gets the image to render.
            GetImage<native><public>():texture

            # Gets the tiling option.
            GetTiling<native><public>():tuple(image_tiling, image_tiling)

            # Gets the tint applied to the image.
            GetTint<native><public>():color

            # Sets the size this widget desired to be displayed in.
            SetDesiredSize<native><public>(InDesiredSize:vector2):void

            # Sets the image to render.
            SetImage<native><public>(InImage:texture):void

            # Sets the tiling option when the image is smaller than the allocated size.
            SetTiling<native><public>(InHorizontalTiling:image_tiling, InVerticalTiling:image_tiling):void

            # Sets the tint applied to the image.
            SetTint<native><public>(InColor:color):void

        # `widget` input consumption mode.
        ui_input_mode<native><public> := enum:
            # `widget` consumes all inputs
            All

            # `widget` does not consume any input.
            None

        # Widget created from a umg_widget_class_asset.
        umg_widget<native><epic_internal> := class<epic_internal>(widget):
            # The widget_blueprint asset to create.
            Asset<native><epic_internal>:umg_widget_class_asset

        # Verse interface to native `umg asset`.
        umg_widget_class_asset<native><epic_internal> := class<computes><final>(client_asset):

        # `widget` vertical alignment mode.
        vertical_alignment<native><public> := enum:
            # Align `widget` to the bottom of the slot.
            Bottom

            # Center `widget` vertically within the slot.
            Center

            # `widget` fills the slot vertically.
            Fill

            # Align `widget` to the top of the slot.
            Top

        # Base class for all UI elements drawn on the `player`'s screen.
        widget<native><public> := class<abstract><unique><epic_internal>:
            # Returns the `widget`'s parent `widget`.
            # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
            GetParentWidget<native><public>()<transacts><decides>:widget

            # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
            # Fails if this `widget` is not in the `player_ui`.
            GetRootWidget<native><public>()<transacts><decides>:widget

            # Returns the current `widget_visibility` state.
            GetVisibility<native><public>():widget_visibility

            # `true` if this `widget` can be modified interactively by the player.
            IsEnabled<native><public>():logic

            # Enables or disables whether the `player` can interact with this `widget`.
            SetEnabled<native><public>(InIsEnabled:logic):void

            # Shows or hides the `widget` without removing itself from the containing `player_ui`.
            # See `widget_visibility` for details.
            SetVisibility<native><public>(InVisibility:widget_visibility):void

        # Parameters for `event`s signalled by a `widget`.
        widget_message<native><public> := struct:
            # The `player` that triggered the `event`.
            Player<native><public>:player

            # The `widget` that triggered the `event`.
            Source<native><public>:widget

        # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
        widget_visibility<native><public> := enum:
            # The `widget` is invisible and does not occupy layout space.
            Collapsed

            # The `widget` is invisible and occupies layout space.
            Hidden

            # The `widget` is visible and occupies layout space.
            Visible

    using {/UnrealEngine.com/Temporary/SpatialMath}
    using {/Verse.org/Simulation}
    # Module import path: /UnrealEngine.com/Temporary/VerseBasicGameplay
    VerseBasicGameplay<public> := module:
        # Module import path: /UnrealEngine.com/Temporary/VerseBasicGameplay/PlayerManager
        PlayerManager<public> := module:
            GetPlayerManagerForLocation<public>(Location:vector3):?basic_player_manager = external {}

            basic_player_manager<public> := class<internal>:
                GetPlayerCount<public>()<transacts>:int = external {}

                GetPlayers<public>()<transacts>:[]player = external {}

                PlayerAddedEvent<public>:subscribable(player)

                PlayerRemovedEvent<public>:subscribable(player)

using {/UnrealEngine.com/VGameplayRst/Transform}
using {/Verse.org/Colors}
using {/Verse.org/Restricted}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/VerseEngine/Entity}
using {/Verse.org/VerseExperimental}
# Module import path: /UnrealEngine.com/VGameplayRst
VGameplayRst<public> := module:
    # Module import path: /UnrealEngine.com/VGameplayRst/Audio
    Audio<public> := module:
        audio_component<native><public> := class<final>(component):
            BeginSound<native><public>():void

            EndSound<native><public>():void

            SetSound<native><epic_internal>(Sound:sound)<transacts>:void

    # Module import path: /UnrealEngine.com/VGameplayRst/Components
    Components<public> := module:
        activation_state<native><public> := enum:
            Active

            Inactive

        dynamic_activation_component<native><public> := class<final>(component):
            BeginTransition<native><public>(SecondsToChange:float, TargetState:activation_state):void

            LinkComponent<native><public>(ComponentToLink:component):void

            Reset<native><public>():void

            UnlinkComponent<native><public>(ComponentToUnlink:component):void

            WaitForTransitionBegin<native><public>()<suspends>:void

            WaitForTransitionComplete<native><public>()<suspends>:void

        script_component<native><public> := class<abstract><unique>(component):
            AddToCreateComponentList<native><public>(__dupe___unnamed_parameter_100:[]subtype(component)):void

            AddToRequiredComponentList<native><public>(__dupe___unnamed_parameter_101:[]subtype(component)):void

            GetAllComponentsOfType<native><public>(componentType:type)<transacts>:[]component

            GetComponentOfType<native><public>(componentType:type)<transacts>:?component

            GetFullname<native><public>():[]char

            GetName<native><public>():[]char

            IsEnabled<native><public>():logic

            IsOwner<native><public>(Entity:entity):logic

            OnBegin<native_callable><public>():void = external {}

            OnCreate<native_callable><public>():void = external {}

            OnEnabledChanged<native_callable><public>(Enabled:logic):void = external {}

            OnEnd<native_callable><public>():void = external {}

            OnPostCreate<native_callable><public>():void = external {}

            OnTick<native_callable><public>(DeltaTime:float):void = external {}

            SetEnabled<native><public>(Enabled:logic):void

            SetTickEnabled<native><public>(InIsEnabled:logic):void

            var AllowMultiple<native><public>:logic = external {}

    # Module import path: /UnrealEngine.com/VGameplayRst/Datastore
    Datastore<public> := module:
        # Module import path: /UnrealEngine.com/VGameplayRst/Datastore/DatastoreComponent
        DatastoreComponent<epic_internal> := module:
            ClearAllDatastoreValues<native><public>(Player:player_component):void

            SetDatastoreValue<native><public>(Player:player_component, Key:[]char, Value:[]char):void

            SetDatastoreValueInt<native><public>(Player:player_component, Key:[]char, Value:int):void

        datastore_component<native><public> := class<final>(component):

    # Module import path: /UnrealEngine.com/VGameplayRst/DebugDraw
    DebugDraw<public> := module:

    # Module import path: /UnrealEngine.com/VGameplayRst/EntityUtil
    EntityUtil<public> := module:
        # Creates a component of the specified type on the entity indicated by EntityID. Returns the spawned component object
        CreateAndAddComponent<native><public>(EntityID:int, ComponentType:subtype(component))<transacts>:component

        # Attempts to find a sub component of the specified type from the nominated component. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponent<native><public>(Component:component, Type:type)<transacts><decides>:component

        # Attempts to find a sub component of the specified type from the nominated component for the specified entity. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponentForEntity<native><public>(Component:component, EntityID:int, Type:type)<transacts><decides>:component

        # Spawn an empty entity with the specified transform. Returns the EntityID
        SpawnEmptyEntity<native><public>(InTransform:transform, Name:[]char):int

        # Spawn an empty entity with the specified transform. Returns the entity.
        SpawnEntity<native><public>(InTransform:transform, Name:[]char):?entity

        # Spawn an empty entity with the specified position. Returns the entity
        SpawnEntity<native><public>(Position:vector3, Name:[]char):?entity

        # Spawn an empty entity with the specified position, rotation, and scale. Returns the entity
        SpawnEntity<native><public>(Position:vector3, Rotation:vector3, Scale:vector3, Name:[]char):?entity

        # Spawn an entity from the specified assetPath with a transform. Returns the EntityID
        SpawnEntityFromAsset<native><public>(AssetPath:[]char, InTransform:transform, Name:[]char):int

    # Module import path: /UnrealEngine.com/VGameplayRst/GameObjects
    GameObjects<public> := module:
        CreateImmutableModel<public>(TagToFind:tag):?immutable_model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, InScale:vector3, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InTransform:transform, Name:[]char, Mesh:mesh):?model = external {}

        CreateModel<epic_internal>(InTransform:transform, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<public>(TagToFind:tag):?model = external {}

        CreateWorldAnchor<public>(Entity:entity):?world_anchor = external {}

        CreateWorldAnchor<public>(TagToFind:tag):?world_anchor = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3):?world_anchor = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3, DebugName:[]char):?world_anchor = external {}

        # Model that can only be inspected, not modified.
        immutable_model<public> := class<internal>(model_interface):
            ForwardVector<override>()<transacts>:vector3 = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            GetScale<override>()<transacts>:vector3 = external {}

            GetTransform<public>():transform = external {}

            # Returns true if the model mesh is visible.
            IsVisible<public>():logic = external {}

            RightVector<override>()<transacts>:vector3 = external {}

            Rotation<override>()<transacts>:rotation = external {}

            UpVector<override>()<transacts>:vector3 = external {}

        model<public> := class<internal>(mutable_model_interface):
            ApplyAdditionalRotation<override>(r:rotation):void = external {}

            Destroy<public>():void = external {}

            DisableCollision<public>():void = external {}

            EnableCollision<public>():void = external {}

            ForwardVector<override>()<transacts>:vector3 = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            GetScale<override>()<transacts>:vector3 = external {}

            GetTransform<public>():transform = external {}

            Hide<public>():void = external {}

            IsVisible<public>():logic = external {}

            RightVector<override>()<transacts>:vector3 = external {}

            Rotation<override>()<transacts>:rotation = external {}

            SetForwardVectorFromXY<override>(x:vector3, y:vector3):void = external {}

            SetPosition<override>(NewPosition:vector3)<transacts>:void = external {}

            SetRotation<override>(r:rotation)<transacts>:void = external {}

            SetScale<override>(NewScale:vector3)<transacts>:void = external {}

            SetTransform<public>(NewTransform:transform):void = external {}

            Show<public>():void = external {}

            UpVector<override>()<transacts>:vector3 = external {}

        model_interface<public> := interface(positionable, rotatable, scalable):

        mutable_model_interface<public> := interface(mutable_positionable, mutable_rotatable, mutable_scalable, model_interface):

        world_anchor<public> := class<internal>(mutable_positionable):
            Destroy<public>():void = external {}

            GetComponent<public>()<transacts>:component = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            SetPosition<override>(Position:vector3)<transacts>:void = external {}

    # Module import path: /UnrealEngine.com/VGameplayRst/Geometry
    Geometry<public> := module:
        collision_type<native><public> := enum:
            NoCollision

            QueryAndSimulation

            QueryOnly

            SimulationOnly

        default_animation_mode_type<native><public> := enum:
            UseAnimationAsset

            UseAnimationBlueprint

            UseAnimationInstance

            UseCustomMode

        default_mesh_type<native><public> := enum:
            Cone

            Cube

            Cylinder

            Plane

            Sphere

        fixed_mesh_component<native><public> := class<final>(component):
            IsVisible<native><public>():logic

            SetAsRootComponent<native><public>(KeepExistingRootTransform:logic, DestroyOldRoot:logic)<transacts>:void

            SetDefaultMesh<native><public>(DefaultMesh:default_mesh_type):void

            SetEnableCollision<native><public>(EnabledCollision:collision_type)<transacts>:void

            SetMaterial<native><epic_internal>(Material:material)<transacts>:void

            SetMaterialAtIndex<native><epic_internal>(Material:material, Index:int):void

            SetMesh<native><epic_internal>(Mesh:mesh)<transacts>:void

            SetVisibility<native><public>(NewVisibility:logic)<transacts>:void

        skeletal_mesh_component<native><public> := class(component):
            BeginAnimation<native><public>(Looping:logic):void

            EndAnimation<native><public>():void

            GetAnimationPlayRate_FIXME<native><public>():float

            GetAnimationPosition_FIXME<native><public>():float

            IsPlayingAnimation<native><public>():logic

            SetAnimation<native><epic_internal>(InAnimation:animation):void

            SetAnimationBlueprint<native><epic_internal>(InAnimationBlueprint:animation_blueprint):void

            SetAnimationInstance<native><epic_internal>(InAnimationInstance:animation_instance):void

            SetAnimationMode<native><public>(AnimMode:default_animation_mode_type):void

            SetAnimationPlayRate_FIXME<native><public>(Rate:float):void

            SetAnimationPosition_FIXME<native><public>(InPos:float, FireNotifies:logic):void

            SetMaterial<native><epic_internal>(Material:material):void

            SetSkeletalMesh<native><epic_internal>(Mesh:skeletal_mesh):void

    # Module import path: /UnrealEngine.com/VGameplayRst/LevelStreaming
    LevelStreaming<public> := module:
        level_streaming_component<native><public> := class<final>(component):
            RequestLoadLevel<native><epic_internal>(Level:level, Timeout:time_span, MessageToKickedPlayers:[]char):?sticky_event(void)

            RequestUnloadLevel<native><public>(Timeout:time_span, MessageToKickedPlayers:[]char):?sticky_event(void)

    # Module import path: /UnrealEngine.com/VGameplayRst/Lights
    Lights<public> := module:
        point_light_component<native><public> := class<final>(component):
            GetAttenuationRadius<native><public>():float

            GetColor<native><epic_internal>():color

            GetIntensity<native><public>():float

            GetSourceLength<native><public>():float

            GetSourceRadius<native><public>():float

            SetAttenuationRadius<native><public>(NewRadius:float):void

            SetColor<native><epic_internal>(NewColor:color):void

            SetIntensity<native><public>(NewIntensity:float):void

            SetSourceLength<native><public>(NewLength:float):void

            SetSourceRadius<native><public>(NewRadius:float):void

        spot_light_component<native><public> := class<final>(component):
            GetAttenuationRadius<native><public>():float

            GetColor<native><epic_internal>():color

            GetInnerConeAngle<native><public>():float

            GetIntensity<native><public>():float

            GetOuterConeAngle<native><public>():float

            GetSourceLength<native><public>():float

            GetSourceRadius<native><public>():float

            SetAttenuationRadius<native><public>(NewRadius:float):void

            SetColor<native><epic_internal>(NewColor:color):void

            SetInnerConeAngle<native><public>(NewInnerConeAngle:float):void

            SetIntensity<native><public>(NewIntensity:float):void

            SetOuterConeAngle<native><public>(NewOuterConeAngle:float):void

            SetSourceLength<native><public>(NewLength:float):void

            SetSourceRadius<native><public>(NewRadius:float):void

    # Module import path: /UnrealEngine.com/VGameplayRst/Messaging
    Messaging<public> := module:
        debug_command_component<native><public> := class(component):
            _WaitForCommand<native><public>(CommandId:[]char)<suspends>:[]char

    # Module import path: /UnrealEngine.com/VGameplayRst/Physics
    Physics<public> := module:
        collision_component<native><public> := class<final>(component):
            GetCollisionProfileName<native><public>()<transacts>:[]char

            GetCollisionShapeMode<native><public>()<transacts>:collision_shape_mode

            GetEnabled<native><public>():logic

            GetGravityEnabled<native><public>():logic

            GetMovable<native><public>()<transacts>:logic

            GetSendHitEventsOnCollide<native><public>()<transacts>:logic

            GetSendOverlapEvents<native><public>()<transacts>:logic

            GetUseContinuousCollisionDetection<native><public>():logic

            SetBoxCollisionShapeMode<native><public>(BoxExtent:vector3)<transacts>:void

            SetCapsuleCollisionShapeMode<native><public>(Height:float, Radius:float)<transacts>:void

            SetCollisionProfileName<native><public>(CollisionProfile:[]char)<transacts>:void

            SetCustomDegreeOfFreedomConstrain<native><public>(CustomMovementPlaneNormal:vector3):void

            SetDegreeOfFreedomContraint<native><public>(MovementMode:dof_movement_mode):void

            SetEnabled<native><public>(InIsEnabled:logic):void

            SetGravityEnabled<native><public>(EnableGravity:logic):void

            SetMeshCollisionShapeMode<native><epic_internal>(Mesh:mesh)<transacts>:void

            # Looks at the static_mesh_component for the mesh.
            SetMeshCollisionShapeMode<native><public>()<transacts>:void

            SetMovable<native><public>(IsMovable:logic)<transacts>:void

            SetSendHitEventsOnCollide<native><public>(EnableHitEvents:logic)<transacts>:void

            SetSendOverlapEvents<native><public>(EnableOverlapEvents:logic)<transacts>:void

            SetSphereCollisionShapeMode<native><public>(Radius:float)<transacts>:void

            SetUseContinuousCollisionDetection<native><public>(UseCCD:logic):void

            WaitBeginOverlap<native><public>()<suspends>:overlap_result

            WaitEndOverlap<native><public>()<suspends>:overlap_result

            WaitHit<native><public>()<suspends>:hit_result

        collision_shape_mode<native><public> := enum:
            CollisionBox

            CollisionCapsule

            CollisionMesh

            CollisionSphere

        dof_movement_mode<native><public> := enum:
            CustomPlane

            Default

            NoConstraints

            SixDOF

            XYPlane

            XZPlane

            YZPlane

        hit_result<native><public> := struct:
            # The location at which the hit occured on OtherEntityID
            HitLocation<native><public>:vector3

            # The surface normal at the location at which the hit occured on OtherEntityID
            HitNormal<native><public>:vector3

            # The collision_component belonging to the entity hit
            OtherComponent<native><public>:collision_component

            # The ID belonging to the entity hit
            OtherEntityID<native><public>:int

        overlap_result<native><public> := class:
            FromSweep<native><public>:logic

            OtherComponent<native><public>:collision_component

            OtherEntityID<native><public>:int

            SweepHitLocation<native><public>:vector3

            SweepHitNormal<native><public>:vector3

        physics_trace<native><public> := class:
            InitPhysicsTrace<native><public>(ContextObject:component, TraceCategory:physics_trace_category, TraceType:physics_trace_type, TraceShape:physics_trace_shape, TraceChannel:physics_trace_channel, Start:vector3, End:vector3, IgnoreCallingEntity:logic, TraceExtent:vector3, TraceRadius:float, ProfileName:[]char):void

            WaitPhysicsTrace<native><public>()<suspends>:[]hit_result

        physics_trace_category<native><public> := enum:
            Channel

            Object

            Profile

        physics_trace_channel<native><public> := enum:
            Camera

            Destructible

            GameTraceChannel1

            GameTraceChannel2

            GameTraceChannel3

            GameTraceChannel4

            GameTraceChannel5

            GameTraceChannel6

            Pawn

            PhysicsBody

            Vehicle

            Visibility

            WorldDynamic

            WorldStatic

        physics_trace_shape<native><public> := enum:
            Box

            Line

            ShapeSphere

        physics_trace_type<native><public> := enum:
            Multi

            Single

            Test

    # Module import path: /UnrealEngine.com/VGameplayRst/Transform
    Transform<public> := module:
        mutable_positionable<native><public> := interface(positionable):
            SetPosition<public>(v:vector3)<transacts>:void

        mutable_rotatable<native><public> := interface(rotatable):
            ApplyAdditionalRotation<public>(r:rotation):void

            SetForwardVectorFromXY<public>(x:vector3, y:vector3):void

            SetRotation<public>(r:rotation)<transacts>:void

        mutable_scalable<native><public> := interface(scalable):
            SetScale<public>(v:vector3)<transacts>:void

        position_component<native><public> := class<final>(component, mutable_positionable):
            AddToPosition<native><public>(v:vector3):void

            GetPosition<override><native>()<transacts>:vector3

            SetPosition<override><native>(v:vector3)<transacts>:void

        positionable<native><public> := interface:
            GetPosition<public>()<transacts>:vector3

        rotatable<native><public> := interface:
            ForwardVector<public>()<transacts>:vector3

            RightVector<public>()<transacts>:vector3

            Rotation<public>()<transacts>:rotation

            UpVector<public>()<transacts>:vector3

        rotation_component<native><public> := class<final>(component, mutable_rotatable):
            ApplyAdditionalRotation<override><native>(r:rotation):void

            ForwardVector<override>()<transacts>:vector3 = external {}

            RightVector<override>()<transacts>:vector3 = external {}

            Rotation<override><native>()<transacts>:rotation

            SetForwardVectorFromXY<override><native>(x:vector3, y:vector3):void

            SetRotation<override><native>(r:rotation)<transacts>:void

            UpVector<override>()<transacts>:vector3 = external {}

        scalable<native><public> := interface:
            GetScale<public>()<transacts>:vector3

        scale_component<native><public> := class<final>(component, mutable_scalable):
            AddToScale<native><public>(v:vector3):void

            GetScale<override><native>()<transacts>:vector3

            SetScale<override><native>(v:vector3)<transacts>:void

    # Module import path: /UnrealEngine.com/VGameplayRst/VFX
    VFX<public> := module:
        particle_system_component<native><public> := class<final>(component):
            Activate<native><public>():void

            Deactivate<native><public>():void

            SetParticleSystem<native><epic_internal>(ParticleSystem:particle_system)<transacts>:void

using {/Verse.org/Native}
# Module import path: /UnrealEngine.com/VerseQuery
VerseQuery<public> := module:
    (Component:component).GetQueryManager<native><epic_internal>():query_manager

    (Component:core_entity_component).GetQueryManager<native><epic_internal>():query_manager

    (Entity:core_entity).GetQueryManager<native><epic_internal>():query_manager

    (QueryManager:query_manager).EntitiesOfType<native><epic_internal>(EntityClass:subtype(core_entity))<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesOfTypeIterator<native><epic_internal>(EntityClass:subtype(core_entity))<varies>:query_iterator

    (QueryManager:query_manager).EntitiesWithComponents<native><epic_internal>(ComponentClass:subtype(core_entity_component))<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesWithComponentsIterator<native><epic_internal>(ComponentClass:subtype(core_entity))<varies>:query_iterator

    (QueryManager:query_manager).EntitiesWithTags<native><epic_internal>(AllRequiredTags:[]tag, AnyRequiredTag:[]tag, DisallowedTags:[]tag)<varies>:[]core_entity

    (QueryManager:query_manager).EntitiesWithinVolume<native><epic_internal>(Volume:query_volume)<varies>:[]core_entity

    core_entity_query_iterator<native><epic_internal> := class(query_iterator, query_iterator_base):
        IsValid<native><override>():logic

        Next<native><override>():?core_entity

    null_query_iterator<native><epic_internal> := class(query_iterator):
        IsValid<native><override>():logic

        Next<native><override>():?core_entity

    # Helper component used to associate a core_entity with a playspace
    playspace_association_component<native><epic_internal> := class(core_entity_component):

    query_iterator<native><epic_internal> := interface:
        IsValid<public>():logic

        Next<public>():?core_entity

    @import_as("/Script/VerseQuery.UQueryIteratorBase")
    query_iterator_base<native><epic_internal> := class:

    @import_as("/Script/VerseQuery.UEntityQueryManager")
    query_manager<native><epic_internal> := class:

    # Abstract base representation of volume
    query_volume<native><epic_internal> := class<abstract>:

    # Axis aligned box volume
    query_volume_box<native><epic_internal> := class<concrete>(query_volume):
        Extent<native><public>:vector3 = external {}

        Origin<native><public>:vector3 = external {}

    # Component used for tagging objects for retrieval later. Useful when connecting runtime scripts with editor placed objects.
    tag_container_core_entity_component<native><epic_internal> := class<final>(core_entity_component):
        # Add a single tag to this component.
        AddTag<native><epic_internal>(TagToAdd:tag):void

        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Get the tags associated with this component. These may be specified in the editor.
        GetTags<native><epic_internal>():tag_container

        # Remove a single tag from this component.
        RemoveTag<native><epic_internal>(TagToRemove:tag):logic

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Set the tags associated with this component.
        SetTags<native><epic_internal>(InTags:tag_container):void

WorldPartition<public> := module:
    using {/Verse.org/Assets}
    # Module import path: /UnrealEngine.com/WorldPartition/VerseWorldPartition
    VerseWorldPartition<public> := module:
        GetDataLayerManager<native><public>()<transacts>:?data_layer_manager

        data_layer_asset<native><public> := class<computes><final><epic_internal>(asset):

        # Data Layer Manager used to get/set the runtime state of Data Layers.
        data_layer_manager<native><public> := class<concrete>:
            # Returns data layer effective runtime state.
            GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset:data_layer_asset):data_layer_runtime_state

            # Sets data layer runtime state.
            SetDataLayerRuntimeState<native><public>(DataLayerAsset:data_layer_asset, State:data_layer_runtime_state, IsRecursive:logic):logic

        # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Data Layer runtime states.
        data_layer_runtime_state<native><public> := enum:
            # Activated (meaning loaded and visible)
            Activated

            # Loaded (meaning loaded but not visible)
            Loaded

            # Unloaded
            Unloaded
