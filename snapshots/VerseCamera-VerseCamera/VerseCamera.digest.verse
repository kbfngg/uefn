using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Verse.org/Simulation/Tags}
using {/Verse.org/Native}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
# Module import path: /UnrealEngine.com/Temporary/SceneGraph/VerseCamera
VerseCamera<public> := module:
    @experimental
    # Component that owns higher level camera behavior. 
    # Owns a CameraDirector, which is responsible for selecting the best camera mode every update.
    # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
    camera_behavior_component<native><epic_internal> := class(component):
        @replicated("")
        @experimental
        # Reponsible for deciding which camera modes should be active on each layer
        var CameraDirector<public>:camera_director = external {}

        @replicated("")
        @experimental
        # The evaluation context sets an initial transform for the camera, before camera mode logic is applied. This evaluation context is used as the default if a camera mode does not provide its own
        var DefaultEvaluationContext<public>:camera_evaluation_context = external {}

        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    @experimental
    # Activate a camera behavior component for a player, setting it as the active view target
    (InCameraBehavior:camera_behavior_component).ActivateForPlayer<native><epic_internal>(InPlayer:player)<transacts><decides>:void

    @experimental
    # Deactivate a camera behavior component for a player, restoring the player's view target to the default
    (InCameraBehavior:camera_behavior_component).DeactivateForPlayer<native><epic_internal>(InPlayer:player)<transacts><decides>:void

    @experimental
    (InCameraBehavior:camera_behavior_component).ActivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex:int)<transacts><decides>:void

    @experimental
    (InCameraBehavior:camera_behavior_component).DeactivateForPlayerAtIndex<native><epic_internal>(InPlayerIndex:int)<transacts><decides>:void

    @experimental
    # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
    camera_component<native><epic_internal> := class(basic_camera_component):
        # Internal epic method to know if this component is allowed on client
        IsAllowedOnClient<override>():logic = external {}

    @import_as("/Script/VerseCamera.UVerseCameraDirectorBase")
    @experimental
    camera_director_base<native><epic_internal> := class:


    @experimental
    # Base class for Camera Directors defined in Verse
    camera_director<native><epic_internal> := class(camera_director_base):
        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native_callable><public>():[]camera_mode = external {}

        @experimental
        # Add a camera mode to the list for consideration
        AddCameraMode<native_callable><public>(CameraMode:camera_mode):void = external {}

        @experimental
        # Remove a camera mode from the list for consideration
        RemoveCameraMode<native_callable><public>(CameraMode:camera_mode):void = external {}

    @experimental
    # Default camera director implementation  - Simply returns the highest priority camera mode every update
    camera_director_default<native><epic_internal> := class<final>(camera_director):
        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraModes<native><override>():[]camera_mode

        @experimental
        # Add a camera mode to the list for consideration
        AddCameraMode<native><override>(CameraMode:camera_mode):void

        @experimental
        # Remove a camera mode from the list for consideration
        RemoveCameraMode<native><override>(CameraMode:camera_mode):void

    @experimental
    # Input params to a camera evaluation context update
    camera_evaluation_context_input_parameters<native><epic_internal> := class<final>:
        @experimental
        # Entity that owns the camera behavior component
        var CameraBehaviorEntity<native><epic_internal>:entity = external {}

        @experimental
        # Time elapsed since last update
        var DeltaTime<native><public>:float = external {}

    @experimental
    # Output params to a camera evaluation context update
    camera_evaluation_context_output_parameters<native><epic_internal> := class<final>(camera_output_parameters):
        @experimental
        # If written to, will set the target distance
        var TargetDistance<native><epic_internal>:?float = external {}

    @import_as("/Script/VerseCamera.UVerseCameraEvaluationContext")
    @experimental
    camera_evaluation_context_base<native><epic_internal> := class<abstract>:


    @experimental
    # Base class for Verse camera evaluation contexts
    camera_evaluation_context<native><epic_internal> := class(camera_evaluation_context_base):
        @experimental
        # Update the evaluation context. Override this to modify the initial camera transform and other initial camera parameters before any camera modes are run
        Update<native_callable><public>(InputParameters:camera_evaluation_context_input_parameters, OutputParameters:camera_evaluation_context_output_parameters)<transacts><decides>:void = external {}

    @experimental
    # Camera evaluation context for scene graph entities.
    # Allows users of camera modes to supply a context object that provides more information about the context in whichthe camera mode is being used (for example, initial camera position)
    entity_camera_evaluation_context<native><epic_internal> := class<final>(camera_evaluation_context):
        @experimental
        Update<native><override>(InputParameters:camera_evaluation_context_input_parameters, OutputParameters:camera_evaluation_context_output_parameters)<transacts><decides>:void

        @replicated("")
        @experimental
        # For cameras that are fixed in the world. This entity is used as a reference point for the initial world transform of the fixed camera.
        # Leave this unset for cameras that should follow another entity around
        var FixedWorldCameraEntity<native><public>:?entity = external {}

        @replicated("")
        @experimental
        # Entity the camera is targeting. Used to provide an initial look-at rotation for the camera
        var TargetEntity<native><public>:?entity = external {}

    @experimental
    verse_camera_mode_tag<native><epic_internal> := class(tag):


    @import_as("/Script/VerseCamera.UVerseCameraMode")
    @experimental
    camera_mode_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
    camera_mode<native><epic_internal> := class<concrete><unique><final>:
        @experimental
        GetCameraModeTag<native><public>()<transacts><decides>:verse_camera_mode_tag

        @replicated("")
        @experimental
        # Camera rig asset that defines the behavior of the camera mode
        var CameraRigAsset<public>:camera_rig_asset = external {}

        @replicated("")
        @editable
        @experimental
        # Root camera operation - This is mutually exclusive with CameraRigAsset, but allows you to build up a camera mode completely in Verse
        var RootCameraOperation<native><epic_internal>:?camera_operation = external {}

        @replicated("")
        @experimental
        # Priority level that can be used by camera directors to determine the best camera mode
        var Priority<public>:float = external {}

        @replicated("")
        @experimental
        # Camera evaluation context. Used to override default camera transform, and set target entity
        var CameraEvaluationContext<public>:camera_evaluation_context = external {}

    @experimental
    # Camera operation initialization parameters
    camera_operation_initialization_parameters<native><epic_internal> := class<final>:


    @experimental
    # Input params to a camera operation
    camera_operation_input_parameters<native><epic_internal> := class<final>:
        @experimental
        # Camera evaluation context that the owning camera mode is running in
        var EvaluationContext<native><public>:?camera_evaluation_context = external {}

        @experimental
        # Camera location from the initial evaluator execution, or previous operation if an operation modified it before this one
        var CameraLocation<native><public>:vector3 = external {}

        @experimental
        # Camera rotation from the initial evaluator execution,  or previous operation if an operation modified it before this one
        var CameraRotation<native><public>:rotation = external {}

        @experimental
        # Delta time since last update
        var DeltaTime<native><public>:float = external {}

        @experimental
        # Get the value of a camera parameter
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_logic)<transacts><decides>:void

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_float)<transacts><decides>:float

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_integer)<transacts><decides>:int

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_vector2)<transacts><decides>:vector2

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_vector3)<transacts><decides>:vector3

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_rotation)<transacts><decides>:rotation

        @experimental
        GetCameraParameterValue<native><epic_internal>(Parameter:camera_parameter_transform)<transacts><decides>:transform

    @experimental
    # Output params to a camera operation
    camera_operation_output_parameters<native><epic_internal> := class<final>(camera_output_parameters):


    @import_as("/Script/VerseCamera.UVerseCameraNode")
    @experimental
    camera_operation_base<native><epic_internal> := class<abstract>:


    @experimental
    # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
    camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base):
        @experimental
        # Called when the camera mode is initialized
        Initialize<native_callable><public>(InitParams:camera_operation_initialization_parameters)<transacts><decides>:void = external {}

        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(InputParams:camera_operation_input_parameters, OutputParams:camera_operation_output_parameters):void = external {}

    @experimental
    camera_parameter_logic<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:logic = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_logic = external {}

    @experimental
    camera_parameter_float<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:float = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_float = external {}

    @experimental
    camera_parameter_integer<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:int = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_integer = external {}

    @experimental
    camera_parameter_vector2<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:vector2 = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_vector2 = external {}

    @experimental
    camera_parameter_vector3<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:vector3 = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_vector3 = external {}

    @experimental
    camera_parameter_rotation<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:rotation = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_rotation = external {}

    @experimental
    camera_parameter_transform<native><epic_internal> := class:
        @editable
        @experimental
        Value<native><public>:transform = external {}

        @editable
        @experimental
        Variable<native><public>:camera_variable_transform = external {}

    @experimental
    camera_output_parameters<native><epic_internal> := class:
        @experimental
        # If written to, will set the camera location
        var CameraLocation<native><public>:?vector3 = external {}

        @experimental
        # If written to, will set the camera rotation
        var CameraRotation<native><public>:?rotation = external {}

        @experimental
        # If written to, will set the camera field of view
        var CameraFieldOfViewDegrees<native><public>:?float = external {}

        @experimental
        # Set a camera variable value
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_logic, Value:logic)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_float, Value:float)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_integer, Value:int)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_vector2, Value:vector2)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_vector3, Value:vector3)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_rotation, Value:rotation)<transacts><decides>:void

        @experimental
        SetCameraVariable<native><epic_internal>(CameraVariable:camera_variable_transform, Value:transform)<transacts><decides>:void

        Reset_Internal<native><epic_internal>():void

    @experimental
    GetPlayerCameraView<native><epic_internal>(Player:player)<transacts><decides>:player_camera_view

    @experimental
    GetPlayerCameraViewByIndex<native><epic_internal>(PlayerIndex:int)<transacts><decides>:player_camera_view

    @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
    @experimental
    player_camera_view_base<native><epic_internal> := class<abstract>:


    @experimental
    # Component used to associate a camera behavior component with a player
    player_camera_view<native><epic_internal> := class(player_camera_view_base):
        @experimental
        SetActiveCameraBehavior<native><public>(CameraBehaviorIn:camera_behavior_component)<transacts><decides>:void

        @experimental
        ClearActiveCameraBehavior<native><public>()<transacts><decides>:void

        @experimental
        GetActiveCameraBehavior<native><public>()<transacts><decides>:camera_behavior_component