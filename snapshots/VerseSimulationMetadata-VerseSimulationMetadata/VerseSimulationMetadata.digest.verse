# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    category_attribute<epic_internal> := class(attribute):


    category<epic_internal>(Category:[]char)<computes>:category_attribute

    @attribscope_data
    @customattribhandler
    clamp_max_attribute<epic_internal> := class(attribute):


    clamp_max<epic_internal>(ClampMax:[]char)<computes>:clamp_max_attribute

    @attribscope_data
    @customattribhandler
    clamp_min_attribute<epic_internal> := class(attribute):


    clamp_min<epic_internal>(ClampMin:[]char)<computes>:clamp_min_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_name_attribute<epic_internal> := class(attribute):


    display_name<epic_internal>(DisplayName:[]char)<computes>:display_name_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    display_priority_attribute<epic_internal> := class(attribute):


    display_priority<epic_internal>(DisplayPriority:[]char)<computes>:display_priority_attribute

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class(attribute):
        ToolTip<localizes><epic_internal>:message = external {}

        ShortToolTip<localizes><epic_internal>:message = external {}

        ShowThumbnail<epic_internal>:logic = external {}

        Categories<epic_internal>:[]message = external {}

        Widget<epic_internal>:editable_widget = external {}

    editable_widget<epic_internal> := class<epic_internal>:


    editable_text_box<epic_internal> := class<final>(editable_widget):
        MultiLine<public>:logic = external {}

        MaxLength<public>:int = external {}

    editable_slider<epic_internal>(t:type)<computes> := class<final>(editable_widget):
        MinValue<public>:?t = external {}

        MaxValue<public>:?t = external {}

        SliderDelta<public>:?t = external {}

        Exponent<public>:?t = external {}

        MouseLinearDeltaSensitivity<public>:float = external {}

        MouseShiftMovePixelPerDelta<public>:float = external {}

    editable_number<epic_internal>(t:type)<computes> := class<final>(editable_widget):
        MinValue<public>:?t = external {}

        MaxValue<public>:?t = external {}

        SpinBoxDelta<public>:?t = external {}

    editable_vector<epic_internal>(t:type)<computes> := class<final>(editable_widget):
        PreserveRatio<public>:logic = external {}

        Normalize<public>:logic = external {}

        MinComponentValue<public>:?t = external {}

        MaxComponentValue<public>:?t = external {}

        SpinBoxDelta<public>:?t = external {}

    editable_container<epic_internal> := class<final>(editable_widget):
        AllowReordering<public>:logic = external {}

    @attribscope_class
    @customattribhandler
    hide_in_editor<epic_internal> := class(attribute):


    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    short_tool_tip_attribute<epic_internal> := class(attribute):


    short_tool_tip<epic_internal>(ShortToolTip:[]char)<computes>:short_tool_tip_attribute

    @attribscope_class
    @attribscope_data
    @attribscope_function
    @customattribhandler
    tool_tip_attribute<epic_internal> := class(attribute):


    tool_tip<epic_internal>(ToolTip:[]char)<computes>:tool_tip_attribute

    @attribscope_data
    @customattribhandler
    ui_max_attribute<epic_internal> := class(attribute):


    ui_max<epic_internal>(UIMax:[]char)<computes>:ui_max_attribute

    @attribscope_data
    @customattribhandler
    ui_min_attribute<epic_internal> := class(attribute):


    ui_min<epic_internal>(UIMin:[]char)<computes>:ui_min_attribute