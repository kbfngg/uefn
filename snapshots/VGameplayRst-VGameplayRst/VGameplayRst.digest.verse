using {/Verse.org/Simulation}
using {/Verse.org/VerseEngine/Entity}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/VGameplayRst/Transform}
using {/Verse.org/Restricted}
using {/Verse.org/VerseExperimental}
using {/Verse.org/Colors}
using {/Verse.org/Assets}
using {/Verse.org/VerseEngine/Component}
using {/UnrealEngine.com/Temporary/SpatialMath}
# Module import path: /UnrealEngine.com/VGameplayRst
VGameplayRst<public> := module:
    # Module import path: /UnrealEngine.com/VGameplayRst/Transform
    Transform<public> := module:
        positionable<native><public> := interface:
            GetPosition<public>()<transacts>:vector3

        mutable_positionable<native><public> := interface(positionable):
            SetPosition<public>(v:vector3)<transacts>:void

        position_component<native><public> := class<final>(vk_component, mutable_positionable):
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

        rotation_component<native><public> := class<final>(vk_component, mutable_rotatable):
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

        scale_component<native><public> := class<final>(vk_component, mutable_scalable):
            AddToScale<native><public>(v:vector3):void

            SetScale<override><native>(v:vector3)<transacts>:void

            GetScale<override><native>()<transacts>:vector3

    # Module import path: /UnrealEngine.com/VGameplayRst/Physics
    Physics<public> := module:
        hit_result_legacy<native><public> := struct:
            # The ID belonging to the entity hit
            OtherEntityID<native><public>:int

            # The vk_collision_component belonging to the entity hit
            OtherComponent<native><public>:vk_collision_component

            # The surface normal at the location at which the hit occured on OtherEntityID
            HitNormal<native><public>:vector3

            # The location at which the hit occured on OtherEntityID
            HitLocation<native><public>:vector3

        physics_trace<native><public> := class:
            WaitPhysicsTrace<native><public>()<suspends>:[]hit_result_legacy

            InitPhysicsTrace<native><public>(ContextObject:vk_component, TraceCategory:physics_trace_category, TraceType:physics_trace_type, TraceShape:physics_trace_shape, TraceChannel:physics_trace_channel, Start:vector3, End:vector3, IgnoreCallingEntity:logic, TraceExtent:vector3, TraceRadius:float, ProfileName:string):void

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

        collision_shape_mode<native><public> := enum:
            CollisionMesh
            CollisionBox
            CollisionCapsule
            CollisionSphere

        vk_collision_component<native><public> := class<final>(vk_component):
            SetEnabled<native><public>(InIsEnabled:logic):void

            GetEnabled<native><public>():logic

            WaitHit<native><public>()<suspends>:hit_result_legacy

            WaitBeginOverlap<native><public>()<suspends>:vk_overlap_result

            WaitEndOverlap<native><public>()<suspends>:vk_overlap_result

            SetGravityEnabled<native><public>(EnableGravity:logic):void

            GetGravityEnabled<native><public>():logic

            SetSendHitEventsOnCollide<native><public>(EnableHitEvents:logic)<transacts>:void

            GetSendHitEventsOnCollide<native><public>()<transacts>:logic

            SetSendOverlapEvents<native><public>(EnableOverlapEvents:logic)<transacts>:void

            GetSendOverlapEvents<native><public>()<transacts>:logic

            SetCollisionProfileName<native><public>(CollisionProfile:string)<transacts>:void

            GetCollisionProfileName<native><public>()<transacts>:string

            SetMovable<native><public>(IsMovable:logic)<transacts>:void

            GetMovable<native><public>()<transacts>:logic

            SetUseContinuousCollisionDetection<native><public>(UseCCD:logic):void

            GetUseContinuousCollisionDetection<native><public>():logic

            SetDegreeOfFreedomContraint<native><public>(MovementMode:dof_movement_mode):void

            SetCustomDegreeOfFreedomConstrain<native><public>(CustomMovementPlaneNormal:vector3):void

            # Looks at the mesh_component for the mesh.
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

        vk_overlap_result<native><public> := class:
            OtherEntityID<native><public>:int

            OtherComponent<native><public>:vk_collision_component

            FromSweep<native><public>:logic

            SweepHitNormal<native><public>:vector3

            SweepHitLocation<native><public>:vector3

    # Module import path: /UnrealEngine.com/VGameplayRst/Lights
    Lights<public> := module:
        vk_point_light_component<native><public> := class<final>(vk_component):
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

        vk_spot_light_component<native><public> := class<final>(vk_component):
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
        level_streaming_component<native><public> := class<final>(vk_component):
            RequestLoadLevel<native><epic_internal>(Level:level, Timeout:time_span, MessageToKickedPlayers:string):?sticky_event(void)

            RequestUnloadLevel<native><public>(Timeout:time_span, MessageToKickedPlayers:string):?sticky_event(void)

    # Module import path: /UnrealEngine.com/VGameplayRst/Geometry
    Geometry<public> := module:
        fixed_mesh_component<native><public> := class<final>(vk_component):
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

        CreateModel<epic_internal>(InTransform:transform, Name:string, Mesh:mesh):?model = external {}

        CreateModel<epic_internal>(InTransform:transform, Name:string, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, Name:string, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, Name:string, Mesh:mesh, Material:material):?model = external {}

        CreateModel<epic_internal>(InPosition:vector3, InRotation:rotation, InScale:vector3, Name:string, Mesh:mesh, Material:material):?model = external {}

        world_anchor<public> := class<internal>(mutable_positionable):
            GetComponent<public>()<transacts>:vk_component = external {}

            GetPosition<override>()<transacts>:vector3 = external {}

            SetPosition<override>(Position:vector3)<transacts>:void = external {}

            Destroy<public>():void = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3):?world_anchor = external {}

        CreateWorldAnchor<public>(WorldPosition:vector3, DebugName:string):?world_anchor = external {}

        CreateWorldAnchor<public>(Entity:vk_entity):?world_anchor = external {}

        CreateWorldAnchor<public>(TagToFind:tag):?world_anchor = external {}

    # Module import path: /UnrealEngine.com/VGameplayRst/EntityUtil
    EntityUtil<public> := module:
        # Spawn an empty vk_entity with the specified transform. Returns the EntityID
        SpawnEmptyEntity<native><public>(InTransform:transform, Name:string):int

        # Spawn an vk_entity from the specified assetPath with a transform. Returns the EntityID
        SpawnEntityFromAsset<native><public>(AssetPath:string, InTransform:transform, Name:string):int

        # Creates a vk_component of the specified type on the vk_entity indicated by EntityID. Returns the spawned vk_component object
        CreateAndAddComponent<native><public>(EntityID:int, ComponentType:subtype(vk_component))<transacts>:vk_component

        # Attempts to find a sub vk_component of the specified type from the nominated vk_component. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponent<native><public>(Component:vk_component, Type:type)<transacts><decides>:vk_component

        # Attempts to find a sub vk_component of the specified type from the nominated vk_component for the specified vk_entity. Returns it if found, otherwise fails
        GetComponentOfTypeFromComponentForEntity<native><public>(Component:vk_component, EntityID:int, Type:type)<transacts><decides>:vk_component

        # Spawn an empty vk_entity with the specified transform. Returns the vk_entity.
        SpawnEntity<native><public>(InTransform:transform, Name:string):?vk_entity

        # Spawn an empty vk_entity with the specified position, rotation, and scale. Returns the vk_entity
        SpawnEntity<native><public>(Position:vector3, Rotation:vector3, Scale:vector3, Name:string):?vk_entity

        # Spawn an empty vk_entity with the specified position. Returns the vk_entity
        SpawnEntity<native><public>(Position:vector3, Name:string):?vk_entity

    # Module import path: /UnrealEngine.com/VGameplayRst/DebugDraw
    DebugDraw<public> := module:


    # Module import path: /UnrealEngine.com/VGameplayRst/Messaging
    Messaging<public> := module:
        debug_command_component<native><public> := class(vk_component):
            _WaitForCommand<native><public>(CommandId:string)<suspends>:string

    # Module import path: /UnrealEngine.com/VGameplayRst/Datastore
    Datastore<public> := module:
        datastore_component<native><public> := class<final>(vk_component):


        # Module import path: /UnrealEngine.com/VGameplayRst/Datastore/DatastoreComponent
        DatastoreComponent<epic_internal> := module:
            SetDatastoreValue<native><public>(Player:player_component, Key:string, Value:string):void

            SetDatastoreValueInt<native><public>(Player:player_component, Key:string, Value:int):void

            ClearAllDatastoreValues<native><public>(Player:player_component):void

    # Module import path: /UnrealEngine.com/VGameplayRst/Components
    Components<public> := module:
        activation_state<native><public> := enum:
            Active
            Inactive

        dynamic_activation_component<native><public> := class<final>(vk_component):
            BeginTransition<native><public>(SecondsToChange:float, TargetState:activation_state):void

            Reset<native><public>():void

            LinkComponent<native><public>(ComponentToLink:vk_component):void

            UnlinkComponent<native><public>(ComponentToUnlink:vk_component):void

            WaitForTransitionBegin<native><public>()<suspends>:void

            WaitForTransitionComplete<native><public>()<suspends>:void

        script_component<native><public> := class<abstract><unique>(vk_component):
            var AllowMultiple<native><public>:logic = external {}

            AddToCreateComponentList<native><public>(__dupe___unnamed_parameter_108:[]subtype(vk_component)):void

            AddToRequiredComponentList<native><public>(__dupe___unnamed_parameter_109:[]subtype(vk_component)):void

            SetTickEnabled<native><public>(InIsEnabled:logic):void

            OnTick<native_callable><public>(DeltaTime:float):void = external {}

            OnCreate<native_callable><public>():void = external {}

            OnPostCreate<native_callable><public>():void = external {}

            OnBegin<native_callable><public>():void = external {}

            OnEnd<native_callable><public>():void = external {}

            SetEnabled<native><public>(Enabled:logic):void

            IsEnabled<native><public>():logic

            IsOwner<native><public>(Entity:vk_entity):logic

            OnEnabledChanged<native_callable><public>(Enabled:logic):void = external {}

            GetComponentOfType<native><public>(componentType:type)<transacts>:?vk_component

            GetAllComponentsOfType<native><public>(componentType:type)<transacts>:[]vk_component

            GetName<native><public>():string

            GetFullname<native><public>():string

    # Module import path: /UnrealEngine.com/VGameplayRst/Audio
    Audio<public> := module:
        audio_component<native><public> := class<final>(vk_component):
            SetSound<native><epic_internal>(Sound:sound)<transacts>:void

            BeginSound<native><public>():void

            EndSound<native><public>():void