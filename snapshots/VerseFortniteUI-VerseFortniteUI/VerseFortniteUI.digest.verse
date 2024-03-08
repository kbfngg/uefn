using {/Fortnite.com/Devices}
using {/Verse.org/Native}
using {/Verse.org/Colors}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/Fortnite.com/Playspaces}
using {/UnrealEngine.com/Temporary/UI}
# Module import path: /Fortnite.com/UI
UI<public> := module:
    # Button with text message common base class. Displays a button with a custom message string.
    text_button_base<native><public> := class<abstract><epic_internal>(widget):
        # The text to display to the user. Used only during initialization of the widget and not modified by SetText.
        DefaultText<localizes><native><public>:message = external {}

        # Subscribable event that fires when the button is clicked.
        OnClick<public>():listenable(widget_message) = external {}

        # Sets the text displayed in the widget.
        SetText<native><public>(InText:message):void

        # Gets the text currently in the widget.
        GetText<native><public>():string

    # Text button with big and loud styling applied.
    button_loud<native><public> := class<final>(text_button_base):


    # Text button with normal styling applied.
    button_regular<native><public> := class<final>(text_button_base):


    # Text button with quiet styling applied.
    button_quiet<native><public> := class<final>(text_button_base):


    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ShowElements()`.
    # Shows a set of HUD elements.
    (PlayerUI:player_ui).ShowHUDElements<native><public>(HUDElements:[]hud_element_identifier):void

    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().HideElements()`.
    # Hides a set of HUD elements.
    (PlayerUI:player_ui).HideHUDElements<native><public>(HUDElements:[]hud_element_identifier):void

    # Deprecated. This function affects all players. Please use `fort_playspace.GetHUDController().ResetElementVisibility()`.
    # Resets the visibility for a set of HUD elements.
    (PlayerUI:player_ui).ResetHUDElementVisibility<native><public>(HUDElements:[]hud_element_identifier):void

    # A HUD controller that allows for showing and hiding of HUD elements.
    fort_hud_controller<native><public> := interface<epic_internal>:
        # Shows a set of HUD elements.
        ShowElements<public>(HUDElements:[]hud_element_identifier):void

        # Hides a set of HUD elements.
        HideElements<public>(HUDElements:[]hud_element_identifier):void

        # Resets the visibility for a set of HUD elements.
        ResetElementVisibility<public>(HUDElements:[]hud_element_identifier):void

    # Get the `fort_hud_controller` for the current `fort_playspace`.
    (Playspace:fort_playspace).GetHUDController<native><public>():fort_hud_controller

    creative_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

        TreatAsChildTagCollection<override>:logic = external {}

    creative_hud_identifier_build_menu<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_crafting_resources<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_elimination_counter<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_equipped_item<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_level<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_supercharged<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_experience_ui<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_health<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_health_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_hud_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_interaction_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_map_prompts<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_mimimap<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_minimap<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_pickup_stream<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_player_count<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_player_inventory<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_round_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_round_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shield_numbers<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shileds<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_shields<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_storm_notifications<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_storm_timer<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    creative_hud_identifier_team_info<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

    player_hud_identifier_all<public> := class<final>(hud_element_gameplay_tag_identifier_base):
        InternalTag<override>:string = external {}

        TreatAsChildTagCollection<override>:logic = external {}

    hud_identifier_world_resource_wood<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_stone<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_metal<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_permanite<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_gold_currency<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_world_resource_ingredient<public> := class<final>(hud_element_world_resource_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_none<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_setup<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_warmup<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_bus_locked<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_bus_flying<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_forming<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_holding<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_storm_shrinking<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_final_countdown<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    hud_identifier_game_phase_end_game<epic_internal> := class<final>(hud_element_game_phase_identifier_base):
        InternalIndex<override>:int = external {}

    # Used to identify a HUD element.
    hud_element_identifier<native><public> := class<abstract><epic_internal>:


    # Base class for hud elements identified by a gameplay tag
    hud_element_gameplay_tag_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal string used to make a lookup of an FGameplayTag
        InternalTag<native><epic_internal>:string

        # If set to true the only child tags from the InternalTag will be included in the identifier
        TreatAsChildTagCollection<native><epic_internal>:logic = external {}

    # Base class for hud elements assosiated with world resource hud elements 
    hud_element_world_resource_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal index converted to EFortResourceType
        InternalIndex<native><epic_internal>:int

    # Base class for hud elements assosiated with game phase hud elements 
    hud_element_game_phase_identifier_base<native><epic_internal> := class<abstract><epic_internal>(hud_element_identifier):
        # Internal index converted to EAthenaGamePhaseStep
        InternalIndex<native><epic_internal>:int

    # Slider with a text value. Displays a slider, its progress bar and value.
    slider_regular<native><public> := class<final>(widget):
        # The value to display to the user. Used only during initialization of the widget and not modified by SetValue.
        DefaultValue<native><public>:float = external {}

        # The minimum value that the slider can haver. Used only during initialization of the widget and not modified by SetMinValue.
        DefaultMinValue<native><public>:float = external {}

        # The maximum value that the slider can haver. Used only during initialization of the widget and not modified by SetMaxValue.
        DefaultMaxValue<native><public>:float = external {}

        # The amount to adjust the value by, when using a controller or keyboard. Used only during initialization of the widget and not modified by SetStepSize.
        DefaultStepSize<native><public>:float = external {}

        # Sets the value of the slider, will clamp the value to be within the sliders minimum and maximum value.
        SetValue<native><public>(InValue:float):void

        # Gets the value of the slider.
        GetValue<native><public>():float

        # Sets the minimum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
        SetMinValue<native><public>(InMinValue:float):void

        # Gets the minimum value of the slider.
        GetMinValue<native><public>():float

        # Sets the maximum value of the slider, will enforce that the sliders maximum value is always larger than or equal to the minimum value.
        SetMaxValue<native><public>(InMaxValue:float):void

        # Gets the maximum value of the slider.
        GetMaxValue<native><public>():float

        # Sets the amount to adjust the value by, when using a controller or keyboard.
        SetStepSize<native><public>(InValue:float):void

        # Gets the amount to adjust the value by.
        GetStepSize<native><public>():float

        # Subscribable event that fires when the value of the slider has changed.
        OnValueChanged<public>():listenable(widget_message) = external {}

    # Text block widget. Displays text to the user.
    text_block<native><public> := class<final>(text_base):
        # The direction the shadow is cast. Used only during initialization of the widget and not modified by SetShadowOffset.
        DefaultShadowOffset<native><public>:?vector2 = external {}

        # The color of the shadow. Used only during initialization of the widget and not modified by SetShadowColor.
        DefaultShadowColor<native><public>:color = external {}

        # Sets the direction the shadow is cast.
        SetShadowOffset<native><public>(InShadowOffset:?vector2):void

        # Gets the direction the shadow is cast.
        GetShadowOffset<native><public>():?vector2

        # Sets the color of the shadow.
        SetShadowColor<native><public>(InColor:color):void

        # Gets the color of the shadow.
        GetShadowColor<native><public>():color

        # Sets the opacity of the shadow.
        SetShadowOpacity<native><public>(InOpacity:type{_X:float where 0.000000 <= _X, _X <= 1.000000}):void

        # Gets the opacity of the shadow.
        GetShadowOpacity<native><public>():type{_X:float where 0.000000 <= _X, _X <= 1.000000}

    # Editable text block widget common base class. Allows the user to type in a custom text.
    editable_text_base<native><epic_internal> := class<abstract>(text_base):
        # Called whenever the text is committed. This happens when the user presses enter or the text box loses focus.
        OnTextCommitted<public>():listenable(widget_message) = external {}

    # Editable text widget. Allows the user to type in a custom text. Only permits a single line of text to be entered.
    editable_text<native><epic_internal> := class<final>(editable_text_base):


    # Editable text widget contained in a box. Allows the user to type in a custom text. Only permits a single line of text to be entered.
    editable_text_box<native><epic_internal> := class<final>(editable_text_base):


    @import_as("/Script/VerseFortniteUI.UVerseFortniteWidgetViewmodel")
    # Verse interface to native `widget viewmodel`.
    fortnite_widget_viewmodel<native><epic_internal> := class<abstract>:


    function_parameter_fortnite_widget_viewmodel<native><epic_internal> := class<computes>(function_parameter_base):
        Value<native><epic_internal>:?fortnite_widget_viewmodel