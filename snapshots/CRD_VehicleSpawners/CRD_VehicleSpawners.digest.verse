using {/Verse.org/Simulation}
# Specialized `vehicle_spawner_device` that allows a Whiplash sports car to be configured and spawned.
vehicle_spawner_sports_car_device<public> := class<concrete><final>(vehicle_spawner_device):


# Base class for various specialized vehicle spawners which allow specific vehicle types to be spawned and configured with specialized options.
vehicle_spawner_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when an `agent` enters the vehicle.Sends the `agent` that entered the vehicle.
    AgentEntersVehicleEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the vehicle.Sends the `agent` that exited the vehicle.
    AgentExitsVehicleEvent<public>:listenable(agent) = external {}

    # Signaled when a vehicle is spawned or respawned by this device.
    VehicleSpawnedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a vehicle is destroyed.
    VehicleDestroyedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets `Agent` as the vehicle's driver.
    AssignDriver<public>(Agent:agent):void = external {}

    # Destroys the spawned vehicle if it exists.
    DestroyVehicle<public>():void = external {}

    # Spawns a new vehicle. The previous vehicle will be destroyed before a new vehicle spawns.
    RespawnVehicle<public>():void = external {}

# Specialized `vehicle_spawner_device` that allows a taxi to be configured and spawned.
vehicle_spawner_taxi_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a surfboard to be configured and spawned.
vehicle_spawner_surfboard_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a shopping cart to be configured and spawned.
vehicle_spawner_shopping_cart_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Quadcrasher to be configured and spawned.
vehicle_spawner_quadcrasher_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Prevalent sedan to be configured and spawned.
vehicle_spawner_sedan_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Mudflap semi truck to be configured and spawned.
vehicle_spawner_big_rig_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Driftboard to be configured and spawned.
vehicle_spawner_driftboard_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a cannon to be configured and spawned.
vehicle_spawner_cannon_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a boat to be configured and spawned.
vehicle_spawner_boat_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Stormwing biplane to be configured and spawned.
vehicle_spawner_biplane_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a pickup truck to be configured and spawned.
vehicle_spawner_pickup_truck_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Baller vehicle to be configured and spawned.
vehicle_spawner_baller_device<public> := class<concrete><final>(vehicle_spawner_device):
    # Signaled when the vehicle runs out of energy.
    OutOfEnergyEvent<public>:listenable(tuple()) = external {}

    # Refills the vehicle's energy.
    RefillEnergy<public>():void = external {}

# Specialized `vehicle_spawner_device` that allows an ATK (all terrain kart) to be configured and spawned.
vehicle_spawner_atk_device<public> := class<concrete><final>(vehicle_spawner_device):
