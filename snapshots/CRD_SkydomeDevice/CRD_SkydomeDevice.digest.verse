# Controls how the sky looks, as well as giving you options for changing the sun, clouds, stars or other objects in the sky above your island. You can control the sun and moon, and add other atmosphericelements like stars, fog and clouds. You can change the color of your light source, and blend differentcolors for your island's sky to create the perfect atmosphere for your game.
skydome_device<public> := class<concrete><final>(creative_device_base):
    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}