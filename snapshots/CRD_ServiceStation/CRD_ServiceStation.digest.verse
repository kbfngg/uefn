using {/Fortnite.com/Vehicles}
using {/Fortnite.com/Game}
# A one stop automated refueling and repairing station for your vehicles.
service_station_device<public> := class<concrete><final>(creative_device_base, healthful, damageable, enableable):
    GetHealth<override>()<transacts>:float = external {}

    SetHealth<override>(Health:float)<transacts>:void = external {}

    GetMaxHealth<override>()<transacts>:float = external {}

    SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

    Damage<override>(Amount:float):void = external {}

    Damage<override>(Args:damage_args):void = external {}

    DamagedEvent<override>():listenable(damage_result) = external {}

    Enable<override>():void = external {}

    Disable<override>():void = external {}

    IsEnabled<override>()<transacts><decides>:void = external {}

    # Fires when a vehicle enters the service station, returns the vehicle that entered.
    VehicleEnteredEvent<public>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station, returns the vehicle that exited.
    VehicleExitedEvent<public>:listenable(fort_vehicle) = external {}

    # Fires on the first tick of a vehicle refueling, returns the refueled vehicle.
    VehicleFuelingBeginEvent<public>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle is at full fuel, returns the refueled vehicle.
    VehicleFuelingEndEvent<public>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle starts repairing, returns the repaired vehicle.
    VehicleRepairBeginEvent<public>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle is at full health, returns the repaired vehicle.
    VehicleRepairEndEvent<public>:listenable(fort_vehicle) = external {}

    # Check if any vehicle is inside the service station.
    IsAnyVehicleInside<public>()<transacts><decides>:void = external {}