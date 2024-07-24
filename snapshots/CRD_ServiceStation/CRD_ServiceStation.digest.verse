using {/Fortnite.com/Vehicles}
# A one stop automated refueling and repairing station for your vehicles.
service_station_device<epic_internal> := class<concrete><final>(creative_device_base):
    # Fires when a vehicle enters the service station, returns the vehicle that entered
    VehicleEnteredEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station, returns the vehicle that left
    VehicleLeftEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires on the first tick of a vehicle refueling, returns the vehicle refueled
    VehicleStartedFuelingEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle finishes refueling, returns the vehicle refueled
    VehicleStoppedFuelingEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle starts repairing, returns the vehicle repaired
    VehicleStartedRepairingEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle stops repairing, returns the vehicle repaired
    VehicleStoppedRepairingEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle enters the service station at full health, returns the vehicle that entered
    VehicleEnteredAtFullHealthEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle enters the service station at full fuel, returns the vehicle that entered
    VehicleEnteredAtFullFuelEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station while full health, returns the vehicle that left
    VehicleLeftUnderFullHealthEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station while full health, returns the vehicle that left
    VehicleLeftUnderFullFuelEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station before it can receive any health, returns the vehicle that left
    VehicleLeftWithoutBeingRepairedEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when a vehicle leaves the service station before it can receive any fuel, returns the vehicle that left
    VehicleLeftWithoutBeingRefueledEvent<epic_internal>:listenable(fort_vehicle) = external {}

    # Fires when the Service Station is damaged
    DamagedEvent<epic_internal>:listenable(tuple()) = external {}

    # Fires When the Service Station is destroyed
    DestroyedEvent<epic_internal>:listenable(tuple()) = external {}

    # Response for if vehicle is inside service station
    VehicleIsInsideEvent<epic_internal>:listenable(tuple()) = external {}

    # Response for if vehicle is not inside service station
    VehicleIsNotInsideEvent<epic_internal>:listenable(tuple()) = external {}

    # Enables this device.
    Enable<epic_internal>():void = external {}

    # Disables this device.
    Disable<epic_internal>():void = external {}

    # Request to check if any vehicle is inside the service station.
    CheckIfVehicleIsInside<epic_internal>():void = external {}