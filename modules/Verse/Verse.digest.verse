# Copyright Epic Games, Inc. All Rights Reserved.
#################################################
# Generated Digest of Verse API
# DO NOT modify this manually!
# Generated from build: ++Fortnite+Release-28.10-CL-30676362
#################################################

# Module import path: /Verse.org/Assets
Assets<public> := module:
    animation_sequence<native><public> := class<computes><final><epic_internal>:

    material<native><public> := class<computes><epic_internal>:

    mesh<native><public> := class<computes><final><epic_internal>:

    texture<native><public> := class<computes><final><epic_internal>:

using {/Verse.org/Simulation}
# Module import path: /Verse.org/Colors
Colors<public> := module:
    # Makes an ACES 2065-1 `color` from `Hue`, `Saturation`, and `Value` components.
    # Components use the HSV color model in the sRGB color space. Expected ranges:
    #  * `0.0 <= Hue <= 360.0`
    #  * `0.0 <= Saturation <= 1.0`
    #  * `0.0 <= Value <= 1.0`
    # Values out of expected ranges will undergo range reduction and conversion.
    MakeColorFromHSV<native><public>(Hue:float, Saturation:float, Value:float)<converges>:color

    # Makes an ACES 2065-1 `color` from a CSS-style sRGB `hexString`. Supported formats are:
    #  * RGB
    #  * RRGGBB
    #  * RRGGBBAA
    #  * #RGB
    #  * #RRGGBB
    #  * #RRGGBBAA
    # An invalid hex string will return `Black`.
    MakeColorFromHex<native><public>(hexString:[]char)<converges>:color

    # Makes an ACES 2065-1 `color` from sRGB components `Red`, `Green`, and `Blue`.
    # Normal sRGB component values are between `0.0` and `1.0`, but this can handle larger values.
    MakeColorFromSRGB<native><public>(Red:float, Green:float, Blue:float)<converges>:color

    # Makes an ACES 2065-1 `color` from the integer sRGB components `Red`, `Green`, and `Blue`.
    # Valid sRGB component values are between '0' and '255', inclusive.
    MakeColorFromSRGBValues<native><public>(Red:int, Green:int, Blue:int)<converges>:color

    # Makes an ACES 2065-1 `color` from the chromaticity of a blackbody radiator at `Temperature` Kelvin.
    # `Temperature` is clamped such that `0 <= Temperature`.
    MakeColorFromTemperature<native><public>(Temperature:float)<converges>:color

    # Makes an HSV `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB and applying the HSV color model.
    MakeHSVFromColor<native><public>(InColor:color):tuple(float, float, float)

    # Makes an sRGB `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB.
    MakeSRGBFromColor<native><public>(InColor:color)<converges>:tuple(float, float, float)

    # Module import path: /Verse.org/Colors/NamedColors
    # Color presets from CSS Color Module 3 Extended color keywords.
    NamedColors<public> := module:
        (NamedColors:)Tan<public>:color = external {}

        AliceBlue<public>:color = external {}

        AntiqueWhite<public>:color = external {}

        Aqua<public>:color = external {}

        Aquamarine<public>:color = external {}

        Azure<public>:color = external {}

        Beige<public>:color = external {}

        Bisque<public>:color = external {}

        Black<public>:color = external {}

        BlanchedAlmond<public>:color = external {}

        Blue<public>:color = external {}

        BlueViolet<public>:color = external {}

        Brown<public>:color = external {}

        Burlywood<public>:color = external {}

        CadetBlue<public>:color = external {}

        Chartreuse<public>:color = external {}

        Chocolate<public>:color = external {}

        Coral<public>:color = external {}

        CornflowerBlue<public>:color = external {}

        Cornsilk<public>:color = external {}

        Crimson<public>:color = external {}

        Cyan<public>:color = external {}

        DarkBlue<public>:color = external {}

        DarkCyan<public>:color = external {}

        DarkGoldenrod<public>:color = external {}

        DarkGray<public>:color = external {}

        DarkGreen<public>:color = external {}

        DarkGrey<public>:color = external {}

        DarkKhaki<public>:color = external {}

        DarkMagenta<public>:color = external {}

        DarkOliveGreen<public>:color = external {}

        DarkOrange<public>:color = external {}

        DarkOrchid<public>:color = external {}

        DarkRed<public>:color = external {}

        DarkSalmon<public>:color = external {}

        DarkSeaGreen<public>:color = external {}

        DarkSlateBlue<public>:color = external {}

        DarkSlateGray<public>:color = external {}

        DarkSlateGrey<public>:color = external {}

        DarkTurquoise<public>:color = external {}

        DarkViolet<public>:color = external {}

        DeepPink<public>:color = external {}

        DeepSkyBlue<public>:color = external {}

        DimGray<public>:color = external {}

        DimGrey<public>:color = external {}

        DodgerBlue<public>:color = external {}

        Firebrick<public>:color = external {}

        FloralWhite<public>:color = external {}

        ForestGreen<public>:color = external {}

        Fuchsia<public>:color = external {}

        Gainsboro<public>:color = external {}

        GhostWhite<public>:color = external {}

        Gold<public>:color = external {}

        Goldenrod<public>:color = external {}

        Gray<public>:color = external {}

        Green<public>:color = external {}

        GreenYellow<public>:color = external {}

        Grey<public>:color = external {}

        Honeydew<public>:color = external {}

        Hotpink<public>:color = external {}

        IndianRed<public>:color = external {}

        Indigo<public>:color = external {}

        Ivory<public>:color = external {}

        Khaki<public>:color = external {}

        Lavender<public>:color = external {}

        LavenderBlush<public>:color = external {}

        LawnGreen<public>:color = external {}

        LemonChiffon<public>:color = external {}

        LightBlue<public>:color = external {}

        LightCoral<public>:color = external {}

        LightCyan<public>:color = external {}

        LightGoldenrodYellow<public>:color = external {}

        LightGray<public>:color = external {}

        LightGreen<public>:color = external {}

        LightGrey<public>:color = external {}

        LightPink<public>:color = external {}

        LightSalmon<public>:color = external {}

        LightSeaGreen<public>:color = external {}

        LightSkyBlue<public>:color = external {}

        LightSlateGray<public>:color = external {}

        LightSlateGrey<public>:color = external {}

        LightSteelBlue<public>:color = external {}

        LightYellow<public>:color = external {}

        Lime<public>:color = external {}

        LimeGreen<public>:color = external {}

        Linen<public>:color = external {}

        Magenta<public>:color = external {}

        Maroon<public>:color = external {}

        MediumAquamarine<public>:color = external {}

        MediumBlue<public>:color = external {}

        MediumOrchid<public>:color = external {}

        MediumPurple<public>:color = external {}

        MediumSeaGreen<public>:color = external {}

        MediumSlateBlue<public>:color = external {}

        MediumSpringGreen<public>:color = external {}

        MediumTurquoise<public>:color = external {}

        MediumVioletRed<public>:color = external {}

        MidnightBlue<public>:color = external {}

        MintCream<public>:color = external {}

        MistyRose<public>:color = external {}

        Moccasin<public>:color = external {}

        NavajoWhite<public>:color = external {}

        Navy<public>:color = external {}

        OldLace<public>:color = external {}

        Olive<public>:color = external {}

        OliveDrab<public>:color = external {}

        Orange<public>:color = external {}

        OrangeRed<public>:color = external {}

        Orchid<public>:color = external {}

        PaleGoldenrod<public>:color = external {}

        PaleGreen<public>:color = external {}

        PaleTurquoise<public>:color = external {}

        PaleVioletred<public>:color = external {}

        PapayaWhip<public>:color = external {}

        PeachPuff<public>:color = external {}

        Peru<public>:color = external {}

        Pink<public>:color = external {}

        Plum<public>:color = external {}

        PowderBlue<public>:color = external {}

        Purple<public>:color = external {}

        Red<public>:color = external {}

        RosyBrown<public>:color = external {}

        RoyalBlue<public>:color = external {}

        SaddleBrown<public>:color = external {}

        Salmon<public>:color = external {}

        SandyBrown<public>:color = external {}

        SeaGreen<public>:color = external {}

        SeaShell<public>:color = external {}

        Sienna<public>:color = external {}

        Silver<public>:color = external {}

        SkyBlue<public>:color = external {}

        SlateBlue<public>:color = external {}

        SlateGray<public>:color = external {}

        SlateGrey<public>:color = external {}

        Snow<public>:color = external {}

        SpringGreen<public>:color = external {}

        SteelBlue<public>:color = external {}

        Teal<public>:color = external {}

        Thistle<public>:color = external {}

        Tomato<public>:color = external {}

        Turquoise<public>:color = external {}

        Violet<public>:color = external {}

        Wheat<public>:color = external {}

        White<public>:color = external {}

        WhiteSmoke<public>:color = external {}

        Yellow<public>:color = external {}

        YellowGreen<public>:color = external {}

    # Represents colors as RGB triples in the ACES 2065-1 color space.
    # Component values are linear (i.e. `*gamma* = 1.0`).
    color<native><public> := struct<concrete><computes>:
        @editable
        # Blue component of this `color`.
        B<native><public>:float = external {}

        @editable
        # Green component of this `color`.
        G<native><public>:float = external {}

        @editable
        # Red component of this `color`.
        R<native><public>:float = external {}

    # Makes an ACES 2065-1 `color` from the component-wise product of `c0` and `c1`.
    operator'*'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    operator'*'<native><public>(c:color, factor:float)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    operator'*'<native><public>(c:color, factor:int)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    operator'*'<native><public>(factor:float, c:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` scaled by `factor`.
    operator'*'<native><public>(factor:int, c:color)<converges>:color

    # Makes an ACES 2065-1 `color` from the component-wise sum of `c0` and `c1`.
    operator'+'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from the component-wise difference of `c0` and `c1`.
    operator'-'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    operator'/'<native><public>(c:color, factor:float)<computes><decides>:color

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    operator'/'<native><public>(c:color, factor:int)<computes><decides>:color

Concurrency<public> := module:
    awaitable<public>()<computes> := awaitable(void)

    # A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
    awaitable<public>(payload:type)<computes> := interface:
        # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
        Await<public>()<suspends>:payload

    task<native><public>(t:type)<computes> := class<abstract><final>(awaitable(t)):
        Await<native><override>()<suspends>:t

Native<public> := module:
    import_as<epic_internal>(importName:[]char)<computes>:import_as_attribute

    @attribscope_class
    @attribscope_struct
    import_as_attribute<epic_internal> := class(attribute):

using {/Verse.org/Concurrency}
# Module import path: /Verse.org/Random
Random<public> := module:
    # Returns a random `float` between `Low` and `High`, inclusive.
    GetRandomFloat<native><public>(Low:float, High:float)<varies>:float

    # Returns a random `int` between `Low` and `High`, inclusive.
    GetRandomInt<native><public>(Low:int, High:int)<varies>:int

    # Makes an `array` with the same elements as `Input` shuffled in a random order.
    Shuffle<public>(Input:[]t where t:type)<transacts>:[]t = external {}

# Module import path: /Verse.org/Simulation
Simulation<public> := module:
    # Returns the `session` corresponding to the current round.  The result can be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to return a single instance per game. Round-local behavior should not be relied upon.
    GetSession<native><public>()<varies>:session

    # Get the seconds that have elapsed since the world began simulating
    GetSimulationElapsedTime<native><public>()<transacts>:float

    MakeLocalizableValue<epic_internal>(Agent:agent):localizable_agent = external {}

    # Waits specified number of seconds and then resumes. If `Seconds` = 0.0 then it waits until next tick/frame/update. If `Seconds` = Inf then it waits forever and only calls back if canceled - such as via `race`. If `Seconds` < 0.0 then it completes immediately and does not yield to other aysnc expressions.
    # Waiting until the next update (0.0) is especially useful in a loop of a coroutine that needs to do some work every update and this yields to other coroutines so that it doesn't hog a processor's resources.
    # Waiting forever (Inf) will have any expression that follows never be evaluated. Occasionally it is desireable to have a task never complete such as the last expression in a `race` subtask where the task must never win the race though it still may be canceled earlier.
    # Immediately completing (less than 0) is useful when you want programmatic control over whether an expression yields or not.
    Sleep<native><public>(Seconds:float)<suspends>:void

    # Module import path: /Verse.org/Simulation/Tags
    Tags<public> := module:
        # A single gameplay tag, which represents a hierarchical name of the form x.y that is registered in the GameplayTagsManager You can filter the gameplay tags displayed in the editor.
        tag<native><public> := class<abstract>:

        # Advanced tag search criteria
        tag_search_criteria<native><public> := class:
            # Tags that may NOT be on the object. All items with these tags are excluded from the search.
            ExclusionTags<native><public>:[]tag = external {}

            # Tags that are used if no required tags are specified. These are treated as if any of them will do.
            PreferredTags<native><public>:[]tag = external {}

            # Tags required to be on the object.
            RequiredTags<native><public>:[]tag = external {}

            # Flag to request sorting the results by tag.
            SortType<native><public>:tag_search_sort_type = external {}

        tag_search_sort_type<native><public> := enum:
            Sorted

            Unsorted

        # A queryable collection of gameplay tags.
        tag_view<native><public> := interface<epic_internal>:
            # Determine if TagToCheck is present in this container, also checking against parent tags {"A.1"}.Has("A") will return True, {"A"}.Has("A.1") will return False If TagToCheck is not Valid it will always return False.
            Has<public>(TagToCheck:tag)<transacts><decides>:void

            # Checks if this container contains ALL of the tags in the specified container, also checks against parent tags {"A.1","B.1"}.HasAll({"A","B"}) will return True, {"A","B"}.HasAll({"A.1","B.1"}) will return False If InTags is empty/invalid it will always return True, because there were no failed checks.
            HasAll<public>(InTags:[]tag)<transacts><decides>:void

            # Checks if this container contains ANY of the tags in the specified container, also checks against parent tags {"A.1"}.HasAny({"A","B"}) will return True, {"A"}.HasAny({"A.1","B"}) will return False If InTags is empty/invalid it will always return False.
            HasAny<public>(InTags:[]tag)<transacts><decides>:void

    agent<native><public> := class<unique><epic_internal>:

    @attribscope_class
    @attribscope_struct
    @attribscope_data
    @customattribhandler
    editable<public> := class(attribute):

    localizable_agent<native><epic_internal> := class(localizable_value):

    player<native><public> := class<unique><persistent><epic_internal>(agent):

    # Type for which there is a single instance per round.  Use `GetSession` to get the current round's `session` instance. May be used with `weak_map` to implement global variables.
    # Note: may be changed in a future release to a single instance per game. Round-local behavior should not be relied upon.
    session<native><public> := class<unique><module_scoped_var_weak_map_key><epic_internal>:

    team<native><public> := class<unique><epic_internal>:

Verse<public> := module:
    # Returns the first index whose element in `Input` equals `ElementToFind`.
    # Fails if ElementToFind does not exist in the array.
    (Input:[]t where t:subtype(comparable)).Find<public>(ElementToFind:t)<computes><decides>:int = external {}

    # Makes an `array` by removing all elements that equal `ElementToRemove` from `Input`.
    (Input:[]t where t:subtype(comparable)).RemoveAllElements<public>(ElementToRemove:t)<computes>:[]t = external {}

    # Makes an `array` by removing the element at the lowest index that equals `ElementToRemove` from `Input`.
    # Fails if `Input` did not contain any instances of `ElementToRemove`.
    (Input:[]t where t:subtype(comparable)).RemoveFirstElement<public>(ElementToRemove:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing all ranges of elements that equal `ElementsToReplace` with `Replacement` in `Input`.
    # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest index is replaced.
    (Input:[]t where t:subtype(comparable)).ReplaceAll<public>(ElementsToReplace:[]t, Replacement:[]t)<transacts>:[]t = external {}

    # Makes an `array` by replacing all elements that equal `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    (Input:[]t where t:subtype(comparable)).ReplaceAllElements<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes>:[]t = external {}

    # Makes an `array` by replacing the element at the lowest index that equals `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    # Fails if `Input` did not contain any instances of `ElementToReplace`.
    (Input:[]t where t:subtype(comparable)).ReplaceFirstElement<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by inserting `ElementsToInsert` into `Input` such that the first element of `ElementsToInsert` is at `InsertionIndex`.
    (Input:[]t where t:type).Insert<public>(InsertionIndex:int, ElementsToInsert:[]t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Remove<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at `IndexToRemove` from `Input`.
    # Succeeds if `0 <= IndexToRemove <= Input.Length-1`.
    (Input:[]t where t:type).RemoveElement<public>(IndexToRemove:int)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing the element at `IndexToReplace` with `ElementToReplaceWith` in `Input`.
    # Succeeds if `0 <= IndexToReplace <= Input.Length-1`.
    (Input:[]t where t:type).ReplaceElement<public>(IndexToReplace:int, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `Input.Length-1`.
    # Succeeds if `0 <= StartIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Fails unless `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Succeeds if `Val` is within `AbsoluteTolerance` of `0.0`.
    (Val:float).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Returns `X` if `X` is finite.
    # Fails if `X` is one of:`
    #  * `+Inf`
    #  * `-Inf`
    #  * `NaN`
    (X:float).IsFinite<public>()<computes><decides>:float = external {}

    # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
    ArCosh<native><public>(X:float)<varies>:float

    # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
    ArSinh<native><public>(X:float)<varies>:float

    # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
    ArTanh<native><public>(X:float)<varies>:float

    # Returns the inverse cosine (arccosine) of `X` if `-1.0 <= X <= 1.0`.
    ArcCos<native><public>(X:float)<varies>:float

    # Returns the inverse sine (arcsine) of `X` if `-1.0 <= X <= 1.0`.
    ArcSin<native><public>(X:float)<varies>:float

    # Returns the inverse tangent (arctangent) of `X` such that:`-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
    ArcTan<native><public>(X:float)<varies>:float

    # Returns the angle in radians at the origin between a ray pointing to `(X, Y)` and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
    # Returns 0.0 if `X=0.0 and Y=0.0`.
    ArcTan<native><public>(Y:float, X:float)<varies>:float

    # Returns the smallest `int` that is greater than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Ceil<native><public>(Val:float)<varies><decides>:int

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`.
    Clamp<native><public>(Val:int, A:int, B:int)<computes>:int

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`, such that comparisons with `NaN` operate as if `NaN > +Inf`.
    Clamp<public>(Val:float, A:float, B:float)<computes>:float = external {}

    # Makes a flattened `array` by concatenating the elements of `Arrays`.
    Concatenate<public>(Arrays:[][]t where t:type)<computes>:[]t = external {}

    # Returns the cosine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Cos<native><public>(X:float)<varies>:float

    # Returns the hyperbolic cosine of `X`.
    Cosh<native><public>(X:float)<varies>:float

    # Halts the Verse runtime with error `Message`.
    Err<native><public>(Message:[]char)<computes>:false

    # Returns the natural exponent of `X`.
    Exp<native><public>(X:float)<varies>:float

    # Returns the largest `int` that is less than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Floor<native><public>(Val:float)<varies><decides>:int

    # Returns the `int` that equals `Val` without the fractional part.
    # Fails if `not IsFinite(val)`.
    Int<native><public>(Val:float)<varies><decides>:int

    # Succeeds if `Val1` and `Val2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(Val1:float, Val2:float, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
    Join<native><public>(Strings:[][]char, Separator:[]char)<computes>:[]char

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<native><public>(From:float, To:float, Parameter:float)<varies>:float

    # Returns the natural logarithm of `X`.
    Ln<native><public>(X:float)<varies>:float

    # Makes a `string` by localizing `Message` based on the current `locale`.
    Localize<native><public>(Message:message)<varies>:[]char

    # Returns the base `B` logarithm of `X`.
    Log<public>(B:float, X:float)<varies>:float = external {}

    MakeLocalizableValue<epic_internal>(V:[]char):localizable_string = external {}

    MakeLocalizableValue<epic_internal>(V:float):localizable_float = external {}

    MakeLocalizableValue<epic_internal>(V:int):localizable_int = external {}

    MakeLocalizableValue<epic_internal>(V:message):localizable_message = external {}

    MakeMessageInternal<native><epic_internal>(K:[]char, D:[]char, S:[[]char]localizable_value)<converges>:message

    # Returns the maximum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Max<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the maximum of `X` and `Y`.
    Max<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the minimum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Min<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the minimum of `X` and `Y`.
    Min<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the remainder of `X/Y` as defined by Euclidean division, i.e.:
    #  * `Mod[X,Y] = X - Quotient(X/Y)*Y`
    #  * `0 <= Mod[X,Y] < Abs(Y)`
    # Fails if `Y=0`.
    Mod<native><public>(X:int, Y:int)<computes><decides>:int

    # Pi, the ratio of the circumference of a circle to its diameter.
    PiFloat<public>:float = external {}

    # Returns `A` to the power of `B`.
    Pow<native><public>(A:float, B:float)<varies>:float

    using {/Verse.org/Colors}
    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
    Print<native><public>(Message:[]char, ?Duration:float = external {}, ?Color:color = external {}):void

    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and `Duration` is `2.0` seconds.
    Print<native><public>(Message:message, ?Duration:float = external {}, ?Color:color = external {}):void

    # Returns the quotient `X/Y` as defined by Euclidean division, i.e.:
    #  * `Quotient[X/Y] = Floor[X/Y]` when `Y > 0`
    #  * `Quotient[X/Y] = Ceil[X/Y]` when `Y < 0`
    #  * `Quotient[X/Y] * Y + Mod[X,Y] = X`
    # Fails if `Y = 0`.
    Quotient<native><public>(X:int, Y:int)<computes><decides>:int

    # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`, rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
    # Fails if `not IsFinite(Val)`.
    Round<native><public>(Val:float)<varies><decides>:int

    # Returns the sign of `Val`:
    #  * `1.0` if `Val > 0.0`
    #  * `0.0` if `Val = 0.0`
    #  * `-1.0` if `Val < 0.0`
    #  * `NaN` if `Val = NaN`
    Sgn<public>(Val:float)<computes>:float = external {}

    # Returns the sign of `Val`:
    #   * `1` if `Val > 0`
    #  * `0` if `Val = 0`
    #  * `-1` if `Val < 0`
    Sgn<public>(Val:int)<computes>:int = external {}

    # Returns the sine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Sin<native><public>(X:float)<varies>:float

    # Returns the hyperbolic sine of `X`.
    Sinh<native><public>(X:float)<varies>:float

    # Returns the square root of `X` if `X >= 0.0`.
    # Returns `NaN` if `X < 0.0`.
    Sqrt<native><public>(X:float)<varies>:float

    # Returns the tangent of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X).
    Tan<native><public>(X:float)<varies>:float

    # Returns the hyperbolic tangent of `X`.
    Tanh<native><public>(X:float)<varies>:float

    # Makes a `string` from `Character`.
    ToString<native><public>(Character:char)<computes>:[]char

    # Makes a `string` representation of `Val`.
    ToString<native><public>(Val:float)<varies>:[]char

    # Makes a printable `string` representation of `Val`.
    ToString<native><public>(Val:int)<computes>:[]char

    # Returns `String` without modification.
    ToString<public>(String:[]char)<computes>:[]char = external {}

    # Implemented by classes that allow users to cancel an operation. For example, calling `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel` on the return object unsubscribes the callback.
    cancelable<native><public> := interface:
        # Prevents any current or future work from completing.
        Cancel<public>()<transacts>:void

    # Implemented by classes whose instances have limited lifetimes.
    disposable<native><public> := interface:
        # Cleans up this object.
        Dispose<public>():void

    # A *recurring*, successively signaled parametric `event` with a `payload` allowing a simple mechanism to coordinate between concurrent tasks:
    #  * `Await` suspends tasks to wait on this `event`,
    #  * another task `Signal`s this `event` and resumes the suspended tasks in FIFO order.
    event<native><public>(t:type)<computes> := class(signalable(t), awaitable(t)):
        # Suspends the current task until another task calls `Signal`.
        # If called during another invocation of `Signal`, the the task will still suspend and resume during the next call to `Signal`.
        Await<native><override>()<suspends>:t

        # Concurrently resumes the tasks that were suspended by `Await` calls before this call to `Signal`.
        #
        # Tasks are resumed in the order they were suspended. Each task will perform as much work as it can until it encounters a blocking call, whereupon it will transfer control to the next suspended task.
        Signal<native><override>(Val:t):void

    # A *recurring*, successively signaled event allowing a simple mechanism to coordinate between concurrent tasks.
    event<public>()<computes> := event(tuple())

    # Implemented by classes whose instances can become invalid at runtime.
    invalidatable<native><public> := interface(disposable):
        # Succeeds if this object is still valid.
        IsValid<public>()<transacts><decides>:void

    # A parameterless interface combining `awaitable` and `subscribable`.
    listenable<public>()<computes> := listenable(tuple())

    # A parametric interface combining `awaitable` and `subscribable`.
    listenable<public>(payload:type)<computes> := interface(awaitable(payload), subscribable(payload)):

    # Used for message localization.
    locale<native><public> := struct<epic_internal>:

    localizable_float<native><epic_internal> := class<internal>(localizable_value):

    localizable_int<native><epic_internal> := class<internal>(localizable_value):

    localizable_message<native><epic_internal> := class<internal>(localizable_value):

    localizable_string<native><epic_internal> := class<internal>(localizable_value):

    localizable_value<native><epic_internal> := class:

    # A localizable text message.
    message<native><public> := class<epic_internal>:

    # A parametric interface implemented by events with a `payload` that can be signaled.
    # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
    signalable<public>(payload:type)<computes> := interface:
        # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
        Signal<public>(Val:payload):void

    # A parameterless interface implemented by events that can be subscribed to.
    subscribable<public>()<computes> := subscribable(tuple())

    # A parametric interface implemented by events with a `payload` that can be subscribed to.
    # Matched with `signalable.`
    subscribable<public>(t:type)<computes> := interface:
        # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
        # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
        Subscribe<public>(Callback:type {__(:t):void})<transacts>:cancelable
