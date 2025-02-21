# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-34.00-CL-40085084
#################################################

# Module import path: /Verse.org/Assets
Assets<public> := module {
  animation_sequence<native><public> := class<computes><final><epic_internal> {}

  material<native><public> := class<epic_internal> {}

  mesh<native><public> := class<computes><epic_internal> {}

  particle_system<native><public> := class<computes><final><epic_internal> {}

  sound_wave<native><public> := class<computes><final><epic_internal> {}

  texture<native><public> := class<computes><final><epic_internal> {}
}

using { /Verse.org/Simulation }
# Module import path: /Verse.org/Colors
Colors<public> := module {
  # Makes an ACES 2065-1 `color` from `Hue`, `Saturation`, and `Value` components.
  # Components use the HSV color model in the sRGB color space. Expected ranges:
  #  * `0.0 <= Hue <= 360.0`
  #  * `0.0 <= Saturation <= 1.0`
  #  * `0.0 <= Value <= 1.0`
  # Values out of expected ranges will undergo range reduction and conversion.
  MakeColorFromHSV<native><public>(Hue: float, Saturation: float, Value: float)<converges>: color

  # Makes an ACES 2065-1 `color` from a CSS-style sRGB `hexString`. Supported formats are:
  #  * RGB
  #  * RRGGBB
  #  * RRGGBBAA
  #  * #RGB
  #  * #RRGGBB
  #  * #RRGGBBAA
  # An invalid hex string will return `Black`.
  MakeColorFromHex<native><public>(hexString: string)<converges>: color

  # Makes an ACES 2065-1 `color` from sRGB components `Red`, `Green`, and `Blue`.
  # Normal sRGB component values are between `0.0` and `1.0`, but this can handle larger values.
  MakeColorFromSRGB<native><public>((local:)Red: float, (local:)Green: float, (local:)Blue: float)<converges>: color

  # Makes an ACES 2065-1 `color` from the integer sRGB components `Red`, `Green`, and `Blue`.
  # Valid sRGB component values are between '0' and '255', inclusive.
  MakeColorFromSRGBValues<native><public>((local:)Red: int, (local:)Green: int, (local:)Blue: int)<converges>: color

  # Makes an ACES 2065-1 `color` from the chromaticity of a blackbody radiator at `Temperature` Kelvin.
  # `Temperature` is clamped such that `0 <= Temperature`.
  MakeColorFromTemperature<native><public>(Temperature: float)<converges>: color

  # Makes an HSV `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB and applying the HSV color model.
  MakeHSVFromColor<native><public>(InColor: color): tuple(float, float, float)

  # Makes an sRGB `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB.
  MakeSRGBFromColor<native><public>(InColor: color)<converges>: tuple(float, float, float)

  # Module import path: /Verse.org/Colors/NamedColors
  # Color presets from CSS Color Module 3 Extended color keywords.
  NamedColors<public> := module {
    AliceBlue<public>: color = external {}

    AntiqueWhite<public>: color = external {}

    Aqua<public>: color = external {}

    Aquamarine<public>: color = external {}

    Azure<public>: color = external {}

    Beige<public>: color = external {}

    Bisque<public>: color = external {}

    Black<public>: color = external {}

    BlanchedAlmond<public>: color = external {}

    Blue<public>: color = external {}

    BlueViolet<public>: color = external {}

    Brown<public>: color = external {}

    Burlywood<public>: color = external {}

    CadetBlue<public>: color = external {}

    Chartreuse<public>: color = external {}

    Chocolate<public>: color = external {}

    Coral<public>: color = external {}

    CornflowerBlue<public>: color = external {}

    Cornsilk<public>: color = external {}

    Crimson<public>: color = external {}

    Cyan<public>: color = external {}

    DarkBlue<public>: color = external {}

    DarkCyan<public>: color = external {}

    DarkGoldenrod<public>: color = external {}

    DarkGray<public>: color = external {}

    DarkGreen<public>: color = external {}

    DarkGrey<public>: color = external {}

    DarkKhaki<public>: color = external {}

    DarkMagenta<public>: color = external {}

    DarkOliveGreen<public>: color = external {}

    DarkOrange<public>: color = external {}

    DarkOrchid<public>: color = external {}

    DarkRed<public>: color = external {}

    DarkSalmon<public>: color = external {}

    DarkSeaGreen<public>: color = external {}

    DarkSlateBlue<public>: color = external {}

    DarkSlateGray<public>: color = external {}

    DarkSlateGrey<public>: color = external {}

    DarkTurquoise<public>: color = external {}

    DarkViolet<public>: color = external {}

    DeepPink<public>: color = external {}

    DeepSkyBlue<public>: color = external {}

    DimGray<public>: color = external {}

    DimGrey<public>: color = external {}

    DodgerBlue<public>: color = external {}

    Firebrick<public>: color = external {}

    FloralWhite<public>: color = external {}

    ForestGreen<public>: color = external {}

    Fuchsia<public>: color = external {}

    Gainsboro<public>: color = external {}

    GhostWhite<public>: color = external {}

    Gold<public>: color = external {}

    Goldenrod<public>: color = external {}

    Gray<public>: color = external {}

    Green<public>: color = external {}

    GreenYellow<public>: color = external {}

    Grey<public>: color = external {}

    Honeydew<public>: color = external {}

    Hotpink<public>: color = external {}

    IndianRed<public>: color = external {}

    Indigo<public>: color = external {}

    Ivory<public>: color = external {}

    Khaki<public>: color = external {}

    Lavender<public>: color = external {}

    LavenderBlush<public>: color = external {}

    LawnGreen<public>: color = external {}

    LemonChiffon<public>: color = external {}

    LightBlue<public>: color = external {}

    LightCoral<public>: color = external {}

    LightCyan<public>: color = external {}

    LightGoldenrodYellow<public>: color = external {}

    LightGray<public>: color = external {}

    LightGreen<public>: color = external {}

    LightGrey<public>: color = external {}

    LightPink<public>: color = external {}

    LightSalmon<public>: color = external {}

    LightSeaGreen<public>: color = external {}

    LightSkyBlue<public>: color = external {}

    LightSlateGray<public>: color = external {}

    LightSlateGrey<public>: color = external {}

    LightSteelBlue<public>: color = external {}

    LightYellow<public>: color = external {}

    Lime<public>: color = external {}

    LimeGreen<public>: color = external {}

    Linen<public>: color = external {}

    Magenta<public>: color = external {}

    Maroon<public>: color = external {}

    MediumAquamarine<public>: color = external {}

    MediumBlue<public>: color = external {}

    MediumOrchid<public>: color = external {}

    MediumPurple<public>: color = external {}

    MediumSeaGreen<public>: color = external {}

    MediumSlateBlue<public>: color = external {}

    MediumSpringGreen<public>: color = external {}

    MediumTurquoise<public>: color = external {}

    MediumVioletRed<public>: color = external {}

    MidnightBlue<public>: color = external {}

    MintCream<public>: color = external {}

    MistyRose<public>: color = external {}

    Moccasin<public>: color = external {}

    NavajoWhite<public>: color = external {}

    Navy<public>: color = external {}

    OldLace<public>: color = external {}

    Olive<public>: color = external {}

    OliveDrab<public>: color = external {}

    Orange<public>: color = external {}

    OrangeRed<public>: color = external {}

    Orchid<public>: color = external {}

    PaleGoldenrod<public>: color = external {}

    PaleGreen<public>: color = external {}

    PaleTurquoise<public>: color = external {}

    PaleVioletred<public>: color = external {}

    PapayaWhip<public>: color = external {}

    PeachPuff<public>: color = external {}

    Peru<public>: color = external {}

    Pink<public>: color = external {}

    Plum<public>: color = external {}

    PowderBlue<public>: color = external {}

    Purple<public>: color = external {}

    Red<public>: color = external {}

    RosyBrown<public>: color = external {}

    RoyalBlue<public>: color = external {}

    SaddleBrown<public>: color = external {}

    Salmon<public>: color = external {}

    SandyBrown<public>: color = external {}

    SeaGreen<public>: color = external {}

    SeaShell<public>: color = external {}

    Sienna<public>: color = external {}

    Silver<public>: color = external {}

    SkyBlue<public>: color = external {}

    SlateBlue<public>: color = external {}

    SlateGray<public>: color = external {}

    SlateGrey<public>: color = external {}

    Snow<public>: color = external {}

    SpringGreen<public>: color = external {}

    SteelBlue<public>: color = external {}

    (/Verse.org/Colors/NamedColors:)Tan<public>: color = external {}

    Teal<public>: color = external {}

    Thistle<public>: color = external {}

    Tomato<public>: color = external {}

    Turquoise<public>: color = external {}

    Violet<public>: color = external {}

    Wheat<public>: color = external {}

    White<public>: color = external {}

    WhiteSmoke<public>: color = external {}

    Yellow<public>: color = external {}

    YellowGreen<public>: color = external {}
  }

  # Represents colors as RGB triples in the ACES 2065-1 color space.
  # Component values are linear (i.e. `*gamma* = 1.0`).
  color<native><public> := struct<concrete><computes><persistable> {
    @editable
    # Blue component of this `color`.
    B<native><public>: float = external {}

    @editable
    # Green component of this `color`.
    G<native><public>: float = external {}

    @editable
    # Red component of this `color`.
    R<native><public>: float = external {}
  }

  # Makes an ACES 2065-1 `color` from the component-wise product of `c0` and `c1`.
  (/Verse.org/Colors:)operator'*'<native><public>(c0: color, c1: color)<converges>: color

  # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
  (/Verse.org/Colors:)operator'*'<native><public>(c: color, factor: float)<converges>: color

  # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
  (/Verse.org/Colors:)operator'*'<native><public>(c: color, factor: int)<converges>: color

  # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
  (/Verse.org/Colors:)operator'*'<native><public>(factor: float, c: color)<converges>: color

  # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
  (/Verse.org/Colors:)operator'*'<native><public>(factor: int, c: color)<converges>: color

  # Makes an ACES 2065-1 `color` from the component-wise sum of `c0` and `c1`.
  (/Verse.org/Colors:)operator'+'<native><public>(c0: color, c1: color)<converges>: color

  # Makes an ACES 2065-1 `color` from the component-wise difference of `c0` and `c1`.
  (/Verse.org/Colors:)operator'-'<native><public>(c0: color, c1: color)<converges>: color

  # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
  (/Verse.org/Colors:)operator'/'<native><public>(c: color, factor: float)<converges><decides>: color

  # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
  (/Verse.org/Colors:)operator'/'<native><public>(c: color, factor: int)<converges><decides>: color
}

# Module import path: /Verse.org/Concurrency
Concurrency<public> := module {
  awaitable<public>() := awaitable(void)

  # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
  awaitable<public>(payload: type) := interface {
    # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
    Await<public>()<suspends>: payload
  }

  task<native><public>(t: type) := class<abstract><final>(awaitable(t)) {
    Await<native><override>()<suspends>: t
  }
}

# Module import path: /Verse.org/Native
Native<public> := module {
  import_as<constructor><epic_internal>(ImportName: string)<computes>: import_as_attribute = external {}

  @attribscope_class
  @attribscope_struct
  @attribscope_enum
  import_as_attribute<epic_internal> := class<computes><internal>(attribute) {}
}

using { /Verse.org/Concurrency }
# Module import path: /Verse.org/Random
Random<public> := module {
  # Returns a random `float` between `Low` and `High`, inclusive.
  GetRandomFloat<native><public>(Low: float, High: float)<transacts>: float

  # Returns a uniformly distributed, cryptographically-secure random `int` between `Low` and `High`, inclusive. (`Low` and `High` can be out of order.)
  GetRandomInt<native><public>(Low: int, High: int)<transacts>: int

  # Makes an `array` with the same elements as `Input` shuffled in a random order.
  Shuffle<public>(Input: []t where t: type)<transacts>: []t = external {}
}

Simulation<public> := module {
  # Returns the `session` corresponding to the current round.  The result can be used with `weak_map` to implement global variables.
  # Note: may be changed in a future release to return a single instance per game. Round-local behavior should not be relied upon.
  GetSession<native><public>()<computes><reads>: session

  # Get the seconds that have elapsed since the world began simulating
  GetSimulationElapsedTime<native><public>()<transacts>: float

  (/Verse.org/Simulation:)MakeLocalizableValue<epic_internal>(Agent: agent): localizable_agent = external {}

  # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.
  # Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.
  # Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.
  # Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
  Sleep<native><public>(Seconds: float)<suspends>: void

  # Module import path: /Verse.org/Simulation/Tags
  Tags<public> := module {
    # A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor.
    tag<native><public> := class<abstract> {}

    # Advanced tag search criteria
    tag_search_criteria<native><public> := class {
      # Tags that may NOT be on the object. All items with these tags are excluded from the search.
      ExclusionTags<native><public>: []tag = external {}

      # Tags that are used if no required tags are specified. These are treated as if any of them will do.
      PreferredTags<native><public>: []tag = external {}

      # Tags required to be on the object.
      RequiredTags<native><public>: []tag = external {}

      # Flag to request sorting the results by tag.
      SortType<native><public>: tag_search_sort_type = external {}
    }

    tag_search_sort_type<native><public> := enum {
      Sorted

      Unsorted
    }

    # A queryable collection of gameplay tags.
    tag_view<native><public> := interface<epic_internal> {
      # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
      Has<public>(TagToCheck: tag)<computes><decides><reads>: void

      # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
      HasAll<public>(InTags: []tag)<computes><decides><reads>: void

      # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
      HasAny<public>(InTags: []tag)<computes><decides><reads>: void
    }
  }

  agent<native><public> := class<unique><epic_internal> {}

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable<public> := class<computes>(attribute) {
    # The categories displayed in the editor.
    Categories<public>: []message = external {}

    # The tooltip displayed in the editor.
    ToolTip<public>: message = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_container<public> := class<final><computes>(editable) {
    # If true, allows reordering of the container elements in the editor.
    AllowReordering<public>: logic = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_number<public>(t: type) := class<final><computes>(editable) {
    # The maximum value the editor allows.
    MaxValue<public>: ?t = external {}

    # The minimum value the editor allows.
    MinValue<public>: ?t = external {}

    # Snap the spinbox to the nearest delta.
    SpinBoxDelta<public>: ?t = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_slider<public>(t: type) := class<final><computes>(editable) {
    # The maximum value of the editor slider.
    MaxValue<public>: ?t = external {}

    # The minimum value of the editor slider.
    MinValue<public>: ?t = external {}

    # Used to change how sensitive the field value is when moving the slider via mouse cursor.
    MouseLinearDeltaSensitivity<public>: float = external {}

    MouseShiftMovePixelPerDelta<public>: float = external {}

    # The amount the slider moves for each step.
    SliderDelta<public>: ?t = external {}

    # Used to scale a slider exponentially. Common values are found within the range of 1-20.
    SliderExponent<public>: ?t = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_text_box<public> := class<final><computes>(editable) {
    # The maximum length of the text.
    MaxLength<public>: int = external {}

    # True if the editor text box should support multiple lines.
    MultiLine<public>: logic = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_vector_number<public>(t: type) := class<final><computes>(editable) {
    # The maximum value allowed for each vector element.
    MaxComponentValue<public>: ?t = external {}

    # The minimum value allowed for each vector element.
    MinComponentValue<public>: ?t = external {}

    # Show the button that allows normalizing the vector.
    ShowNormalize<public>: logic = external {}

    # Show the button that allows locking the vector aspect ratio.
    ShowPreserveRatio<public>: logic = external {}

    # Snap the spinbox to the nearest delta.
    SpinBoxDelta<public>: ?t = external {}
  }

  @attribscope_class
  @attribscope_struct
  @attribscope_data
  @customattribhandler
  editable_vector_slider<public>(t: type) := class<final><computes>(editable) {
    # The maximum value allowed for each vector element.
    MaxComponentValue<public>: ?t = external {}

    # The minimum value allowed for each vector element.
    MinComponentValue<public>: ?t = external {}

    # Used to change how sensitive the field value is when moving the slider via mouse cursor.
    MouseLinearDeltaSensitivity<public>: float = external {}

    MouseShiftMovePixelPerDelta<public>: float = external {}

    # Show the button that allows normalizing the vector.
    ShowNormalize<public>: logic = external {}

    # Show the button that allows locking the vector aspect ratio.
    ShowPreserveRatio<public>: logic = external {}

    # The amount the slider moves for each step.
    SliderDelta<public>: ?t = external {}

    # Used to scale a slider exponentially. Common values are found within the range of 1-20.
    SliderExponent<public>: ?t = external {}
  }

  localizable_agent<native><epic_internal> := class(localizable_value) {}

  player<native><public> := class<unique><persistent><module_scoped_var_weak_map_key><epic_internal>(agent) {
    # Succeeds when this `player` may be used as a module-scoped `var` `weak_map` key. This coincides with the corresponding player having joined the game and not yet left. Using a `player` as a module-scope `var` `weak_map` key when this method fails results in a runtime error.
    IsActive<native><public>()<computes><decides><reads>: void
  }

  # Type for which there is a single instance per round.  Use `GetSession` to get the current round's `session` instance. May be used with `weak_map` to implement global variables.
  # Note: may be changed in a future release to a single instance per game. Round-local behavior should not be relied upon.
  session<native><public> := class<unique><module_scoped_var_weak_map_key><epic_internal> {}

  team<native><public> := class<unique><epic_internal> {}
}

using { /Verse.org/Native }
# Module import path: /Verse.org/SpatialMath
SpatialMath<public> := module {
  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Forward axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyLocalRotationForward<public>(AngleRadians: float)<computes><reads>: rotation = external {}

  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Right axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyLocalRotationRight<public>(AngleRadians: float)<computes><reads>: rotation = external {}

  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Up axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyLocalRotationUp<public>(AngleRadians: float)<computes><reads>: rotation = external {}

  @experimental
  # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Right axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyPitch<native><public>(PitchUpRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +Forward axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyRoll<native><public>(RollClockwiseRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Forward axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyWorldRotationForward<native><public>(AngleRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Right axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyWorldRotationRight<native><public>(AngleRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Up axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyWorldRotationUp<native><public>(AngleRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Up axis to `InitialRotation`.
  (InitialRotation: rotation).ApplyYaw<native><public>(YawRightRadians: float)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
  (InitialRotation: rotation).RotateBy<native><public>(AdditionalRotation: rotation)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
  (InitialRotation: rotation).UnrotateBy<native><public>(RotationToRemove: rotation)<computes><reads>: rotation

  @experimental
  # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
  (Rotation: rotation).(/Verse.org/SpatialMath:)IsFinite<native><public>()<converges><decides>: rotation

  @experimental
  # Returns the radians of left-handed `rotation` around the axis of `rotation`. See also `GetAxis`.
  (Rotation: rotation).GetAngle<native><public>()<computes><reads>: float

  @experimental
  # Makes a `vector3` from the axis of `rotation`.
  # If `rotation` is nearly identity, this will return the +Forward axis. See also `GetAngle`.
  (Rotation: rotation).GetAxis<native><public>()<computes><reads>: vector3

  @experimental
  # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
  # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=1.0, Right:=0.0, Up:=0.0})`.
  (Rotation: rotation).GetLocalForward<public>()<computes><reads>: vector3 = external {}

  @experimental
  # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
  # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=0.0, Right:=1.0, Up:=0.0})`.
  (Rotation: rotation).GetLocalRight<public>()<computes><reads>: vector3 = external {}

  @experimental
  # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
  # This is equivalent to: `RotateVector(Rotation, vector3{Forward:=0.0, Right:=0.0, Up:=1.0})`.
  (Rotation: rotation).GetLocalUp<public>()<computes><reads>: vector3 = external {}

  @experimental
  # Makes an `[]float` with three elements:
  #  * *yaw* degrees of `rotation`
  #  * *pitch* degrees of `rotation`
  #  * *roll* degrees of `rotation`
  # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
  (Rotation: rotation).GetYawPitchRollDegrees<native><public>()<computes><reads>: []float

  @experimental
  # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
  (Rotation: rotation).Invert<native><public>()<computes><reads>: rotation

  @experimental
  # Makes a `vector3` by applying `Rotation` to `Vector`.
  (Rotation: rotation).RotateVector<native><public>(Vector: vector3)<computes><reads>: vector3

  @experimental
  # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
  (Rotation: rotation).UnrotateVector<native><public>(Vector: vector3)<computes><reads>: vector3

  @experimental
  # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
  (V: vector3).(/Verse.org/SpatialMath:)IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

  @experimental
  # Returns `V` if all components are finite.
  # Fails if any of the components are not finite.
  (V: vector3).(/Verse.org/SpatialMath:)IsFinite<public>()<computes><decides>: vector3 = external {}

  @experimental
  # Returns the length of `V`.
  (V: vector3).Length<public>()<computes><reads>: float = external {}

  @experimental
  # Returns the length of `V` as if `V.Up = 0.0`.
  (V: vector3).LengthForwardRight<public>()<computes><reads>: float = external {}

  @experimental
  # Returns the squared length of `V`.
  (V: vector3).LengthSquared<public>()<computes>: float = external {}

  @experimental
  # Returns the squared length of `V` as if `V.Up = 0.0`.
  (V: vector3).LengthSquaredForwardRight<public>()<computes><reads>: float = external {}

  @experimental
  # Makes a unit length `vector3` pointing in the same direction of `V`.
  # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
  (V: vector3).MakeUnitVector<native><public>()<computes><decides><reads>: vector3

  @experimental
  # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
  AngularDistance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

  @experimental
  # Returns the left-handed cross product of `V1` and `V2`.
  CrossProductLeftHanded<native><public>(V1: vector3, V2: vector3)<computes><reads>: vector3

  @experimental
  # Returns radians from `Degrees`.
  DegreesToRadians<public>(Degrees: float)<computes><reads>: float = external {}

  @experimental
  # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
  #  * `0.0`, representing equivalent rotations and
  #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
  Distance<native><public>(Rotation1: rotation, Rotation2: rotation)<computes><reads>: float

  @experimental
  # Returns the Euclidean distance between `V1` and `V2`.
  Distance<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

  @experimental
  # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Up`.
  DistanceForwardRight<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

  @experimental
  # Returns the squared Euclidean distance between `V1` and `V2`.
  DistanceSquared<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

  @experimental
  # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Up`.
  DistanceSquaredForwardRight<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

  @experimental
  # Returns the dot product of `V1` and `V2`.
  DotProduct<native><public>(V1: vector3, V2: vector3)<computes><reads>: float

  @experimental
  # Makes the identity `rotation`.
  IdentityRotation<native><public>()<converges>: rotation

  @experimental
  # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
  (/Verse.org/SpatialMath:)IsAlmostEqual<public>(V1: vector3, V2: vector3, AbsoluteTolerance: float)<computes><decides>: void = external {}

  @experimental
  # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
  # Returns `From*(1 - Parameter) + To*Parameter`.
  (/Verse.org/SpatialMath:)Lerp<public>(From: vector3, To: vector3, Parameter: float)<computes><reads>: vector3 = external {}

  @experimental
  # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by
  # the Euler angle components in `RotationB` and ensures the returned value is normalized.
  MakeComponentWiseDeltaRotation<native><public>(RotationA: rotation, RotationB: rotation)<computes><reads>: rotation

  @experimental
  # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
  MakeRotation<native><public>(Axis: vector3, AngleRadians: float)<converges><reads>: rotation

  @experimental
  # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
  #  * first a *yaw* about the Up axis with a positive angle indicating a clockwise rotation when viewed from above,
  #  * then a *pitch* about the new Right axis with a positive angle indicating 'nose up',
  #  * followed by a *roll* about the new Forward axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
  # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
  MakeRotationFromYawPitchRollDegrees<native><public>(
    YawRightDegrees: float,
    PitchUpDegrees: float,
    RollClockwiseDegrees: float
  )<converges><reads>: rotation

  @experimental
  # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
  # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
  # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
  MakeShortestRotationBetween<native><public>(
    InitialRotation: rotation,
    FinalRotation: rotation
  )<computes><reads>: rotation

  @experimental
  # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
  # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
  # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
  MakeShortestRotationBetween<native><public>(InitialVector: vector3, FinalVector: vector3)<computes><reads>: rotation

  @experimental
  # Returns degrees from `Radians`.
  RadiansToDegrees<public>(Radians: float)<computes><reads>: float = external {}

  @experimental
  # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
  # Fails if `not SurfaceNormal.MakeUnitVector[]`.
  ReflectVector<native><public>(Direction: vector3, SurfaceNormal: vector3)<computes><decides><reads>: vector3

  @experimental
  # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
  Slerp<native><public>(
    InitialRotation: rotation,
    FinalRotation: rotation,
    Parameter: float
  )<computes><decides><reads>: rotation

  @experimental
  # Makes a `string` representation of `InTransform` where the result is on the form.
  # `"{Translation = {ToString(`InTransform.Translation`)}, Rotation = {ToString(`InTransform.Rotation`)}, Scale = {ToString(`InTransform.Scale`)}}".
  (/Verse.org/SpatialMath:)ToString<native><public>(InTransform: transform)<computes><reads>: string

  @experimental
  # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
  # `ToString(MakeRotation(vector3{Forward:=1.0, Right:=0.0, Up:=0.0}, PiFloat/2.0))` produces the string: `"{Axis = {x=1.000000,y=0.000000,z=0.000000}, Angle = 90.000000}"`.
  (/Verse.org/SpatialMath:)ToString<native><public>(Rotation: rotation)<computes><reads>: string

  @experimental
  # Makes a `string` representation of `V`.
  (/Verse.org/SpatialMath:)ToString<native><public>(V: vector3)<computes><reads>: string

  @experimental
  # Makes a `vector3` by applying `InTransform` to `InVector`.
  TransformVector<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

  @experimental
  # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
  TransformVectorNoScale<native><public>(InTransform: transform, InVector: vector3)<computes><reads>: vector3

  @experimental
  # Makes a `vector3` by multiplying the components of `Right` by `Left`.
  (/Verse.org/SpatialMath:)operator'*'<public>(Left: float, Right: vector3)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by multiplying the components of `Left` by `Right`.
  (/Verse.org/SpatialMath:)operator'*'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
  (/Verse.org/SpatialMath:)operator'*'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by component-wise addition of `Left` and `Right`.
  (/Verse.org/SpatialMath:)operator'+'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
  (/Verse.org/SpatialMath:)operator'-'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by dividing the components of `Left` by `Right`.
  (/Verse.org/SpatialMath:)operator'/'<public>(Left: vector3, Right: float)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by component-wise division of `Left` by `Right`.
  (/Verse.org/SpatialMath:)operator'/'<public>(Left: vector3, Right: vector3)<computes>: vector3 = external {}

  @experimental
  # Makes a `vector3` by inverting the signs of `Operand`.
  (/Verse.org/SpatialMath:)prefix'-'<public>(Operand: vector3)<computes>: vector3 = external {}

  @import_as("/*.FVRotation")
  rotation<native><public> := struct<concrete> {}

  @experimental
  @import_as("/*.FVTransform")
  # A combination of scale, rotation, and translation, applied in that order.
  transform<native><public> := struct<concrete><computes> {
    @editable
    # The rotation of this `transform`.
    Rotation<native><public>: rotation = external {}

    @editable
    # The scale of this `transform`.
    Scale<native><public>: vector3 = external {}

    @editable
    # The location of this `transform`.
    Translation<native><public>: vector3 = external {}
  }

  @experimental
  @import_as("/*.FVVector3")
  # 3-dimensional vector with `float` components.
  vector3<native><public> := struct<concrete><computes><persistable> {
    @editable
    # The Forward (was X) component of this vector.
    Forward<native><public>: float = external {}

    @editable
    # The Right (was Y) component of this vector.
    Right<native><public>: float = external {}

    @editable
    # The Up (was Z) component of this vector.
    Up<native><public>: float = external {}
  }
}

Verse<public> := module {
  # Returns the first index whose element in `Input` equals `ElementToFind`.
  # Fails if ElementToFind does not exist in the array.
  (Input: []t where t: subtype(comparable)).Find<public>(ElementToFind: t)<computes><decides>: int = external {}

  # Makes an `array` by removing all elements that equal `ElementToRemove` from `Input`.
  (Input: []t where t: subtype(comparable)).RemoveAllElements<public>(ElementToRemove: t)<computes>: []t = external {}

  # Makes an `array` by removing the element at the lowest index that equals `ElementToRemove` from `Input`.
  # Fails if `Input` did not contain any instances of `ElementToRemove`.
  (Input: []t where t: subtype(comparable)).RemoveFirstElement<public>(ElementToRemove: t)<computes><decides>: []t = external {}

  # Makes an `array` by replacing all ranges of elements that equal `ElementsToReplace` with `Replacement` in `Input`.
  # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest index is replaced.
  (Input: []t where t: subtype(comparable)).ReplaceAll<public>(
    ElementsToReplace: []t,
    Replacement: []t
  )<transacts>: []t = external {}

  # Makes an `array` by replacing all elements that equal `ElementToReplace` with `ElementToReplaceWith` in `Input`.
  (Input: []t where t: subtype(comparable)).ReplaceAllElements<public>(
    ElementToReplace: t,
    ElementToReplaceWith: t
  )<computes>: []t = external {}

  # Makes an `array` by replacing the element at the lowest index that equals `ElementToReplace` with `ElementToReplaceWith` in `Input`.
  # Fails if `Input` did not contain any instances of `ElementToReplace`.
  (Input: []t where t: subtype(comparable)).ReplaceFirstElement<public>(
    ElementToReplace: t,
    ElementToReplaceWith: t
  )<computes><decides>: []t = external {}

  # Makes an `array` by inserting `ElementsToInsert` into `Input` such that the first element of `ElementsToInsert` is at `InsertionIndex`.
  (Input: []t where t: type).Insert<public>(
    InsertionIndex: int,
    ElementsToInsert: []t
  )<computes><decides>: []t = external {}

  # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
  # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
  (Input: []t where t: type).Remove<public>(StartIndex: int, StopIndex: int)<computes><decides>: []t = external {}

  # Makes an `array` by removing the element at `IndexToRemove` from `Input`.
  # Succeeds if `0 <= IndexToRemove <= Input.Length-1`.
  (Input: []t where t: type).RemoveElement<public>(IndexToRemove: int)<computes><decides>: []t = external {}

  # Makes an `array` by replacing the element at `IndexToReplace` with `ElementToReplaceWith` in `Input`.
  # Succeeds if `0 <= IndexToReplace <= Input.Length-1`.
  (Input: []t where t: type).ReplaceElement<public>(
    IndexToReplace: int,
    ElementToReplaceWith: t
  )<computes><decides>: []t = external {}

  # Makes an `array` containing `Input`'s elements from `StartIndex` to `Input.Length-1`.
  # Succeeds if `0 <= StartIndex <= Input.Length`.
  (Input: []t where t: type).Slice<public>(StartIndex: int)<computes><decides>: []t = external {}

  # Makes an `array` containing `Input`'s elements from `StartIndex` to `StopIndex-1`.
  # Fails unless `0 <= StartIndex <= StopIndex <= Input.Length`.
  (Input: []t where t: type).Slice<public>(StartIndex: int, StopIndex: int)<computes><decides>: []t = external {}

  # Succeeds if `Val` is within `AbsoluteTolerance` of `0.0`.
  (Val: float).IsAlmostZero<public>(AbsoluteTolerance: float)<computes><decides>: void = external {}

  # Returns `X` if `X` is finite.
  # Fails if `X` is one of:`
  #  * `+Inf`
  #  * `-Inf`
  #  * `NaN`
  (X: float).IsFinite<public>()<computes><decides>: float = external {}

  @rtfm_always_open
  # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
  ArCosh<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
  ArSinh<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
  ArTanh<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the inverse cosine (arccosine) of `X` if `-1.0 <= X <= 1.0`.
  ArcCos<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the inverse sine (arcsine) of `X` if `-1.0 <= X <= 1.0`.
  ArcSin<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the inverse tangent (arctangent) of `X` such that:`-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
  ArcTan<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the angle in radians at the origin between a ray pointing to `(X, Y)` and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
  # Returns 0.0 if `X=0.0 and Y=0.0`.
  ArcTan<native><public>(Y: float, X: float)<computes><reads>: float

  # Returns the smallest `int` that is greater than or equal to `Val`.
  # Fails if `not IsFinite(Val)`.
  Ceil<native><public>(Val: float)<computes><decides><reads>: int

  @rtfm_always_open
  # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
  # Returns the median of `Val`, `A`, and `B`.
  Clamp<native><public>(Val: int, A: int, B: int)<computes>: int

  # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
  # Returns the median of `Val`, `A`, and `B`, such that comparisons with `NaN` operate as if `NaN > +Inf`.
  Clamp<public>(Val: float, A: float, B: float)<computes>: float = external {}

  # Makes a flattened `array` by concatenating the elements of `Arrays`.
  Concatenate<public>(Arrays: [][]t where t: type)<computes>: []t = external {}

  @rtfm_always_open
  # Returns the cosine of `X` if `IsFinite(X)`.
  # Returns `NaN` if `not IsFinite(X)
  Cos<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the hyperbolic cosine of `X`.
  Cosh<native><public>(X: float)<computes><reads>: float

  # Halts the Verse runtime with error `Message`.
  Err<native><public>(Message: string)<computes>: false

  @rtfm_always_open
  # Returns the natural exponent of `X`.
  Exp<native><public>(X: float)<computes><reads>: float

  # Returns the largest `int` that is less than or equal to `Val`.
  # Fails if `not IsFinite(Val)`.
  Floor<native><public>(Val: float)<computes><decides><reads>: int

  # Returns the number of seconds since January 1, 1970 UTC, ignoring leap seconds. I.e, this function implements Unix time. This function always returns the same value within the same transaction.
  GetSecondsSinceEpoch<native><public>()<computes><reads>: float

  # Returns the `int` that equals `Val` without the fractional part.
  # Fails if `not IsFinite(val)`.
  Int<native><public>(Val: float)<computes><decides><reads>: int

  # Succeeds if `Val1` and `Val2` are within `AbsoluteTolerance` of each other.
  IsAlmostEqual<public>(Val1: float, Val2: float, AbsoluteTolerance: float)<computes><decides>: void = external {}

  # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
  Join<native><public>(Strings: []string, Separator: string)<computes>: string

  @rtfm_always_open
  # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
  # Returns `From*(1 - Parameter) + To*Parameter`.
  Lerp<native><public>(From: float, To: float, Parameter: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the natural logarithm of `X`.
  Ln<native><public>(X: float)<computes><reads>: float

  # Makes a `string` by localizing `Message` based on the current `locale`.
  Localize<native><public>(Message: message)<computes><reads>: string

  # Returns the base `B` logarithm of `X`.
  Log<public>(B: float, X: float)<computes><reads>: float = external {}

  MakeLocalizableValue<epic_internal>(V: float): localizable_float = external {}

  MakeLocalizableValue<epic_internal>(V: int): localizable_int = external {}

  MakeLocalizableValue<epic_internal>(V: message): localizable_message = external {}

  MakeLocalizableValue<epic_internal>(V: string): localizable_string = external {}

  MakeMessageInternal<native><epic_internal>(K: string, D: string, S: [string]localizable_value)<converges>: message

  # Returns the maximum of `X` and `Y` unless either are `NaN`.
  # Returns `NaN` if either `X` or `Y` are `NaN`.
  Max<public>(X: float, Y: float)<computes>: float = external {}

  # Returns the maximum of `X` and `Y`.
  Max<public>(X: int, Y: int)<computes>: int = external {}

  # Returns the minimum of `X` and `Y` unless either are `NaN`.
  # Returns `NaN` if either `X` or `Y` are `NaN`.
  Min<public>(X: float, Y: float)<computes>: float = external {}

  # Returns the minimum of `X` and `Y`.
  Min<public>(X: int, Y: int)<computes>: int = external {}

  @rtfm_always_open
  # Returns the remainder of `X/Y` as defined by Euclidean division, i.e.:
  #  * `Mod[X,Y] = X - Quotient(X/Y)*Y`
  #  * `0 <= Mod[X,Y] < Abs(Y)`
  # Fails if `Y=0`.
  Mod<native><public>(X: int, Y: int)<computes><decides>: int

  # Pi, the ratio of the circumference of a circle to its diameter.
  PiFloat<public>: float = external {}

  @rtfm_always_open
  # Returns `A` to the power of `B`.
  Pow<native><public>(A: float, B: float)<computes><reads>: float

  # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
  Print<native><public>(Message: message, ?Duration: float = external {}, ?Color: color = external {})<transacts>: void

  using { /Verse.org/Colors }
  # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
  Print<native><public>(Message: string, ?Duration: float = external {}, ?Color: color = external {})<transacts>: void

  # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
  Print<public>(
    Message: diagnostic,
    ?Duration: float = external {},
    ?Color: color = external {}
  )<transacts>: void = external {}

  @rtfm_always_open
  # Returns the quotient `X/Y` as defined by Euclidean division, i.e.:
  #  * `Quotient[X/Y] = Floor[X/Y]` when `Y > 0`
  #  * `Quotient[X/Y] = Ceil[X/Y]` when `Y < 0`
  #  * `Quotient[X/Y] * Y + Mod[X,Y] = X`
  # Fails if `Y = 0`.
  Quotient<native><public>(X: int, Y: int)<computes><decides>: int

  # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`, rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
  # Fails if `not IsFinite(Val)`.
  Round<native><public>(Val: float)<computes><decides><reads>: int

  # Returns the sign of `Val`:
  #  * `1.0` if `Val > 0.0`
  #  * `0.0` if `Val = 0.0`
  #  * `-1.0` if `Val < 0.0`
  #  * `NaN` if `Val = NaN`
  Sgn<public>(Val: float)<computes>: float = external {}

  # Returns the sign of `Val`:
  #   * `1` if `Val > 0`
  #  * `0` if `Val = 0`
  #  * `-1` if `Val < 0`
  Sgn<public>(Val: int)<computes>: int = external {}

  @rtfm_always_open
  # Returns the sine of `X` if `IsFinite(X)`.
  # Returns `NaN` if `not IsFinite(X)
  Sin<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the hyperbolic sine of `X`.
  Sinh<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the square root of `X` if `X >= 0.0`.
  # Returns `NaN` if `X < 0.0`.
  Sqrt<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the tangent of `X` if `IsFinite(X)`.
  # Returns `NaN` if `not IsFinite(X).
  Tan<native><public>(X: float)<computes><reads>: float

  @rtfm_always_open
  # Returns the hyperbolic tangent of `X`.
  Tanh<native><public>(X: float)<computes><reads>: float

  # Converts any Verse value into an opaque diagnostic message.
  ToDiagnostic<native><public>(Value: any)<computes><reads>: diagnostic

  # Makes a `string` from `Character`.
  ToString<native><public>(Character: char)<computes>: string

  # Makes a `string` representation of `Val`.
  ToString<native><public>(Val: float)<computes><reads>: string

  # Makes a printable `string` representation of `Val`.
  ToString<native><public>(Val: int)<computes>: string

  # Returns `String` without modification.
  ToString<public>(String: string)<computes>: string = external {}

  # Implemented by classes that allow users to cancel an operation. For example, calling `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel` on the return object unsubscribes the callback.
  cancelable<native><public> := interface {
    # Prevents any current or future work from completing.
    Cancel<native_callable><public>()<transacts>: void
  }

  # An opaque diagnostic message that only shows up in diagnostic logs. The format of the diagnostic may change at any time without warning and may not be inspected by Verse code.
  diagnostic<native><public> := class<computes><epic_internal> {}

  # Implemented by classes whose instances have limited lifetimes.
  disposable<native><public> := interface {
    # Cleans up this object.
    Dispose<public>(): void
  }

  # Implemented by classes whose instances can be enabled and disabled.
  enableable<native><public> := interface<public> {
    # Disable this object.
    Disable<public>(): void

    # Enable this object.
    Enable<public>(): void

    # Succeeds if the object is enabled, fails if it’s disabled.
    IsEnabled<public>()<transacts><decides>: void
  }

  # A *recurring*, successively signaled parametric `event` with a `payload` allowing a simple mechanism to coordinate between concurrent tasks:
  #  * `Await` suspends tasks to wait on this `event`,
  #  * another task `Signal`s this `event` and resumes the suspended tasks in FIFO order.
  event<native><public>(t: type) := class(signalable(t), awaitable(t)) {
    # Suspends the current task until another task calls `Signal`.
    # If called during another invocation of `Signal`, the the task will still suspend and resume during the next call to `Signal`.
    Await<native><override>()<suspends>: t

    # Concurrently resumes the tasks that were suspended by `Await` calls before this call to `Signal`.
    #
    # Tasks are resumed in the order they were suspended. Each task will perform as much work as it can until it encounters a blocking call, whereupon it will transfer control to the next suspended task.
    Signal<native><override>(Val: t): void
  }

  # A *recurring*, successively signaled event allowing a simple mechanism to coordinate between concurrent tasks.
  event<public>() := event(tuple())

  # Implemented by classes whose instances can become invalid at runtime.
  invalidatable<native><public> := interface(disposable) {
    # Succeeds if this object is still valid.
    IsValid<public>()<transacts><decides>: void
  }

  # A parameterless interface combining `awaitable` and `subscribable`.
  listenable<public>() := listenable(tuple())

  # A parametric interface combining `awaitable` and `subscribable`.
  listenable<public>(payload: type) := interface(awaitable(payload), subscribable(payload)) {}

  # Used for message localization.
  locale<native><public> := struct<epic_internal> {}

  localizable_float<native><epic_internal> := class<internal>(localizable_value) {}

  localizable_int<native><epic_internal> := class<internal>(localizable_value) {}

  localizable_message<native><epic_internal> := class<internal>(localizable_value) {}

  localizable_string<native><epic_internal> := class<internal>(localizable_value) {}

  localizable_value<native><epic_internal> := class {}

  # A localizable text message.
  message<native><public> := class<epic_internal> {}

  # Concatenates two diagnostic messages.
  operator'+'<public>(Lhs: diagnostic, Rhs: diagnostic)<computes>: diagnostic = external {}

  # Concatenates a diagnostic message with a normal string, yielding a diagnostic message.
  operator'+'<public>(Lhs: diagnostic, Rhs: string)<computes>: diagnostic = external {}

  # Concatenates a normal string with a diagnostic message, yielding a diagnostic message.
  operator'+'<public>(Lhs: string, Rhs: diagnostic)<computes>: diagnostic = external {}

  # A parametric interface implemented by events with a `payload` that can be signaled.
  # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
  signalable<public>(payload: type) := interface {
    # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
    Signal<native_callable><public>(Val: payload): void
  }

  # A parameterless interface implemented by events that can be subscribed to.
  subscribable<public>() := subscribable(tuple())

  # A parametric interface implemented by events with a `payload` that can be subscribed to.
  # Matched with `signalable.`
  subscribable<public>(t: type) := interface {
    # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
    # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
    Subscribe<public>(Callback: type { _(: t): void })<transacts>: cancelable
  }
}