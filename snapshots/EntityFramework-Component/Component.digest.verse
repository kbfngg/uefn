using {/Verse.org/Assets}
using {/Verse.org/Colors}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/EntityFramework/Entity}
# Module import path: /UnrealEngine.com/EntityFramework/Component
Component<public> := module:
    attachment_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Attaches the owner entity to the specified entity. This method will compute relative transform from the current world transform of both entity
        AttachTo<native><public>(InParentEntity:core_entity)<transacts><decides>:void

        # Attach the owner entity to the specified entity, use the specified transform as the relation to it
        AttachTo<native><public>(InParentEntity:core_entity, NewRelativeTransform:transform)<transacts><decides>:void

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
        var ParentEntity<native><public>:?core_entity = external {}

    camera_entity_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Notification called when the game simulation has started
        BeginPlay<native><override>():void

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

        # Set the field of view of the camera in degrees
        SetFieldOfView<public>(InFieldOfView:float):void = external {}

        GetFieldOfView<public>():float = external {}

        # Set the aspect ratio of the camera
        SetAspectRatio<public>(InAspectRatio:float):void = external {}

        GetAspectRatio<public>():float = external {}

        # Enable or disable the camera
        SetIsActive<public>(InIsActive:logic):void = external {}

        GetIsActive<public>():logic = external {}

    @hide_in_editor
    light_entity_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    @hide_in_editor
    mesh_component<native><epic_internal> := class(core_entity_component):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    physics_component<native><epic_internal> := class(core_entity_component):
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Notification called then the component owner entity was added to a world
        AddedToWorld<native><override>():void

        # Notification called when the component owner entity is about to be removed from world
        RemovingFromWorld<native><override>():void

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

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
        # The component is being initialized, called when it is attach to an entity
        Initialize<native><override>():void

        # The component is being uninitialized, called when it is about to be detached from an entity
        Uninitialize<native><override>():void

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

        # The path to the static mesh asset
        var Mesh<native><public>:mesh = external {}

        # The path to the material asset of a static mesh
        var Material<native><public>:?material = external {}