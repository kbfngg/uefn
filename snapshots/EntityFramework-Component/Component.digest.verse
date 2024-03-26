using {/Verse.org/Colors}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/UI}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
attachment_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Attaches the owner entity to the specified entity. This method will compute relative transform from the current world transform of both entity
    AttachTo<native><public>(InParentEntity:entity)<transacts><decides>:void

    # Attach the owner entity to the specified entity, use the specified transform as the relation to it
    AttachTo<native><public>(InParentEntity:entity, NewRelativeTransform:transform)<transacts><decides>:void

    # Detaches the owner entity if it was attached to an other entity
    DetachFrom<native><public>()<transacts><decides>:void

    # Set relative transform
    SetRelativeTransform<native><public>(Transform:transform)<transacts><decides>:void

    # Set relative transform from a global transform
    SetRelativeTransformFromGlobal<native><public>(Transform:transform)<transacts><decides>:void

    # Retrieve the transform of the attachment
    GetAttachedTransform<native><public>()<decides>:transform

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    # Automatically attach to owner at initialization
    AutoAttachToOwner<native><public>:logic = external {}

    # The relative transform to the attached entity
    var RelativeTransform<native><public>:?transform = external {}

    # The relative transform to the attached entity
    var ParentEntity<native><public>:?entity = external {}

basic_camera_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to a world
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from world
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    # Set the field of view of the camera in degrees
    SetFieldOfView<public>(InFieldOfView:float):void = external {}

    GetFieldOfView<public>():float = external {}

damage_component<native><epic_internal> := class(component):
    Damage<native><public>(Amount:float):void

@hide_in_editor
light_entity_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

local_hud_component<epic_internal> := class(component):
    IsAllowedOnClient<override>():logic = external {}

    var Canvas<public>:canvas

    var UISlot<public>:player_ui_slot

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    Show<public>(Player:player):void = external {}

    Hide<public>(Player:player):void = external {}

@hide_in_editor
mesh_component<native><epic_internal> := class(component):
    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

particle_system_component<native><epic_internal> := class<final>(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to a world
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from world
    OnRemovingFromScene<native><override>():void

    # Activate the particle system
    Activate<native><public>():void

    # Deactivate the particle system
    Deactivate<native><public>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @replicated("RepNotify")
    # The path to the particle system asset
    var ParticleSystem<native><public>:particle_system = external {}

    SetBeamStart<native><epic_internal>(BeamStart:vector3):void

    SetBeamStartTangent<native><epic_internal>(BeamStartTangent:vector3):void

    SetBeamEnd<native><epic_internal>(BeamEnd:vector3):void

    SetBeamEndTangent<native><epic_internal>(BeamEndTangent:vector3):void

    SetBeamWidth<native><epic_internal>(BeamWidth:float):void

hit_result<native><epic_internal> := struct:
    ThisEntity<native><public>:?entity

    ThisComponent<native><public>:?physics_component

    OtherEntity<native><public>:?entity

    OtherComponent<native><public>:?physics_component

    HitNormal<native><public>:vector3

    HitLocation<native><public>:vector3

physics_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to a world
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from world
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    # Event signaled when the component experiences a blocking hit
    HitEvent<native><public>:listenable(hit_result) = external {}

point_light_entity_component<native><public> := class<final>(light_entity_component):
    SetIntensity<public>(NewIntensity:float):void = external {}

    SetColor<public>(NewColor:color):void = external {}

    SetSourceRadius<public>(NewRadius:float):void = external {}

    SetSourceLength<public>(NewLength:float):void = external {}

    SetAttenuationRadius<public>(NewRadius:float):void = external {}

    GetIntensity<public>():float = external {}

    GetColor<public>():color = external {}

    GetSourceRadius<public>():float = external {}

    GetSourceLength<public>():float = external {}

    GetAttenuationRadius<public>():float = external {}

sound_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @replicated("RepNotify")
    # The path to the sound asset
    var Sound<native><public>:sound = external {}

    # Play the sound asset
    Play<native><public>():void

    # Play the sound asset
    Stop<native><public>():void

spot_light_entity_component<native><public> := class<final>(light_entity_component):
    SetIntensity<public>(NewIntensity:float):void = external {}

    SetColor<public>(NewColor:color):void = external {}

    SetSourceRadius<public>(NewRadius:float):void = external {}

    SetSourceLength<public>(NewLength:float):void = external {}

    SetInnerConeAngle<public>(NewInnerConeAngle:float):void = external {}

    SetOuterConeAngle<public>(NewOuterConeAngle:float):void = external {}

    SetAttenuationRadius<public>(NewRadius:float):void = external {}

    GetIntensity<public>():float = external {}

    GetColor<public>():color = external {}

    GetSourceRadius<public>():float = external {}

    GetSourceLength<public>():float = external {}

    GetInnerConeAngle<public>():float = external {}

    GetOuterConeAngle<public>():float = external {}

    GetAttenuationRadius<public>():float = external {}

static_mesh_component<native><epic_internal> := class(mesh_component):
    OnInitialized<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @replicated("RepNotify")
    # The path to the static mesh asset
    var Mesh<native><public>:mesh = external {}

    @replicated("RepNotify")
    # The path to the material asset of a static mesh
    var Material<native><public>:?material = external {}