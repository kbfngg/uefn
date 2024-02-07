using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Entity}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/VGameplayRst/Transform}
using {/Verse.org/Restricted}
using {/Verse.org/VerseExperimental}
using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/VerseEngine/Component}
# Module import path: /UnrealEngine.com/VGameplayRst
VGameplayRst<public> := module:
    # Module import path: /UnrealEngine.com/VGameplayRst/VFX
    VFX<public> := module:
        particle_system_component<native><public> := class<final>(component):
            SetParticleSystem<native><epic_internal>(ParticleSystem:particle_system)<transacts>:void

            Activate<native><public>():void

            Deactivate<native><public>():void

    # Module import path: /UnrealEngine.com/VGameplayRst/Transform
    Transform<public> := module:
        positionable<native><public> := interface:
            GetPosition<public>()<transacts>:vector3

        mutable_positionable<native><public> := interface(positionable):
            SetPosition<public>(v:vector3)<transacts>:void

        position_component<native><public> := class<final>(component, mutable_positionable):
            AddToPosition<native><public>(v:vector3):void

            SetPosition<override><native>(v:vector3)<transacts>:void

            GetPosition<override><native>()<transacts>:vector3

        rotatable<native><public> := interface:
            Rotation<public>()<transacts>:rotation

            ForwardVector<public>()<transacts>:vector3

            UpVector<public>()<transacts>:vector3

            RightVector<public>()<transacts>:vector3

        mutable_rotatable<native><public> := interface(rotatable):
            SetRotation<public>(r:rotation)<transacts>:void

            ApplyAdditionalRotation<public>(r:rotation):void

            SetForwardVectorFromXY<public>(x:vector3, y:vector3):void

        rotation_component<native><public> := class<final>(component, mutable_rotatable):
            ApplyAdditionalRotation<override><native>(r:rotation):void

            SetRotation<override><native>(r:rotation)<transacts>:void

            SetForwardVectorFromXY<override><native>(x:vector3, y:vector3):void

            Rotation<override><native>()<transacts>:rotation

            ForwardVector<override>()<transacts>:vector3 = external {}

            UpVector<override>()<transacts>:vector3 = external {}

            RightVector<override>()<transacts>:vector3 = external {}

        scalable<native><public> := interface:
            GetScale<public>()<transacts>:vector3

        mutable_scalable<native><public> := interface(scalable):
            SetScale<public>(v:vector3)<transacts>:void

        scale_component<native><public> := class<final>(component, mutable_scalable):
            AddToScale<native><public>(v:vector3):void

            SetScale<override><native>(v:vector3)<transacts>:void

            GetScale<override><native>()<transacts>:vector3

    # Module import path: /UnrealEngine.com/VGameplayRst/Physics
    Physics<public> := module:
        collision_shape_mode<native><public> := enum:
            CollisionMesh
            CollisionBox
            CollisionCapsule
            CollisionSphere

        collision_component<native><public> := class<final>(component):
            SetEnabled<native><public>(InIsEnabled:logic):void

            GetEnabled<native><public>():logic

            WaitHit<native><public>()<suspends>:hit_result

            WaitBeginOverlap<native><public>()<suspends>:overlap_result

            WaitEndOverlap<native><public>()<suspends>:overlap_result

            SetGravityEnabled<native><public>(EnableGravity:logic):void

            GetGravityEnabled<native><public>():logic

            SetSendHitEventsOnCollide<native><public>(EnableHitEvents:logic)<transacts>:void

            GetSendHitEventsOnCollide<native><public>()<transacts>:logic

            SetSendOverlapEvents<native><public>(EnableOverlapEvents:logic)<transacts>:void

            GetSendOverlapEvents<native><public>()<transacts>:logic

            SetCollisionProfileName<native><public>(CollisionProfile:[]char)<transacts>:void

            GetCollisionProfileName<native><public>()<transacts>:[]char

            SetMovable<native><public>(IsMovable:logic)<transacts>:void

            GetMovable<native><public>()<transacts>:logic

            SetUseContinuousCollisionDetection<native><public>(UseCCD:logic):void

            GetUseContinuousCollisionDetection<native><public>():logic

            SetDegreeOfFreedomContraint<native><public>(MovementMode:dof_movement_mode):void

            SetCustomDegreeOfFreedomConstrain<native><public>(CustomMovementPlaneNormal:vector3):void

            # Looks at the static_mesh_component for the mesh.
            SetMeshCollisionShapeMode<native><public>()<transacts>:void

            SetMeshCollisionShapeMode<native><epic_internal>(Mesh:mesh)<transacts>:void

            SetBoxCollisionShapeMode<native><public>(BoxExtent:vector3)<transacts>:void

            SetCapsuleCollisionShapeMode<native><public>(Height:float, Radius:float)<transacts>:void

            SetSphereCollisionShapeMode<native><public>(Radius:float)<transacts>:void

            GetCollisionShapeMode<native><public>()<transacts>:collision_shape_mode

        dof_movement_mode<native><public> := enum:
            Default
            SixDOF
            YZPlane
            XZPlane
            XYPlane
            CustomPlane
            NoConstraints

        hit_result<native><public> := struct:
            # The ID belonging to the entity hit
            OtherEntityID<native><public>:int

            # The collision_component belonging to the entity hit
            OtherComponent<native><public>:collision_component

            # The surface normal at the location at which the hit occured on OtherEntityID
            HitNormal<native><public>:vector3

            # The location at which the hit occured on OtherEntityID
            HitLocation<native><public>:vector3

        overlap_result<native><public> := class:
            OtherEntityID<native><public>:int

            OtherComponent<native><public>:collision_component

            FromSweep<native><public>:logic

            SweepHitNormal<native><public>:vector3

            SweepHitLocation<native><public>:vector3

        physics_trace<native><public> := class:
            WaitPhysicsTrace<native><public>()<suspends>:[]hit_result

            InitPhysicsTrace<native><public>(ContextObject:component, TraceCategory:physics_trace_category, TraceType:physics_trace_type, TraceShape:physics_trace_shape, TraceChannel:physics_trace_channel, Start:vector3, End:vector3, IgnoreCallingEntity:logic, TraceExtent:vector3, TraceRadius:float, ProfileName:[]char):void

        physics_trace_category<native><public> := enum:
            Channel
            Profile
            Object

        physics_trace_channel<native><public> := enum:
            WorldStatic
            WorldDynamic
            Pawn
            Visibility
            Camera
            PhysicsBody
            Vehicle
            Destructible
            GameTraceChannel1
            GameTraceChannel2
            GameTraceChannel3
            GameTraceChannel4
            GameTraceChannel5
            GameTraceChannel6

        physics_trace_shape<native><public> := enum:
            Line
            Box
            ShapeSphere

        physics_trace_type<native><public> := enum:
            Single
            Multi
            Test

    # Module import path: /UnrealEngine.com/VGameplayRst/Lights
    Lights<public> := module:
        point_light_component<native><public> := class<final>(component):
            SetIntensity<native><public>(NewIntensity:float):void

            SetColor<native><epic_internal>(NewColor:color):void

            SetSourceRadius<native><public>(NewRadius:float):void

            SetSourceLength<native><public>(NewLength:float):void

            SetAttenuationRadius<native><public>(NewRadius:float):void

            GetIntensity<native><public>():float

            GetColor<native><epic_internal>():color

            GetSourceRadius<native><public>():float

            GetSourceLength<native><public>():float

            GetAttenuationRadius<native><public>():float

        spot_light_component<native><public> := class<final>(component):
            SetIntensity<native><public>(NewIntensity:float):void

            SetColor<native><epic_internal>(NewColor:color):void

            SetSourceRadius<native><public>(NewRadius:float):void

            SetSourceLength<native><public>(NewLength:float):void

            SetInnerConeAngle<native><public>(NewInnerConeAngle:float):void

            SetOuterConeAngle<native><public>(NewOuterConeAngle:float):void

            SetAttenuationRadius<native><public>(NewRadius:float):void

            GetIntensity<native><public>():float

            GetColor<native><epic_internal>():color

            GetSourceRadius<native><public>():float

            GetSourceLength<native><public>():float

            GetInnerConeAngle<native><public>():float

            GetOuterConeAngle<native><public>():float

            GetAttenuationRadius<native><public>():float

    # Module import path: /UnrealEngine.com/VGameplayRst/LevelStreaming
    LevelStreaming<public> := module:
        level_streaming_component<native><public> := class<final>(component):
            RequestLoadLevel<native><epic_internal>(Level:level, Timeout:time_span, MessageToKickedPlayers:[]char):?sticky_event(void)

            RequestUnloadLevel<native><public>(Timeout:time_span, MessageToKickedPlayers:[]char):?sticky_event(void)

    # Module import path: /UnrealEngine.com/VGameplayRst/Geometry
    Geometry<public> := module:
        fixed_mesh_component<native><public> := class<final>(component):
            SetMesh<native><epic_internal>(Mesh:mesh)<transacts>:void

            SetDefaultMesh<native><public>(DefaultMesh:default_mesh_type):void

            SetEnableCollision<native><public>(EnabledCollision:collision_type)<transacts>:void

            SetAsRootComponent<native><public>(KeepExistingRootTransform:logic, DestroyOldRoot:logic)<transacts>:void

            SetMaterial<native><epic_internal>(Material:material)<transacts>:void

            SetMaterialAtIndex<native><epic_internal>(Material:material, Index:int):void

            SetVisibility<native><public>(NewVisibility:logic)<transacts>:void

            IsVisible<native><public>():logic

        default_mesh_type<native><public> := enum:
            Cube
            Sphere
            Cylinder
            Cone
            Plane

        collision_type<native><public> := enum:
            NoCollision
            QueryOnly
            SimulationOnly
            QueryAndSimulation

        skeletal_mesh_component<native><public> := class(component):
            SetSkeletalMesh<native><epic_internal>(Mesh:skeletal_mesh):void

            SetAnimationMode<native><public>(AnimMode:default_animation_mode_type):void

            SetAnimationInstance<native><epic_internal>(InAnimationInstance:animation_instance):void

            SetAnimationBlueprint<native><epic_internal>(InAnimationBlueprint:animation_blueprint):void

            SetAnimation<native><epic_internal>(InAnimation:animation):void

            BeginAnimation<native><public>(Looping:logic):void

            EndAnimation<native><public>():void

            IsPlayingAnimation<native><public>():logic

            SetMaterial<native><epic_internal>(Material:material):void

            SetAnimationPosition_FIXME<native><public>(InPos:float, FireNotifies:logic):void

            GetAnimationPosition_FIXME<native><public>():float

            SetAnimationPlayRate_FIXME<native><public>(Rate:float):void

            GetAnimationPlayRate_FIXME<native><public>():float

        default_animation_mode_type<native><public> := enum:
            UseAnimationBlueprint
            UseAnimationInstance
            UseAnimationAsset
            UseCustomMode

    # Module import path: /UnrealEngine.com/VGameplayRst/GameObjects
    GameObjects<public> := module:
        model_interface<public> := interface(positionable, rotatable, scalable):


        # Model that can only be inspected, not modified.
        immutable_model<public> := class<internal>(model_interface):
            # Returns true if the model mesh is visible.
            IsVisible<public>():logic = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            Rotation<override>()<transacts>:rotation = external {}

            ForwardVector<override>()<transacts>:vector3 = external {}

            UpVector<override>()<transacts>:vector3 = external {}

            RightVector<override>()<transacts>:vector3 = external {}

            GetScale<override>()<transacts>:vector3 = external {}

            GetTransform<public>():transform = external {}

        CreateImmutableModel<public>(TagToFind:tag):?immutable_model = external {}

        mutable_model_interface<public> := interface(mutable_positionable, mutable_rotatable, mutable_scalable, model_interface):


        model<public> := class<internal>(mutable_model_interface):
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

        CreateModel<public>(TagToFind:tag):?model = external {}

        CreateModel<epic_internal>(InTransform:transform, Name:[]char, Mesh:mesh):?model = external {}

        CreateModel<epic_internal>(InTransform:transform, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, InScale:vector3, Name:[]char, Mesh:mesh, Material:material):?model = external {}

        world_anchor<public> := class<internal>(mutable_positionable):
            GetComponent<public>()<transacts>:component = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            SetPosition<override>(Position:vector3)<transacts>:void = external {}

            Destroy<public>():void = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3):?world_anchor = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3, DebugName:[]char):?world_anchor = external {}

        CreateWorldAnchor<public>(Entity:entity):?world_anchor = external {}

        CreateWorldAnchor<public>(TagToFind:tag):?world_anchor = external {}

    # Module import path: /UnrealEngine.com/VGameplayRst/EntityUtil
    EntityUtil<public> := module:
        # Spawn an empty entity with the specified transform. Returns the EntityID
        SpawnEmptyEntity<native><public>(InTransform:transform, Name:[]char):int

        # Spawn an entity from the specified assetPath with a transform. Returns the EntityID
        SpawnEntityFromAsset<native><public>(AssetPath:[]char, InTransform:transform, Name:[]char):int

        # Creates a component of the specified type on the entity indicated by EntityID. Returns the spawned component object
        CreateAndAddComponent<native><public>(EntityID:int, ComponentType:subtype(component))<transacts>:component

        # Attempts to find a sub component of the specified type from the nominated component. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponent<native><public>(Component:component, Type:type)<transacts><decides>:component

        # Attempts to find a sub component of the specified type from the nominated component for the specified entity. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponentForEntity<native><public>(Component:component, EntityID:int, Type:type)<transacts><decides>:component

        # Spawn an empty entity with the specified transform. Returns the entity.
        SpawnEntity<native><public>(InTransform:transform, Name:[]char):?entity

        # Spawn an empty entity with the specified position, rotation, and scale. Returns the entity
        SpawnEntity<native><public>(Position:vector3, Rotation:vector3, Scale:vector3, Name:[]char):?entity

        # Spawn an empty entity with the specified position. Returns the entity
        SpawnEntity<native><public>(Position:vector3, Name:[]char):?entity

    # Module import path: /UnrealEngine.com/VGameplayRst/DebugDraw
    DebugDraw<public> := module:


    # Module import path: /UnrealEngine.com/VGameplayRst/Messaging
    Messaging<public> := module:
        debug_command_component<native><public> := class(component):
            _WaitForCommand<native><public>(CommandId:[]char)<suspends>:[]char

    # Module import path: /UnrealEngine.com/VGameplayRst/Datastore
    Datastore<public> := module:
        datastore_component<native><public> := class<final>(component):


        # Module import path: /UnrealEngine.com/VGameplayRst/Datastore/DatastoreComponent
        DatastoreComponent<epic_internal> := module:
            SetDatastoreValue<native><public>(Player:player_component, Key:[]char, Value:[]char):void

            SetDatastoreValueInt<native><public>(Player:player_component, Key:[]char, Value:int):void

            ClearAllDatastoreValues<native><public>(Player:player_component):void

    # Module import path: /UnrealEngine.com/VGameplayRst/Components
    Components<public> := module:
        activation_state<native><public> := enum:
            Active
            Inactive

        dynamic_activation_component<native><public> := class<final>(component):
            BeginTransition<native><public>(SecondsToChange:float, TargetState:activation_state):void

            Reset<native><public>():void

            LinkComponent<native><public>(ComponentToLink:component):void

            UnlinkComponent<native><public>(ComponentToUnlink:component):void

            WaitForTransitionBegin<native><public>()<suspends>:void

            WaitForTransitionComplete<native><public>()<suspends>:void

        script_component<native><public> := class<abstract><unique>(component):
            var AllowMultiple<native><public>:logic = external {}

            AddToCreateComponentList<native><public>(__dupe___unnamed_parameter_100:[]subtype(component)):void

            AddToRequiredComponentList<native><public>(__dupe___unnamed_parameter_101:[]subtype(component)):void

            SetTickEnabled<native><public>(InIsEnabled:logic):void

            OnTick<native_callable><public>(DeltaTime:float):void = external {}

            OnCreate<native_callable><public>():void = external {}

            OnPostCreate<native_callable><public>():void = external {}

            OnBegin<native_callable><public>():void = external {}

            OnEnd<native_callable><public>():void = external {}

            SetEnabled<native><public>(Enabled:logic):void

            IsEnabled<native><public>():logic

            IsOwner<native><public>(Entity:entity):logic

            OnEnabledChanged<native_callable><public>(Enabled:logic):void = external {}

            GetComponentOfType<native><public>(componentType:type)<transacts>:?component

            GetAllComponentsOfType<native><public>(componentType:type)<transacts>:[]component

            GetName<native><public>():[]char

            GetFullname<native><public>():[]char

    # Module import path: /UnrealEngine.com/VGameplayRst/Audio
    Audio<public> := module:
        audio_component<native><public> := class<final>(component):
            SetSound<native><epic_internal>(Sound:sound)<transacts>:void

            BeginSound<native><public>():void

            EndSound<native><public>():void