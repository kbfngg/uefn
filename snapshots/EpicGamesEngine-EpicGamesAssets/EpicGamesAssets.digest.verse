using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
# Module import path: /UnrealEngine.com/Assets
Assets<public> := module:
    play_sound_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    PlaySound<native><epic_internal>(Asset:sound, ?StartDelay:float = external {})<transacts>:cancelable

    PlaySoundAtLocation<native><epic_internal>(Asset:sound, Position:vector3, ?Rotation:rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable

    spawn_particle_system_subscription<native><epic_internal> := class(cancelable):
        Cancel<native><override>()<transacts>:void

    SpawnParticleSystem<native><public>(Asset:particle_system, Position:vector3, ?Rotation:rotation = external {}, ?StartDelay:float = external {})<transacts>:cancelable