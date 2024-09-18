using {/Verse.org/Colors}
using {/Verse.org/Assets}
using {/Verse.org/Native}
using {/Verse.org/Simulation/Tags}
using {/UnrealEngine.com/EpicGamesRestricted/Network}
using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SceneGraph}
@experimental
inventory_creation_type<native><public> := enum<persistable>:
    Runtime
    SetupData

@experimental
inventory_add_result<native><public> := struct:
    ModifiedItemList<native><public>:[]item

    AmountAdded<native><public>:int

@experimental
inventory_add_items_result<native><public> := struct<epic_internal>:
    Inventory<native><public>:inventory_component

    AddedItems<native><public>:[]item

@experimental
inventory_component<native><public> := class(component):
    IsAllowedOnClient<override>():logic = external {}

    CanAcceptItem<native><public>(Item:item)<decides>:void

    TakeItem<native><public>(Item:item)<transacts><decides>:int

    DuplicateItem<native><public>(Item:item, ?Amount:int = external {})<transacts><decides>:inventory_add_result

    RemoveItem<native><public>(Item:item, ?Amount:int = external {})<transacts><decides>:int

    DisposeAllItems<native><public>():void

    GetItemList<native><public>():[]item

    ItemsAddedEvent<native><public>:listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>:listenable(remove_items_result) = external {}

    ItemsChangedSlotEvent<native><public>:listenable(change_items_slot_result) = external {}

    @editable
    @replicated("")
    var InventoryName<native><public>:string = external {}

    @editable
    @replicated("")
    InventoryDescription<native><public>:string = external {}

    @editable
    ItemRequirement<native><public>:?item_requirement_base = external {}

    @editable
    @replicated("")
    var TotalSlots<native><protected>:int = external {}

    @editable
    @replicated("")
    var PickupPriority<native><public>:int = external {}

    @editable
    VerseGameplayTags<native><epic_internal>:tag_container = external {}

    @replicated("")
    var InventoryType<native><public>:inventory_creation_type = external {}

    @editable
    @replicated("")
    var EnableItemStacking<native><public>:logic = external {}

    @replicated("")
    var InventoryMaxStackSizeOverride<native><public>:int = external {}

@import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
@experimental
equippable_item_restriction_base<native><public> := class<unique><concrete>:


@experimental
active_item_limit_behavior<native><public> := enum<persistable>:
    UnequipLeastRecentlyUsed
    Block

@experimental
equippable_item_restriction<native><public> := class(equippable_item_restriction_base):
    AppliesTo<native><public>(Item:item)<transacts><decides>:void

    GetActiveSlotLimit<native><public>(Item:item)<transacts><decides>:int

    GetActiveLimitBehaviour<native><public>(Item:item)<transacts><decides>:active_item_limit_behavior

    @editable
    ItemRequirement<native><public>:?item_requirement_base = external {}

    @editable
    ActiveSlotLimit<native><public>:int = external {}

    @editable
    ActiveLimitBehaviour<native><public>:active_item_limit_behavior = external {}

@experimental
equippable_inventory_component<native><public> := class(inventory_component):
    CanEquipItem<native><public>(Item:item)<decides>:void

    EquipItem<native><public>(Item:item)<transacts><decides>:void

    UnequipItem<native><public>(Item:item)<transacts><decides>:void

    @editable
    EquipmentRestrictionList<native><public>:[]equippable_item_restriction_base = external {}

    @editable
    AutoEquipRequirementList<native><public>:[]item_requirement_base = external {}

    @editable
    SlotBindingList<native><epic_internal>:[]tuple(enhanced_input_action, int) = external {}

    @editable
    ShowSlotBindings<native><public>:logic = external {}

    var ActiveItemList<native><public>:[]item = external {}

@experimental
inventory_backpack_component<public> := class(inventory_component):
    var TotalSlots<override>:int = external {}

@experimental
equippable_inventory_slot_component<native><public> := class(equippable_inventory_component):
    var TotalSlots<override>:int = external {}

    EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

    AutoEquipRequirementList<override>:[]item_requirement_base = external {}

@experimental
equippable_inventory_hotbar_component<native><public> := class(equippable_inventory_component):
    var TotalSlots<override>:int = external {}

    EquipmentRestrictionList<override>:[]equippable_item_restriction_base = external {}

    AutoEquipRequirementList<override>:[]item_requirement_base = external {}

@experimental
add_inventory_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    Inventory<native><public>:inventory_component

@experimental
remove_inventory_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    Inventory<native><public>:inventory_component

@experimental
add_items_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    Inventory<native><public>:inventory_component

    AddedItems<native><public>:[]item

@experimental
remove_items_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    Inventory<native><public>:inventory_component

    RemovedItems<native><public>:[]item

@experimental
change_items_slot_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    Inventory<native><public>:inventory_component

    SlotChangedItems<native><public>:[]item_slot_change

@experimental
inventory_collection_component<native><public> := class<epic_internal>(component):
    IsAllowedOnClient<override>():logic = external {}

    AddInventory<native><public>(InventoryClass:subtype(inventory_component))<transacts><decides>:inventory_component

    RemoveInventory<native><public>(Inventory:inventory_component)<transacts><decides>:void

    InventoryAddedEvent<native><public>:listenable(add_inventory_result) = external {}

    InventoryRemovedEvent<native><public>:listenable(remove_inventory_result) = external {}

    ItemsAddedEvent<native><public>:listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>:listenable(remove_items_result) = external {}

    ItemsSlotChangedEvent<native><public>:listenable(change_items_slot_result) = external {}

    GetItemList<epic_internal>():[]item = external {}

    @editable
    InventorySetupData<native><protected>:?inventory_setup_data = external {}

    var<private> InventoryList<native><public>:[]inventory_component = external {}

@experimental
inventory_setup_data_result<native><public> := struct<epic_internal>:
    InventoryCollection<native><public>:inventory_collection_component

    AddedInventoryMap<native><public>:[]tuple(inventory_component, []item)

@experimental
inventory_setup_data<native><public> := class<concrete>:
    ApplyTo<native><public>(Target:inventory_collection_component)<decides>:inventory_setup_data_result

    @editable
    InventorySetupDataName<native><public>:string = external {}

@experimental
item_state<native><public> := enum:
    NotInInventory
    InInventory
    Equipped

@experimental
item<native><public> := class(entity):


@experimental
item_component<native><public> := class<epic_internal>(component):
    OnItemStateChanged<native><public>(Item:item)<transacts><decides>:void

    ShouldBeUnique<native><public>()<decides>:void

@experimental
item_amount_change<native><public> := struct<epic_internal>:
    Item<native><public>:item

    NewAmount<native><public>:int

    PreviousAmount<native><public>:int

@experimental
item_slot_change<native><public> := struct<epic_internal>:
    Item<native><public>:item

    NewSlot<native><public>:int

    PreviousSlot<native><public>:int

@experimental
item_state_change<native><public> := struct<epic_internal>:
    Item<native><public>:item

    NewState<native><public>:item_state

    PreviousState<native><public>:item_state

@experimental
item_state_component<native><final><public> := class(item_component):
    IsAllowedOnClient<override>():logic = external {}

    ItemChangedAmountEvent<native><public>:listenable(item_amount_change) = external {}

    ItemChangedSlotEvent<native><public>:listenable(item_slot_change) = external {}

    ItemChangedStateEvent<native><public>:listenable(item_state_change) = external {}

    GetItemName<native><epic_internal>():string

    var<private> Amount<native><public>:int = external {}

    var<private> Slot<native><public>:int = external {}

    var<private> State<native><public>:item_state = external {}

item_type_tag<native><public> := class(tag):


item_type_wood_tag<native><public> := class(item_type_tag):


item_type_stone_tag<native><public> := class(item_type_tag):


item_type_metal_tag<native><public> := class(item_type_tag):


@experimental
item_type<native><public> := class<concrete><unique>:
    @editable
    ItemTypeName<native><public>:string = external {}

    @editable
    ItemTypeDescription<native><public>:string = external {}

@experimental
item_type_component<native><final><public> := class(item_component):
    GetItemTypeTags<native><epic_internal>():tag_container

    HasItemType<native_callable><public>(SearchItemType:item_type)<decides>:void = external {}

    @editable
    var<private> ItemTypeList<native><public>:[]item_type

@import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
@experimental
item_requirement_base<native><public> := class<unique><concrete>:


@experimental
item_requirement<native><public> := class(item_requirement_base):
    CanAcceptItem<native><public>(Item:item)<transacts><decides>:void

    @editable
    RequirementName<native><public>:string = external {}

    @editable
    RequirementDescription<native><public>:string = external {}

@experimental
item_rarity<native><public> := class<unique><concrete>:
    @editable
    RarityName<native><public>:string = external {}

    @editable
    RarityDescription<native><public>:string = external {}

    @editable
    RarityColor<native><public>:color = external {}

    @editable
    RarityTier<native><public>:float = external {}

@experimental
item_rarity_component<native><final><public> := class(item_component):
    @editable
    var<private> Rarity<native><public>:?item_rarity