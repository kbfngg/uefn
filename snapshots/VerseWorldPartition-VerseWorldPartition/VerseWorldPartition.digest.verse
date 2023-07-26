# Module import path: /UnrealEngine.com/WorldPartition/VerseWorldPartition
VerseWorldPartition<public> := module:
    # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Data Layer runtime states.
    data_layer_runtime_state<native><public> := enum:
        # Unloaded
        Unloaded
        # Loaded (meaning loaded but not visible)
        Loaded
        # Activated (meaning loaded and visible)
        Activated

    data_layer_asset<native><public> := class<computes><final><epic_internal>:


    # Data Layer Manager used to get/set the runtime state of Data Layers.
    data_layer_manager<native><public> := class<concrete>:
        # Sets data layer runtime state.
        SetDataLayerRuntimeState<native><public>(DataLayerAsset:data_layer_asset, State:data_layer_runtime_state, IsRecursive:logic):logic

        # Returns data layer effective runtime state.
        GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset:data_layer_asset):data_layer_runtime_state

    GetDataLayerManager<native><public>()<transacts>:?data_layer_manager