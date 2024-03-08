using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Verse.org/Assets}
using {/Fortnite.com/Devices}
using {/Fortnite.com/Characters}
using {/Verse.org/Native}
@import_as("/Script/ItemizationVerse.UVerseInventory")
fort_inventory_base<native><epic_internal> := class<abstract>:


fort_inventory<native><public> := class(fort_inventory_base):
    GetOwningInventoryCollection<native><public>()<transacts><decides>:fort_inventory_collection

    GetItemList<native><public>()<transacts><decides>:[]fort_item

fort_equippable_inventory<native><public> := class<final>(fort_inventory):
    GetEquippedItemList<native><public>()<transacts><decides>:[]fort_item

@import_as("/Script/ItemizationVerse.UVerseInventoryCollectionWrapper")
fort_inventory_collection_base<native><epic_internal> := class<abstract>:


fort_inventory_collection<native><public> := class<final>(fort_inventory_collection_base):
    GetInventoryList<native><public>()<transacts>:[]fort_inventory

    GetEquippableInventoryList<native><public>()<transacts>:[]fort_equippable_inventory

    GetItemList<native><public>()<transacts>:[]fort_item

    GetEquippedItemList<native><public>()<transacts>:[]fort_item

    OnItemsAdded<public>():listenable([]fort_item) = external {}

    OnItemsRemoved<public>():listenable([]fort_item) = external {}

    OnItemSlotsChanged<public>():listenable([]fort_item) = external {}

    OnInventoryAdded<public>():listenable(fort_inventory) = external {}

    OnInventoryRemoved<public>():listenable(fort_inventory) = external {}

(InCharacter:fort_character).GetPlayerInventoryCollection<native><public>()<transacts><decides>:fort_inventory_collection

(InCreativeObject:creative_object).GetInventoryCollection<native><public>()<transacts><decides>:fort_inventory_collection

(InCreativeObject:creative_object).GetOrCreateInventoryCollection<native><public>()<transacts><decides>:fort_inventory_collection

item_state<native><public> := enum:
    NotInInventory
    InInventory
    Equipped

item_definition_base_asset<native><public> := class<epic_internal>(asset):


item_definition_asset<native><public> := class<final><epic_internal>(item_definition_base_asset):


item_variant_asset<native><public> := class<final><epic_internal>(item_definition_base_asset):


@import_as("/Script/ItemizationCoreRuntime.UItemComponentBase")
fort_item_component_base<native><epic_internal> := class<abstract>:


fort_item_component<native><public> := class<abstract>(fort_item_component_base):


OnItemStateUpdate<native_callable><epic_internal>(Item:fort_item, NewItemState:item_state):void = external {}

@import_as("/Script/ItemizationCoreRuntime.UItemComponentLocalStorage")
fort_item_component_local_storage<native><public> := class<abstract>:


@import_as("/Script/ItemizationCoreRuntime.UItemComponentSharedLocalStorage")
fort_item_component_shared_local_storage<native><public> := class<abstract>:


@import_as("/Script/ItemizationVerse.UVerseItem")
fort_item_base<native><epic_internal> := class<abstract>:


fort_item<native><public> := class<final>(fort_item_base):
    GetOwningInventoryCollection<native><public>()<transacts><decides>:fort_inventory_collection

    GetOwningInventory<native><public>()<transacts><decides>:fort_inventory

    GetItemOwnerTransform<native><public>()<transacts><decides>:transform

    GetItemDefinition<public>()<decides>:item_definition_base_asset = external {}

    GetItemSlot<public>()<decides>:int = external {}

    GetItemState<public>()<decides>:item_state = external {}

    OnItemSlotChanged<native_callable><epic_internal>(NewItemSlot:int):void = external {}

    OnItemStateChanged<native_callable><epic_internal>(NewItemState:item_state):void = external {}

    ItemDefinition<native><epic_internal>:?item_definition_base_asset = external {}

    var<protected> ItemSlot<native><epic_internal>:int = external {}

    var<protected> ItemState<native><epic_internal>:item_state = external {}

@import_as("/Script/ItemizationCoreRuntime.UItemAttribute")
item_attribute_base<native><public> := class<abstract>:


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_Int")
item_attribute_int_base<native><epic_internal> := class<abstract>(item_attribute_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_Decimal")
item_attribute_float_base<native><epic_internal> := class<abstract>(item_attribute_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_Bool")
item_attribute_logic_base<native><epic_internal> := class<abstract>(item_attribute_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_String")
item_attribute_string_base<native><epic_internal> := class<abstract>(item_attribute_base):


item_attribute_int<native><public> := class<abstract>(item_attribute_int_base):
    DefaultValue<native><public>:int

item_attribute_float<native><public> := class<abstract>(item_attribute_float_base):
    DefaultValue<native><public>:float

item_attribute_logic<native><public> := class<abstract>(item_attribute_logic_base):
    DefaultValue<native><public>:logic

item_attribute_string<native><public> := class<abstract>(item_attribute_string_base):
    DefaultValue<native><public>:string

@import_as("/Script/ItemizationCoreRuntime.UItemAttributeValueBase")
item_attribute_value_base<native><public> := class<abstract>:
    GetAsInt<public>():int = external {}

    GetAsFloat<public>():float = external {}

    GetAsLogic<public>():logic = external {}

    GetAsString<public>():string = external {}

@import_as("/Script/ItemizationCoreRuntime.UItemAttributeValue_Int")
item_attribute_value_int_base<native><epic_internal> := class<abstract>(item_attribute_value_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttributeValue_Decimal")
item_attribute_value_float_base<native><epic_internal> := class<abstract>(item_attribute_value_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttributeValue_Bool")
item_attribute_value_logic_base<native><epic_internal> := class<abstract>(item_attribute_value_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttributeValue_String")
item_attribute_value_string_base<native><epic_internal> := class<abstract>(item_attribute_value_base):


item_attribute_value_int<native><public> := class<final>(item_attribute_value_int_base):
    Value<native><epic_internal>:int = external {}

    GetAsInt<override>():int = external {}

    GetAsFloat<override>():float = external {}

    GetAsLogic<override>():logic = external {}

    GetAsString<override>():string = external {}

item_attribute_value_float<native><public> := class<final>(item_attribute_value_float_base):
    Value<native><epic_internal>:float = external {}

    GetAsInt<override>():int = external {}

    GetAsFloat<override>():float = external {}

    GetAsLogic<override>():logic = external {}

    GetAsString<override>():string = external {}

item_attribute_value_logic<native><public> := class<final>(item_attribute_value_logic_base):
    Value<native><epic_internal>:logic = external {}

    GetAsInt<override>():int = external {}

    GetAsFloat<override>():float = external {}

    GetAsLogic<override>():logic = external {}

    GetAsString<override>():string = external {}

item_attribute_value_string<native><public> := class<final>(item_attribute_value_string_base):
    Value<native><epic_internal>:string = external {}

    GetAsString<override>():string = external {}

@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_StackSize")
item_attribute_stack_size<native><public> := class<final>(item_attribute_int_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_MaxStackSize")
item_attribute_max_stack_size<native><public> := class<final>(item_attribute_int_base):


@import_as("/Script/ItemizationCoreRuntime.UItemAttribute_WasLoadedFromSave")
item_attribute_loaded_from_save<native><public> := class<final>(item_attribute_logic_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_Core")
fort_item_component_core<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_DisplayUI")
fort_item_component_display_ui<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_Pickup")
fort_item_component_pickup<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_Stackable")
fort_item_component_stackable<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_Attach")
fort_item_component_attach<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponentStorage_Attach")
fort_item_component_local_storage_attach<native><public> := class<final>(fort_item_component_local_storage):


@import_as("/Script/ItemizationCoreRuntime.UItemComponent_Ability")
fort_item_component_ability<native><public> := class<final>(fort_item_component_base):


@import_as("/Script/ItemizationCoreRuntime.UItemComponentStorage_Ability")
fort_item_component_local_storage_ability<native><public> := class<final>(fort_item_component_local_storage):
