using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/UI}
using {/Verse.org/Colors}
using {/Verse.org/Simulation}
@hide_in_editor
@experimental
basic_camera_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is added to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to a world
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from world
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Set the field of view of the camera in degrees
    SetFieldOfView<public>(InFieldOfView:float):void = external {}

    @experimental
    GetFieldOfView<public>():float = external {}

@experimental
damageable_component<native><epic_internal> := class(component):
    @experimental
    Damage<native><public>(Amount:float):void

    @experimental
    DamagedEvent<native><final><public>:listenable(float) = external {}

@experimental
# A `directional_light_component` simulates light that is being emitted from a source that is infinitelyfar away. This means that all shadows cast by this light will be parallel, making this the ideal choicefor simulating sunlight.
directional_light_component<native><public> := class<final>(light_component):
    @experimental
    # Controls the amount of shadow occlusion. A value of 0.0 means no occlusion, thus no shadow.
    var ShadowOpacity<public>:type{_X:float where 0.000000 <= _X, _X <= 1.000000} = external {}

@experimental
# Base class for light components in the SceneGraph.Dependencies:  * `transform_component` on the entity positions the light.Examples of components implementing `light_component`:  * `directional_light_component`  * `point_light_component`  * `rect_light_component`  * `spot_light_component`
light_component<native><public> := class<abstract><epic_internal>(component):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # If the light casts any shadows.
    var CastShadows<public>:logic = external {}

    @experimental
    # If the light casts shadows on volumetric fog. Disabling this can save GPU time.
    var CastVolumetricShadow<public>:logic = external {}

    @experimental
    # If the light casts high quality shadows, such that hair-strands are self-shadowing. When this option is enabled, there is an extra GPU cost for this light.
    var CastDeepShadows<public>:logic = external {}

    @experimental
    # If the light affects objects in reflections, when ray-traced reflection is enabled.
    var AffectReflection<public>:logic = external {}

    @experimental
    # If the light affects global illumination, when ray-traced global illumination is enabled.
    var AffectGlobalIllumination<public>:logic = external {}

    @experimental
    # The total energy the light emits in candela. The renderer clamps between 0.0 and 20.0.
    var Intensity<public>:float = external {}

    @experimental
    # The color of the light. Note that this can change the light’s effective intensity.
    var Color<epic_internal>:color = external {}

@experimental
local_hud_component<epic_internal> := class(component):
    IsAllowedOnClient<override>():logic = external {}

    var Canvas<public>:canvas

    var UISlot<public>:player_ui_slot

    OnBeginSimulation<override>():void = external {}

    OnEndSimulation<override>():void = external {}

    @experimental
    Show<public>(Player:player):void = external {}

    @experimental
    Hide<public>(Player:player):void = external {}

@experimental
# Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapesin the world such as:  * foliage and terrain decorations  * movers (for example, doors and lifts)  * procedurally created buildingsDependencies:  * `transform_component` on the entity positions the mesh.
mesh_component<native><public> := class(component, enableable):
    OnInitialized<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @replicated("RepNotify")
    @experimental
    # The `mesh` to be rendered by this `mesh_component`.
    var Mesh<native><public>:mesh = external {}

    @replicated("RepNotify")
    @experimental
    # A material to be applied to this mesh. If this is set to `false` the base material on the mesh asset will be used.
    var Material<native><public>:?material = external {}

    @experimental
    # Enables rendering of this mesh.
    Enable<native><override>():void

    @experimental
    # Disables rendering of this mesh.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it's disabled.
    IsEnabled<native><override>()<transacts><decides>:void

@experimental
# Constrains the transform of this entity so it is always offset relatively from its parent entity.Any changes made to the parent entity's `transform_component` will automatically cause this entity to change too.Dependencies:  * `transform_component` on the entity provides the world transform to be constrained.
parent_constraint_component<native><public> := class(component):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    @experimental
    # Sets the relative transform of the entity to its parent.
    SetRelativeTransform<native><epic_internal>(Transform:transform)<transacts><decides>:void

    @experimental
    # Returns the relative transform of the entity to its parent.
    GetRelativeTransform<native><epic_internal>()<transacts>:transform

    @experimental
    # Attaches the owner entity to the specified entity. This method will compute relative transform from the current world transform of both entity
    AttachTo<native><epic_internal>(InParentEntity:entity)<transacts><decides>:void

    @experimental
    # Attach the owner entity to the specified entity, use the specified transform as the relation to it
    AttachTo<native><epic_internal>(InParentEntity:entity, NewRelativeTransform:transform)<transacts><decides>:void

    @experimental
    # Detaches the owner entity if it was attached to an other entity
    DetachFrom<native><epic_internal>()<transacts><decides>:void

    @experimental
    # Set relative transform from a global transform
    SetRelativeTransformFromGlobal<native><epic_internal>(Transform:transform)<transacts><decides>:void

    @experimental
    # Retrieve the transform of the attachment
    GetAttachedTransform<native><epic_internal>()<decides>:transform

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Automatically attach to owner at initialization
    AutoAttachToOwner<native><epic_internal>:logic = external {}

    @experimental
    # The relative transform to the attached entity
    var RelativeTransform<native><epic_internal>:?transform = external {}

    @experimental
    # The relative transform to the attached entity
    var ParentEntity<native><epic_internal>:?entity = external {}

@experimental
# Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate whilethe `particle_system_component` is in the scene.Dependencies:  * `transform_component` on the entity positions the `particle_system`.
particle_system_component<native><public> := class<final>(component, enableable):
    OnInitialized<native><override>():void

    OnUninitializing<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Enables the simulation and rendering of this `particle_system`.
    Enable<native><override>():void

    @experimental
    # Disables the simulation and rendering of this `particle_system`.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<override>()<transacts><decides>:void = external {}

    @editable
    @experimental
    # Controls if the `particle_system_component` should start enabled.
    AutoEnable<native><public>:logic = external {}

    @replicated("RepNotify")
    @editable
    @experimental
    # The `particle_system` to be created by this component.
    var ParticleSystem<native><public>:particle_system = external {}

    @editable
    # Controls if the `particle_system_component` should run a simulation preview in UEFN. This isseparate from `AutoEnable` so users can control what starts in the game separately from the editor.
    PreviewInEditor<native><public>:logic = external {}

    @experimental
    SetBeamStart<native><epic_internal>(InBeamStart:vector3):void

    @experimental
    SetBeamStartTangent<native><epic_internal>(InBeamStartTangent:vector3):void

    @experimental
    SetBeamEnd<native><epic_internal>(InBeamEnd:vector3):void

    @experimental
    SetBeamEndTangent<native><epic_internal>(InBeamEndTangent:vector3):void

    @experimental
    SetBeamWidth<native><epic_internal>(InBeamWidth:float):void

@experimental
hit_result<native><epic_internal> := struct:
    @experimental
    ThisEntity<native><public>:?entity

    @experimental
    ThisComponent<native><public>:?component

    @experimental
    OtherEntity<native><public>:?entity

    @experimental
    OtherComponent<native><public>:?component

    @experimental
    HitNormal<native><public>:vector3

    @experimental
    HitLocation<native><public>:vector3

@experimental
physics_component<native><epic_internal> := class<final>(component, enableable):
    # The component is being initialized, called when it is added to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnUninitializing<native><override>():void

    # Notification called then the component owner entity was added to a world
    OnAddedToScene<native><override>():void

    # Notification called when the component owner entity is about to be removed from world
    OnRemovingFromScene<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Enable this object.
    Enable<native><override>():void

    @experimental
    # Disable this object.
    Disable<native><override>():void

    @experimental
    # Succeeds if the component is enabled, fails if it’s disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    @experimental
    # Event signaled when the component experiences a blocking hit
    HitEvent<native><public>:listenable(hit_result) = external {}

@hide_in_editor
@experimental
point_light_component_base<native><epic_internal> := class<epic_internal>(light_component):
    @experimental
    # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.This clamping of the light's influence is not physically correct but very important for performance. Larger lights cost more. Clamped between 8.0 and 16384.0.
    var AttenuationRadius<public>:float = external {}

    @experimental
    # The radius of the light shape. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceRadius<public>:float = external {}

    @experimental
    # The length of the light shape. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
    var SourceLength<public>:float = external {}

    GetAttenuationRadius<native><protected>(__dupe___unnamed_parameter_130:accessor)<transacts>:float

    SetAttenuationRadius<native><protected>(__dupe___unnamed_parameter_131:accessor, InAttenuationRadius:float)<transacts>:void

    GetSourceRadius<native><protected>(__dupe___unnamed_parameter_132:accessor)<transacts>:float

    SetSourceRadius<native><protected>(__dupe___unnamed_parameter_133:accessor, InSourceRadius:float)<transacts>:void

    GetSourceLength<native><protected>(__dupe___unnamed_parameter_134:accessor)<transacts>:float

    SetSourceLength<native><protected>(__dupe___unnamed_parameter_135:accessor, InSourceLength:float)<transacts>:void

@experimental
# A `point_light_component` emits light equally in all directions from a single point in space.
point_light_component<native><public> := class<final>(point_light_component_base):


@experimental
# A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use theseto simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lightingfixtures, or wall sconces.
rect_light_component<native><public> := class<final>(light_component):
    @experimental
    # The bounds of the light’s visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.This clamping of the light's influence is not physically correct but very important for performance. Larger lights cost more. Clamped between 8.0 and 16384.0.
    var AttenuationRadius<public>:float = external {}

    @experimental
    # The width of the light source rect. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
    var SourceWidth<public>:float = external {}

    @experimental
    # The height of the light source rect. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.Clamped between 0.0 and 1000.0 cm.
    var SourceHeight<public>:float = external {}

    @experimental
    # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
    var BarnDoorAngle<public>:float = external {}

    @experimental
    # The length of the barn door attached to the light source rect. Clamped to a minimum of 0.0 cm.
    var BarnDoorLength<public>:float = external {}

@experimental
sound_component<native><epic_internal> := class(component):
    # The component is being initialized, called when it is added to an entity
    OnInitialized<native><override>():void

    # The component is being uninitialized, called when it is about to be removed from an entity
    OnUninitializing<native><override>():void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @editable
    @replicated("RepNotify")
    @experimental
    # The path to the sound asset
    var Sound<native><public>:sound = external {}

    @experimental
    # Play the sound asset
    Play<native><public>():void

    @experimental
    # Play the sound asset
    Stop<native><public>():void

@experimental
# A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngle`and `OuterConeAngle`. Within the `InnerConeAngle` the light achieves full brightness. As you go from the extent of the inner radius to theextents of the `OuterConeAngle` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc ofillumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
spot_light_component<native><public> := class<final>(point_light_component_base):
    @experimental
    # The light’s inner cone shaped angle in degrees. Clamped between 1.0 and 80.00.
    var InnerConeAngle<public>:float = external {}

    @experimental
    # The light's 'outer cone shaped angle in degrees. Clamped between 1.0 and 80.00.
    var OuterConeAngle<public>:float = external {}

@experimental
# A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
float_range<native><public> := struct<concrete>:
    Minimum<native><public>:float = external {}

    @editable
    Maximum<native><public>:float = external {}

@experimental
# Used to render a string at the location of this entity.Dependencies:  * `transform_component` on the entity positions the `text_display_component`.
text_display_component<native><public> := class<final>(component, enableable):
    OnInitialized<native><override>():void

    OnAddedToScene<native><override>():void

    OnRemovingFromScene<native><override>():void

    OnBeginSimulation<native><override>():void

    OnEndSimulation<native><override>():void

    # Enable this object.
    Enable<native><override>():void

    # Disable this object.
    Disable<native><override>():void

    # Succeeds if the component is enabled, fails if it is disabled.
    IsEnabled<native><override>()<transacts><decides>:void

    # Internal epic method to know if this component is allowed on client
    IsAllowedOnClient<override>():logic = external {}

    @experimental
    @editable
    @replicated("RepNotify")
    # Text to be displayed on the entity.
    var Text<native><public>:string = external {}

    @editable
    @replicated("RepNotify")
    # The color with which to display the text.
    var Color<native><public>:color = external {}

    @editable
    @replicated("RepNotify")
    # The time in seconds for the text to fully fade in.
    var FadeInTime<native><epic_internal>:float = external {}

    @editable
    @replicated("RepNotify")
    # The time in seconds for the text to fully fade out.
    var FadeOutTime<native><epic_internal>:float = external {}