using {/Verse.org/Native}
using {/Verse.org/VerseEngine/Component}
# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    # Module import path: /Verse.org/VerseEngine/Entity
    Entity<public> := module:
        vk_entity<native><public> := class<final>:
            # Add a vk_component to the vk_entity of the specified type
            AddComponent<native><public>(ComponentType:type)<transacts>:?vk_component

            # Remove a vk_component from the vk_entity
            RemoveComponent<native><public>(__dupe___unnamed_parameter_34:vk_component):logic

            # Helper method for check if required components exist
            HasComponents<public>(RequiredComponentClasses:[]subtype(vk_component))<transacts><decides>:void = external {}

            # Helper method for ensuring components exist, creating them if they don't exist
            EnsureComponents<public>(AddComponentClasses:[]subtype(vk_component)):void = external {}

            # Get a vk_component from the vk_entity of the specified type
            GetComponentOfType<native><public>(ComponentType:type)<transacts>:?vk_component

            # Get all vk_component(s) from the vk_entity of the specified type
            GetAllComponentsOfType<native><public>(ComponentType:type)<transacts>:[]vk_component

            # Get a vk_component from the vk_entity of the specified type, if one does not exist, add it
            GetOrCreateComponentOfType<native><public>(ComponentType:type):?vk_component

            # Destroy the vk_entity
            Destroy<native><public>():logic

            GetName<native><public>():string

            GetFullname<native><public>():string

            # Compare with another vk_entity
            IsEqual<native><public>(OtherEntity:vk_entity)<transacts>:logic

        # Module import path: /Verse.org/VerseEngine/Entity/EntityHelpers
        EntityHelpers<public> := module:
            # Get a vk_component from the vk_entity of the specified type
            GetComponentOfTypeC<native><public>(InComponent:vk_component, Type:type)<transacts><decides>:vk_component

            # Destroy the vk_entity the vk_component is attached to
            DestroyObject<native><public>(__dupe___unnamed_parameter_43:vk_component):logic

            # Gets the vk_entity associated with the parameter provided vk_component
            GetEntityFromComponent<native><public>(__dupe___unnamed_parameter_44:vk_component)<transacts><decides>:vk_entity

    # Module import path: /Verse.org/VerseEngine/Component
    Component<public> := module:
        @import_as("/Script/EntityCore.UEntityComponent")
        vk_component<native><public> := class<abstract>:


    no_param_delegate_signature<public> := type {__():void}

    logic_param_delegate_signature<public> := type {__(:logic):void}

    int_param_delegate_signature<public> := type {__(:int):void}

    float_param_delegate_signature<public> := type {__(:float):void}

    string_param_delegate_signature<public> := type {__(:string):void}

    multicast_delegate_base<native><public> := class:


    multicast_delegate<native><public>(t:type) := class(multicast_delegate_base, subscribable(t)):
        Subscribe<native><override>(Callback:type {__(:t):void})<transacts>:cancelable

        Broadcast<native><public>(__dupe___unnamed_parameter_46:t):void

        Empty<native><public>():void

    multicast_delegate<public>() := multicast_delegate(tuple())

    subscribable_event<native><epic_internal>(t:type) := class(multicast_delegate(t), listenable(t)):
        Await<native><override>()<suspends>:t

    subscribable_event<epic_internal>() := subscribable_event(tuple())