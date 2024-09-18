using {/Fortnite.com/Vehicles}
using {/Fortnite.com/Game}
# A one stop automated refueling and repairing station for your vehicles.
service_station_device<public> := class<concrete><final>(creative_device_base, healthful, damageable, enableable):
    # Returns the health state of the object. This value will between 0.0 and `GetMaxHealth`
    GetHealth<override>()<transacts>:float = external {}

    # Sets the health state of the object to `Health`.
    #  * Health state will be clamped between 1.0 and `GetMaxHealth`.
    #  * Health state cannot be directly set to 0.0. To eliminate `healthful` objects use the `damageable.Damage` functions instead.
    SetHealth<override>(Health:float)<transacts>:void = external {}

    # Returns the maximum health of the object. This value will be between 1.0 and Inf.
    GetMaxHealth<override>()<transacts>:float = external {}

    # Sets the maximum health state of the object.
    #  * MaxHealth will be clamped between 1.0 and Inf.
    #  * Current health state will be scaled up or down based on the scale difference between the old and new MaxHealth state.
    SetMaxHealth<override>(MaxHealth:float)<transacts>:void = external {}

    # Damage the `damageable` object anonymously by `Amount`. Setting `Amount` to less than 0 will cause no damage.
    # Use `Damage(:damage_args):void` when damage is being applied from a known instigator and source.
    Damage<override>(Amount:float):void = external {}

    # Damage the `damageable` object by `Args.Amount`. Setting `Amount` to less than 0 will cause no damage.
    Damage<override>(Args:damage_args):void = external {}

    # Signaled when damage is applied to the `damageable` object.
    DamagedEvent<override>():listenable(damage_result) = external {}

    # Enable this object.
    Enable<override>():void = external {}

    # Disable this object.
    Disable<override>():void = external {}

    # Succeeds if the object is enabled, fails if it's disabled.
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