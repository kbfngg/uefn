using {/Verse.org/Native}
using {/Verse.org/VerseEngine/Component}
# Module import path: /Verse.org/VerseEngine
VerseEngine<public> := module:
    # Module import path: /Verse.org/VerseEngine/Entity
    Entity<public> := module:
        entity<native><public> := class<final>:
            # Add a component to the entity of the specified type
            AddComponent<native><public>(ComponentType:type)<transacts>:?component

            # Remove a component from the entity
            RemoveComponent<native><public>(__dupe___unnamed_parameter_34:component):logic

            # Helper method for check if required components exist
            HasComponents<public>(RequiredComponentClasses:[]subtype(component))<transacts><decides>:void = external {}

            # Helper method for ensuring components exist, creating them if they don't exist
            EnsureComponents<public>(AddComponentClasses:[]subtype(component)):void = external {}

            # Get a component from the entity of the specified type
            GetComponentOfType<native><public>(ComponentType:type)<transacts>:?component

            # Get all component(s) from the entity of the specified type
            GetAllComponentsOfType<native><public>(ComponentType:type)<transacts>:[]component

            # Get a component from the entity of the specified type, if one does not exist, add it
            GetOrCreateComponentOfType<native><public>(ComponentType:type):?component

            # Destroy the entity
            Destroy<native><public>():logic

            GetName<native><public>():[]char

            GetFullname<native><public>():[]char

            # Compare with another entity
            IsEqual<native><public>(OtherEntity:entity)<transacts>:logic

        # Module import path: /Verse.org/VerseEngine/Entity/EntityHelpers
        EntityHelpers<public> := module:
            # Get a component from the entity of the specified type
            GetComponentOfTypeC<native><public>(InComponent:component, Type:type)<transacts><decides>:component

            # Destroy the entity the component is attached to
            DestroyObject<native><public>(__dupe___unnamed_parameter_43:component):logic

            # Gets the entity associated with the parameter provided component
            GetEntityFromComponent<native><public>(__dupe___unnamed_parameter_44:component)<transacts><decides>:entity

    # Module import path: /Verse.org/VerseEngine/Component
    Component<public> := module:
        @import_as("/Script/EntityCore.UEntityComponent")
        component<native><public> := class<abstract>:


    multicast_delegate_base<native><public> := class:


    multicast_delegate<native><public>(t:type)<computes> := class(multicast_delegate_base, subscribable(t)):
        Subscribe<native><override>(Callback:type {__(:t):void})<transacts>:cancelable

        Broadcast<native><public>(__dupe___unnamed_parameter_46:t):void

        Empty<native><public>():void

    multicast_delegate<public>()<computes> := multicast_delegate(tuple())

    subscribable_event<native><epic_internal>(t:type)<computes> := class(multicast_delegate(t), listenable(t)):
        Await<native><override>()<suspends>:t

    subscribable_event<epic_internal>()<computes> := subscribable_event(tuple())