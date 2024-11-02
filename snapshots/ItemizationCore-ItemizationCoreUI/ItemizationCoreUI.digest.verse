using {/Verse.org/Native}
using {/Verse.org/Assets}
using {/UnrealEngine.com/Temporary/SceneGraph}
using {/UnrealEngine.com/Temporary/Diagnostics}
itemization_log<epic_internal> := class(log_channel):


@experimental
inventory_collection_view_model_component<native><public> := class<final>(component):
    InitializeViewModel<native_callable><public>(Collection:inventory_collection_component):void = external {}

    HandleItemsAdded<protected>(AddItemsResult:add_items_result):void = external {}

    HandleItemsRemoved<protected>(RemoveItemsResult:remove_items_result):void = external {}

    HandleItemSlotsChanged<protected>(ChangeItemsSlotResult:change_items_slot_result):void = external {}

    HandleInventoryAdded<protected>(AddInventoryResult:add_inventory_result):void = external {}

    HandleInventoryRemoved<protected>(RemoveInventoryResult:remove_inventory_result):void = external {}

    GetParameterCollection<native_callable><epic_internal>():InventoryCollectionParameterCollection = external {}

    ParameterCollection<epic_internal>:InventoryCollectionParameterCollection = external {}

@experimental
(InventoryCollection:inventory_collection_component).GetKeyForParameterCollection<native><public>()<transacts><decides>:int

@experimental
(Inventory:inventory_component).GetKeyForParameterCollection<native><public>()<transacts><decides>:int

@experimental
(Item:item).GetKeyForParameterCollection<native><public>()<transacts><decides>:int

InventoryCollectionParameterCollection_asset<epic_internal>:parameter_collection_UE5_definition = external {}

InventoryCollectionParameterCollection<epic_internal> := class(parameterized_parameter_collection):
    UE5Class<override>:parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_CollectionName_Changed<epic_internal>():void = external {}

    ___ParameterCollection_On_CollectionKey_Changed<epic_internal>():void = external {}

InventoryParameterCollection_asset<epic_internal>:parameter_collection_UE5_definition = external {}

InventoryParameterCollection<public> := class<public>(parameterized_parameter_collection):
    UE5Class<override>:parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_InventoryName_Changed<epic_internal>():void = external {}

    ___ParameterCollection_On_InventoryKey_Changed<epic_internal>():void = external {}

InventoryItemParameterCollection_asset<epic_internal>:parameter_collection_UE5_definition = external {}

InventoryItemParameterCollection<public> := class<public>(parameterized_parameter_collection):
    UE5Class<override>:parameter_collection_UE5_definition = external {}

    ___ParameterCollection_On_IsActive_Changed<epic_internal>():void = external {}

    ___ParameterCollection_On_Amount_Changed<epic_internal>():void = external {}

    ___ParameterCollection_On_ItemName_Changed<epic_internal>():void = external {}

    ___ParameterCollection_On_ItemKey_Changed<epic_internal>():void = external {}

@import_as("/Script/ItemizationCoreUI.UVerseInventoryItemEntryViewModelBase")
inventory_item_entry_view_model_base<native><epic_internal> := class<abstract>:


@experimental
inventory_item_entry_view_model<public> := class<final>(inventory_item_entry_view_model_base):
    InitializeViewModel<public>(Item:item):void = external {}

    ParameterCollection<public>:InventoryItemParameterCollection = external {}

@import_as("/Script/ItemizationCoreUI.UVerseInventoryViewModelBase")
inventory_view_model_base<native><epic_internal> := class<abstract>:


@experimental
inventory_view_model<epic_internal> := class<final>(inventory_view_model_base):
    InitializeViewModel<public>(InInventory:inventory_component):void = external {}

    ParameterCollection<public>:InventoryParameterCollection = external {}