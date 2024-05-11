using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/UI}
using {/Verse.org/Simulation}
using {/Verse.org/Colors}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
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

damageable_component<native><epic_internal> := class(component):
    Damage<native><public>(Amount:float):void

    DamagedEvent<native><public>:listenable(float) = external {}

directional_light_component<native><public> := class<final>(light_component):
    @replicated("RepNotify")
    # Control the amount of shadow occlusion. A value of 0 means no occlusion, thus no shadow.
    var ShadowOpacity<public>:type{_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

    GetShadowOpacity<native><protected>()<transacts>:type{_X:float where 0.000000 <= _X, _X <= 1.000000}

    SetShadowOpacity<native><protected>(InShadowOpacity:type{_X:float where 0.000000 <= _X, _X <= 1.000000})<transacts>:void

@hide_in_editor
light_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @replicated("RepNotify")
    # Whether the light should cast any shadows. Whether the light should cast shadows from static objects.
    var CastShadows<public>:logic = external {}

    @replicated("RepNotify")
    # Whether the light shadows volumetric fog.  Disabling this can save GPU time.
    var CastVolumetricShadow<public>:logic = external {}

    @replicated("RepNotify")
    # Whether the light should cast high quality such that hair-strands are self-shadowing. When this option is enabled, there is an extra GPU cost for this light.
    var CastDeepShadows<public>:logic = external {}

    @replicated("RepNotify")
    # Whether the light affects objects in reflections, when ray-traced reflection is enabled.
    var AffectReflection<public>:logic = external {}

    @replicated("RepNotify")
    # Whether the light affects global illumination, when ray-traced global illumination is enabled.
    var AffectGlobalIllumination<public>:logic = external {}

    @replicated("RepNotify")
    # Set the total energy the light emits in candela. The renderer clamps between 0.0 and 20.0.
    var Intensity<public>:float = external {}

    @replicated("RepNotify")
    # Set the filter color of the light. Note that this can change the light’s effective intensity.
    var Color<protected>:color = external {}

    GetCastShadows<native><protected>()<transacts>:logic

    SetCastShadows<native><protected>(InCastShadows:logic)<transacts>:void

    GetCastVolumetricShadow<native><protected>()<transacts>:logic

    SetCastVolumetricShadow<native><protected>(InCastVolumetricShadow:logic)<transacts>:void

    GetCastDeepShadows<native><protected>()<transacts>:logic

    SetCastDeepShadows<native><protected>(InCastDeepShadows:logic)<transacts>:void

    GetAffectReflection<native><protected>()<transacts>:logic

    SetAffectReflection<native><protected>(InAffectReflection:logic)<transacts>:void

    GetAffectGlobalIllumination<native><protected>()<transacts>:logic

    SetAffectGlobalIllumination<native><protected>(InAffectGlobalIllumination:logic)<transacts>:void

    GetIntensity<native><protected>()<transacts>:float

    SetIntensity<native><protected>(InIntensity:float)<transacts>:void

    GetColor<native><public>()<transacts>:color

    SetColor<native><public>(InColor:color)<transacts>:void

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

particle_system_component<native><epic_internal> := class<final>(component, enableable):
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

    # Enable the particle system
    Enable<override>():void = external {}

    # Disable the particle system
    Disable<override>():void = external {}

    # Internal epic method to know if this component is allowed on client
    IsEnabled<override>()<transacts><decides>:void = external {}

    @editable
    # Whether the particle system should start activated
    AutoActivate<native><public>:logic = external {}

    @replicated("RepNotify")
    @editable
    # The path to the particle system asset
    var ParticleSystem<native><public>:particle_system = external {}

    SetBeamStart<native><epic_internal>(InBeamStart:vector3):void

    SetBeamStartTangent<native><epic_internal>(InBeamStartTangent:vector3):void

    SetBeamEnd<native><epic_internal>(InBeamEnd:vector3):void

    SetBeamEndTangent<native><epic_internal>(InBeamEndTangent:vector3):void

    SetBeamWidth<native><epic_internal>(InBeamWidth:float):void

collision_channel_response<native><epic_internal> := enum:
    Ignore
    Overlap
    Block

hit_result<native><epic_internal> := struct:
    ThisEntity<native><public>:?entity

    ThisComponent<native><public>:?physics_component

    OtherEntity<native><public>:?entity

    OtherComponent<native><public>:?physics_component

    HitNormal<native><public>:vector3

    HitLocation<native><public>:vector3

physics_component<native><epic_internal> := class<final>(component, enableable):
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

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    # Event signaled when the component experiences a blocking hit
    HitEvent<native><public>:listenable(hit_result) = external {}

    @editable
    VisibilityChannelResponseOverride<native><epic_internal>:?collision_channel_response = external {}

@hide_in_editor
point_light_component_base<native><epic_internal> := class(light_component):
    @replicated("RepNotify")
    # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.
    # Clamped between 8.0 and 16384.0.
    var AttenuationRadius<public>:float = external {}

    @replicated("RepNotify")
    # The radius of the light source shape. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

    @replicated("RepNotify")
    # The length of the light source shape. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceLength<public>:float = external {}

    GetAttenuationRadius<native><protected>()<transacts>:float

    SetAttenuationRadius<native><protected>(InAttenuationRadius:float)<transacts>:void

    GetSourceRadius<native><protected>()<transacts>:float

    SetSourceRadius<native><protected>(InSourceRadius:float)<transacts>:void

    GetSourceLength<native><protected>()<transacts>:float

    SetSourceLength<native><protected>(InSourceLength:float)<transacts>:void

point_light_component<native><public> := class<final>(point_light_component_base):


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

rect_light_component<native><public> := class<final>(light_component):
    @replicated("RepNotify")
    # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.
    # This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more. Clamped between 8.0 and 16384.0.
    var AttenuationRadius<public>:float = external {}

    @replicated("RepNotify")
    # The width of the light source rect. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.
    # Clamped between 0.0 and 1000.0 cm.
    var SourceWidth<public>:float = external {}

    @replicated("RepNotify")
    # The height of the light source rect. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.
    # Clamped between 0.0 and 1000.0 cm.
    var SourceHeight<public>:float = external {}

    @replicated("RepNotify")
    # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
    var BarnDoorAngle<public>:float = external {}

    @replicated("RepNotify")
    # The length of the barn door attached to the light source rect. Clamped to a minimum of 0.0 cm.
    var BarnDoorLength<public>:float = external {}

    GetAttenuationRadius<native><protected>()<transacts>:float

    SetAttenuationRadius<native><protected>(InAttenuationRadius:float)<transacts>:void

    GetSourceWidth<native><protected>()<transacts>:float

    SetSourceWidth<native><protected>(InSourceWidth:float)<transacts>:void

    GetSourceHeight<native><protected>()<transacts>:float

    SetSourceHeight<native><protected>(InSourceHeight:float)<transacts>:void

    GetBarnDoorAngle<native><protected>()<transacts>:float

    SetBarnDoorAngle<native><protected>(InBarnDoorAngle:float)<transacts>:void

    GetBarnDoorLength<native><protected>()<transacts>:float

    SetBarnDoorLength<native><protected>(InBarnDoorLength:float)<transacts>:void

sound_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is attach to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be detached from an entity
    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @replicated("RepNotify")
    # The path to the sound asset
    var Sound<native><public>:sound = external {}

    # Play the sound asset
    Play<native><public>():void

    # Play the sound asset
    Stop<native><public>():void

spot_light_component<native><public> := class<final>(point_light_component_base):
    @replicated("RepNotify")
    # The light’s inner cone shaped angle in degrees. Clamped between 1.0 and 80.00.
    var InnerConeAngle<public>:float = external {}

    @replicated("RepNotify")
    # The outer cone shaped angle in degrees. Clamped between 1.0 and 80.00.
    var OuterConeAngle<public>:float = external {}

    GetInnerConeAngle<native><protected>()<transacts>:float

    SetInnerConeAngle<native><protected>(InInnerConeAngle:float)<transacts>:void

    GetOuterConeAngle<native><protected>()<transacts>:float

    SetOuterConeAngle<native><protected>(InOuterConeAngle:float)<transacts>:void

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

static_mesh_component<native><epic_internal> := class<final>(mesh_component, enableable):
    OnInitialized<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @replicated("RepNotify")
    # The path to the static mesh asset
    var Mesh<native><public>:mesh = external {}

    @replicated("RepNotify")
    # The path to the material asset of a static mesh
    var Material<native><public>:?material = external {}

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

text_display_component<native><epic_internal> := class<concrete><final>(component):
    OnInitialized<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @replicated("RepNotify")
    # The text to display.
    var Text<native><public>:string = external {}