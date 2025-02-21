# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-34.00-CL-40085084
#################################################

AINavigation<public> := module {
  @experimental
  # Finds and returns the path between this entity's location and the target location.
  (InEntity: entity).FindPath<native><epic_internal>(Destination: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<suspends>: navigation_path

  @experimental
  # Finds and returns the path between this entity's location and the target location, filtering the path using supplied Query
  (InEntity: entity).FindPath<native><epic_internal>(
    Destination: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
    Query: navigation_query
  )<suspends>: navigation_path

  # Result of a navigation request
  navigation_find_path_result<native><epic_internal> := enum {
    # The destination cannot be associated to the query's navigation_layer.
    DestinationNonNavigable

    # There is no path that connect the start and end location using the query parameters.
    DestinationUnreachable

    # The request contains invalid or missing data.
    InvalidRequest

    # Search limit was reached before a path could be found. The path leads to the closest location to the destination that the search had time to visit.
    PartialReachedLimit

    # The destination is unreachable. The path leads to the reachable location closest to the destination.
    PartialUnreachable

    # A valid navigation path was found.
    PathFound

    # The origin location cannot be associated to the query's navigation_layer.
    StartLocationNonNavigable
  }

  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Native }
  using { /Verse.org/Simulation }
  # Navigation layers are various representations of the world that can be used by agents of different shapes and abilities
  navigation_layer<native><epic_internal> := class<abstract> {}

  # Use the most granular air field available
  navigation_layer_air_auto<native><epic_internal> := class<concrete><final>(navigation_layer) {}

  # Auto select a ground layer based on the user's collision component
  navigation_layer_ground_auto<native><epic_internal> := class<concrete><final>(navigation_layer) {}

  # Contains the resulting path and status from a find path query.
  navigation_path<native><epic_internal> := class<final><epic_internal> {
    # Returns the points that form the path. Fails if the path is invalid.
    GetPathPoints<native><public>()<transacts><decides>: []navigation_path_point

    # Whether this path completed successfully or encountered a problem.
    Result<native><public>: navigation_find_path_result
  }

  # Describes the location and characteristics of a point along a navigation path.
  navigation_path_point<native><epic_internal> := struct<concrete> {
    @editable
    # Position of the point in the world.
    Location<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}
  }

  @import_as("/Script/AINavigation.UCompositeNavigationQuery")
  # Defines the parameters of a navigation query such as finding a path or projecting a point.
  navigation_query<native><epic_internal> := class<concrete><final> {}

  @experimental
  # Component that describes the navigation preferences of this entity and offers helpers to find paths using those preferences.
  navigation_user_component<native><epic_internal> := class<final><final_super>(component) {
    @editable
    # Default navigation query parameters for this entity.
    DefaultNavigationQuery<native><public>: navigation_query

    OnAddedToScene<native><override>(): void

    OnRemovingFromScene<native><override>(): void
  }
}

Abilities<public> := module {
  using { /UnrealEngine.com/Temporary/SceneGraph }
  ability<native><public> := class {
    Activate<native><protected>()<suspends>: void

    GameplayAbilityPath<native><epic_internal>: ?string = external {}
  }

  @experimental
  ability_component<native><public> := class<final_super>(component) {
    ActivateAbility<native><epic_internal>(Ability: ability): void

    ActivateAbility<native><public>(ability_type: subtype(ability)): void

    GiveAbility<native><epic_internal>(Ability: ability)<transacts><decides>: void

    GiveAbility<native><public>(ability_type: subtype(ability))<transacts><decides>: void
  }

  @attribscope_data
  @customattribhandler
  ability_link<epic_internal> := class<computes>(attribute) {
    Name<epic_internal>: string = external {}
  }
}

using { /UnrealEngine.com/Temporary/SpatialMath }
# Module import path: /UnrealEngine.com/Assets
(/UnrealEngine.com:)Assets<public> := module {
  PlaySound<native><epic_internal>(Asset: sound, ?StartDelay: float = external {})<transacts>: cancelable

  PlaySoundAtLocation<native><epic_internal>(
    Asset: sound,
    Position: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
    ?Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {},
    ?StartDelay: float = external {}
  )<transacts>: cancelable

  SpawnParticleSystem<native><public>(
    Asset: particle_system,
    Position: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
    ?Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {},
    ?StartDelay: float = external {}
  )<transacts>: cancelable

  play_sound_subscription<native><epic_internal> := class(cancelable) {
    Cancel<native><override>()<transacts>: void
  }

  spawn_particle_system_subscription<native><epic_internal> := class(cancelable) {
    Cancel<native><override>()<transacts>: void
  }
}

using { /UnrealEngine.com/Temporary/SceneGraph }
using { /Verse.org/Assets }
# Module import path: /UnrealEngine.com/BasicShapes
BasicShapes<public> := module {
  @experimental
  cone<public> := class<final><public>(mesh_component) {
    Mesh<override>: mesh = external {}
  }

  @experimental
  cube<public> := class<final><public>(mesh_component) {
    Mesh<override>: mesh = external {}
  }

  @experimental
  cylinder<public> := class<final><public>(mesh_component) {
    Mesh<override>: mesh = external {}
  }

  @experimental
  plane<public> := class<final><public>(mesh_component) {
    Mesh<override>: mesh = external {}
  }

  @experimental
  sphere<public> := class<final><public>(mesh_component) {
    Mesh<override>: mesh = external {}
  }
}

using { /Verse.org/Simulation/Tags }
# Module import path: /UnrealEngine.com/ComponentTestSuite
ComponentTestSuite<public> := module {
  @experimental
  @hide_in_editor
  test_component_key_component_a<native><epic_internal> := class(test_component_key_component_base) {}

  @experimental
  @hide_in_editor
  test_component_key_component_b<native><epic_internal> := class(test_component_key_component_base) {}

  @experimental
  @hide_in_editor
  test_component_key_component_base<native><epic_internal> := class<final_super>(component) {}

  @hide_in_editor
  test_tag_animal<native><epic_internal> := class(tag) {}

  @hide_in_editor
  test_tag_animal_cat<native><epic_internal> := class(test_tag_animal) {}

  @hide_in_editor
  test_tag_animal_cat_cheddar<native><epic_internal> := class(test_tag_animal_cat) {}

  @hide_in_editor
  test_tag_animal_cat_jello<native><epic_internal> := class(test_tag_animal_cat) {}

  @hide_in_editor
  test_tag_animal_dog<native><epic_internal> := class(test_tag_animal) {}

  @hide_in_editor
  test_tag_animal_dog_kimchi<native><epic_internal> := class(test_tag_animal_dog) {}

  @hide_in_editor
  test_tag_animal_dog_pollo<native><epic_internal> := class(test_tag_animal_dog) {}

  @hide_in_editor
  test_tag_vehicle<native><epic_internal> := class(tag) {}

  @hide_in_editor
  test_tag_vehicle_bike<native><epic_internal> := class(test_tag_vehicle) {}

  @hide_in_editor
  test_tag_vehicle_bike_norton<native><epic_internal> := class(test_tag_vehicle_bike) {}

  @hide_in_editor
  test_tag_vehicle_car<native><epic_internal> := class(test_tag_vehicle) {}

  @hide_in_editor
  test_tag_vehicle_car_datsun<native><epic_internal> := class(test_tag_vehicle_car) {}
}

EditableSubclass<public> := module {
  using { /Verse.org/Assets }
  verse_editable_subclass<native><epic_internal> := class(asset) {}
}

using { /Verse.org/Simulation }
# Module import path: /UnrealEngine.com/EntityRegistryTestSuite
EntityRegistryTestSuite<public> := module {
  @hide_in_editor
  @experimental
  entity_registry_not_used_test_entity<native><epic_internal> := class(entity) {}

  @hide_in_editor
  @experimental
  entity_registry_other_test_component<native><epic_internal> := class<final_super>(component) {}

  @hide_in_editor
  @experimental
  entity_registry_test_component<native><epic_internal> := class<final_super>(component) {}

  @hide_in_editor
  @experimental
  entity_registry_test_entity<native><epic_internal> := class(entity) {}

  @hide_in_editor
  @experimental
  entity_registry_unused_test_component<native><epic_internal> := class<final_super>(component) {}
}

# Module import path: /UnrealEngine.com/EntityTestSuite
EntityTestSuite<public> := module {
  @hide_in_editor
  @experimental
  derived_test_component<native><epic_internal> := class(test_component) {}

  @hide_in_editor
  @experimental
  lambda_test_component<native><epic_internal> := class<final_super>(component) {
    OnAddedToSceneInternal<native><override>(): void

    OnBeginSimulationInternal<native><override>(): void

    OnEndSimulationInternal<native><override>(): void

    OnInitializedInternal<native><override>(): void

    OnRemovingFromSceneInternal<native><override>(): void

    OnSimulate<override>()<suspends>: void = external {}

    OnUninitializingInternal<native><override>(): void
  }

  @hide_in_editor
  @experimental
  lambda_test_component_2<native><epic_internal> := class<final_super>(component) {
    OnAddedToSceneInternal<native><override>(): void

    OnBeginSimulationInternal<native><override>(): void

    OnEndSimulationInternal<native><override>(): void

    OnInitializedInternal<native><override>(): void

    OnRemovingFromSceneInternal<native><override>(): void

    OnSimulate<override>()<suspends>: void = external {}

    OnUninitializingInternal<native><override>(): void
  }

  @hide_in_editor
  @experimental
  second_derived_test_component<native><epic_internal> := class(test_component) {}

  @hide_in_editor
  @experimental
  test_component<native><epic_internal> := class<final_super>(component) {}

  @hide_in_editor
  @experimental
  test_replication_component<native><epic_internal> := class<final_super>(component) {}

  @hide_in_editor
  @experimental
  test_replication_object<native><epic_internal> := class {}
}

# Module import path: /UnrealEngine.com/EpicGamesRestricted
EpicGamesRestricted<public> := module {
  # Module import path: /UnrealEngine.com/EpicGamesRestricted/Network
  Network<public> := module {
    replicated<constructor><epic_internal>(ReplicationArgs: string)<computes>: replicated_attribute = external {}

    @attribscope_data
    @customattribhandler
    replicated_attribute<epic_internal> := class<computes><internal>(attribute) {}
  }
}

Itemization<public> := module {
  @experimental
  (InAgent: agent).GetInventory<native><epic_internal>()<transacts><decides>: inventory_component

  @experimental
  DebugItemTypeAmmo<public> := class(item_type) {
    ItemTypeDescription<override>: string = external {}

    ItemTypeName<override>: string = external {}
  }

  @experimental
  DebugItemTypeBuildTools<public> := class(item_type) {
    ItemTypeDescription<override>: string = external {}

    ItemTypeName<override>: string = external {}
  }

  @experimental
  DebugItemTypeCollectables<public> := class(item_type) {
    ItemTypeDescription<override>: string = external {}

    ItemTypeName<override>: string = external {}
  }

  @experimental
  DebugItemTypeCurrencies<public> := class(item_type) {
    ItemTypeDescription<override>: string = external {}

    ItemTypeName<override>: string = external {}
  }

  @experimental
  DebugItemTypeResources<public> := class(item_type) {
    ItemTypeDescription<override>: string = external {}

    ItemTypeName<override>: string = external {}
  }

  @experimental
  active_item_limit_behavior<native><public> := enum<persistable> {
    Block

    UnequipLeastRecentlyUsed
  }

  @experimental
  add_inventory_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    ParentInventory<native><public>: inventory_component
  }

  @experimental
  add_items_result<native><public> := struct<epic_internal> {
    AddedItems<native><public>: []entity

    Inventory<native><public>: inventory_component
  }

  @experimental
  calculate_count_info<native><epic_internal> := struct {
    Instigators<native>: []agent = external {}

    Owner<native>: entity = external {}
  }

  @experimental
  change_items_slot_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    SlotChangedItems<native><public>: []item_slot_change
  }

  @experimental
  equippable_inventory_component<native><public> := class(inventory_component) {
    @editable
    AutoEquipRequirementList<native><public>: []item_requirement_base = external {}

    CanEquipItem<native><public>(Item: entity)<decides>: void

    EquipItem<native><public>(Item: entity)<transacts><decides>: void

    @editable
    EquipmentRestrictionList<native><public>: []equippable_item_restriction_base = external {}

    GetEquippedItems<final><native><public>(): []entity

    @editable
    ShowSlotBindings<native><public>: logic = external {}

    @editable
    SlotBindingList<native><epic_internal>: []tuple(input_action(type), int) = external {}

    UnequipItem<native><public>(Item: entity)<transacts><decides>: void
  }

  @experimental
  equippable_inventory_hotbar_component<native><public> := class(equippable_inventory_component) {
    AutoEquipRequirementList<override>: []item_requirement_base = external {}

    EquipmentRestrictionList<override>: []equippable_item_restriction_base = external {}

    var TotalSlots<override>: int = external {}
  }

  @experimental
  equippable_inventory_slot_component<native><public> := class(equippable_inventory_component) {
    AutoEquipRequirementList<override>: []item_requirement_base = external {}

    EquipmentRestrictionList<override>: []equippable_item_restriction_base = external {}

    var TotalSlots<override>: int = external {}
  }

  @experimental
  equippable_item_restriction<native><public> := class(equippable_item_restriction_base) {
    @editable
    ActiveLimitBehaviour<native><public>: active_item_limit_behavior = external {}

    @editable
    ActiveSlotLimit<native><public>: int = external {}

    AppliesTo<native><public>(Item: entity)<transacts><decides>: void

    GetActiveLimitBehaviour<native><public>(Item: entity)<transacts><decides>: active_item_limit_behavior

    GetActiveSlotLimit<native><public>(Item: entity)<transacts><decides>: int

    @editable
    ItemRequirement<native><public>: ?item_requirement_base = external {}
  }

  @import_as("/Script/ItemizationCoreRuntime.UEquippableItemRestrictionBase")
  @experimental
  equippable_item_restriction_base<native><public> := class<unique><concrete> {}

  @experimental
  inventory_backpack_component<public> := class(inventory_component) {
    var TotalSlots<override>: int = external {}
  }

  @experimental
  inventory_component<native><public> := class<final_super>(component) {
    AddItems<native><final><public>(Item: []entity)<transacts><decides>: add_items_result

    CanAddItem<native><public>(Item: entity)<decides>: void

    CanRemoveItem<native><public>(Item: entity)<decides>: void

    @available { MinUploadedAtFNVersion := 2930 }
    FindItems<native><final><public>()<computes><reads>: generator(entity)

    GetItems<native><final><public>()<computes><reads>: []entity

    InventoryAddedEvent<native><public>: listenable(add_inventory_result) = external {}

    InventoryPropertyChangedEvent<native><public>: listenable(inventory_property_change_result) = external {}

    InventoryRemovedEvent<native><public>: listenable(remove_inventory_result) = external {}

    @editable
    ItemRequirement<native><public>: ?item_requirement_base = external {}

    ItemsAddedEvent<native><public>: listenable(add_items_result) = external {}

    ItemsRemovedEvent<native><public>: listenable(remove_items_result) = external {}

    ItemsSlotChangedEvent<native><public>: listenable(change_items_slot_result) = external {}

    OnInitializedInternal<native><override>(): void

    OnUninitializingInternal<native><override>(): void

    RemoveItems<native><final><public>(Item: []entity)<transacts><decides>: remove_items_result

    @editable
    VerseGameplayTags<native><epic_internal>: tag_container = external {}

    @editable
    @replicated("")
    var<private> EnableItemStacking<native><public>: logic = external {}

    @editable
    @replicated("")
    var<private> InventoryDescription<native><public>: message

    @editable
    @replicated("")
    var<private> InventoryDisplayName<native><public>: message

    @replicated("")
    var<private> InventoryMaxStackSizeOverride<native><public>: int = external {}

    @editable
    @replicated("")
    var<private> InventoryName<native><public>: string = external {}

    @replicated("")
    var<private> InventoryType<native><public>: inventory_creation_type = external {}

    @editable
    @replicated("")
    var<private> PickupPriority<native><public>: int = external {}

    @editable
    @replicated("")
    var<private> TotalSlots<native><protected>: int = external {}
  }

  using { /UnrealEngine.com/Abilities }
  using { /UnrealEngine.com/EpicGamesRestricted/Network }
  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /Verse.org/Assets }
  using { /Verse.org/Colors }
  using { /Verse.org/Native }
  using { /Verse.org/Simulation }
  using { /Verse.org/Simulation/Tags }
  @experimental
  inventory_creation_type<native><public> := enum<persistable> {
    Runtime

    SetupData
  }

  @experimental
  inventory_debug<native><epic_internal> := class {
    AddTestItem<native_callable><public>(InInventory: inventory_component): void = external {}

    AddTestStackableItem<native_callable><public>(InInventory: inventory_component): void = external {}

    RemoveAllItems<native_callable><public>(InInventory: inventory_component): void = external {}
  }

  @experimental
  inventory_property_change_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    ParentInventory<native><public>: inventory_component
  }

  @experimental
  inventory_setup_data<native><public> := class<concrete> {
    ApplyTo<native><public>(Target: inventory_component)<decides>: inventory_setup_data_result

    @editable
    InventorySetupDataName<native><public>: string = external {}
  }

  @experimental
  inventory_setup_data_result<native><public> := struct<epic_internal> {
    AddedInventoryMap<native><public>: []tuple(inventory_component, []entity)

    Inventory<native><public>: inventory_component
  }

  @experimental
  item_ability_binding<native><final><epic_internal> := class<concrete> {
    @editable
    var<private> Ability<native><public>: ?ability = external {}

    @editable
    var<private> ActiveState<native><public>: item_state = external {}

    @editable
    var<private> Cooldowns<native><public>: []item_ability_cooldown = external {}

    @editable
    var<private> Costs<native><public>: []item_ability_cost = external {}

    @editable
    var<private> InputAction<native><public>: ?input_action(type) = external {}
  }

  @experimental
  item_ability_component<native><final><epic_internal> := class<final_super>(component) {
    @editable
    var<private> ItemAbilities<native><public>: []item_ability_binding
  }

  @experimental
  @import_as("/Script/ItemizationCoreRuntime.UItemAbilityCooldown")
  item_ability_cooldown<native><epic_internal> := class<unique><abstract> {}

  @experimental
  item_ability_cooldown_time<native><epic_internal> := class(item_ability_cooldown) {}

  @experimental
  item_ability_cooldown_velocity_based<native><epic_internal> := class(item_ability_cooldown) {}

  @experimental
  @import_as("/Script/ItemizationCoreRuntime.UItemAbilityCost")
  item_ability_cost<native><epic_internal> := class<unique><abstract> {}

  @experimental
  item_ability_cost_item<native><epic_internal> := class(item_ability_cost) {}

  @experimental
  item_amount_change<native><public> := struct<epic_internal> {
    Item<native><public>: entity

    NewAmount<native><public>: int

    PreviousAmount<native><public>: int
  }

  @experimental
  item_attach_component<native><final><epic_internal> := class<final_super>(component) {
    @editable
    Attachments<native><public>: []item_attachment_definition = external {}
  }

  @experimental
  item_attachment_definition<native><epic_internal> := class<unique><concrete> {
    @editable
    var AttachmentVisibility<native><public>: item_state_filter = external {}
  }

  @experimental
  # Anything using this component should be considered an item. Required to interact with inventories.
  item_component<native><final><public> := class<final_super>(component) {
    GetParentInventory<native><public>()<converges><decides>: inventory_component

    ItemChangedAmountEvent<native><public>: listenable(item_amount_change) = external {}

    ItemChangedSlotEvent<native><public>: listenable(item_slot_change) = external {}

    ItemChangedStateEvent<native><public>: listenable(item_state_change) = external {}

    OnInitializedInternal<native><override>(): void

    OnItemStateChanged<native><public>()<transacts><decides>: void

    @replicated("")
    var<private> ItemDefinition<native><epic_internal>: ?item_definition_base = external {}

    var<private> State<native><public>: item_state = external {}
  }

  @experimental
  @import_as("/Script/ItemizationCoreRuntime.UItemDefinitionBase")
  item_definition_base<native><epic_internal> := class {}

  @experimental
  item_definition_details_component<native><epic_internal> := class(item_details_component) {
    GetItemDescription<native><override>(): message

    GetItemName<native><override>(): message

    GetItemShortDescription<native><override>(): message
  }

  @experimental
  item_details_component<native><epic_internal> := class<final_super>(component) {
    GetItemDescription<native><public>(): message

    GetItemName<native><public>(): message

    GetItemShortDescription<native><public>(): message

    @editable
    ItemDescription<native><localizes><public>: message = external {}

    @editable
    ItemName<native><localizes><public>: message = external {}

    @editable
    ItemShortDescription<native><localizes><public>: message = external {}
  }

  @experimental
  item_icon_component<native><final><epic_internal> := class<final_super>(component) {
    @editable
    var<private> Icon<native><public>: ?texture = external {}
  }

  @experimental
  item_mesh_attachment_definition<native><epic_internal> := class<concrete>(item_attachment_definition) {
    @editable
    EntityToAttach<native><public>: ?subtype(entity) = external {}

    @editable
    var AttachToSocketName<native><public>: string = external {}
  }

  @experimental
  @import_as("/Script/ItemizationCoreRuntime.UItemOwnerPoseAsset")
  item_owner_pose<native><epic_internal> := class<concrete><unique>(asset) {}

  @experimental
  item_owner_pose_component<native><final><epic_internal> := class<final_super>(component) {
    @editable
    OwnerPose<native><public>: ?item_owner_pose = external {}

    @editable
    var<private> ApplyPoseState<native><public>: item_state_filter = external {}

    @editable
    var<private> PosePriority<native><public>: float = external {}
  }

  @experimental
  item_rarity<native><public> := class<unique><concrete> {
    @editable
    RarityColor<native><public>: color = external {}

    @editable
    RarityDescription<native><public>: string = external {}

    @editable
    RarityName<native><public>: string = external {}

    @editable
    RarityTier<native><public>: float = external {}
  }

  @experimental
  item_rarity_component<native><final><public> := class<final_super>(component) {
    @editable
    var<private> Rarity<native><public>: ?item_rarity
  }

  @experimental
  item_requirement<native><public> := class(item_requirement_base) {
    CanAcceptItem<native><public>(Item: entity)<transacts><decides>: void

    @editable
    ItemTypeRequirement<native><public>: ?item_type = external {}

    @editable
    RequirementDescription<native><public>: string = external {}

    @editable
    RequirementName<native><public>: string = external {}
  }

  @import_as("/Script/ItemizationCoreRuntime.UItemRequirementBase")
  @experimental
  item_requirement_base<native><public> := class<unique><concrete> {}

  @experimental
  item_slot_change<native><public> := struct<epic_internal> {
    Item<native><public>: entity

    NewSlot<native><public>: int

    PreviousSlot<native><public>: int
  }

  @experimental
  item_stack_size_component<native><final><epic_internal> := class<final_super>(component) {
    SetMaxStackSize<native><public>(NewMaxStackSize: int): void

    SetStackSize<native><public>(NewStackSize: int): void

    @editable
    var<private> MaxStackSize<native><public>: int = external {}

    @editable
    var<private> StackSize<native><public>: int = external {}
  }

  @experimental
  item_state<native><public> := enum {
    Equipped

    InInventory

    NotInInventory
  }

  @experimental
  item_state_change<native><public> := struct<epic_internal> {
    Item<native><public>: entity

    NewState<native><public>: item_state

    PreviousState<native><public>: item_state
  }

  @experimental
  item_state_filter<native><epic_internal> := enum {
    Equipped

    EquippedAndActive

    Owned
  }

  @experimental
  item_type<native><public> := class<concrete><unique> {
    @editable
    ItemTypeDescription<native><public>: string = external {}

    @editable
    ItemTypeName<native><public>: string = external {}

    @editable
    ParentType<native><public>: ?item_type = external {}
  }

  @experimental
  item_type_component<native><final><public> := class<final_super>(component) {
    GetItemTypeTags<native><epic_internal>(): tag_container

    @editable
    var<private> ItemType<native><public>: item_type
  }

  @experimental
  # Loot Data
  loot<native><epic_internal> := struct<concrete> {
    @editable
    Items<native>: []entity = external {}

    @editable
    LootPools<native>: []loot_pool = external {}

    @editable
    MaxSelections<native>: ?int = external {}

    @editable
    Weight<native>: loot_weight_calculator = external {}
  }

  @experimental
  # Spawns loot to the world or award it to an agent inventory.
  loot_component<native><epic_internal> := class<final_super>(component, enableable) {
    AwardLoot<native><public>(Target: entity, Instigators: []agent, DestroyOverflow: logic): []entity

    Disable<native><override>(): void

    Enable<native><override>(): void

    IsEnabled<native><override>()<transacts><decides>: void

    @editable
    Items<native><public>: []entity = external {}

    @editable
    LootPools<native><public>: []loot_pool = external {}

    SpawnPickups<native><public>(Instigators: []agent): []entity
  }

  @experimental
  # It can be overriden. It will return how many times the loot can be rolled
  loot_count_calculator<native><epic_internal> := class<concrete> {}

  @experimental
  # Fixed amount of rolls
  loot_count_calculator_fixed<native><epic_internal> := class<concrete>(loot_count_calculator) {}

  @experimental
  # Random range of rolls
  loot_count_calculator_range<native><epic_internal> := class<concrete>(loot_count_calculator) {}

  @experimental
  # Weighted amount of rolls
  loot_count_calculator_weighted<native><epic_internal> := class<concrete>(loot_count_calculator) {}

  @experimental
  loot_distribution<native><epic_internal> := struct<concrete> {
    @category("Values")
    @editable
    Count<native>: int = external {}

    @category("Values")
    @editable
    Weight<native>: float = external {}
  }

  @experimental
  # The Data for the loot component to work with
  loot_pool<native><epic_internal> := class<concrete> {}

  @experimental
  loot_weight_calculator<native><epic_internal> := class<concrete> {}

  @experimental
  loot_weight_calculator_fixed<epic_internal> := class<concrete>(loot_weight_calculator) {}

  @experimental
  loot_weight_calculator_info<native><epic_internal> := struct {
    Instigators<native>: []agent = external {}

    Items<native>: []entity = external {}

    LootPools<native>: []loot_pool = external {}

    Owner<native>: ?entity = external {}
  }

  @experimental
  remove_inventory_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    ParentInventory<native><public>: inventory_component
  }

  @experimental
  remove_items_result<native><public> := struct<epic_internal> {
    Inventory<native><public>: inventory_component

    RemovedItems<native><public>: []entity
  }
}

JSON<public> := module {
  # Parse a JSON string returning a value with its contents
  Parse<native><public>(JSONString: string)<transacts><decides>: value

  value<native><public> := class {
    # Retrieve an array value or fail if value is not a json array
    AsArray<native><public>()<transacts><decides>: []value

    # Retrieve a float value or fail if value is not a json number
    AsFloat<native><public>()<transacts><decides>: float

    # Retrieve an integer value or fail if value is not a json number
    AsInt<native><public>()<transacts><decides>: int

    # Retrieve an object value or fail if value is not null
    AsNull<native><public>()<transacts><decides>: void

    # Retrieve an object value or fail if value is not a json object
    AsObject<native><public>()<transacts><decides>: [string]value

    # Retrieve an object value or fail if value is not a string
    AsString<native><public>()<transacts><decides>: string
  }
}

# Module import path: /UnrealEngine.com/Playspace
Playspace<public> := module {
  @hide_in_editor
  @experimental
  playspace_association_component<native><epic_internal> := class<final_super><epic_internal>(
    component,
    simulation_entity_interop_handler
  ) {
    Initialize<native><override><native_callable>(IteropObject: simulation_interop_object): void
  }
}

Temporary<public> := module {
  using { /UnrealEngine.com/Temporary/Diagnostics }
  # Module import path: /UnrealEngine.com/Temporary/Curves
  Curves<public> := module {
    editable_curve<native><public> := class<final><concrete> {
      # Evaluates this float curve at the specified time and returns the result as a float
      Evaluate<native><public>(Time: float): float
    }
  }

  # Module import path: /UnrealEngine.com/Temporary/Diagnostics
  Diagnostics<public> := module {
    # debug draw class to draw debug shapes on screen.
    debug_draw<native><public> := class {
      # Channel will be used to clear specific debug draw.
      Channel<native><public>: subtype(debug_draw_channel) = external {}

      # Clears all debug draw from this debug_draw instance.
      Clear<native><public>()<transacts>: void

      # Clears all debug draw for the channel.
      ClearChannel<native><public>()<transacts>: void

      # Draws an arrow pointing from Start to End locations, and using the provided draw parameters.
      DrawArrow<native><public>(
        Start: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        End: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?ArrowSize: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a box at the named location, and using the provided draw parameters
      DrawBox<native><public>(
        Center: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
        ?Extent: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a capsule at the named location, and using the provided draw parameters.
      DrawCapsule<native><public>(
        Center: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
        ?Height: float = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cone at the named location, and using the provided draw parameters.
      DrawCone<native><public>(
        Origin: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        Direction: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?Height: float = external {},
        ?NumSides: int = external {},
        ?AngleWidthRadians: float = external {},
        ?AngleHeightRadians: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a cylinder at the named location, and using the provided draw parameters.
      DrawCylinder<native><public>(
        Start: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        End: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?NumSegments: int = external {},
        ?Radius: float = external {},
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a line from Start to End locations, and using the provided draw parameters.
      DrawLine<native><public>(
        Start: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        End: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a point at the named location, and using the provided draw parameters.
      DrawPoint<native><public>(
        Position: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?Color: color = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Draws a sphere at the named location, and using the provided draw parameters.
      DrawSphere<native><public>(
        Center: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
        ?Radius: float = external {},
        ?Color: color = external {},
        ?NumSegments: int = external {},
        ?Thickness: float = external {},
        ?DrawDurationPolicy: debug_draw_duration_policy = external {},
        ?Duration: float = external {}
      )<transacts>: void

      # Hide Debug Draw for the channel for all users.
      HideChannel<native><public>()<transacts>: void

      # Show Debug Draw for the channel for all users.
      ShowChannel<native><public>()<transacts>: void
    }

    # debug_draw_channel is the base class used to define debug draw channels.
    debug_draw_channel<native><public> := class<abstract> {}

    # Enumerated presets for policies describing a desired draw duration.
    debug_draw_duration_policy<native><public> := enum {
      FiniteDuration

      Persistent

      SingleFrame
    }

    # log class to send messages to the default log
    log<native><public> := class {
      # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
      Channel<native><public>: subtype(log_channel)

      # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
      DefaultLevel<native><public>: log_level = external {}

      # Print message using the given log level
      (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<epic_internal>(Message: message, ?Level: log_level = external {})<computes><reads>: void = external {}

      # Print diagnostic using the given log level
      (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message: diagnostic, ?Level: log_level = external {})<computes>: void = external {}

      # Print message using the given log level
      (/UnrealEngine.com/Temporary/Diagnostics/log:)Print<public>(Message: string, ?Level: log_level = external {})<computes>: void = external {}

      # Prints current script call stack using the give log level
      PrintCallStack<native><public>(?Level: log_level = external {})<computes>: void
    }

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract> {}

    # log levels available for various log commands
    log_level<native><public> := enum {
      Debug

      Error

      Normal

      Verbose

      Warning
    }
  }

  SceneGraph<public> := module {
    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that currently overlap this entity.
    (Entity: entity).FindOverlapHits<public>()<transacts>: generator(overlap_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that would overlap this entity if it were placed at GlobalTransform.
    (Entity: entity).FindOverlapHits<public>(GlobalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: generator(overlap_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that would overlap Volume if they were placed at GlobalTransform. NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
    (Entity: entity).FindOverlapHits<public>(
      GlobalTransform: (/Verse.org/SpatialMath:)transform,
      Volume: collision_volume
    )<transacts>: generator(overlap_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that would intersect this entity if it were swept from its location along the Displacement vector.
    (Entity: entity).FindSweepHits<public>(Displacement: (/Verse.org/SpatialMath:)vector3)<transacts>: generator(sweep_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that would intersect this entity if it were swept from GlobalTransform along the Displacement vector.
    (Entity: entity).FindSweepHits<public>(
      Displacement: (/Verse.org/SpatialMath:)vector3,
      StartGlobalTransform: (/Verse.org/SpatialMath:)transform
    )<transacts>: generator(sweep_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Find all objects in the scene that would intersect Volume if they were swept from GlobalTransform along the Displacement vector NOTE: This entity defines the context(scene) for the query but does not otherwise take part in the sweep.
    (Entity: entity).FindSweepHits<public>(
      Displacement: (/Verse.org/SpatialMath:)vector3,
      StartGlobalTransform: (/Verse.org/SpatialMath:)transform,
      Volume: collision_volume
    )<transacts>: generator(sweep_hit) = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all components attached to ancestor entities to `InEntity` of type `component_type`.
    # The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindAncestorComponents<native><public>(component_type: castable_subtype(component))<transacts>: generator(component_type)

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all ancestor entities to `InEntity` of type `entity_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindAncestorEntities<native><public>(entity_type: castable_subtype(entity))<transacts>: generator(entity_type)

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all ancestor entities to `InEntity` containing a component of type `component_type`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindAncestorEntitiesWithComponent<native><public>(component_type: castable_subtype(component))<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all ancestor entities to `InEntity` with `Tag` present in their `tag_component`.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindAncestorEntitiesWithTag<native><public>(Tag: tag)<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all components attached to descendant entities to and including `InEntity` of type `component_type`.
    # When querying from the simulation entity, the simulation entity itself is not included in the results.
    # The order of the returned components is unspecified and subject to change.
    (InEntity: entity).FindDescendantComponents<native><public>(component_type: castable_subtype(component))<transacts>: generator(component_type)

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all descendant entities including `InEntity` of type `entity_type`.
    # When querying from the simulation entity, the simulation entity itself is not included in the results.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindDescendantEntities<native><public>(entity_type: castable_subtype(entity))<transacts>: generator(entity_type)

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # Finds all descendant entities including `InEntity` containing a component of type `component_type`.
    # When querying from the simulation entity, the simulation entity itself is not included in the results.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindDescendantEntitiesWithComponent<native><public>(component_type: castable_subtype(component))<transacts>: generator(entity)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    # Finds all descendant entities including `InEntity` with `Tag` present in their `tag_component`.
    # When querying from the simulation entity, the simulation entity itself is not included in the results.
    # The order of the returned entities is unspecified and subject to change.
    (InEntity: entity).FindDescendantEntitiesWithTag<native><public>(Tag: tag)<transacts>: generator(entity)

    @experimental
    # Returns the global transform of this entity, in the case the entity does not have a transform_component it will return the transform of the first parent that has a transform
    (InEntity: entity).GetGlobalTransform<native><public>()<transacts>: (/Verse.org/SpatialMath:)transform

    @experimental
    # Returns the local transform of this entity, in the case the entity does not have a transform_component it will return identity
    (InEntity: entity).GetLocalTransform<native><public>()<transacts>: (/Verse.org/SpatialMath:)transform

    @experimental
    # Returns the origin of the entity in any, in the case the entity does not have a transform_component the method will fail
    (InEntity: entity).GetOrigin<native><public>()<transacts><decides>: origin

    @experimental
    # Returns the simulation entity parent for this entity.
    #   * The simulation entity is the rootmost entity in an experience.
    #   * Fails if this entity is not currently in the scene.
    (InEntity: entity).GetSimulationEntity<native><public>()<transacts><decides>: entity

    @experimental
    # Resets the origin of this entity, which will now default to its parent
    (InEntity: entity).ResetOrigin<native><public>()<transacts>: void

    @experimental
    # Sets the global transform of this entity, in the case the entity does not have a transform_component it will create one and set its global transform
    (InEntity: entity).SetGlobalTransform<native><public>(NewGlobalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: void

    @experimental
    # Sets the local transform of this entity, in the case the entity does not have a transform_component it will create one and set its local transform
    (InEntity: entity).SetLocalTransform<native><public>(NewLocalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: void

    @experimental
    # Sets the origin of this entity, in the case the entity does not have a transform_component it will create one and set its origin. This method fails if it recognized dependency recursion.
    (InEntity: entity).SetOrigin<native><public>(NewOrigin: origin)<transacts><decides>: void

    @experimental
    DefaultChannelToInteraction<epic_internal>(__dupe___unnamed_parameter_47: collision_channel)<computes>: collision_interaction = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    EmptyOverlapHitsGenerator<native><epic_internal>()<transacts>: generator(overlap_hit)

    @experimental
    @available { MinUploadedAtFNVersion := 2930 }
    EmptySweepHitsGenerator<native><epic_internal>()<transacts>: generator(sweep_hit)

    using { /Verse.org/Assets }
    using { /Verse.org/Simulation }
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/FNECon
    FNECon<public> := module {
      @experimental
      # Used to handle general conversation.
      conversation_component<native><epic_internal> := class<final_super><epic_internal>(component, enableable) {
        # Event that sends the participating agent when a conversation has ended.
        ConversationEndedEvent<native><public>: listenable(agent) = external {}

        # Event that sends the participating agent when a conversation has started.
        ConversationStartedEvent<native><public>: listenable(agent) = external {}

        # Disables this component.
        Disable<native><override>(): void

        # Enables this component.
        Enable<native><override>(): void

        # Ends all conversations associated with this component.
        EndAllConversations<native><public>(): void

        # Ends a conversation with the input agent.
        EndConversation<native><public>(Agent: agent): void

        # Gets the speaker's name.
        GetSpeakerName<native_callable><public>(): message = external {}

        # Succeeds if the component is enabled. Fails if it’s disabled.
        IsEnabled<native><override>()<transacts><decides>: void

        OnBeginSimulationInternal<native><override>(): void

        OnEndSimulationInternal<native><override>(): void

        OnInitializedInternal<native><override>(): void

        OnRemovingFromSceneInternal<native><override>(): void

        OnUninitializingInternal<native><override>(): void

        # Sets the name of the speaker that is displayed during conversations.
        SetSpeakerName<native><public>(InSpeakerName: message): void

        # Starts a conversation with the input agent.
        StartConversation<native><public>(Agent: agent): void

        @editable
        # The conversation database used when a conversation is started.
        var ConversationDatabase<native><public>: conversation_database = external {}

        @editable
        # Determines the range at which a player will be able to see the speech bubble (in meters). If set to less than 2m, the player will not see an indicator speech bubble.
        var IndicatorBubbleRange<native><public>: float = external {}

        @editable
        # The max number of participants allowed to interact with this component simultaneously.
        var MaximumParticipatingAgents<native><public>: int = external {}
      }

      # Data type used for conversations.
      conversation_database<native><epic_internal> := class<computes><concrete><epic_internal>(asset) {}
    }

    @experimental
    GetPhysicsSceneForEntity<native><epic_internal>(Entity: entity)<transacts><decides>: physics_scene_component

    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/KeyframedMovement
    # Animate Scene Graph entities with keyframes.
    KeyframedMovement<public> := module {
      @experimental
      # Cubic bezier easing function. See CubicBezierEasingFunctions for some basic easing values.
      cubic_bezier_easing_function<native><public> := class<concrete><computes><epic_internal>(easing_function) {
        Evaluate<native><override>(Input: float): float

        X0<native><public>: float = external {}

        X1<native><public>: float = external {}

        Y0<native><public>: float = external {}

        Y1<native><public>: float = external {}
      }

      @experimental
      # Cubic Bezier function sent to clients to reconstruct the animation curves.
      cubic_bezier_easing_function_native<native><epic_internal> := struct<concrete> {
        X0<native><public>: float = external {}

        X1<native><public>: float = external {}

        Y0<native><public>: float = external {}

        Y1<native><public>: float = external {}
      }

      @experimental
      # `Ease` animations start slowly, speed up, then end slowly. The speed of the animation is slightly slower at the end than the start.
      ease_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function) {
        X0<override>: float = external {}

        X1<override>: float = external {}

        Y0<override>: float = external {}

        Y1<override>: float = external {}
      }

      @experimental
      # `EaseIn` animations start slow, then speed up towards the end.
      ease_in_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function) {
        X0<override>: float = external {}

        X1<override>: float = external {}

        Y0<override>: float = external {}

        Y1<override>: float = external {}
      }

      @experimental
      # `EaseInOut` animations are similar to `Ease` but the start and end animation speed is symmetric.
      ease_in_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function) {
        X0<override>: float = external {}

        X1<override>: float = external {}

        Y0<override>: float = external {}

        Y1<override>: float = external {}
      }

      @experimental
      # `EaseOut` animations start fast, then slow down towards the end.
      ease_out_cubic_bezier_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function) {
        X0<override>: float = external {}

        X1<override>: float = external {}

        Y0<override>: float = external {}

        Y1<override>: float = external {}
      }

      @experimental
      # Base class for an animation easing function.
      easing_function<native><public> := class<abstract><computes><epic_internal> {
        Evaluate<native><public>(Input: float): float
      }

      @experimental
      # Contains all the information needed for the client to reconstruct the entire animation command.
      keyframed_movement_command_data<native><epic_internal> := struct<concrete> {
        BlendOutDuration<native>: float = external {}

        Command<native>: keyframed_movement_net_command = external {}

        CommandServerTime<native>: float = external {}

        HaltTransform<native>: (/Verse.org/SpatialMath:)transform = external {}

        Keyframes<native>: []keyframed_movement_delta_native = external {}

        PlaybackMode<native>: keyframed_movement_playback_mode_native = external {}

        ServerStartTimeForBlendOut<native>: ?float = external {}

        StartTimeForPlay<native>: float = external {}
      }

      @experimental
      # Provides teleportation and simple keyframe-based animation for an entity. Animations play back in the Pre-Physics tick phase. When animating an entity with a parent_constraint, animation will be relative to the parent entity.
      keyframed_movement_component<native><public> := class<final><final_super>(component) {
        @experimental
        GetDuration<native><public>()<computes><decides><reads>: float

        @experimental
        # Get the event that fires when the animations ends, failing if the animation is of infinite duration
        GetOnFinishedEvent<public>()<computes><decides><reads>: listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation is Paused.
        GetOnPausedEvent<public>(): listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation begins or resumes Playing.
        GetOnPlayedEvent<public>(): listenable(tuple()) = external {}

        @experimental
        # Get the event that fires when the animation is Stopped.
        GetOnStoppedEvent<public>(): listenable(tuple()) = external {}

        @experimental
        # Is there a valid set of playable keyframes?
        HasValidAnimation<native><public>()<computes><decides><reads>: void

        @experimental
        # Is the animation paused?
        IsPaused<native><public>()<computes><decides><reads>: void

        @experimental
        # Is the animation currently playing?
        IsPlaying<native><public>()<computes><decides><reads>: void

        @experimental
        # Signaled when any keyframe is reached. (Keyframe:int, IsReversed:logic).
        KeyframeReachedEvent<native><public>: listenable(tuple(int, logic)) = external {}

        @experimental
        # Signaled when the entire animation is complete. This will only fire for `OneShot` animations.
        MovementCompleteEvent<native><public>: listenable(tuple()) = external {}

        OnEndSimulationInternal<native><override>(): void

        OnInitializedInternal<native><override>(): void

        OnRep__PendingCommand<native><epic_internal>(): void

        @experimental
        # Pause movement. Subsequently calling Play() will resume from the point in the animation when it was paused.
        Pause<native><public>(): void

        @experimental
        # Begin or resume playback.
        Play<native><public>(): void

        @experimental
        # Stop any ongoing animation, sets the animation path and rebases it relative to the actor's current transform. Does not start playing until you call Play().
        SetKeyframes<native><public>(
          RelativeKeyframes: []keyframed_movement_delta,
          PlaybackMode: keyframed_movement_playback_mode
        ): void

        @experimental
        # Stop and reset transform to the initial state. Subsequently calling Play() will begin the animation anew.
        Stop<native><public>(?BlendOutTime: float = external {}): void

        @replicated("RepNotify")
        var _PendingCommand<native><epic_internal>: keyframed_movement_command_data = external {}
      }

      @experimental
      # Represents a change in pose and scale over a duration.
      keyframed_movement_delta<native><public> := class<final><concrete> {
        @editable_number(float) { MinValue := option { 0.000000 } }
        # Duration of this keyframe in seconds.
        Duration<native><public>: float = external {}

        @editable
        # Easing function to use for playback.
        Easing<native><public>: easing_function = external {}

        @editable
        # Represents a change in the transform relative to the previous keyframe or initial animation position.
        Transform<native><public>: (/Verse.org/SpatialMath:)transform = external {}
      }

      @experimental
      # Keyframe delta sent to clients to reconstruct the animation frames.
      keyframed_movement_delta_native<native><epic_internal> := struct<concrete> {
        Duration<native><public>: float = external {}

        Easing<native><public>: cubic_bezier_easing_function_native = external {}

        Transform<native><public>: (/Verse.org/SpatialMath:)transform = external {}
      }

      @experimental
      # Play Command sent to clients to reconstruct the playback command
      keyframed_movement_net_command<native><epic_internal> := enum {
        HaltAt

        PlayFrom
      }

      @experimental
      # Controls how the animation plays back.
      keyframed_movement_playback_mode<native><public> := class<abstract><computes><epic_internal> {}

      # Control how the animation plays back.
      keyframed_movement_playback_mode_native<native><epic_internal> := enum {
        Loop

        OneShot

        PingPong
      }

      @experimental
      # `Linear` animations move at a constant speed.
      linear_easing_function<native><public> := class<final><concrete><computes>(cubic_bezier_easing_function) {
        X0<override>: float = external {}

        X1<override>: float = external {}

        Y0<override>: float = external {}

        Y1<override>: float = external {}
      }

      @experimental
      # Play once and repeat indefinitely.
      loop_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode) {}

      @experimental
      # Play once and stop.
      oneshot_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode) {}

      @experimental
      # Play continuously reversing direction at each end.
      pingpong_keyframed_movement_playback_mode<native><public> := class<final><concrete><computes>(keyframed_movement_playback_mode) {}
    }

    @experimental
    # Create a collision_profile. See the collision_profiles module.
    MakeCollisionProfile<native><public>(
      channel_type: subtype(collision_channel),
      ChannelToInteraction: collision_channel_to_interaction
    )<converges>: collision_profile

    using { /Verse.org/Native }
    using { /Verse.org/Simulation/Tags }
    using { /Verse.org/SpatialMath }
    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/VerseCamera
    VerseCamera<public> := module {
      @experimental
      (CameraMode: camera_mode).GetControlRotation<native><epic_internal>(UpdateParameters: camera_update_parameters)<transacts><decides>: (/Verse.org/SpatialMath:)rotation

      @experimental
      (CameraMode: camera_mode).GetViewTargetTransform<native><epic_internal>(UpdateParameters: camera_update_parameters)<transacts><decides>: (/Verse.org/SpatialMath:)transform

      @experimental
      # Represents the physical body, lens of the camera and other cinematographic qualities, such as sensor size, aspect ratio lock/constraint, focal length, focus distance, post-process settings, etc.
      camera_component<native><epic_internal> := class(basic_camera_component) {}

      @experimental
      # Component that owns higher level camera behavior.
      # Responsible for selecting the best camera mode every update.
      # Owns a default EvaluationContext, which is responsible for setting the default camera transform, before camera logic is applied
      camera_director_component<native><epic_internal> := class<final_super>(camera_component) {
        @experimental
        # Add a camera component to the list for consideration
        AddCameraMode<native><public>(CameraMode: camera_mode): void

        @experimental
        # Determine which camera mode should be active
        DetermineActiveCameraMode<native_callable><public>()<transacts><decides>: camera_mode = external {}

        # Get camera parameters for a specific player
        GetCameraParametersForPlayer<native><epic_internal>(Player: player)<transacts><decides>: []parameterized_property_interface

        @experimental
        # Remove a camera component from the list for consideration
        RemoveCameraMode<native><public>(CameraMode: camera_mode): void

        @replicated("")
        @experimental
        # Parameters that can be used as input to all camera modes being run by this camera behavior component
        var<private> CameraParameters<native><epic_internal>: []parameterized_property_interface = external {}

        @replicated("")
        @editable
        var<protected> CameraModes<native><public>: []camera_mode = external {}
      }

      @experimental
      # A camera mode builds up a camera transform piece by piece by executing a camera rig asset
      camera_mode<native><epic_internal> := class<concrete> {
        @experimental
        GetCameraModeTag<native><public>()<transacts><decides>: verse_camera_mode_tag

        @experimental
        # Get blend to use when entering this camera mode to transition to the specified camera mode
        GetEnterBlend<native_callable><public>(SourceCameraMode: camera_mode)<transacts><decides>: camera_mode_blend = external {}

        @experimental
        GetEnterBlend_Internal<native_callable><epic_internal>(SourceCameraMode: camera_mode)<transacts><decides>: camera_mode_blend = external {}

        @experimental
        # Get blend to use when exiting this camera mode to transition to the destination camera mode
        GetExitBlend<native_callable><public>(DestinationCameraMode: camera_mode)<transacts><decides>: camera_mode_blend = external {}

        @experimental
        # Update camera mode
        Update<native_callable><public>(UpdateParameters: camera_update_parameters): void = external {}
      }

      @import_as("/Script/VerseCamera.UVerseCameraMode")
      @experimental
      camera_mode_base<native><epic_internal> := class<abstract> {}

      @experimental
      @hide_in_editor
      # Configurable blend between two camera modes
      camera_mode_blend<native><epic_internal> := class<concrete> {}

      @experimental
      # Linear blend between camera modes
      camera_mode_blend_linear<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      # Instantly snap to target mode
      camera_mode_blend_pop<native><epic_internal> := class<concrete>(camera_mode_blend) {}

      @experimental
      # Camera mode blend that uses the smootherstep function to blend between the two camera modes
      camera_mode_blend_smootherstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      # Camera mode blend that uses the smoothstep function to blend between the two camera modes
      camera_mode_blend_smoothstep<native><epic_internal> := class<concrete>(camera_mode_blend_with_duration) {}

      @experimental
      @hide_in_editor
      # Base class for camera mode blends that have a duration
      camera_mode_blend_with_duration<native><epic_internal> := class<concrete>(camera_mode_blend) {
        @editable
        # Sets the duration of the camera blend
        Duration<native><public>: float = external {}
      }

      @experimental
      # A camera operation is a primitive operation that is used to build up a camera transform piece by piece
      camera_operation<native><epic_internal> := class<concrete><unique>(camera_operation_base) {
        @experimental
        # Called by the camera mode to build up the camera settings
        Update<native_callable><public>(UpdateParams: camera_update_parameters): void = external {}
      }

      @import_as("/Script/VerseCamera.UVerseCameraNode")
      @experimental
      camera_operation_base<native><epic_internal> := class<abstract> {}

      @experimental
      # Update params to a camera operation
      camera_update_parameters<native><epic_internal> := class<final> {
        @experimental
        # Field of view
        var CameraFieldOfViewDegrees<native><public>: ?float = external {}

        @experimental
        # Camera location from the initial evaluator execution, or previous operation if an operation modified it before this one
        var CameraLocation<native><public>: (/Verse.org/SpatialMath:)vector3 = external {}

        @experimental
        # Camera rotation from the initial evaluator execution,  or previous operation if an operation modified it before this one
        var CameraRotation<native><public>: (/Verse.org/SpatialMath:)rotation = external {}

        @experimental
        # Camera director component that this camera_mode is running in
        var<private> CameraDirectorComponent<native><public>: camera_director_component

        @experimental
        # Delta time since last update
        var<private> DeltaTime<native><public>: float = external {}

        # Player that the camera director is active for (if any)
        var<private> Player<native><public>: ?player = external {}
      }

      @experimental
      # A camera mode implemented using a native CameraRig asset
      native_camera_mode<native><epic_internal> := class<concrete>(camera_mode) {
        @editable
        @display_name("CameraRig")
        @experimental
        CameraRig<native><epic_internal>: camera_rig_asset = external {}
      }

      @experimental
      # Component used to associate a camera behavior component with a player
      player_camera_view<native><epic_internal> := class(player_camera_view_base) {}

      @import_as("/Script/VerseCamera.UVersePlayerCameraViewComponent")
      @experimental
      player_camera_view_base<native><epic_internal> := class<abstract> {}

      @experimental
      verse_camera_mode_tag<native><epic_internal> := class(tag) {}
    }

    @import_as("/Script/CoreUObject.UObject")
    actor<native><epic_internal> := class {}

    @experimental
    # class to provide alternative origin to the 'transform_component' as an actor. This class should never be public and is intended for internal use only.
    actor_origin<native><epic_internal> := class(origin) {
      @editable
      @replicated("RepNotify")
      Actor<native><epic_internal>: actor

      GetTransform<native><override>()<transacts>: (/Verse.org/SpatialMath:)transform
    }

    @import_as("/Script/Entity.UBaseEntity")
    @experimental
    base_entity<native><epic_internal> := class<abstract> {}

    using { /Verse.org/Colors }
    @hide_in_editor
    @experimental
    basic_camera_component<native><epic_internal> := class<final_super>(component) {
      OnAddedToSceneInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void
    }

    using { /UnrealEngine.com/EpicGamesRestricted/Network }
    @experimental
    # An interactable component with a composable feature set.
    basic_interactable_component<native><epic_internal> := class(interactable_component) {
      @experimental
      # Attempt to cancel an interaction. Fails if the supplied agent is not currently interacting with the component.
      Cancel<native><public>(Agent: agent)<transacts><decides>: void

      @editable
      @experimental
      # Cooldowns begin elapsing on successful interactions. A cooldown which applies for all attempts to interact on this component.
      Cooldown<native><public>: ?interactable_cooldown = external {}

      @editable
      @experimental
      # Cooldowns begin elapsing on successful interactions. A cooldown which applies for future attempts to interact on this component by the agent which succeeded.
      CooldownPerAgent<native><public>: ?interactable_cooldown_per_agent = external {}

      @experimental
      # Get the remaining cooldown of the interactable for the supplied agent. This returns the duration left in seconds of either the shared or per agent cooldown, whichever is greater. Returns the same value when called multiple times within a transaction.
      GetRemainingCooldownDurationAffectingAgent<native><public>(Agent: agent): float

      @editable
      @experimental
      # An interaction with a duration does not succeed until the duration has elapsed, and success is not guaranteed as it can be canceled while the duration is active.
      InteractableDuration<native><public>: ?interactable_duration = external {}

      OnInitializedInternal<native><override>(): void

      @experimental
      # Attempt to succeed at an interaction. Success will also happen automatically after InteractDuration has elapsed after starting an interaction. Fails if the supplied agent is not currently interacting with the component.
      Succeed<native><public>(Agent: agent)<transacts><decides>: void

      @editable
      @experimental
      # Success limits prevent new interactions once the component has been successfully interacted with a specified number of times.
      SuccessLimit<native><public>: ?interactable_success_limit = external {}

      @experimental
      # The agents which are currently interacting with this interactable.
      var<private> InteractingAgents<native><public>: []agent = external {}
    }

    @experimental
    # A `capsule_light_component` emits light in all directions into the scene from a capsule shaped source with a specified radius and length. A radius and length of 0 makes it a point light. You can use these
    # to simulate any kind of light sources that emit in all directions and need an elongated source shape, such as a long light bulb.
    capsule_light_component<native><public> := class<final>(light_component) {
      OnAddedToSceneInternal<native><override>(): void

      # The bounds of the light's visible influence. This clamping of the light's influence is not physically correct but very important for performance,
      # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
      # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
      var AttenuationRadius<public>: ?float = external {}

      # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
      var Intensity<public>: float = external {}

      # Length of the source capsule shape in centimeters along the local Z axis. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceLength<public>: float = external {}

      # Radius of the source capsule shape in centimeters around the local Z axis. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceRadius<public>: float = external {}
    }

    @experimental
    # An axis-aligned collision box.
    collision_box<native><public> := class(collision_element) {
      var Extents<public>: (/Verse.org/SpatialMath:)vector3
    }

    @experimental
    # A collision capsule aligned along the Z axis.
    collision_capsule<native><public> := class(collision_element) {
      # The length of the capsule's cylindrical section (distance between the two end cap centers)
      var Length<public>: float = external {}

      # The radius of the capsule
      var Radius<public>: float = external {}
    }

    @experimental
    # Every volume has a collision channel as part of its collision_profile. It is used to determine how two volumes interact. See collision_profile.
    collision_channel<native><public> := class<concrete><epic_internal> {}

    @experimental
    # An alias for the function type used to map a collision_channel to a collision_interaction used by  collision_profile.
    collision_channel_to_interaction<public> := type { _(: collision_channel)<computes>: collision_interaction }

    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/collision_channels
    # The set of built-in collision_channels. This is a closed set for now.
    collision_channels<public> := module {
      @experimental
      avatar<native><public> := class(collision_channel) {}

      @experimental
      camera<native><public> := class(collision_channel) {}

      @experimental
      dynamic<native><public> := class(collision_channel) {}

      @experimental
      physics<native><public> := class(collision_channel) {}

      @experimental
      stationary<native><public> := class(collision_channel) {}

      @experimental
      visibility<native><public> := class(collision_channel) {}
    }

    @experimental
    # Base class for collision_volumes that consist of a single volume with a single collision_profile and collision_material for the whole volume. This covers most volume types used in queries and physics, except compound types like a mesh. A query will always return an element rather than a general volume. For example when colliding with a mesh, the element will be a collision_triangle, which is a collision_element and has a single material, rather than a collision_triangle_mesh, which is not an element and has a material palette.
    collision_element<native><public> := class<abstract>(collision_volume) {
      @experimental
      # The collision_profile for this volume.
      var CollisionProfile<public>: collision_profile = external {}
    }

    @experimental
    # Specifies how a collision volume pair should interact. See collision_profile.
    collision_interaction<native><public> := enum {
      # The pair will be detected by Overlap and Sweep queries. The pair will collide in the physics simulation.
      Block

      # The pair will not be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
      Ignore

      # The pair will be detected by Overlap and Sweep queries. The pair will not collide in the physics simulation.
      Overlap
    }

    @experimental
    # A collision point.
    collision_point<native><public> := class<concrete>(collision_element) {}

    @experimental
    # A collision profile determines how a volume interacts with other volumes for Overlap queries, Sweep queries, and physics simulation. When two volumes are being tested to see how they interact, the algorithm looks like this:
    #    GetInteraction(A:collision_profile, B:collision_profile):collision_interaction =
    #        InteractionA = B.GetChannelInteraction(A.Channel)
    #        InteractionB = A.GetChannelInteraction(B.Channel)
    #        return Min(InteractionA, InteractionB)
    collision_profile<native><public> := class<concrete> {
      # The collision channel for the owning object.
      Channel<native><public>: collision_channel = external {}

      # How the owning object should interact with other objects.GetChannelInteraction is a function which maps a collision_channel to a collision_interaction. It can be implemented as an simple sequence of if statements. For example, to block all channels except camera:
      #     BlockAllIgnoreCamera(Channel:collision_channel)<computes>:collision_interaction =
      #         if (collision_channels.camera[Channel]):
      #             return collision_interaction.Ignore
      #         return collision_interaction.Block
      #     MyProfile<public>:collision_profile = MakeCollisionProfile(collision_channels.dynamic, BlockAllIgnoreCamera)
      GetChannelInteraction<native><public>: collision_channel_to_interaction = external {}
    }

    # Module import path: /UnrealEngine.com/Temporary/SceneGraph/collision_profiles
    # A set of useful collision profiles. New profiles can be created in Verse code
    collision_profiles<public> := module {
      @experimental
      # Dynamic collision channel, Block all channels
      DynamicBlockAll<public>: collision_profile = external {}

      @experimental
      # Dynamic collision channel, Ignore all channels
      DynamicIgnoreAll<public>: collision_profile = external {}

      @experimental
      # Dynamic collision channel, Overlap all channels
      DynamicOverlapAll<public>: collision_profile = external {}

      @experimental
      # Stationary collision channel, Block all channels
      StationaryBlockAll<public>: collision_profile = external {}

      @experimental
      # Stationary collision channel, Block all channels except visibility (used for e.g., invisible wall, glass)
      StationaryBlockVisible<public>: collision_profile = external {}

      @experimental
      # Stationary collision channel, Ignore all channels
      StationaryIgnoreAll<public>: collision_profile = external {}

      @experimental
      # Stationary collision channel, Overlap all channels
      StationaryOverlapAll<public>: collision_profile = external {}

      @experimental
      # Visibility collision channel, Overlap all channel (used for e.g., visibility testing)
      VisibilityOverlapAll<public>: collision_profile = external {}
    }

    @experimental
    # A collision sphere.
    collision_sphere<native><public> := class(collision_element) {
      # The radius of the sphere
      var Radius<public>: float = external {}
    }

    @experimental
    # Collision Volumes represent the collision shapes of meshes. They can be detected by Overlap and Sweep queries and generate collisions in the physics simulation.
    collision_volume<native><public> := class<abstract> {
      # Get the transform of this volume in the space of its owner (usually a component on an entity)
      GetLocalTransform<public>()<transacts>: (/Verse.org/SpatialMath:)transform = external {}

      # Set the transform of this volume in the space of its owner (usually a component on an entity)
      SetLocalTransform<public>(NewLocalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: void = external {}

      @experimental
      # Enable/disable collision on this volume.
      var Collideable<public>: logic = external {}

      @experimental
      # Enable/disable spatial queries against this volume.
      var Queryable<public>: logic = external {}
    }

    @experimental
    collision_volume_internal<native><epic_internal> := class<concrete><epic_internal>(collision_element) {}

    @experimental
    # Base class for authoring logic and data in the SceneGraph. Using components you
    # can author re-usable building blocks of logic and data which can then be added to
    # entities in the scene.
    #
    # Components are a very low level building block which can be used in many ways.
    # For example:
    #   * Exposing engine level concepts like mesh or sound
    #   * Adding gameplay capabilities like damage or interaction
    #   * Storing an inventory for a character in the game
    #
    # As components are generic there is no specific way that they must be used.
    # It is up to the needs of your experience if you use one big game component
    # or if you break up logic into many small components.
    #
    # Classes deriving from component must also specify `<final_super>` to be added
    # to entities. This ensures the class will always derive directly from `component`.
    # Further subclassing of the initial derived component is allowed and does not require
    # specifying `<final_super>` on the derived classes.
    #
    # Only one instance of a component from each subclass group can be added to an entity
    # at a time. For example, given this group of components, only one light_component can
    # exist on a single entity. To create multiple lights you should use multiple entities.
    #
    #   light_component             := class<final_super>(component){}
    #   capsule_light_component     := class<final>(light_component){}
    #   directional_light_component := class<final>(light_component){}
    #   spot_light_component        := class<final>(light_component){}
    #   sphere_light_component      := class<final>(light_component){}
    #   rect_light_component        := class<final>(light_component){}
    #
    # ==============================================================================
    # Component Lifetime
    #
    #   Components move through a series of lifetime functions as they are added
    #   to entities, added to the scene, and begin running in the simulation. Components
    #   should override these methods to perform setup and run their simulation.
    #
    #   As a component shuts down it will then move through shutdown version of these
    #   functions, giving users the opportunity to clean up any retained state on the
    #   component before it is disposed
    # .
    #   Lifetime Methods:
    #     OnInitialized
    #        OnAddedToScene
    #          OnBeginSimulation -> OnSimulate<suspends>
    #          OnEndSimulation
    #        OnRemovingFromScene
    #     OnUninitializing
    # ==============================================================================
    component<native><public> := class<abstract><unique><castable><final_super_base>(diagnosable) {
      @experimental
      @allow_self_reference
      @experimental_always_overridden
      # The parent entity of this component.
      #   * Components must have a parent entity pointer provided when being constructed.
      #   * Components cannot be moved between parents.
      Entity<native><public>: entity

      GetDiagnostic<override><native>()<computes><reads>: diagnostic

      @experimental
      # Succeeds if the component is currently in the scene.
      #   * After `OnAddedToScene` is called this call succeeds.
      #   * After `OnRemovingFromScene` is called this call fails.
      IsInScene<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently initialized with its parent entity.
      #   * After `OnInitialized` is called this call succeeds.
      #   * After `OnUninitializing` is called this call fails.
      IsInitialized<native><final><public>()<transacts><decides>: void

      @experimental
      # Succeeds if the component is currently simulating.
      #   * After `OnBeginSimulation` is called this call succeeds.
      #   * After `OnEndSimulation` is called this call fails.
      IsSimulating<native><final><public>()<transacts><decides>: void

      @experimental
      # Called when the component is added to the scene by parenting it under the simulation entity or another entity already in the scene.
      #   * Querying for components in the scene is valid after this phase completes.
      #   * `OnInitialized` is guaranteed to run before `OnAddedToScene`.
      OnAddedToScene<native><native_callable><protected>(): void

      OnAddedToSceneInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Called when the component begins simulating within the scene.
      #   * Use this to set up TickEvent callbacks or other setup that must be guaranteed to complete immediately.
      #   * `OnAddedToScene` is guaranteed to run before `OnBeginSimulation`.
      OnBeginSimulation<native><native_callable><protected>(): void

      OnBeginSimulationInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Called when the component ends simulation within the scene.
      #   * Simulation ends on a component when the experience resets, the parent entity is removed from the scene.
      #   * Cached TickEvents cancelables should be canceled in `OnEndSimulation`.
      #   * `OnSimulate` task will be canceled before `OnEndSimulation` is called.
      #   * `OnEndSimulation` is only called on components that have already had `OnBeginSimulation` called.
      OnEndSimulation<native><native_callable><protected>(): void

      OnEndSimulationInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Called when the component is added to an entity using `entity.AddEntities`.
      #   * Components can check for dependent sibling components at this stage through `entity.GetComponents`.
      #   * Components can add additional components at this stage using `entity.AddComponents`
      OnInitialized<native><native_callable><epic_internal>(): void

      OnInitializedInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Respond to an event being propagated through the scene graph. Returns if the event is consumed, in which case the event will not be passed to the next entity, depending on how the event is being sent through the hierarchy.
      OnReceive<native><native_callable><public>(SceneEvent: scene_event): logic

      @experimental
      # Called when the component is about to be removed from the scene.
      #   * Components are removed from a scene when the parent entity is removed from the scene.
      #   * `OnRemovingFromScene` is only called on components that have already had `OnAddedToScene` called.
      OnRemovingFromScene<native><native_callable><protected>(): void

      OnRemovingFromSceneInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Called when the component begins simulating within the scene.
      #   * Use this to add asynchronous/suspends update logic for a component.
      #   * `OnBeginSimulation` is guaranteed to run before `OnSimulate`.
      #   * `OnSimulate` will be cancelled before `OnEndSimulation`
      OnSimulate<native_callable><protected>()<suspends>: void = external {}

      @experimental
      # Called when the component is about to be removed from the parent entity.
      #   * `OnUninitializing` is only called on components that have already had `OnInitialized` called.
      OnUninitializing<native><native_callable><epic_internal>(): void

      OnUninitializingInternal<native><native_callable><epic_internal>(): void

      @experimental
      # Removes the component from the entity.
      #   * Removed components are removed from the scene and can only be added back to the same entity.
      #   * Flows through `OnEndSimulation`-> `OnRemovingFromScene`-> `OnUninitializing`.
      RemoveFromEntity<native><final><public>(): void

      @experimental
      # Set callbacks to `TickEvents.PrePhysics` and `TickEvents.PostPhysics` to receive per-frame updates before and after physics is updated on your object.
      var<private> TickEvents<protected>: tick_events = external {}
    }

    @experimental
    component_query_iterator_interface<native><epic_internal> := interface<epic_internal> {
      NextValue<native_callable><public>()<transacts><decides>: component
    }

    @experimental
    damageable_component<native><epic_internal> := class<final_super>(component) {
      @experimental
      Damage<native><public>(Amount: float): void

      @experimental
      DamagedEvent<native><final><public>: listenable(float) = external {}
    }

    @experimental
    # A `directional_light_component` simulates light that is being emitted from a source that is infinitely far away. This means that all shadows cast by this light will be parallel, making this the ideal choice for simulating sunlight.
    directional_light_component<native><public> := class<final>(light_component) {
      @editable_slider(float) { EpicOnly := true, MinValue := option { 0.000000 }, MaxValue := option { 1.000000 } }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Controls the size of the fade out region at the far extent of the dynamic shadow's influence
      CascadeDistanceFadeoutFraction<native><epic_internal>: float = external {}

      @editable_slider(float) { EpicOnly := true, MinValue := option { 1.000000 }, MaxValue := option { 4.000000 } }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Controls whether the cascades are distributed closer to the camera (larger exponent) or further from the camera (smaller exponent)
      CascadeDistributionExponent<native><epic_internal>: float = external {}

      @editable_slider(float) { EpicOnly := true, MinValue := option { 0.000000 }, MaxValue := option { 0.300000 } }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Proportion of the fade region between cascades
      CascadeTransitionFraction<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("directional_light_component|Epic Internal")
      @experimental
      # How far, in centimeters, cascaded shadow map dynamic shadows will cover, measured in units from the camera. A value of 0 disables the dynamic shadow
      DynamicShadowDistance<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Distance at which the far shadow cascade should end
      EnableLightShaftOcclusion<native><epic_internal>: logic = external {}

      @editable_slider(int) { EpicOnly := true, MinValue := option { 0 }, MaxValue := option { 4 } }
      @category("directional_light_component|Epic Internal")
      @experimental
      # The number of cascades between DynamicShadowDistance and FarShadowDistance that are covered by Far Shadow Cascades, or zero to disable far shadow cascades
      FarShadowCascadeCount<native><epic_internal>: int = external {}

      @editable { EpicOnly := true }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Distance, in centimeters, at which the far shadow cascade should end
      FarShadowDistance<native><epic_internal>: float = external {}

      @editable_slider(int) { EpicOnly := true, MinValue := option { 0 }, MaxValue := option { 4 } }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Number of cascades to split the view frustum into for the whole scene dynamic shadow
      NumDynamicShadowCascades<native><epic_internal>: int = external {}

      @editable { EpicOnly := true }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Everything closer to the camera than this distance, measured in centimeters, will occlude light shafts
      OcclusionDepthRange<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("directional_light_component|Epic Internal")
      @experimental
      # Controls how dark the occlusion masking is
      OcclusionMaskDarkness<native><epic_internal>: float = external {}

      OnAddedToSceneInternal<native><override>(): void

      # Intensity of the light hitting the surface. In Lux (Lumen per square meter).
      var Illuminance<public>: float = external {}

      # Angle subtended by light source in degrees (also known as angular diameter). Defaults to 0.5357 which is the angle for our sun.
      var SourceAngleDegrees<public>: float = external {}
    }

    @experimental
    # Entities are the base object in the SceneGraph.
    #   * Objects in experiences are constructed of one or more entities.
    #   * Entities are hierarchical. You can query your parent using `GetParent` and add child entities using `AddEntities`.
    #   * Behavior is added to entities through `component`s. You can add new components using `AddComponents`.
    #   * The structure and content of entities is dynamic and be changed at any time through your experience
    # .
    # ==============================================================================
    # Deriving from entity
    #
    #   In the SceneGraph system a class that derives from `entity` is also known as a prefab. Prefabs are useful when you
    #   want to spawn/re-use a collection of entities and components many times within your game. Primarily prefabs are
    #   authored through the editor, with their Verse classes generated as part of the build into the projects
    #   Assets.digest.verse file.
    #
    #   While you can create base prefabs for common game object types like a vehicle or character, we highly recommended
    #   that you do not add code directly to the entity class, and instead keep logic in components. Keeping logic and data in
    #   components allows you to restructure your prefabs throughout production of your experience, without needing to massively
    #   refactor your class structure.
    entity<native><public> := class<concrete><unique><transacts><castable>(base_entity, diagnosable) {
      @experimental
      # Adds the provided components to the entity.
      #   * If a component is not allowed to be added to this entity it is skipped.
      #   Note: When called during the Initialize, AddedToScene or BeginSimulation phase, it will make sure the added component has achieved the corresponding phase.
      #   * Components are added following these rules:
      #       1. All components are added to the entity child list.
      #       2. All components have `OnInitialized` called.
      #       3. All components have `OnAddedToScene` called (if this entity is in the scene).
      #       4. All components have `OnBeginSimulation` called (if this entity is simulating).
      AddComponents<native><final><public>(Components: []component): void

      @experimental
      # Adds the provided entities as children of this entity.
      #   * If child entity already has a parent, removes the entity from its current parent and adds it to the new one.
      #   * Added child entities will move through their lifetime methods until they match the state of the new parent.
      AddEntities<native><final><public>(NewChildEntities: []entity): void

      @experimental
      @available { MinUploadedAtFNVersion := 3200 }
      # Succeeds and returns the child component of type `component_type` if it exists and is accessible from the calling context.
      #   Note: When called during the Initialize, AddedToScene or BeginSimulation phase, it will make sure the returned component has achieved the corresponding phase.
      #   Fails if no component of `component_type` exists or can be accessed.
      GetComponent<native><final><public>(component_type: castable_subtype(component))<transacts><decides>: component_type

      @experimental
      # Returns the child components belonging to this entity which are accessible from the calling context.
      GetComponents<native><final><public>()<transacts>: []component

      GetDiagnostic<override><native>()<computes><reads>: diagnostic

      @experimental
      # Returns the child entities belonging to this entity which are accessible from the calling context.
      #   * This method only gets the direct entity children. To query multiple levels down the entity structure use
      #     the Find* query methods instead.
      GetEntities<native><final><public>()<transacts>: []entity

      @experimental
      # Returns the parent entity of this entity.
      #   * The parent entity controls the lifetime of its child entities and components. When an entity
      #     is removed from the scene, all its child entities and components will be removed as well.
      #   * Method fails if there is currently no parent entity.
      GetParent<native><final><public>()<transacts><decides>: entity

      @experimental
      # Removes this entity from its parent. This is used to remove entities from the scene.
      #   * Components on this entity and its children will run through `OnEndSimulation` -> `OnRemovingFromScene`.
      #   * Entity can be added back later by using `NewParent.AddEntities`.
      RemoveFromParent<native><final><public>(): void

      @experimental
      # Send a scene event to only this entity. Returns true if the event was consumed.
      SendDirect<final><native><public>(SceneEvent: scene_event): logic

      @experimental
      # Send a scene event to this entity and all of its descendants. OnReceive will be invoked for each entity. Consuming the event at any entity will halt propagation down that subtree. Entities are traversed in breadth-first order, i.e. each layer is evaluated before moving deeper. Returns true if the event was consumed.
      SendDown<final><native><public>(SceneEvent: scene_event): logic

      @experimental
      # Send a scene event to this entity and its ancestors. Events do not propagate beyond the Simulation Entity. OnReceive will be invoked for each entity. Consuming the event will halt propagation to the next ancestor. Returns true if the event was consumed.
      SendUp<final><native><public>(SceneEvent: scene_event): logic
    }

    @experimental
    @available { MinUploadedAtFNVersion := 3200 }
    # class to provide alternative origin to the 'transform_component' as an entity
    entity_origin<native><public> := class<epic_internal>(origin) {
      @editable
      @replicated("")
      Entity<native><public>: entity

      GetTransform<override>()<transacts>: (/Verse.org/SpatialMath:)transform = external {}
    }

    @experimental
    # Reference type to editor defined prefab. Only generated digest code should reference this type.
    entity_prefab<native><public> := class<computes><epic_internal>(asset) {}

    @experimental
    entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    entity_query_iterator_interface<native><epic_internal> := interface<epic_internal> {
      NextValue<native_callable><public>()<transacts><decides>: entity
    }

    @hide_in_editor
    @experimental
    entity_registry_component<native><epic_internal> := class<final_super><epic_internal>(component) {}

    @experimental
    # Used to subscribe a callback or await an event based callback '
    #
    # IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
    execution_event<native><public> := class<epic_internal>(listenable(tuple())) {
      # Suspends the current task until resumed by a matching call to `signalable.Signal`.
      Await<native><override>()<suspends>: tuple()

      @experimental
      # Subscribe a callback function to this event.
      Subscribe<native><override>(Callback: type { _(): void })<transacts>: cancelable
    }

    @experimental
    # Users to subscribe to, or await on, a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'
    #
    # IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventually clean up your subscription and your callback will stop being invoked.
    execution_listenable<native><public> := class<epic_internal>(listenable(float)) {
      # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
      Await<native><override>()<suspends>: float

      @experimental
      # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that has passed between the last update and the current update.
      Subscribe<native><override>(Callback: type { _(: float): void })<transacts>: cancelable
    }

    @experimental
    execution_subscription<native><epic_internal> := class(cancelable) {
      Cancel<native><override>()<transacts>: void

      RunAfter<native><epic_internal>(__dupe___unnamed_parameter_28: execution_subscription): void

      RunBefore<native><epic_internal>(__dupe___unnamed_parameter_29: execution_subscription): void
    }

    @experimental
    # A range with a minimum and maximum value. For a value to fall inside of this range, the min value must be less than or equal to the max value.
    float_range<native><public> := struct<concrete> {
      @editable
      Maximum<native><public>: float = external {}

      Minimum<native><public>: float = external {}
    }

    @experimental
    hit_result<native><epic_internal> := struct {
      @experimental
      HitLocation<native><public>: (/Verse.org/SpatialMath:)vector3

      @experimental
      HitNormal<native><public>: (/Verse.org/SpatialMath:)vector3

      @experimental
      OtherComponent<native><public>: ?component

      @experimental
      OtherEntity<native><public>: ?entity

      @experimental
      ThisComponent<native><public>: ?component

      @experimental
      ThisEntity<native><public>: ?entity
    }

    @experimental
    # Used to handle general interaction.
    interactable_component<native><public> := class<final_super>(component, enableable) {
      # Returns whether the specified agent can interact.
      CanInteract<native><native_callable><public>(Agent: agent)<computes><decides><reads>: void

      # Event fires when an interaction has ended before completing successfully. Sends the formerly interacting agent. interactable_component cannot be canceled, this event is provided for subclasses to fire where appropriate.
      CanceledEvent<native><public>: listenable(agent) = external {}

      # Disable interaction with the component. Disabled components do not provide interaction prompts.
      Disable<native><override>(): void

      # Enable interaction with the component.
      Enable<native><override>(): void

      InteractFinishedEvent<native><public>: listenable(agent) = external {}

      # Returns an appropriate message to display to players to communicate the current state of the interactable.
      InteractMessage<native><native_callable><public>(Agent: agent)<computes><decides><reads>: message

      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnBeginSimulationInternal<native><override>(): void

      OnEndSimulationInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      # Attempt to start an interaction. Fails if the agent does not pass the CanInteract function.
      Start<native><public>(Agent: agent)<transacts><decides>: void

      # Event fires when an a successful interaction starts. Sends the interacting agent. InteractDuration at or below 0 makes this event identical to InteractSucceededEvent.
      StartedEvent<native><public>: listenable(agent) = external {}

      # Event fires when an interaction has completed successfully. Sends the formerly interacting agent. InteractDuration at or below 0 makes this event identical to InteractStartedEvent.
      SucceededEvent<native><public>: listenable(agent) = external {}
    }

    @experimental
    # Used to set a cooldown when interacted.
    interactable_cooldown<native><epic_internal> := class<concrete> {
      @experimental
      # Event which fires when the shared cooldown expires.
      ExpiredEvent<native><public>: listenable(tuple()) = external {}

      @experimental
      # Get the remaining shared cooldown duration in seconds, affecting all agents.
      GetRemainingDuration<native><epic_internal>(__dupe___unnamed_parameter_73: accessor)<transacts>: float

      @experimental
      # Set the remaining shared cooldown duration in seconds, affecting all agents.
      SetRemainingDuration<native><epic_internal>(
        __dupe___unnamed_parameter_72: accessor,
        InRemainingDuration: float
      )<transacts>: void

      @experimental
      # Event which fires when the shared cooldown triggers.
      TriggeredEvent<native><public>: listenable(float) = external {}

      @editable
      @experimental
      # The number of seconds after a successful interaction, before being able to initiate a subsequent interaction for anyone.
      # This is only used if duration is greater than 0.0. Modifying this does not affect the RemainingDuration.
      # When a cooldown starts on the component all other interactions are canceled.
      var Duration<native><public>: float = external {}

      @experimental
      # The remaining cooldown, in seconds, before new interactions can be initiated on this component.
      var<public> RemainingDuration<public>: float = external {}
    }

    @experimental
    # Used to set a cooldown per agent when interacted.
    interactable_cooldown_per_agent<native><epic_internal> := class<concrete> {
      @experimental
      # Event which fires when the per agent cooldown expires. Sends the agent which was previously affected by the cooldown.
      ExpiredEvent<native><public>: listenable(tuple()) = external {}

      @experimental
      # Get the remaining shared cooldown duration in seconds, affecting all agents.
      GetRemainingDurationForAgent<native><epic_internal>(
        __dupe___unnamed_parameter_75: accessor,
        Agent: agent
      )<transacts>: float

      @experimental
      # Set the remaining shared cooldown duration in seconds, affecting all agents.
      SetRemainingDurationForAgent<native><epic_internal>(
        __dupe___unnamed_parameter_74: accessor,
        Agent: agent,
        InRemainingDuration: float
      )<transacts>: void

      @experimental
      # Event which fires when the per agent cooldown triggers. Sends the agent which was previously affected by the cooldown.
      TriggeredEvent<native><public>: listenable(float) = external {}

      @editable
      @experimental
      # The duration in seconds after a successful interaction, before the interacting agent can initiate a subsequent interaction.
      # This is only used if the duration is greater than 0.0. Modifying this does not affect any RemainingPerAgentCooldownDuration.
      # This property gives other agents time to interact, when there is a limited number of Simultaneous Interactors.
      var Duration<native><public>: float = external {}

      @experimental
      # The cooldown remaining, in seconds, before a particular agent is able to initiate an interaction on this component.
      var<private> RemainingDuration<native><public>: [agent]float = external {}
    }

    @experimental
    # Used to set an interaction duration.
    interactable_duration<native><epic_internal> := class<concrete> {
      @experimental
      # Interact duration getter.
      GetInteractDuration<native><epic_internal>(__dupe___unnamed_parameter_77: accessor)<transacts>: float

      @experimental
      # Returns an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.Returns the same value when called multiple times within a transaction.
      GetRemainingInteractDurationForAgent<final><native><public>(Agent: agent)<computes><decides><reads>: float

      @experimental
      # Interact duration setter.
      SetInteractDuration<native><epic_internal>(
        __dupe___unnamed_parameter_76: accessor,
        InRemainingDuration: float
      )<transacts>: void

      @experimental
      # Sets an agent’s remaining duration, in seconds, for interaction. Fails if the agent is not interacting with this component.
      SetRemainingInteractDurationForAgent<final><native><public>(Agent: agent, RemainingDuration: float)<transacts>: void

      @editable
      @experimental
      # The number of seconds an agent must spend interacting with the object to successfully complete an interaction.
      # 0.0 or less results in an immediate successful interaction.
      # If set during an interaction, the value given will be used for the next interaction and the remaining duration will be updated subtracting the new given value with the current time elapsed.
      # If the subtraction were zero or less it will immediately conclude.
      var InteractDuration<public>: float = external {}

      @editable
      @experimental
      # The max number of simultaneous interactors. A value of false is unlimited.  This value represents how many agents may have active interactions.
      # If this changes to a value less than the current number of active interactions, those interactions are not canceled but new interactions will not start.
      var MaxSimultaneousInteractors<native><public>: ?int = external {}

      @experimental
      @replicated("")
      @editable
      @display_name("Interact Duration")
      # Internal InteractDuration value.
      var _InteractDuration<native><epic_internal>: float = external {}
    }

    @experimental
    # Used to set a limit of times to interact.
    interactable_success_limit<native><epic_internal> := class<concrete> {
      @experimental
      # Resets the counter for the times this component has had a successful interaction.
      ClearSuccessfulInteractionCount<native><public>()<transacts>: void

      @experimental
      # Get the maximum number of successful interactions possible.
      GetMaxSuccessfulInteractions<native><epic_internal>(__dupe___unnamed_parameter_79: accessor)<transacts>: ?int

      @experimental
      # Update the maximum number of successful interactions possible, a value of false is unlimited.
      # If the current number of tracked interactions is greater than the value specified here, all current interactions will be canceled.
      SetMaxSuccessfulInteractions<native><epic_internal>(
        __dupe___unnamed_parameter_78: accessor,
        InMaxSuccessfulInteractions: ?int
      )<transacts>: void

      @experimental
      # The number of times the component can be successfully interacted with. A value of false is unlimited.
      # When SuccessfulInteractionCount reaches MaxSuccessfulInteractions all active interactions are canceled, and the component cannot be interacted with.
      var MaxSuccessfulInteractions<public>: ?int = external {}

      @experimental
      # The number of times this component has had a successful interaction.
      var SuccessfulInteractionCount<public>: int = external {}
    }

    @hide_in_editor
    @experimental
    level_entity<native><epic_internal> := class<concrete><unique><transacts>(entity) {}

    @experimental
    # Base class for light components in the SceneGraph.
    #
    # Dependencies:
    #   * `transform_component` on the entity positions the light.
    #
    # Examples of components implementing `light_component`:
    #   * `directional_light_component`
    #   * `capsule_light_component`
    #   * `sphere_light_component`
    #   * `rect_light_component`
    #   * `spot_light_component`
    light_component<native><public> := class<abstract><final_super><epic_internal>(component, enableable) {
      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Whether the light affects global illumination, when ray-traced global illumination is enabled
      AffectGlobalIllumination<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # After exposure is applied, scene color brightness larger than the max brightness will be rescaled down to the max brightness
      BloomMaxBrightness<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Scales the additive color
      BloomScale<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Scene color must be larger than this to create bloom in the light shafts
      BloomThreshold<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Multiplies against scene color to create the bloom color
      BloomTint<native><epic_internal>: color = external {}

      # Disables rendering of this light.
      Disable<native><override>(): void

      # Enables rendering of this light.
      Enable<native><override>(): void

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Whether to render light shaft bloom from this light
      EnableLightShaftBloom<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Whether to enable lighting on the default channel for all primitives and lights
      EnableLightingChannel0<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Whether to enable lighting on the first custom channel
      EnableLightingChannel1<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Whether to enable lighting on the second custom channel
      EnableLightingChannel2<native><epic_internal>: logic = external {}

      @editable_slider(float) { EpicOnly := true, MinValue := option { 0.000000 }, MaxValue := option { 6.000000 } }
      @category("light_component|Epic Internal")
      @experimental
      # Scales the indirect lighting contribution from this light
      IndirectLightingIntensity<native><epic_internal>: float = external {}

      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      @editable_slider(float) { EpicOnly := true, MinValue := option { 0.000000 }, MaxValue := option { 1.000000 } }
      @category("light_component|Epic Internal")
      @experimental
      # Brightness factor applied to the light when the light function is specified but disabled
      LightFunctionDisabledBrightness<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Distance, in centimeters, at which the light function should be completely faded to the configured disabled brightness
      LightFunctionFadeDistance<native><epic_internal>: float = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # The light function material to be applied to this light
      LightFunctionMaterial<native><epic_internal>: ?material = external {}

      @editable { EpicOnly := true }
      @category("light_component|Epic Internal")
      @experimental
      # Scales the light function projection. X and Y scale in the directions perpendicular to the light's direction, Z scales along the light direction.
      LightFunctionScale<native><epic_internal>: (/Verse.org/SpatialMath:)vector3 = external {}

      OnAddedToSceneInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      @editable_slider(float) { EpicOnly := true, MinValue := option { 0.250000 }, MaxValue := option { 4.000000 } }
      @category("light_component|Epic Internal")
      @experimental
      # Intensity of the volumetric scattering from this light
      VolumetricScatteringIntensity<native><epic_internal>: float = external {}

      # Whether the light should cast any shadows.
      var CastShadows<public>: logic = external {}

      # Set the filter color of the light. This acts as a colored filter in front of the light source. Note that this can change the light's effective intensity. In normalized range 0-1.
      var ColorFilter<public>: color = external {}

      # Multiplier on diffuse lighting. Any value besides 1.0 is not physical. 0.0 means no diffuse contribution from this light.
      var DiffuseScale<public>: float = external {}

      # Multiplier on specular highlights. Can be used to artistically remove highlights mimicking polarizing filters or photo touch up. Any value besides 1.0 is not physical. 0.0 means no specular contribution from this light.
      var SpecularScale<public>: float = external {}
    }

    @experimental
    @hide_in_editor
    mass_component<native><epic_internal> := class<final_super><epic_internal>(component) {
      OnAddedToSceneInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void
    }

    @experimental
    # Used to render a `mesh` at the location of this entity. A mesh is a set of polygons that can be used to represent shapes in the world such as:
    #   * foliage and terrain decorations
    #   * movers (for example, doors and lifts)
    #   * procedurally created buildings
    #
    # Dependencies:
    #   * `transform_component` on the entity positions the mesh.
    mesh_component<native><public> := class<final_super><epic_internal>(component, enableable, property_changed_interface) {
      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # Controls whether the mesh should influence indirect lighting
      AffectDynamicIndirectLighting<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # Controls whether the mesh should affect indirect lighting when hidden
      AffectIndirectLightingWhileHidden<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # If true, the mesh will cast shadows even if HiddenInGame is true
      CastHiddenShadow<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # Controls whether this mesh should cast a shadow or not
      CastShadow<native><epic_internal>: logic = external {}

      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # Whether this mesh should cast dynamic shadows as if it were a two sided material
      CastShadowAsTwoSided<native><epic_internal>: logic = external {}

      @experimental
      # Disables rendering of this mesh.
      Disable<native><override>(): void

      @experimental
      # Enables rendering of this mesh.
      Enable<native><override>(): void

      @experimental
      # Triggered at the beginning of each tick when another entity first overlaps this entity.
      EntityEnteredEvent<native><public>: listenable(entity) = external {}

      @experimental
      # Triggered at the beginning of each tick when another entity is no longer overlapping this entity
      EntityExitedEvent<native><public>: listenable(entity) = external {}

      @experimental
      # Succeeds if the component is enabled, fails if it's disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      @experimental
      @replicated("RepNotify")
      @editable
      # The `mesh` to be rendered by this `mesh_component`.
      Mesh<native><epic_internal>: mesh = external {}

      OnAddedToSceneInternal<native><override>(): void

      OnBeginSimulationInternal<native><override>(): void

      OnEndSimulationInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnPropertyChangedFromVerse<native><override>(PropertyName: string)<transacts>: void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      @experimental
      # Sets the `material` to be applied to the `mesh`.
      SetMaterial<native><epic_internal>(InMaterial: ?material): void

      @experimental
      # Sets the `mesh` to be rendered.
      SetMesh<native><epic_internal>(InMesh: mesh): void

      @editable { EpicOnly := true }
      @category("mesh_component|Epic Internal")
      @experimental
      # Controls the sort priority of this object if it is translucent
      TranslucencySortPriority<native><epic_internal>: int = external {}

      ___PropertyInterface_On_Collideable_Changed<epic_internal>(): void = external {}

      ___PropertyInterface_On_Queryable_Changed<epic_internal>(): void = external {}

      ___PropertyInterface_On_Visible_Changed<epic_internal>(): void = external {}

      @experimental
      # Enable/disable collision on this mesh. If enabled, meshes may collide in the physics simulation.
      var Collideable<public>: logic = external {}

      @experimental
      # Enable/disable spatial queries against this mesh. Disabling this field will also disable EntityEnteredEvent/EntityExitedEvent.
      var Queryable<public>: logic = external {}

      # Enable/disable visibility of this mesh.
      var Visible<public>: logic = external {}
    }

    @experimental
    metasound_trigger<native><epic_internal> := class<epic_internal> {
      SoundComponentTarget<native><epic_internal>: ?sound_component = external {}

      Trigger<native><epic_internal>(): void

      TriggerIdentifier<native><epic_internal>: string = external {}
    }

    @experimental
    null_component_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: component
    }

    @experimental
    null_entity_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    # Interface to provide alternative origin to an entity which is defaulted to its parent. See `transform_component`
    origin<native><public> := interface<epic_internal> {
      GetTransform<native_callable><public>()<transacts>: (/Verse.org/SpatialMath:)transform
    }

    @experimental
    # The results of an overlap query. See entity.FindOverlapHits(). We will get one overlap_hit for each intersection of any volume in SourceVolumes with any other volume.
    overlap_hit<native><public> := struct {
      # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceTransform is the transform of SourceVolume used for the overlap test. For single volume inputs like a sphere, the Source volume and transform are just the inputs to the overlap test, and the component is false.
      SourceComponent<native><public>: ?component

      # The source volume transform
      SourceGlobalTransform<native><public>: (/Verse.org/SpatialMath:)transform

      # The source volume (query input)
      SourceVolume<native><public>: collision_volume

      # The component that was hit by SourceVolume
      TargetComponent<native><public>: component

      # The volume that was hit by SourceVolume
      TargetVolume<native><public>: collision_element
    }

    @experimental
    # Used to spawn a `particle_system` at the location of this entity. The `particle_system` will simulate while the `particle_system_component` is in the scene.
    #
    # Dependencies:
    #   * `transform_component` on the entity positions the `particle_system`.
    particle_system_component<native><public> := class<final_super><epic_internal>(
      component,
      enableable,
      property_changed_interface
    ) {
      # Disables the simulation and rendering of this `particle_system`.
      Disable<override><native>(): void

      # Enables the simulation and rendering of this `particle_system`.
      Enable<override><native>(): void

      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<override><native>()<transacts><decides>: void

      OnAddedToSceneInternal<native><override>(): void

      OnBeginSimulationInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnPropertyChangedFromVerse<native><override>(PropertyName: string)<transacts>: void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      @editable
      ParticleSystem<native><epic_internal>: particle_system = external {}

      Play<native><public>(): void

      Stop<native><public>(): void

      @editable
      # Controls if the `particle_system_component` should play the simulation automatically when added to the scene, or when enabled from a disabled state.
      var<private> AutoPlay<native><public>: logic = external {}

      @editable
      @replicated("RepNotify")
      # Controls if the `particle_system_component` should start enabled.
      var<private> Enabled<native><public>: logic = external {}
    }

    @experimental
    physics_component<native><epic_internal> := class<final><final_super>(component, enableable) {
      @experimental
      # Disable this object.
      Disable<native><override>(): void

      @experimental
      # Enable this object.
      Enable<native><override>(): void

      @experimental
      # Event signaled when the component experiences a blocking hit
      HitEvent<native><public>: listenable(hit_result) = external {}

      @experimental
      # Succeeds if the component is enabled, fails if it’s disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToSceneInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void
    }

    @experimental
    physics_scene_component<native><epic_internal> := class<final><final_super><epic_internal>(component) {
      @available { MinUploadedAtFNVersion := 2930 }
      FindEntityOverlaps<native><public>(
        QueryEntity: entity,
        QueryTransform: (/Verse.org/SpatialMath:)transform
      )<transacts>: generator(overlap_hit)

      @available { MinUploadedAtFNVersion := 2930 }
      FindEntitySweepHits<native><public>(
        QueryEntity: entity,
        QueryTransform: (/Verse.org/SpatialMath:)transform,
        QueryTraceVector: (/Verse.org/SpatialMath:)vector3
      )<transacts>: generator(sweep_hit)

      @available { MinUploadedAtFNVersion := 2930 }
      FindShapeOverlaps<native><public>(
        QueryShape: collision_volume,
        QueryTransform: (/Verse.org/SpatialMath:)transform
      )<transacts>: generator(overlap_hit)

      @available { MinUploadedAtFNVersion := 2930 }
      FindShapeSweepHits<native><public>(
        QueryShape: collision_volume,
        QueryTransform: (/Verse.org/SpatialMath:)transform,
        QueryTraceVector: (/Verse.org/SpatialMath:)vector3
      )<transacts>: generator(sweep_hit)

      OnAddedToSceneInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void
    }

    @experimental
    # A `rect_light_component` emits light into the scene from a rectangular plane with a specified width and height. You can use these
    # to simulate any kind of light sources that have rectangular areas, such as televisions or monitor screens, overhead lighting
    # fixtures, or wall sconces.
    rect_light_component<native><public> := class<final>(light_component) {
      OnAddedToSceneInternal<native><override>(): void

      # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
      # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
      # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
      var AttenuationRadius<public>: ?float = external {}

      # The angle of the barn door in degrees attached to the light source rect. Clamped between 0.0 and 90.0 degrees.
      var BarnDoorAngleDegrees<public>: float = external {}

      # The length of the barn door attached to the light source rect, in centimeters.
      var BarnDoorLength<public>: float = external {}

      # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
      var Intensity<public>: float = external {}

      # The height of the light source rect, in centimeters. Note that light source's shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceHeight<public>: float = external {}

      # The width of the light source rect, in centimeters. Note that light source shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceWidth<public>: float = external {}
    }

    @experimental
    replication_component<native><epic_internal> := class<final_super>(component) {
      @editable
      # Internal only flag to make this entity always relevant for replication to clients
      AlwaysRelevant<native><epic_internal>: logic = external {}

      OnAddedToSceneInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void
    }

    @experimental
    rigid_body_component<native><epic_internal> := class<final><final_super><epic_internal>(component) {
      BeginOverlapEvent<native><public>: listenable(overlap_hit) = external {}

      EndOverlapEvent<native><public>: listenable(overlap_hit) = external {}

      EntityEnteredEvent<native><public>: listenable(entity) = external {}

      EntityExitedEvent<native><public>: listenable(entity) = external {}

      OnAddedToSceneInternal<native><override>(): void

      OnBeginSimulationInternal<native><override>(): void

      OnEndSimulationInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      @experimental
      # Enable/disable collision on this mesh. If enabled, meshes may collide in the physics simulation.
      var Collideable<public>: logic = external {}

      @experimental
      # Enable/Disable simulation of this body.
      var Dynmamic<public>: logic = external {}

      @experimental
      # Enable/disable spatial queries against this mesh. Disabling this field will also disable EntityEnteredEvent/EntityExitedEvent.
      var Queryable<public>: logic = external {}
    }

    @experimental
    # An event which can be sent through the scene graph.
    scene_event<native><public> := interface {}

    @hide_in_editor
    @experimental
    simulation_entity<native><epic_internal> := class<concrete><unique><transacts>(entity) {}

    simulation_entity_interop_handler<native><epic_internal> := interface<epic_internal> {
      Initialize<native_callable><epic_internal>(IteropObject: simulation_interop_object): void
    }

    @hide_in_editor
    @import_as("/Script/Entity.ASimulationEntity")
    simulation_interop_object<native><epic_internal> := class {}

    @experimental
    slow_component_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(component_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: component
    }

    @experimental
    slow_entity_array_copy_query_iterator<native><epic_internal> := class<epic_internal>(entity_query_iterator_interface) {
      NextValue<native><override>()<transacts><decides>: entity
    }

    @experimental
    # Used to attach entities to a socket on an actor.
    socket_origin<native><epic_internal> := class(actor_origin) {
      @editable
      @replicated("")
      var SocketName<native><public>: string
    }

    @experimental
    sound_component<native><public> := class<abstract><final_super><epic_internal>(
      component,
      property_changed_interface,
      enableable
    ) {
      # Disable the sound component.
      Disable<override><native>(): void

      # Enable the sound component.
      Enable<override><native>(): void

      # The path to the sound asset
      InternalMetaSoundAssetPath<native><epic_internal>: metasound = external {}

      # Succeeds if the sound component is enabled, fails if it is disabled.
      IsEnabled<override><native>()<transacts><decides>: void

      OnAddedToSceneInternal<native><override>(): void

      OnBeginSimulationInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnPropertyChangedFromVerse<native><override>(PropertyName: string)<transacts>: void

      OnRemovingFromSceneInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      # Play the sound asset
      Play<native><public>(): void

      # Stop the sound asset
      Stop<native><public>(): void

      @editable
      var<private> AutoPlay<native><public>: logic = external {}

      @editable
      @replicated("RepNotify")
      var<private> Enabled<native><public>: logic = external {}
    }

    @experimental
    # A `sphere_light_component` emits light in all directions into the scene from a spherical source shape with a specified radius. A radius of 0 makes it a point light. You can use these
    # to simulate any kind of light sources that emit in all directions, such as a light bulb.
    sphere_light_component<native><public> := class<final>(light_component) {
      @editable_slider(float) { EpicOnly := true, MinValue := option { 2.000000 }, MaxValue := option { 16.000000 } }
      @category("sphere_light_component|Epic Internal")
      @experimental
      # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
      LightFalloffExponent<native><epic_internal>: float = external {}

      OnAddedToSceneInternal<native><override>(): void

      @editable { EpicOnly := true }
      @category("sphere_light_component|Epic Internal")
      @experimental
      # Whether to use physically based inverse squared distance falloff
      UseInverseSquaredFalloff<native><epic_internal>: logic = external {}

      # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
      # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
      # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
      var AttenuationRadius<public>: ?float = external {}

      # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
      var Intensity<public>: float = external {}

      # Radius of the source shape, in centimeters. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceRadius<public>: float = external {}
    }

    @experimental
    # A `spot_light_component` emits light from a single point in a cone shape. The shape of the light is defined by two cones: the `InnerConeAngleDegrees`
    # and `OuterConeAngleDegrees`. Within the `InnerConeAngleDegrees` the light achieves full brightness. As you go from the extent of the inner radius to the
    # extents of the `OuterConeAngleDegrees` a falloff takes place, creating a penumbra, or softening around the `spot_light_component`'s disc of
    # illumination. The Radius of the light defines the length of the cones. More simply, this will work like a flash light or stage can light.
    spot_light_component<native><public> := class<final>(light_component) {
      @editable_slider(float) { EpicOnly := true, MinValue := option { 2.000000 }, MaxValue := option { 16.000000 } }
      @category("spot_light_component|Epic Internal")
      @experimental
      # Controls the radial falloff of the light when UseInverseSquaredFalloff is disabled
      LightFalloffExponent<native><epic_internal>: float = external {}

      OnAddedToSceneInternal<native><override>(): void

      @editable { EpicOnly := true }
      @category("spot_light_component|Epic Internal")
      @experimental
      # Whether to use physically based inverse squared distance falloff
      UseInverseSquaredFalloff<native><epic_internal>: logic = external {}

      # The bounds of the light's visible influence, in centimeters. This clamping of the light's influence is not physically correct but very important for performance,
      # larger lights cost more. The light falloff is based on Inverse Square law. Towards the tail end of the AttenuationRadius,
      # there is an additional smoothing factor to fade out the light contribution to 0 to avoid a hard cutoff.
      var AttenuationRadius<public>: ?float = external {}

      # The light's inner cone shaped angle in degrees. Clamped between 0.0 and 80.0.
      var InnerConeAngleDegrees<public>: float = external {}

      # Set the visible light intensity emitted in SI unit Candela./nSpecified before ColorFilter (which multiplies each color component after the intensity calculation and can change the effective intensity of the light).
      var Intensity<public>: float = external {}

      # The light's outer cone shaped angle in degrees. Clamped between 1.0 and 80.0.
      var OuterConeAngleDegrees<public>: float = external {}

      # Radius of the source shape, in centimeters. Note that light shapes which intersect shadow casting geometry can cause shadowing artifacts.
      var SourceRadius<public>: float = external {}
    }

    @experimental
    # The results of a sweep query. See entity.FindSweepHits(). We will get one sweep_hit for each intersection of any volume in SourceVolumes with any other volume.
    sweep_hit<native><public> := struct {
      # If TargetVolume is a polygonal object (mesh, convex hull, etc.) and the contact point is on an edge or vertex, this is the most-opposing face normal of the faces that share that edge or vertex. Otherwise it is the same as HitNormal.
      ContactFaceNormal<native><public>: (/Verse.org/SpatialMath:)vector3 = external {}

      # The normal on TargetVolume at the HitPosition.
      ContactNormal<native><public>: (/Verse.org/SpatialMath:)vector3 = external {}

      # The point of contact between SourceVolume and TargetVolume.
      ContactPosition<native><public>: (/Verse.org/SpatialMath:)vector3 = external {}

      # The source component and volume (query input). For compound inputs (like an entity hierarchy) this will be a component/volume in that hierarchy. The SourceGlobalTransform is the transform of SourceVolume at the start of the sweep. For single volume inputs like a sphere, the volume and transform are just the inputs to the sweep, and the component is false.
      SourceComponent<native><public>: ?component

      # The Distance along the sweep at which SourceVolume touches TargetVolume.
      SourceHitDistance<native><public>: float = external {}

      # The world-space translation (relative to SourceStartGlobalTransform) of SourceVolume when it touches TargetVolume.
      SourceHitTranslation<native><public>: (/Verse.org/SpatialMath:)vector3 = external {}

      # The source volume transform at the start of the sweep.
      SourceStartGlobalTransform<native><public>: (/Verse.org/SpatialMath:)transform

      # The source volume (query input).
      SourceVolume<native><public>: collision_volume

      # The component that was hit by SourceVolume.
      TargetComponent<native><public>: component

      # The volume that was hit by SourceVolume.
      TargetVolume<native><public>: collision_element
    }

    @experimental
    # Used to add tags to an entity. Tagged entities can then be queried using `entity.FindEntitiesWithTag` and `entity.FindParentEntitiesWithTag`.
    #   * Finding entities from the simulation entity for tagged entities only considers any `tag_component` that has run `OnAddedToScene`.
    tag_component<native><public> := class<final><final_super>(component, tag_view) {
      # Adds a tag to this component. Returns `true` if the tag was not present before being added.
      AddTag<native><public>(TagToAdd: tag)<transacts>: logic

      # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
      Has<native><override>(TagToCheck: tag)<computes><decides><reads>: void

      # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
      HasAll<native><override>(InTags: []tag)<computes><decides><reads>: void

      # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
      HasAny<native><override>(InTags: []tag)<computes><decides><reads>: void

      OnAddedToSceneInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      # Removes a tag from this component. Returns `true` if the tag was present before being removed.
      RemoveTag<native><public>(TagToRemove: tag)<transacts>: logic
    }

    @hide_in_editor
    @experimental
    tag_query_manager_component<native><epic_internal> := class<final_super><epic_internal>(component) {
      OnUninitializingInternal<native><override>(): void
    }

    @experimental
    # Used to render a string at the location of this entity.
    #
    # Dependencies:
    #   * `transform_component` on the entity positions the `text_display_component`.
    text_display_component<native><epic_internal> := class<final_super>(component, enableable) {
      # Disable this object.
      Disable<native><override>(): void

      # Enable this object.
      Enable<native><override>(): void

      # Succeeds if the component is enabled, fails if it is disabled.
      IsEnabled<native><override>()<transacts><decides>: void

      OnAddedToSceneInternal<native><override>(): void

      OnInitializedInternal<native><override>(): void

      OnRemovingFromSceneInternal<native><override>(): void

      @editable
      @replicated("RepNotify")
      # The color with which to display the text.
      var Color<native><public>: color = external {}

      @editable
      @replicated("RepNotify")
      # The time in seconds for the text to fully fade in.
      var FadeInTime<native><epic_internal>: float = external {}

      @editable
      @replicated("RepNotify")
      # The time in seconds for the text to fully fade out.
      var FadeOutTime<native><epic_internal>: float = external {}

      @experimental
      @replicated("RepNotify")
      # Message to be displayed on the entity.
      var Message<native><public>: message = external {}
    }

    @experimental
    # Describes discrete phases of a frame update. Subscribe to members of the tick_events object to run code before or after the physics system has updated your object, allowing you to affect or react to these updates.
    tick_events<native><public> := class<epic_internal> {
      DuringPhysics<native><epic_internal>: execution_listenable = external {}

      EndFrame<native><epic_internal>: execution_listenable = external {}

      EndPhysics<native><epic_internal>: execution_listenable = external {}

      # Listen `PostPhysics` to run your code after the physics system has updated your object this frame.
      PostPhysics<native><public>: execution_listenable = external {}

      # Listen `PrePhysics` to run your code before the physics system has updated your object this frame.
      PrePhysics<native><public>: execution_listenable = external {}

      StartPhysics<native><epic_internal>: execution_listenable = external {}
    }

    @experimental
    # Stores the transforms for an entity, which are used to position the entity.
    transform_component<native><public> := class<final><final_super>(component) {
      # Returns the global transform of the entity.
      GetGlobalTransform<native><public>()<transacts>: (/Verse.org/SpatialMath:)transform

      OnInitializedInternal<native><override>(): void

      OnUninitializingInternal<native><override>(): void

      # Sets the global transform of the entity.
      SetGlobalTransform<native><public>(NewGlobalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: void

      # Sets the local transform of the entity.
      SetLocalTransform<native><public>(NewLocalTransform: (/Verse.org/SpatialMath:)transform)<transacts>: void

      @editable
      @replicated("RepNotify")
      # LocalTransform to its parent
      var<private> LocalTransform<native><public>: (/Verse.org/SpatialMath:)transform = external {}

      @replicated("RepNotify")
      # alternate origin than the default parent
      var<private> Origin<native><public>: ?origin = external {}
    }

    @hide_in_editor
    @experimental
    typed_element_component<native><epic_internal> := class<final_super>(component) {}
  }

  # Stably sort `Array` using `Less` where `Less` succeeding indicates `Left` should precede `Right`
  SortBy<native><public>(Array: []t, Less: type { _(: t, : t)<computes><decides>: void } where t: type)<computes>: []t

  using { /Verse.org/Native }
  using { /Verse.org/SpatialMath }
  # Module import path: /UnrealEngine.com/Temporary/SpatialMath
  (/UnrealEngine.com/Temporary:)SpatialMath<public> := module {
    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyPitch<native><public>(PitchUpRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyRoll<native><public>(RollClockwiseRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)ApplyYaw<native><public>(YawRightRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateBy<native><public>(AdditionalRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateBy<native><public>(RotationToRemove: (/UnrealEngine.com/Temporary/SpatialMath:)rotation)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationY<public>(AngleRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyLocalRotationZ<public>(AngleRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationX<native><public>(AngleRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationY<native><public>(AngleRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
    (InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).ApplyWorldRotationZ<native><public>(AngleRadians: float)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAngle<native><public>()<computes><reads>: float

    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetAxis<native><public>()<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalForward<public>()<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalRight<public>()<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetLocalUp<public>()<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes an `[]float` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)GetYawPitchRollDegrees<native><public>()<computes><reads>: []float

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)Invert<native><public>()<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<native><public>()<converges><decides>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)RotateVector<native><public>(Vector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation).(/UnrealEngine.com/Temporary/SpatialMath:)UnrotateVector<native><public>(Vector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Returns the length of `V`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Returns the squared length of `V` as if `V.Z = 0.0`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthSquaredXY<public>()<computes><reads>: float = external {}

    # Returns the length of `V` as if `V.Z = 0.0`.
    (V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3).LengthXY<public>()<computes><reads>: float = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V: vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V: vector2).(/UnrealEngine.com/Temporary/SpatialMath:)IsFinite<public>()<computes><decides>: vector2 = external {}

    # Returns the length of `V`.
    (V: vector2).(/UnrealEngine.com/Temporary/SpatialMath:)Length<public>()<computes><reads>: float = external {}

    # Returns the squared length of `V`.
    (V: vector2).(/UnrealEngine.com/Temporary/SpatialMath:)LengthSquared<public>()<computes><reads>: float = external {}

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V: vector2).(/UnrealEngine.com/Temporary/SpatialMath:)MakeUnitVector<native><public>()<computes><decides><reads>: vector2

    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    (/UnrealEngine.com/Temporary/SpatialMath:)AngularDistance<native><public>(
      Rotation1: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      Rotation2: (/UnrealEngine.com/Temporary/SpatialMath:)rotation
    )<computes><reads>: float

    # Returns the cross product of `V1` and `V2`.
    CrossProduct<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Returns radians from `Degrees`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DegreesToRadians<public>(Degrees: float)<computes><reads>: float = external {}

    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(
      Rotation1: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      Rotation2: (/UnrealEngine.com/Temporary/SpatialMath:)rotation
    )<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: float

    # Returns the Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Distance<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DistanceSquared<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
    DistanceSquaredXY<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: float

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
    DistanceXY<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<native><public>(V1: vector2, V2: vector2)<computes><reads>: float

    # Returns the dot product of `V1` and `V2`.
    (/UnrealEngine.com/Temporary/SpatialMath:)DotProduct<public>(V1: vector2i, V2: vector2i)<computes>: int = external {}

    # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
    # Fails if any component of `V1` does not equal the corresponding component of `V2`.
    Equals<public>(V1: vector2i, V2: vector2i)<computes><decides>: vector2i = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `rotation` from /UnrealEngine.com/Temporary/SpatialMath to a `rotation` from /Verse.org/SpatialMath.
    FromRotation<public>(InRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>: (/Verse.org/SpatialMath:)rotation = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `rotation` from /Verse.org/SpatialMath to a `rotation` from /UnrealEngine.com/Temporary/SpatialMath.
    FromRotation<public>(InRotation: (/Verse.org/SpatialMath:)rotation)<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `transform` from /UnrealEngine.com/Temporary/SpatialMath to a `transform` from /Verse.org/SpatialMath.
    FromTransform<public>(InTransform: (/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>: (/Verse.org/SpatialMath:)transform = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `transform` from /Verse.org/SpatialMath to a `transform` from /UnrealEngine.com/Temporary/SpatialMath.
    FromTransform<public>(InTransform: (/Verse.org/SpatialMath:)transform)<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)transform = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `vector3` from /UnrealEngine.com/Temporary/SpatialMath to a `vector3` from /Verse.org/SpatialMath.
    FromVector3<public>(InVector3: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>: (/Verse.org/SpatialMath:)vector3 = external {}

    @experimental
    @available { MinUploadedAtFNVersion := 3400 }
    # Util function for converting a `vector3` from /Verse.org/SpatialMath to a `vector3` from /UnrealEngine.com/Temporary/SpatialMath.
    FromVector3<public>(InVector3: (/Verse.org/SpatialMath:)vector3)<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes the identity `rotation`.
    (/UnrealEngine.com/Temporary/SpatialMath:)IdentityRotation<native><public>()<converges>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(
      V1: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      V2: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      AbsoluteTolerance: float
    )<computes><decides>: void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    (/UnrealEngine.com/Temporary/SpatialMath:)IsAlmostEqual<public>(V1: vector2, V2: vector2, AbsoluteTolerance: float)<computes><decides>: void = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(
      From: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      To: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Parameter: float
    )<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Lerp<public>(From: vector2, To: vector2, Parameter: float)<computes><reads>: vector2 = external {}

    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeComponentWiseDeltaRotation<native><public>(
      RotationA: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      RotationB: (/UnrealEngine.com/Temporary/SpatialMath:)rotation
    )<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotation<native><public>(
      Axis: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      AngleRadians: float
    )<converges><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeRotationFromYawPitchRollDegrees<native><public>(
      YawRightDegrees: float,
      PitchUpDegrees: float,
      RollClockwiseDegrees: float
    )<converges><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(
      InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      FinalRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation
    )<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    (/UnrealEngine.com/Temporary/SpatialMath:)MakeShortestRotationBetween<native><public>(
      InitialVector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      FinalVector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<transacts>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `vector3` with all components `1.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Ones<epic_internal>()<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Returns degrees from `Radians`.
    (/UnrealEngine.com/Temporary/SpatialMath:)RadiansToDegrees<public>(Radians: float)<computes><reads>: float = external {}

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(
      Direction: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      SurfaceNormal: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><decides><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ReflectVector<native><public>(Direction: vector2, SurfaceNormal: vector2)<computes><decides><reads>: vector2

    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Slerp<native><public>(
      InitialRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      FinalRotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation,
      Parameter: float
    )<transacts><decides>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"Scale: {ToString(`InTransform.Scale`)} Rotation: {ToString(`InTransform.Rotation`)} Translation: {ToString(`InTransform.Translation`)}.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><epic_internal>(InTransform: (/UnrealEngine.com/Temporary/SpatialMath:)transform)<computes><reads>: string

    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(Rotation: (/UnrealEngine.com/Temporary/SpatialMath:)rotation)<computes><reads>: string

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes><reads>: string

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V: vector2)<computes><reads>: string

    # Makes a `string` representation of `V`.
    (/UnrealEngine.com/Temporary/SpatialMath:)ToString<native><public>(V: vector2i)<computes>: string

    # Makes a `vector2` by converting the components of `V` to `float`s.
    ToVector2<public>(V: vector2i)<transacts>: vector2 = external {}

    # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
    ToVector2i<public>(V: vector2)<computes><decides><reads>: vector2i = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    (/UnrealEngine.com/Temporary/SpatialMath:)TransformVector<native><public>(
      InTransform: (/UnrealEngine.com/Temporary/SpatialMath:)transform,
      InVector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    (/UnrealEngine.com/Temporary/SpatialMath:)TransformVectorNoScale<native><public>(
      InTransform: (/UnrealEngine.com/Temporary/SpatialMath:)transform,
      InVector: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes><reads>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3

    # Makes a unit `vector3` pointing in the positive X axis (forward)
    XAxis<epic_internal>()<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Y axis (right)
    YAxis<epic_internal>()<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Z axis (up)
    ZAxis<epic_internal>()<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` with all components `0.0`.
    (/UnrealEngine.com/Temporary/SpatialMath:)Zero<epic_internal>()<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: float
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(
      Left: float,
      Right: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector2` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left: float, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left: int, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'*'<public>(Left: vector2i, Right: int)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector2` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'+'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'-'<public>(Left: vector2i, Right: vector2i)<computes>: vector2i = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: (/UnrealEngine.com/Temporary/SpatialMath:)vector3
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(
      Left: (/UnrealEngine.com/Temporary/SpatialMath:)vector3,
      Right: float
    )<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector2` by dividing the components of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left: vector2, Right: float)<computes>: vector2 = external {}

    # Makes a `vector2` by component-wise division of `Left` by `Right`.
    (/UnrealEngine.com/Temporary/SpatialMath:)operator'/'<public>(Left: vector2, Right: vector2)<computes>: vector2 = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand: (/UnrealEngine.com/Temporary/SpatialMath:)vector3)<computes>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

    # Makes a `vector2` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand: vector2)<computes>: vector2 = external {}

    # Makes a `vector2i` by inverting the signs of `Operand`.
    (/UnrealEngine.com/Temporary/SpatialMath:)prefix'-'<public>(Operand: vector2i)<computes>: vector2i = external {}

    @editable
    @import_as("/Script/EpicGamesTemporary.FVerseRotation_Deprecated")
    (/UnrealEngine.com/Temporary/SpatialMath:)rotation<native><public> := struct<concrete> {}

    # A combination of scale, rotation, and translation, applied in that order.
    (/UnrealEngine.com/Temporary/SpatialMath:)transform<native><public> := struct<concrete><computes> {
      @editable
      # The rotation of this `transform`.
      Rotation<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

      @editable
      # The scale of this `transform`.
      Scale<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

      @editable
      # The location of this `transform`.
      Translation<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}
    }

    # 2-dimensional vector with `float` components.
    vector2<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}
    }

    # 2-dimensional vector with `int` components.
    vector2i<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: int = external {}

      @editable
      Y<native><public>: int = external {}
    }

    # 3-dimensional vector with `float` components.
    (/UnrealEngine.com/Temporary/SpatialMath:)vector3<native><public> := struct<concrete><computes><persistable> {
      @editable
      X<native><public>: float = external {}

      @editable
      Y<native><public>: float = external {}

      @editable
      Z<native><public>: float = external {}
    }
  }

  # Module import path: /UnrealEngine.com/Temporary/Testing
  Testing<public> := module {
    # test_reporter is a test result aggregator that writes test results to a log stream and can compile and print a summary of test results.
    test_reporter<native><epic_internal> := class {
      # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
      DefaultLevel<native><epic_internal>: log_level = external {}

      # Returns a string of the test results summary.
      GetSummaryStrings<native><epic_internal>(?Level: log_level = external {}): []string

      # Logs `Message` to the `test_reporter` log stream. This allows users to add context for results to the summary.
      (/UnrealEngine.com/Temporary/Testing/test_reporter:)Log<native><epic_internal>(Message: string, ?Level: log_level = external {}): void

      # The name of this `test_reporter`. Used when displaying results summary.
      Name<native><epic_internal>: string = external {}

      # Prints a summary of test results to the log stream and resets the test results.
      PrintSummary<native><epic_internal>(?Level: log_level = external {}): void

      # Report a test result of `Failed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestFailed<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Passed`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestPassed<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Result`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestResult<native><epic_internal>(
        Message: string,
        Result: test_result,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Report a test result of `Skipped`. `Category` and `SubCategory` are used to calculate test result stats as part of printing the summary.
      ReportTestSkipped<native><epic_internal>(
        Message: string,
        ?Category: string = external {},
        ?SubCategory: string = external {}
      ): void

      # Resets test results.
      Reset<native><epic_internal>(): void
    }

    # test result outcomes
    test_result<native><epic_internal> := enum {
      Failed

      Passed

      Skipped
    }
  }

  using { /UnrealEngine.com/Temporary/SceneGraph }
  using { /UnrealEngine.com/Temporary/SpatialMath }
  using { /Verse.org/Assets }
  using { /Verse.org/Colors }
  using { /Verse.org/Simulation }
  # Module import path: /UnrealEngine.com/Temporary/UI
  UI<public> := module {
    # Returns the `player_ui` associated with `Player`.
    # Fails if there is no `player_ui` associated with `Player`.
    GetPlayerUI<native><public>(Player: player)<transacts><decides>: player_ui

    # Make a canvas slot for fixed position widget.
    # If Size is set, then the Offsets is calculated and the SizeToContent is set to false.
    # If Size is not set, then Right and Bottom are set to zero and are not used. The widget size will be automatically calculated. The SizeToContent is set to true.
    # The widget is not anchored and will not move if the parent is resized.
    # The Anchors is set to zero.
    MakeCanvasSlot<native><public>(Widget: widget, Position: vector2, ?Size: vector2 = external {}, ?ZOrder: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}, ?Alignment: vector2 = external {})<computes>: canvas_slot

    # The anchors of a `widget` determine its the position and sizing relative to its parent.
    # `anchor`s range from `(0.0, 0.0)` (left, top) to `(1.0, 1.0)` (right, bottom).
    anchors<native><public> := struct {
      # Holds the maximum anchors, (right, bottom). The valid range is between `0.0` and `1.0`.
      Maximum<native><public>: vector2 = external {}

      # Holds the minimum anchors, (left, top). The valid range is between `0.0` and `1.0`.
      Minimum<native><public>: vector2 = external {}
    }

    # Button is a container of a single child widget slot and fires the OnClick event when the button is clicked.
    button<native><public> := class<final>(widget) {
      # Subscribable event that fires when the button is clicked.
      OnClick<public>(): listenable(widget_message) = external {}

      # Sets the child widget slot.
      SetWidget<native><public>(InSlot: button_slot): void

      # The child widget of the button. Used only during initialization of the widget and not modified by SetSlot.
      Slot<native><public>: button_slot
    }

    # Slot for button widget.
    button_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Canvas is a container widget that allows for arbitrary positioning of widgets in the canvas' slots.
    canvas<native><public> := class<final>(widget) {
      # Adds a new child slot to the canvas.
      AddWidget<native><public>(Slot: canvas_slot): void

      # Removes a slot containing the given widget.
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the canvas. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []canvas_slot = external {}
    }

    # Slot for a canvas widget.
    canvas_slot<native><public> := struct {
      # Alignment is the pivot/origin point of the widget.
      # Starting in the upper left at (0.0,0.0), ending in the lower right at (1.0,1.0).
      Alignment<native><public>: vector2 = external {}

      # The border for the margin and how the widget is resized with its parent.
      # Values are defined between 0.0 and 1.0.
      Anchors<native><public>: anchors = external {}

      # The offset that defined the size and position of the widget.
      # When the anchors are well defined, the Offsets.Left represent the distance in pixels from the Anchors Minimum.X, the Offsets.Bottom represent the distance in pixel from the Anchors Maximum.Y, effectively controlling the desired widget size. When the anchors are not well defined, the Offsets.Left and Offsets.Top represent the widget position and Offsets.Right and Offset.Bottom represent the widget size.
      Offsets<native><public>: margin = external {}

      # When true we use the widget's desired size. The size calculated by the Offsets is ignored.
      SizeToContent<native><public>: logic = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget

      # Z Order of this slot relative to other slots in this canvas panel.
      # Higher values are rendered last (and so they will appear to be on top)
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # A solid color widget.
    color_block<native><public> := class<final>(widget) {
      # The color of the widget. Used only during initialization of the widget and not modified by SetColor.
      DefaultColor<native><public>: color = external {}

      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The opacity of the widget. Used only during initialization of the widget and not modified by SetOpacity.
      DefaultOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the widget's color.
      GetColor<native><public>(): color

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the widget's opacity.
      GetOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the widget's color.
      SetColor<native><public>(InColor: color): void

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the widgets's opacity.
      SetOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # `widget` horizontal alignment mode.
    horizontal_alignment<native><public> := enum {
      # Center `widget` horizontally within the slot.
      Center

      # `widget` fills the slot horizontally.
      Fill

      # Align `widget` to the left of the slot.
      Left

      # Align `widget` to the right of the slot.
      Right
    }

    # Tiling options values
    image_tiling<native><public> := enum {
      # Repeat/Wrap the image to fill the available space.
      Repeat

      # Stretch the image to fit the available space.
      Stretch
    }

    @experimental
    local_hud_component<epic_internal> := class<final_super>(component) {
      @experimental
      Hide<public>(Player: player): void = external {}

      OnBeginSimulation<override>(): void = external {}

      OnEndSimulation<override>(): void = external {}

      @experimental
      Show<public>(Player: player): void = external {}

      var Canvas<public>: canvas

      var UISlot<public>: player_ui_slot
    }

    # Specifies the gap outside each edge separating a `widget` from its neighbors.
    # Distance is measured in units where `1.0` unit is the width of a pixel at 1080p resolution.
    margin<native><public> := struct {
      # The bottom edge spacing.
      Bottom<native><public>: float = external {}

      # The left edge spacing.
      Left<native><public>: float = external {}

      # The right edge spacing.
      Right<native><public>: float = external {}

      # The top edge spacing.
      Top<native><public>: float = external {}
    }

    # A widget to display a material.
    material_block<native><epic_internal> := class(widget) {
      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The image to render. Used only during initialization of the widget and not modified by SetImage.
      DefaultImage<native><public>: material

      # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
      DefaultTint<native><public>: color = external {}

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the image to render.
      GetImage<native><public>(): material

      # Gets the tint applied to the image.
      GetTint<native><public>(): color

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the image to render.
      SetImage<native><public>(InImage: material): void

      # Sets the tint applied to the image.
      SetTint<native><public>(InColor: color): void
    }

    # Used by`widget` orientation modes.
    orientation<native><public> := enum {
      # Orient `widget`s from left to right.
      Horizontal

      # Orient `widget`s from top to bottom.
      Vertical
    }

    # Overlay is a container consisting of widgets stacked on top of each other.
    overlay<native><public> := class<final>(widget) {
      # Add a new child slot to the overlay. Slots are added at the end.
      AddWidget<native><public>(Slot: overlay_slot): void

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the overlay. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []overlay_slot = external {}
    }

    # Slot for an overlay widget
    overlay_slot<native><public> := struct {
      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # The main interface for adding and removing `widget`s to a player's UI.
    player_ui<native><public> := class<final><epic_internal> {
      # Adds `Widget` to this `player_ui` using default `player_ui_slot` configuration options.
      AddWidget<native><public>(Widget: widget): void

      # Adds `Widget` to this `player_ui` using `Slot` for configuration options.
      AddWidget<native><public>(Widget: widget, Slot: player_ui_slot): void

      # Removes `Widget` from this `player_ui`.
      RemoveWidget<native><public>(Widget: widget): void
    }

    # `widget` creation configuration options.
    player_ui_slot<native><public> := struct {
      # Controls `widget` input event consumption.
      InputMode<native><public>: ui_input_mode = external {}

      # Controls `widget` rendering order. Greater values will be draw in front of lesser values.
      ZOrder<native><public>: type { _X: int where 0 <= _X, _X <= 2147483647 } = external {}
    }

    # Stack box is a container of a list of widgets stacked either vertically or horizontally.
    stack_box<native><public> := class<final>(widget) {
      # Add a new child slot to the stack box. Slots are added at the end.
      AddWidget<native><public>(Slot: stack_box_slot): void

      # The orientation of the stack box. Either stack widgets horizontal or vertical.
      Orientation<native><public>: orientation

      # Removes a slot containing the given widget
      RemoveWidget<native><public>(Widget: widget): void

      # The child widgets of the stack box. Used only during initialization of the widget and not modified by Add/RemoveWidget.
      Slots<native><public>: []stack_box_slot = external {}
    }

    # Slot for a stack_box widget
    stack_box_slot<native><public> := struct {
      # The available space will be distributed proportionally.
      # If not set, the slot will use the desired size of the widget.
      Distribution<native><public>: ?float = external {}

      # Horizontal alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      HorizontalAlignment<native><public>: horizontal_alignment = external {}

      # Empty distance in pixels that surrounds the widget inside the slot. Assumes 1080p resolution.
      Padding<native><public>: margin = external {}

      # Vertical alignment of the widget inside the slot.
      # This alignment is only applied after the layout space for the widget slot is created and determines the widget alignment within that space.
      VerticalAlignment<native><public>: vertical_alignment = external {}

      # The widget assigned to this slot.
      Widget<native><public>: widget
    }

    # Base widget for text widget.
    text_base<native><public> := class<abstract>(widget) {
      # The justification to display to the user. Used only during initialization of the widget and not modified by SetJustification.
      DefaultJustification<native><public>: text_justification = external {}

      # The policy that determine what happens when the text is longer than its allowed length.
      # Used only during initialization of the widget and not modified by SetOverflowPolicy.
      DefaultOverflowPolicy<native><public>: text_overflow_policy = external {}

      # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
      DefaultText<native><localizes><public>: message = external {}

      # The color of the displayed text. Used only during initialization of the widget and not modified by SetTextColor.
      DefaultTextColor<native><public>: color = external {}

      # The opacity of the displayed text. Used only during initialization of the widget and not modified by SetTextOpacity.
      DefaultTextOpacity<native><public>: type { _X: float where 0.000000 <= _X, _X <= 1.000000 } = external {}

      # Gets the text justification in the widget.
      GetJustification<native><public>(): text_justification

      # Gets the policy that determine what happens when the text is longer than its allowed length.
      GetOverflowPolicy<native><public>(): text_overflow_policy

      # Gets the text currently in the widget.
      GetText<native><public>(): string

      # Gets the color of the displayed text.
      GetTextColor<native><public>(): color

      # Gets the opacity of the displayed text.
      GetTextOpacity<native><public>(): type { _X: float where 0.000000 <= _X, _X <= 1.000000 }

      # Sets the text justification in the widget.
      SetJustification<native><public>(InJustification: text_justification): void

      # Sets the policy that determine what happens when the text is longer than its allowed length.
      SetOverflowPolicy<native><public>(InOverflowPolicy: text_overflow_policy): void

      # Sets the text displayed in the widget.
      SetText<native><public>(InText: message): void

      # Sets the color of the displayed text.
      SetTextColor<native><public>(InColor: color): void

      # Sets the opacity of the displayed text.
      SetTextOpacity<native><public>(InOpacity: type { _X: float where 0.000000 <= _X, _X <= 1.000000 }): void
    }

    # Text block widget. Displays text to the user.
    text_block_internal<native><epic_internal> := class(text_base) {}

    # Text justification values:
    #   Left: Justify the text logically to the left based on current culture.
    #   Center: Justify the text in the center.
    #   Right: Justify the text logically to the right based on current culture.
    # The Left and Right value will flip when the local culture is right-to-left.
    text_justification<native><public> := enum {
      Center

      InvariantLeft

      InvariantRight

      Left

      Right
    }

    # Text overflow policy values:
    #   Clip: Overflowing text will be clipped.
    #   Ellipsis: Overflowing text will be replaced with an ellipsis.
    text_overflow_policy<native><public> := enum {
      Clip

      Ellipsis
    }

    # A widget to display a texture.
    texture_block<native><public> := class(widget) {
      # The size this widget desired to be displayed in. Used only during initialization of the widget and not modified by SetDesiredSize.
      DefaultDesiredSize<native><public>: vector2 = external {}

      # The horizontal tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultHorizontalTiling<native><public>: image_tiling = external {}

      # The image to render. Used only during initialization of the widget and not modified by SetImage.
      DefaultImage<native><public>: texture

      # Tinting applied to the image. Used only during initialization of the widget and not modified by SetTint.
      DefaultTint<native><public>: color = external {}

      # The vertical tiling option. Used only during initialization of the widget and not modified by SetTiling.
      DefaultVerticalTiling<native><public>: image_tiling = external {}

      # Gets the size this widget desired to be displayed in.
      GetDesiredSize<native><public>(): vector2

      # Gets the image to render.
      GetImage<native><public>(): texture

      # Gets the tiling option.
      GetTiling<native><public>(): tuple(image_tiling, image_tiling)

      # Gets the tint applied to the image.
      GetTint<native><public>(): color

      # Sets the size this widget desired to be displayed in.
      SetDesiredSize<native><public>(InDesiredSize: vector2): void

      # Sets the image to render.
      SetImage<native><public>(InImage: texture): void

      # Sets the tiling option when the image is smaller than the allocated size.
      SetTiling<native><public>(InHorizontalTiling: image_tiling, InVerticalTiling: image_tiling): void

      # Sets the tint applied to the image.
      SetTint<native><public>(InColor: color): void
    }

    # `widget` input consumption mode.
    ui_input_mode<native><public> := enum {
      # `widget` consumes all inputs
      All

      # `widget` does not consume any input.
      None
    }

    # Widget created from a umg_widget_class_asset.
    umg_widget<native><epic_internal> := class<epic_internal>(widget) {
      # The widget_blueprint asset to create.
      Asset<native><epic_internal>: umg_widget_class_asset

      GetNamedSlotOptional_<native><epic_internal>(NamedSlotName: []char)<transacts>: ?widget

      GetNamedSlot_<native><epic_internal>(NamedSlotName: []char)<transacts>: widget

      GetViewmodelOptional_<native><epic_internal>(viewmodel_type: type, ViewmodelName: []char)<transacts>: viewmodel_type

      GetViewmodel_<native><epic_internal>(viewmodel_type: type, ViewmodelName: []char)<transacts>: viewmodel_type

      SetNamedSlotOptional_<native><epic_internal>(NamedSlotName: []char, NamedSlotInstance: ?widget)<transacts>: void

      SetNamedSlot_<native><epic_internal>(NamedSlotName: []char, NamedSlotInstance: widget)<transacts>: void

      SetViewmodelOptional_<native><epic_internal>(
        viewmodel_type: type,
        ViewmodelName: []char,
        ViewmodelInstance: viewmodel_type
      )<transacts>: void

      SetViewmodel_<native><epic_internal>(
        viewmodel_type: type,
        ViewmodelName: []char,
        ViewmodelInstance: viewmodel_type
      )<transacts>: void
    }

    # Verse interface to native `umg asset`.
    umg_widget_class_asset<native><epic_internal> := class<computes><final>(client_asset) {}

    # `widget` vertical alignment mode.
    vertical_alignment<native><public> := enum {
      # Align `widget` to the bottom of the slot.
      Bottom

      # Center `widget` vertically within the slot.
      Center

      # `widget` fills the slot vertically.
      Fill

      # Align `widget` to the top of the slot.
      Top
    }

    # Base class for all UI elements drawn on the `player`'s screen.
    widget<native><public> := class<abstract><unique><epic_internal> {
      # Returns the `widget`'s parent `widget`.
      # Fails if no parent exists, such as if this `widget` is not in the `player_ui` or is itself the root `widget`.
      GetParentWidget<native><public>()<transacts><decides>: widget

      # Gets the render opacity of the widget.
      GetRenderOpacity<native><epic_internal>(): float

      # Returns the `widget` that added this `widget` to the `player_ui`. The root `widget` will return itself.
      # Fails if this `widget` is not in the `player_ui`.
      GetRootWidget<native><public>()<transacts><decides>: widget

      # Returns the current `widget_visibility` state.
      GetVisibility<native><public>(): widget_visibility

      # `true` if this `widget` can be modified interactively by the player.
      IsEnabled<native><public>(): logic

      # `true` if this `widget` consumes input when `widget_visibility` is Visible.
      IsHitTestVisible<native><epic_internal>(): logic

      # Enables or disables whether the `player` can interact with this `widget`.
      SetEnabled<native><public>(InIsEnabled: logic): void

      # Enables or disables whether this `widget` consumes input when `widget_visibility` is Visible.
      SetHitTestVisible<native><epic_internal>(InIsHitTestVisible: logic): void

      # Sets the render opacity of the widget.
      SetRenderOpacity<native><epic_internal>(InRenderOpacity: float): void

      # Shows or hides the `widget` without removing itself from the containing `player_ui`.
      # See `widget_visibility` for details.
      SetVisibility<native><public>(InVisibility: widget_visibility): void
    }

    # Parameters for `event`s signalled by a `widget`.
    widget_message<native><public> := struct {
      # The `player` that triggered the `event`.
      Player<native><public>: player

      # The `widget` that triggered the `event`.
      Source<native><public>: widget
    }

    # Used by `widget.SetVisibility` determine how a `widget` is shown in the user interface.
    widget_visibility<native><public> := enum {
      # The `widget` is invisible and does not occupy layout space.
      Collapsed

      # The `widget` is invisible and occupies layout space.
      Hidden

      # The `widget` is visible and occupies layout space.
      Visible
    }
  }

  WorldPartition<public> := module {
    using { /UnrealEngine.com/Temporary/SpatialMath }
    using { /Verse.org/Assets }
    # Module import path: /UnrealEngine.com/Temporary/WorldPartition/VerseWorldPartition
    VerseWorldPartition<public> := module {
      GetWorldPartitionHelper<native><epic_internal>()<transacts>: ?world_partition_helper

      data_layer_asset<native><epic_internal> := class<concrete><computes><final><epic_internal>(asset) {}

      world_partition_helper<native><epic_internal> := class<concrete> {
        # Adds a static streaming source.
        AddStreamingSource<native><public>(StreamingSource: world_partition_streaming_source)<transacts>: cancelable

        # Adds a streaming source provider callback. The callback is responsible for filling and updating the streaming source when invoked.
        AddStreamingSourceProvider<native><public>(UpdateStreamingSourceCallback: type { _(: world_partition_streaming_source): void })<transacts>: cancelable

        # Returns data layer effective runtime state.
        GetDataLayerEffectiveRuntimeState<native><public>(DataLayerAsset: data_layer_asset)<transacts>: world_partition_streaming_runtime_state

        # Returns whether an array of streaming sources has finished streaming. If no array is passed, the state of all currently added streaming source is queryed.
        IsStreamingCompleted<native><public>(Sources: ?[]world_partition_streaming_source)<transacts>: logic

        # Returns whether an array of streaming query sources satisfies the passed state.
        IsStreamingCompleted<native><public>(
          Sources: []world_partition_streaming_query_source,
          QueryState: world_partition_streaming_runtime_state
        )<transacts>: logic

        # Sets data layer runtime state.
        SetDataLayerRuntimeState<native><public>(
          DataLayerAsset: data_layer_asset,
          State: world_partition_streaming_runtime_state,
          IsRecursive: logic
        )<transacts>: logic
      }

      world_partition_streaming_definition<native><epic_internal> := class<concrete><epic_internal> {
        SetAsCircle<public>(Range: float)<transacts>: void = external {}

        SetAsSphere<public>(Range: float)<transacts>: void = external {}

        # If true, this streaming source will force intersecting cells in 2D
        var Force2D<native><public>: logic = external {}

        # Source Location
        var Location<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Source orientation (can impact streaming cell prioritization)
        var Rotation<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        # Source internal shapes. When none are provided, a sphere is automatically used. It's radius is equal to grid's loading range and center equals source's location.
        var Shapes<native><public>: []world_partition_streaming_source_shape = external {}

        # Defines how TargetGrids/TargetHLODLayers will be applied to this streaming source.
        var TargetBehavior<native><public>: world_partition_streaming_source_target_behavior = external {}

        # When set, this will change how this streaming source is applied to the provided runtime streaming grids based on the TargetBehavior.
        var TargetGrids<native><public>: []string = external {}
      }

      world_partition_streaming_query_source<native><epic_internal> := class(world_partition_streaming_definition) {
        # The list of layers to consider for this query
        var DataLayers<native><public>: []data_layer_asset = external {}

        # If False, Location/Radius will not be used to find the cells. Only AlwaysLoaded cells will be returned by the query.
        var SpatialQuery<native><public>: logic = external {}
      }

      # Unloaded: Associated content is unloaded. Loaded: Associated content is loaded but not visible. Activated: Associated content is loaded and visible. Represents possible Streaming Sources runtime states.
      world_partition_streaming_runtime_state<native><epic_internal> := enum {
        # Activated (meaning loaded and visible)
        Activated

        # Loaded (meaning loaded but not visible)
        Loaded

        # Unloaded
        Unloaded
      }

      world_partition_streaming_source<native><epic_internal> := class(world_partition_streaming_definition) {
        # Whether this source will be considered when world partition detects slow loading and waits for cell streaming to complete
        var BlockOnSlowLoading<native><public>: logic = external {}

        # Source unique name
        var Name<native><public>: string = external {}

        # Streaming source priority
        var Priority<native><public>: world_partition_streaming_source_priority = external {}

        # Target streaming state
        var TargetState<native><public>: world_partition_streaming_runtime_state = external {}

        # Use velocity contribution to streaming cells priority streaming.
        var UseVelocityContributionToCellsSorting<native><public>: logic = external {}
      }

      world_partition_streaming_source_priority<native><epic_internal> := enum {
        High

        Highest

        Low

        Lowest

        Normal
      }

      world_partition_streaming_source_shape<native><epic_internal> := class<concrete> {
        # Whether the source shape is a spherical sector instead of a regular sphere source.
        var IsSector<native><public>: logic = external {}

        # Applies a scale to the grid's loading range (used if bUseGridLoadingRange is True)
        var LoadingRangeScale<native><public>: float = external {}

        # Streaming source shape location (local to streaming source).
        var Location<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)vector3 = external {}

        # Custom streaming source shape radius (not used if bUseGridLoadingRange is True).
        var Radius<native><public>: float = external {}

        # Streaming source shape rotation (local to streaming source).
        var Rotation<native><public>: (/UnrealEngine.com/Temporary/SpatialMath:)rotation = external {}

        # Shape's spherical sector angle in degree (not used if bIsSector is False)
        var SectorAngle<native><public>: float = external {}

        # If True, streaming source shape radius is bound to loading range radius.
        var UseGridLoadingRange<native><public>: logic = external {}
      }

      world_partition_streaming_source_subscription<native><epic_internal> := class(cancelable) {
        Cancel<native><override>()<transacts>: void
      }

      world_partition_streaming_source_target_behavior<native><epic_internal> := enum {
        Exclude

        Include
      }
    }
  }

  @experimental
  playable<epic_internal> := interface<epic_internal> {
    @experimental
    GetDuration<public>()<decides>: float

    @experimental
    GetOnFinishedEvent<public>()<computes><decides><reads>: listenable(tuple())

    @experimental
    GetOnPausedEvent<public>(): listenable(tuple())

    @experimental
    GetOnPlayedEvent<public>(): listenable(tuple())

    @experimental
    GetOnStoppedEvent<public>(): listenable(tuple())

    @experimental
    Pause<public>(): void

    @experimental
    Play<public>(): void

    @experimental
    Stop<public>(?BlendOutTime: float = external {}): void
  }
}

Tests<public> := module {
  # Module import path: /UnrealEngine.com/Tests/NexusUtils
  NexusUtils<public> := module {
    nexus_utils<native><epic_internal> := class {
      HelloWorld<native><public>(): void
    }
  }
}

WebAPI<public> := module {
  MakeClient<constructor><native><public>(ClientId: client_id)<converges>: client

  body_response<native><public> := class<internal>(response) {
    GetBody<native><public>()<computes>: string
  }

  client<native><public> := class<final><computes><internal> {
    Get<native><public>(Path: string)<suspends>: response
  }

  # Usage:
  #     Licensed users create a derived version of `client_id` in their module.
  #     The Verse class path for your derived `client_id` is then used as the
  #     configuration key in your backend service to map to your endpoint.
  #
  #     WARNING: do not make your derived `client_id` class public. This object
  #     type is your private key to your backend.
  #
  # Example:
  #     my_client_id<internal> := class<final><computes>(client_id)
  #     MyClient<internal> := MakeClient(my_client_id)
  client_id<native><public> := class<abstract><computes> {}

  response<native><public> := class<internal> {}
}