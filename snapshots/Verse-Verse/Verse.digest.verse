using {/Verse.org/Colors}
using {/Verse.org/Concurrency}
# Module import path: /Verse.org/Verse
Verse<public> := module:
    # Makes a flattened `array` by concatenating the elements of `Arrays`.
    Concatenate<public>(Arrays:[][]t where t:type)<computes>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Fails unless `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` containing `Input`'s elements from `StartIndex` to `Input.Length-1`.
    # Succeeds if `0 <= StartIndex <= Input.Length`.
    (Input:[]t where t:type).Slice<public>(StartIndex:int)<computes><decides>:[]t = external {}

    # Makes an `array` by inserting `ElementsToInsert` into `Input` such that the first element of `ElementsToInsert` is at `InsertionIndex`.
    (Input:[]t where t:type).Insert<public>(InsertionIndex:int, ElementsToInsert:[]t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at `IndexToRemove` from `Input`.
    # Succeeds if `0 <= IndexToRemove <= Input.Length-1`.
    (Input:[]t where t:type).RemoveElement<public>(IndexToRemove:int)<computes><decides>:[]t = external {}

    # Makes an `array` by removing the element at the lowest index that equals `ElementToRemove` from `Input`.
    # Fails if `Input` did not contain any instances of `ElementToRemove`.
    (Input:[]t where t:subtype(comparable)).RemoveFirstElement<public>(ElementToRemove:t)<computes><decides>:[]t = external {}

    # Makes an `array` by removing all elements that equal `ElementToRemove` from `Input`.
    (Input:[]t where t:subtype(comparable)).RemoveAllElements<public>(ElementToRemove:t)<computes>:[]t = external {}

    # Makes an `array` by replacing the element at `IndexToReplace` with `ElementToReplaceWith` in `Input`.
    # Succeeds if `0 <= IndexToReplace <= Input.Length-1`.
    (Input:[]t where t:type).ReplaceElement<public>(IndexToReplace:int, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing the element at the lowest index that equals `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    # Fails if `Input` did not contain any instances of `ElementToReplace`.
    (Input:[]t where t:subtype(comparable)).ReplaceFirstElement<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes><decides>:[]t = external {}

    # Makes an `array` by replacing all elements that equal `ElementToReplace` with `ElementToReplaceWith` in `Input`.
    (Input:[]t where t:subtype(comparable)).ReplaceAllElements<public>(ElementToReplace:t, ElementToReplaceWith:t)<computes>:[]t = external {}

    # Makes an `array` by replacing all ranges of elements that equal `ElementsToReplace` with `Replacement` in `Input`.
    # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest
    # index is replaced.
    (Input:[]t where t:subtype(comparable)).ReplaceAll<public>(ElementsToReplace:[]t, Replacement:[]t)<transacts>:[]t = external {}

    # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Remove<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Returns the first index whose element in `Input` equals `ElementToFind`.
    # Fails if ElementToFind does not exist in the array.
    (Input:[]t where t:subtype(comparable)).Find<public>(ElementToFind:t)<computes><decides>:int = external {}

    # Implemented by classes that allow users to cancel an operation. For example, calling
    # `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel`
    # on the return object unsubscribes the callback.
    cancelable<native><public> := interface:
        # Prevents any current or future work from completing.
        Cancel<public>()<transacts>:void

    # Implemented by classes whose instances have limited lifetimes.
    disposable<native><public> := interface:
        # Cleans up this object.
        Dispose<public>():void

    # Halts the Verse runtime with error `Message`.
    Err<native><public>(Message:[]char)<computes>:false

    # A *recurring*, successively signaled parametric `event` with a `payload` allowing a
    # simple mechanism to coordinate between concurrent tasks:
    #  * `Await` suspends tasks to wait on this `event`,
    #  * another task `Signal`s this `event` and resumes the suspended tasks in FIFO order.
    event<native><public>(t:type)<computes> := class(signalable(t), awaitable(t)):
        # Returns the number of suspended tasks added by calls to `Await` that have not
        # been resumed by a call to `Signal`.
        GetAwaitCount<native><epic_internal>():int

        # Suspends the current task until another task calls `Signal`.
        # If called during another invocation of `Signal`, the the task will still suspend
        # and resume during the next call to `Signal`.
        Await<native><override>()<suspends>:t

        # Concurrently resumes the tasks that were suspended by `Await` calls before this
        # call to `Signal`.
        # 
        # Tasks are resumed in the order they were suspended. Each task will perform as
        # much work as it can until it encounters a blocking call, whereupon it will
        # transfer control to the next suspended task.
        Signal<native><override>(Val:t):void

    # A *recurring*, successively signaled event allowing a simple mechanism to coordinate
    # between concurrent tasks.
    event<public>()<computes> := event(tuple())

    # Returns the smallest `int` that is greater than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Ceil<native><public>(Val:float)<varies><decides>:int

    # Returns the largest `int` that is less than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Floor<native><public>(Val:float)<varies><decides>:int

    # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`,
    # rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
    # Fails if `not IsFinite(Val)`.
    Round<native><public>(Val:float)<varies><decides>:int

    # Returns the `int` that equals `Val` without the fractional part
    # Fails if `not IsFinite(val)`.
    Int<native><public>(Val:float)<varies><decides>:int

    # Makes a `string` representation of `Val`.
    ToString<native><public>(Val:float)<varies>:[]char

    # Makes a printable `string` representation of `Val`.
    ToString<native><public>(Val:int)<computes>:[]char

    # Implemented by classes whose instances can become invalid at runtime.
    invalidatable<native><public> := interface(disposable):
        # Succeeds if this object is still valid.
        IsValid<public>()<transacts><decides>:void

    # A parametric interface combining `awaitable` and `subscribable`.
    listenable<public>(payload:type)<computes> := interface(awaitable(payload), subscribable(payload)):


    # A parameterless interface combining `awaitable` and `subscribable`.
    listenable<public>()<computes> := listenable(tuple())

    # Used for message localization.
    locale<native><public> := struct<computes><epic_internal>:


    # A localizable text message.
    message<native><public> := class<computes><epic_internal>:
        Key<native><epic_internal>:[]char

        DefaultText<native><epic_internal>:[]char

        Substitutions<native><epic_internal>:[[]char]localizable_value

    # Makes a `string` by localizing `Message` based on the current `locale`.
    Localize<native_callable><public>(Message:message)<varies>:[]char = external {}

    localizable_value<epic_internal> := interface:


    localizable_string<epic_internal> := class<computes><internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:[]char)<computes>:localizable_string = external {}

    localizable_int<epic_internal> := class<computes><internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:int)<computes>:localizable_int = external {}

    localizable_float<epic_internal> := class<computes><internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:float)<computes>:localizable_float = external {}

    MakeMessageInternal<native><epic_internal>(K:[]char, D:[]char, S:[[]char]localizable_value)<converges>:message

    # Pi, the ratio of the circumference of a circle to its diameter.
    PiFloat<public>:float = external {}

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`, such that comparisons with `NaN` operate as if `NaN > +Inf`.
    Clamp<public>(Val:float, A:float, B:float)<computes>:float = external {}

    # Constrains the value of `Val` between `A` and `B`. Robustly handles different argument orderings.
    # Returns the median of `Val`, `A`, and `B`.
    Clamp<native><public>(Val:int, A:int, B:int)<computes>:int

    # Returns the minimum of `X` and `Y`.
    Min<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the maximum of `X` and `Y`.
    Max<public>(X:int, Y:int)<computes>:int = external {}

    # Returns the minimum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Min<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the maximum of `X` and `Y` unless either are `NaN`.
    # Returns `NaN` if either `X` or `Y` are `NaN`.
    Max<public>(X:float, Y:float)<computes>:float = external {}

    # Returns the square root of `X` if `X >= 0.0`.
    # Returns `NaN` if `X < 0.0`.
    Sqrt<native><public>(X:float)<varies>:float

    # Returns the sine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Sin<native><public>(X:float)<varies>:float

    # Returns the cosine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Cos<native><public>(X:float)<varies>:float

    # Returns the tangent of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X).
    Tan<native><public>(X:float)<varies>:float

    # Returns the inverse sine (arcsine) of `X` if `-1.0 <= X <= 1.0`.
    ArcSin<native><public>(X:float)<varies>:float

    # Returns the inverse cosine (arccosine) of `X` if `-1.0 <= X <= 1.0`.
    ArcCos<native><public>(X:float)<varies>:float

    # Returns the inverse tangent (arctangent) of `X` such that:
    # `-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
    ArcTan<native><public>(X:float)<varies>:float

    # Returns the angle in radians at the origin between a ray pointing to `(X, Y)`
    # and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
    # Returns 0.0 if `X=0.0 and Y=0.0`.
    ArcTan<native><public>(Y:float, X:float)<varies>:float

    # Returns the hyperbolic sine of `X`.
    Sinh<native><public>(X:float)<varies>:float

    # Returns the hyperbolic cosine of `X`.
    Cosh<native><public>(X:float)<varies>:float

    # Returns the hyperbolic tangent of `X`.
    Tanh<native><public>(X:float)<varies>:float

    # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
    ArSinh<native><public>(X:float)<varies>:float

    # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
    ArCosh<native><public>(X:float)<varies>:float

    # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
    ArTanh<native><public>(X:float)<varies>:float

    # Returns `A` to the power of `B`.
    Pow<native><public>(A:float, B:float)<varies>:float

    # Returns `X` if `X` is finite.
    # Fails if `X` is one of:`
    #  * `+Inf`
    #  * `-Inf`
    #  * `NaN`
    (X:float).IsFinite<public>()<computes><decides>:float = external {}

    # Returns the quotient `X/Y` as defined by Euclidean division, i.e.:
    #  * `Quotient[X/Y] = Floor[X/Y]` when `Y > 0`
    #  * `Quotient[X/Y] = Ceil[X/Y]` when `Y < 0`
    #  * `Quotient[X/Y] * Y + Mod[X,Y] = X`
    # Fails if `Y = 0`.
    Quotient<native><public>(X:int, Y:int)<computes><decides>:int

    # Returns the remainder of `X/Y` as defined by Euclidean division, i.e.:
    #  * `Mod[X,Y] = X - Quotient(X/Y)*Y`
    #  * `0 <= Mod[X,Y] < Abs(Y)`
    # Fails if `Y=0`.
    Mod<native><public>(X:int, Y:int)<computes><decides>:int

    # Returns the natural exponent of `X`.
    Exp<native><public>(X:float)<varies>:float

    # Returns the natural logarithm of `X`.
    Ln<native><public>(X:float)<varies>:float

    # Returns the base `B` logarithm of `X`.
    Log<public>(B:float, X:float)<varies>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`)
    # and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<native><public>(From:float, To:float, Parameter:float)<varies>:float

    # Returns the sign of `Val`:
    #  * `1` if `Val > 0`
    #  * `0` if `Val = 0`
    #  * `-1` if `Val < 0`
    Sgn<public>(Val:int)<computes>:int = external {}

    # Returns the sign of `Val`:
    #  * `1.0` if `Val > 0.0`
    #  * `0.0` if `Val = 0.0`
    #  * `-1.0` if `Val < 0.0`
    #  * `NaN` if `Val = NaN`
    Sgn<public>(Val:float)<computes>:float = external {}

    # Succeeds if `Val` is within `AbsoluteTolerance` of `0.0`.
    (Val:float).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds if `Val1` and `Val2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(Val1:float, Val2:float, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Writes `Message` to a dedicated `Print` log while displaying it in `Color` on the
    # client screen for `Duration` seconds. By default, `Color` is `NamedColors.White` and
    # `Duration` is `2.0` seconds.
    Print<native><public>(Message:[]char, ?Duration:float = external {}, ?Color:color = external {}):void

    # A parametric interface implemented by events with a `payload` that can be signaled.
    # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
    signalable<public>(payload:type)<computes> := interface:
        # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and 
        # synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
        Signal<public>(Val:payload):void

    # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
    Join<native><public>(Strings:[][]char, Separator:[]char)<computes>:[]char

    # Returns `String` without modification.
    ToString<public>(String:[]char)<computes>:[]char = external {}

    # Makes a `string` from `Character`.
    ToString<native><public>(Character:char)<computes>:[]char

    # Makes a `string` by converting `Character` to UTF-8 from UTF-32.
    ToString<native><epic_internal>(Character:char32)<computes>:[]char

    # A parametric interface implemented by events with a `payload` that can be subscribed to.
    # Matched with `signalable.`
    subscribable<public>(t:type)<computes> := interface:
        # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
        # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
        Subscribe<public>(Callback:type {__(:t):void})<transacts>:cancelable

    # A parameterless interface implemented by events that can be subscribed to.
    subscribable<public>()<computes> := subscribable(tuple())

# Module import path: /Verse.org/Random
Random<public> := module:
    # Returns a random `float` between `Low` and `High`, inclusive.
    GetRandomFloat<native><public>(Low:float, High:float)<varies>:float

    # Returns a random `int` between `Low` and `High`, inclusive.
    GetRandomInt<native><public>(Low:int, High:int)<varies>:int

    # Makes an `array` with the same elements as `Input` shuffled in a random order.
    Shuffle<public>(Input:[]t where t:type)<transacts>:[]t = external {}

# Module import path: /Verse.org/Colors
Colors<public> := module:
    # Represents colors as RGB triples in the ACES 2065-1 color space.
    # Component values are linear (i.e. `*gamma* = 1.0`).
    color<native><public> := struct<computes>:
        # Red component of this `color`.
        R<native><public>:float = external {}

        # Green component of this `color`.
        G<native><public>:float = external {}

        # Blue component of this `color`.
        B<native><public>:float = external {}

    # Makes an ACES 2065-1 `color` from the component-wise sum of `c0` and `c1`.
    operator'+'<native><public>(c0:color, c1:color)<converges>:color

    # Makes an ACES 2065-1 `color` from the component-wise difference of `c0` and `c1`.
    operator'-'<native><public>(c0:color, c1:color)<converges>:color

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

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    operator'/'<native><public>(c:color, factor:float)<computes><decides>:color

    # Makes an ACES 2065-1 `color` from each component of `c` divided by `factor`.
    operator'/'<native><public>(c:color, factor:int)<computes><decides>:color

    # Makes an ACES 2065-1 `color` from sRGB components `Red`, `Green`, and `Blue`.
    # Normal sRGB component values are between `0.0` and `1.0`, but this can handle
    # larger values.
    MakeColorFromSRGB<native><public>(Red:float, Green:float, Blue:float)<converges>:color

    # Makes an sRGB `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB.
    MakeSRGBFromColor<native><public>(InColor:color)<converges>:tuple(float, float, float)

    # Makes an ACES 2065-1 `color` from the integer sRGB components `Red`, `Green`, and `Blue`.
    # Valid sRGB component values are between '0' and '255', inclusive.
    MakeColorFromSRGBValues<native><public>(Red:int, Green:int, Blue:int)<converges>:color

    # Makes an ACES 2065-1 `color` from a CSS-style sRGB `hexString`. Supported formats are:
    #  * RGB
    #  * RRGGBB
    #  * RRGGBBAA
    #  * #RGB
    #  * #RRGGBB
    #  * #RRGGBBAA
    # An invalid hex string will return `Black`.
    MakeColorFromHex<native><public>(hexString:[]char)<converges>:color

    # Makes an ACES 2065-1 `color` from `Hue`, `Saturation`, and `Value` components.
    # Components use the HSV color model in the sRGB color space. Expected ranges:
    #  * `0.0 <= Hue <= 360.0`
    #  * `0.0 <= Saturation <= 1.0`
    #  * `0.0 <= Value <= 1.0`
    # Values out of expected ranges will undergo range reduction and conversion.
    MakeColorFromHSV<native><public>(Hue:float, Saturation:float, Value:float)<converges>:color

    # Makes an HSV `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB and applying the HSV color model.
    MakeHSVFromColor<native><public>(InColor:color):tuple(float, float, float)

    # Makes an ACES 2065-1 `color` from the chromaticty of a blackbody radiator at `Temperature` Kelvin.
    # `Temperature` is clamped such that `0 <= Temperature`.
    MakeColorFromTemperature<native><public>(Temperature:float)<converges>:color

    # Module import path: /Verse.org/Colors/NamedColors
    # Color presets from CSS Color Module 3 Extended color keywords.
    NamedColors<public> := module:
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

        (NamedColors:)Tan<public>:color = external {}

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