# Used to select, spawn, and configure a skeletal mesh to play a specific animation.
animated_mesh_device<public> := class<concrete><final>(creative_device_base):
    # Starts or resumes playback of the animation.
    Play<public>():void = external {}

    # Pauses playback of the animation.
    Pause<public>():void = external {}

    # Starts or resumes reverse playback of the animation.
    PlayReverse<public>():void = external {}