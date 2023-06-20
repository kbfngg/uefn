using {/Verse.org/Simulation}
# Used to set up islands so players will earn Battle Pass XP when they interact with your island. Accoladesare achievements or accomplishments that players can complete to earn XP.
accolades_device<public> := class<concrete><final>(creative_device_base):
    # Signaled when testing the accolade to make sure it is awarded as expected. Only signals withinunpublished island environments.Sends the `agent` receiving the achievement.
    TestAwardEvent<public>:listenable(agent) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Awards the XP to `agent`.
    Award<public>(Agent:agent):void = external {}