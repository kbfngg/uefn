using {/Verse.org/Simulation}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Native}
# Module import path: /Verse.org/ControlInput
ControlInput<public> := module:
    input_action<native><epic_internal> := class<computes>:
        ConsumeInput<native><epic_internal>:logic = external {}

        Verb<native><epic_internal>:verb

        Triggers<native><epic_internal>:[]trigger

        Modifiers<native><epic_internal>:[]modifier = external {}

        Actions<native><epic_internal>:[]action

    @import_as("/Script/VerseInput.UVerseInputClientActionBase")
    action<native><epic_internal> := class<computes><abstract>:


    apply_impulse_action<native><epic_internal> := class(action):
        Impulse<native><epic_internal>:vector3

    launch_action<native><epic_internal> := class(action):
        Velocity<native><epic_internal>:vector3

    play_animation_action<native><epic_internal> := class(action):
        Animation<native><epic_internal>:animation

    play_sound_action<native><epic_internal> := class(action):
        Sound<native><epic_internal>:sound

    spawn_particle_effect_action<native><epic_internal> := class(action):
        ParticleSystem<native><epic_internal>:particle_system

    verb<native><epic_internal> := class<computes><epic_internal>:
        InputNames<native><epic_internal>:[]string

        IsAxis<native><epic_internal>:logic

    # Module import path: /Verse.org/ControlInput/InputVerbs
    InputVerbs<epic_internal> := module:
        MoveForward<epic_internal>:verb = external {}

        MoveRight<epic_internal>:verb = external {}

        MoveUp<epic_internal>:verb = external {}

        Turn<epic_internal>:verb = external {}

        LookUp<epic_internal>:verb = external {}

        Jump<epic_internal>:verb = external {}

        Sprint<epic_internal>:verb = external {}

        Crouch<epic_internal>:verb = external {}

        Fire<epic_internal>:verb = external {}

        Target<epic_internal>:verb = external {}

        Reload<epic_internal>:verb = external {}

        Use<epic_internal>:verb = external {}

        Emote<epic_internal>:verb = external {}

    modifier<native><epic_internal> := class<computes><abstract><epic_internal>:


    dead_zone<native><epic_internal> := class<computes>(modifier):
        LowerThreshold<native><epic_internal>:float = external {}

        UpperThreshold<native><epic_internal>:float = external {}

        Type<native><epic_internal>:dead_zone_type = external {}

    dead_zone_type<native><epic_internal> := enum:
        Radial
        Axial

    negate<native><epic_internal> := class<computes>(modifier):
        X<native><epic_internal>:logic = external {}

        Y<native><epic_internal>:logic = external {}

        Z<native><epic_internal>:logic = external {}

    scale<native><epic_internal> := class<computes>(modifier):
        Scale<native><epic_internal>:vector3 = external {}

    smooth<native><epic_internal> := class<computes>(modifier):


    exponential_response<native><epic_internal> := class<computes>(modifier):
        CurveExponent<native><epic_internal>:vector3 = external {}

    swizzle<native><epic_internal> := class<computes>(modifier):
        Order<native><epic_internal>:swizzle_order = external {}

    swizzle_order<native><epic_internal> := enum:
        XZY
        YXZ
        YZX
        ZYX
        ZXY

    GetPlayerInput<native><epic_internal>(Player:player)<transacts><decides>:player_input

    player_input<native><epic_internal> := class:
        AddInputAction<native><epic_internal>(InputAction:input_action):void

        RemoveInputAction<native><epic_internal>(InputAction:input_action):void

        AddInputActions<epic_internal>(InputActions:[]input_action):void = external {}

        RemoveInputActions<epic_internal>(InputActions:[]input_action):void = external {}

    trigger<native><epic_internal> := class<computes><abstract><epic_internal>:


    down<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

    hold<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

        HoldTimeThreshold<native><epic_internal>:float = external {}

        IsOneShot<native><epic_internal>:logic = external {}

        AffectedByTimeDilation<native><epic_internal>:logic = external {}

    hold_and_release<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

        HoldTimeThreshold<native><epic_internal>:float = external {}

        AffectedByTimeDilation<native><epic_internal>:logic = external {}

    pressed<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

    released<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

    tap<native><epic_internal> := class<computes>(trigger):
        ActuationThreshold<native><epic_internal>:float = external {}

        TapReleaseTimeThreshold<native><epic_internal>:float = external {}

        AffectedByTimeDilation<native><epic_internal>:logic = external {}