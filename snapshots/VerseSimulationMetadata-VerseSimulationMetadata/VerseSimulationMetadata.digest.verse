# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    category_attribute<epic_internal> := class(attribute):


    category<epic_internal>(Category:string)<computes>:category_attribute

    @attribscope_data
    @customattribhandler
    clamp_max_attribute<epic_internal> := class(attribute):


    clamp_max<epic_internal>(ClampMax:string)<computes>:clamp_max_attribute

    @attribscope_data
    @customattribhandler
    clamp_min_attribute<epic_internal> := class(attribute):


    clamp_min<epic_internal>(ClampMin:string)<computes>:clamp_min_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_name_attribute<epic_internal> := class(attribute):


    display_name<epic_internal>(DisplayName:string)<computes>:display_name_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_priority_attribute<epic_internal> := class(attribute):


    display_priority<epic_internal>(DisplayPriority:string)<computes>:display_priority_attribute

    editable_empty_message<localizes><epic_internal>:message = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class(attribute):
        ToolTip<public>:message = external {}

        ShortToolTip<epic_internal>:message = external {}

        ShowThumbnail<epic_internal>:logic = external {}

        Categories<public>:[]message = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_text_box<public> := class<final>(attribute):
        MultiLine<public>:logic = external {}

        MaxLength<public>:int = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_slider<public>(t:type) := class<final>(editable):
        MinValue<public>:?t = external {}

        MaxValue<public>:?t = external {}

        SliderDelta<public>:?t = external {}

        SliderExponent<public>:?t = external {}

        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_number<public>(t:type) := class<final>(editable):
        MinValue<public>:?t = external {}

        MaxValue<public>:?t = external {}

        SpinBoxDelta<epic_internal>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_slider<public>(t:type) := class<final>(editable):
        ShowPreserveRatio<public>:logic = external {}

        ShowNormalize<epic_internal>:logic = external {}

        MinComponentValue<public>:?t = external {}

        MaxComponentValue<public>:?t = external {}

        SliderDelta<public>:?t = external {}

        SliderExponent<public>:?t = external {}

        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_vector_number<public>(t:type) := class<final>(editable):
        ShowPreserveRatio<public>:logic = external {}

        ShowNormalize<epic_internal>:logic = external {}

        MinComponentValue<public>:?t = external {}

        MaxComponentValue<public>:?t = external {}

        SpinBoxDelta<public>:?t = external {}

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable_container<public> := class<final>(editable):
        AllowReordering<public>:logic = external {}

    @attribscope_class
    @customattribhandler
    hide_in_editor<epic_internal> := class(attribute):


    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    short_tool_tip_attribute<epic_internal> := class(attribute):


    short_tool_tip<epic_internal>(ShortToolTip:string)<computes>:short_tool_tip_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    tool_tip_attribute<epic_internal> := class(attribute):


    tool_tip<epic_internal>(ToolTip:string)<computes>:tool_tip_attribute

    @attribscope_data
    @customattribhandler
    ui_max_attribute<epic_internal> := class(attribute):


    ui_max<epic_internal>(UIMax:string)<computes>:ui_max_attribute

    @attribscope_data
    @customattribhandler
    ui_min_attribute<epic_internal> := class(attribute):


    ui_min<epic_internal>(UIMin:string)<computes>:ui_min_attribute