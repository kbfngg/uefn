using {/Verse.org/ParameterCollections}
using {/Verse.org/Native}
using {/Verse.org/Restricted}
# Module import path: /Verse.org/Assets
Assets<public> := module:
    # Create an asset reference to the given internal asset path
    MakeAsset<native><epic_internal>(AssetType:type, AssetPath:string)<converges>:AssetType

    asset<native><epic_internal> := class<computes><epic_internal>:
        SyncLoad<native><epic_internal>():logic

        Async_Load<native><epic_internal>():?sticky_event(void)

        GetAsyncLoadEvent<native><epic_internal>():?sticky_event(void)

        GetAssetType<native><epic_internal>()<transacts><decides>:type

    client_asset<native><epic_internal> := class<abstract><computes><epic_internal>(asset):


    animation<native><epic_internal> := class<computes><final><epic_internal>(asset):


    animation_blueprint<native><epic_internal> := class<computes><final><epic_internal>(asset):


    animation_instance<native><epic_internal> := class<computes><final><epic_internal>(asset):


    animation_sequence<native><public> := class<computes><final><epic_internal>(asset):


    @import_as("/Script/Engine.UMaterialInterface")
    ue_material_interface<native><epic_internal> := class:


    material<native><public> := interface<epic_internal>:
        GetMaterialInterface<native_callable><epic_internal>():ue_material_interface

        GetAsset<native_callable><epic_internal>():material_asset

    material_asset<native><epic_internal> := class<final><epic_internal>(material, asset):
        GetMaterialInterface<native><override>():ue_material_interface

        GetAsset<override>():material_asset = external {}

    parameterized_material<native><epic_internal> := class<epic_internal>(material, parameter_collection):
        Material<native><epic_internal>:material

        GetMaterialInterface<native><override>():ue_material_interface

        GetAsset<override>():material_asset = external {}

    particle_system<native><public> := class<computes><final><epic_internal>(client_asset):


    skeletal_mesh<native><epic_internal> := class<computes><final><epic_internal>(asset):


    mesh<native><public> := class<computes><final><epic_internal>(asset):


    sound<native><epic_internal> := class<computes><final><epic_internal>(client_asset):


    font<native><epic_internal> := class<computes><final><epic_internal>(client_asset):


    level<native><epic_internal> := class<computes><final><epic_internal>(asset):


    texture_base<native><epic_internal> := class<computes><epic_internal>(asset):


    texture<native><public> := class<computes><final><epic_internal>(texture_base):
