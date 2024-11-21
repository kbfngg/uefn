using {/Fortnite.com/Vehicles}
using {/Verse.org/Simulation}
# Specialized `vehicle_spawner_device` that allows an ATK (all terrain kart) to be configured and spawned.
vehicle_spawner_atk_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Baller vehicle to be configured and spawned.
vehicle_spawner_baller_device<public> := class<concrete><final>(vehicle_spawner_device):
    # Signaled when the vehicle runs out of energy.
    OutOfEnergyEvent<public>:listenable(tuple()) = external {}

    # Refills the vehicle's energy.
    RefillEnergy<public>():void = external {}

# Specialized `vehicle_spawner_device` that allows a pickup truck to be configured and spawned.
vehicle_spawner_pickup_truck_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Stormwing biplane to be configured and spawned.
vehicle_spawner_biplane_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a boat to be configured and spawned.
vehicle_spawner_boat_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a cannon to be configured and spawned.
vehicle_spawner_cannon_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Driftboard to be configured and spawned.
vehicle_spawner_driftboard_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Mudflap semi truck to be configured and spawned.
vehicle_spawner_big_rig_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Prevalent sedan to be configured and spawned.
vehicle_spawner_sedan_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a Quadcrasher to be configured and spawned.
vehicle_spawner_quadcrasher_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a shopping cart to be configured and spawned.
vehicle_spawner_shopping_cart_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a surfboard to be configured and spawned.
vehicle_spawner_surfboard_device<public> := class<concrete><final>(vehicle_spawner_device):


# Specialized `vehicle_spawner_device` that allows a taxi to be configured and spawned.
vehicle_spawner_taxi_device<public> := class<concrete><final>(vehicle_spawner_device):


# Base class for various specialized vehicle spawners which allow specific vehicle types to be spawned and configured with specialized options.
vehicle_spawner_device<public> := class<abstract><epic_internal>(creative_device_base):
    # Signaled when an `agent` enters the vehicle.
    # Sends the `agent` that entered the vehicle.
    AgentEntersVehicleEvent<public>:listenable(agent) = external {}

    # Signaled when an `agent` exits the vehicle.
    # Sends the `agent` that exited the vehicle.
    AgentExitsVehicleEvent<public>:listenable(agent) = external {}

    # Signaled when a vehicle is spawned or respawned by this device.
    # Sends the fort_vehicle who was spawned.
    SpawnedEvent<public>:listenable(fort_vehicle) = external {}

    # Signaled when a vehicle is spawned or respawned by this device.
    # Deprecated, use SpawnedEvent instead.
    VehicleSpawnedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a vehicle is destroyed.
    # Deprecated, use DestroyedEvent instead.
    VehicleDestroyedEvent<public>:listenable(tuple()) = external {}

    # Signaled when a vehicle is destroyed.
    DestroyedEvent<public>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<public>():void = external {}

    # Disables this device.
    Disable<public>():void = external {}

    # Sets `agent` as the vehicle's driver.
    AssignDriver<public>(Agent:agent):void = external {}

    # Destroys the vehicle if it exists.
    DestroyVehicle<public>():void = external {}

    # Spawns a new vehicle. The previous vehicle will be destroyed before a new vehicle spawns.
    RespawnVehicle<public>():void = external {}

    # Applies off-road tires to the vehicle if applicable.
    ApplyOffRoadTires<epic_internal>():void = external {}

    # Reverts to road tires on the vehicle if applicable.
    RemoveTireMods<epic_internal>():void = external {}

    # Pops all of the tires on the vehicle, if applicable.
    PopAllTires<epic_internal>():void = external {}

    # Repairs all of the tires on the vehicle, if applicable.
    RepairAllTires<epic_internal>():void = external {}

    # Sets the amount of fuel(or energy) in the vehicle as a percentage between `0.0` and `100.0`.
    SetFuelRemaining<epic_internal>(Amount:float):void = external {}

    # Gets the amount of fuel(or energy) in the vehicle as a percentage between `0.0` and `100.0`.
    GetFuelRemaining<epic_internal>()<transacts>:float = external {}

    # Checks to see if a vehicle is currently spawned from this device.
    HasVehicle<epic_internal>()<transacts><decides>:void = external {}

    # Succeeds if `agent` is the driver of the vehicle.
    IsDriver<epic_internal>(Agent:agent)<transacts><decides>:void = external {}

    # Succeeds if `agent` is the passenger of the vehicle.
    IsPassenger<epic_internal>(Agent:agent)<transacts><decides>:void = external {}

    # Restores the vehicle to full health.
    RepairVehicle<epic_internal>():void = external {}

    # Sets the vehicle's current health to the supplied amount.
    # Health will be clamped between `1.0` and *Max Health*.
    SetVehicleHealth<epic_internal>(Amount:float):void = external {}

    # Returns the vehicle's current health.
    # Returns 0.0 if the vehicle does not exist.
    GetVehicleHealth<epic_internal>()<transacts>:float = external {}

    # Sets the vehicle's maximum health to the supplied value.
    # Health will be clamped between `1.0` and `9,999.0`.
    SetVehicleMaxHealth<epic_internal>(Amount:float):void = external {}

    # Returns the vehicle's maximum health.
    GetVehicleMaxHealth<epic_internal>(Amount:float):void = external {}

    # Returns the `agent` who is currently driving the vehicle.
    GetDriver<epic_internal>()<transacts><decides>:agent = external {}

# Specialized `vehicle_spawner_device` that allows a Whiplash sports car to be configured and spawned.
vehicle_spawner_sports_car_device<public> := class<concrete><final>(vehicle_spawner_device):
