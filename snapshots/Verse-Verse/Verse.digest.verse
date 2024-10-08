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
    # When there are multiple overlapping instances of `ElementsToReplace` in `Input`, only the position with the lowest index is replaced.
    (Input:[]t where t:subtype(comparable)).ReplaceAll<public>(ElementsToReplace:[]t, Replacement:[]t)<transacts>:[]t = external {}

    # Makes an `array` by removing `Input`'s elements from `StartIndex` to `StopIndex-1`.
    # Succeeds if `0 <= StartIndex <= StopIndex <= Input.Length`.
    (Input:[]t where t:type).Remove<public>(StartIndex:int, StopIndex:int)<computes><decides>:[]t = external {}

    # Returns the first index whose element in `Input` equals `ElementToFind`.
    # Fails if ElementToFind does not exist in the array.
    (Input:[]t where t:subtype(comparable)).Find<public>(ElementToFind:t)<computes><decides>:int = external {}

    # Implemented by classes that allow users to cancel an operation. For example, calling `subscribable.Subscribe` with a callback returns a `cancelable` object. Calling `Cancel` on the return object unsubscribes the callback.
    cancelable<native><public> := interface:
        # Prevents any current or future work from completing.
        Cancel<public>()<transacts>:void

    accessor<epic_internal> := enum:
        Dummy

    # Implemented by classes whose instances have limited lifetimes.
    disposable<native><public> := interface:
        # Cleans up this object.
        Dispose<public>():void

    # Implemented by classes whose instances can be enabled and disabled.
    enableable<native><public> := interface<epic_internal>:
        # Enable this object.
        Enable<public>():void

        # Disable this object.
        Disable<public>():void

        # Succeeds if the object is enabled, fails if it’s disabled.
        IsEnabled<public>()<transacts><decides>:void

    # Halts the Verse runtime with error `Message`.
    Err<native><public>(Message:string)<computes>:false

    # A *recurring*, successively signaled parametric `event` with a `payload` allowing a simple mechanism to coordinate between concurrent tasks:
    #  * `Await` suspends tasks to wait on this `event`,
    #  * another task `Signal`s this `event` and resumes the suspended tasks in FIFO order.
    event<native><public>(t:type) := class(signalable(t), awaitable(t)):
        # Returns the number of suspended tasks added by calls to `Await` that have not been resumed by a call to `Signal`.
        GetAwaitCount<native><epic_internal>():int

        # Suspends the current task until another task calls `Signal`.
        # If called during another invocation of `Signal`, the the task will still suspend and resume during the next call to `Signal`.
        Await<native><override>()<suspends>:t

        # Concurrently resumes the tasks that were suspended by `Await` calls before this call to `Signal`.
        # 
        # Tasks are resumed in the order they were suspended. Each task will perform as much work as it can until it encounters a blocking call, whereupon it will transfer control to the next suspended task.
        Signal<native><override>(Val:t):void

    # A *recurring*, successively signaled event allowing a simple mechanism to coordinate between concurrent tasks.
    event<public>() := event(tuple())

    # Returns the smallest `int` that is greater than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Ceil<native><public>(Val:float)<computes><decides><reads>:int

    # Returns the largest `int` that is less than or equal to `Val`.
    # Fails if `not IsFinite(Val)`.
    Floor<native><public>(Val:float)<computes><decides><reads>:int

    # Returns `Val` rounded to the nearest `int`. When the fractional part of `Val` is `0.5`, rounds to the nearest *even* `int` (per the IEEE-754 default rounding mode).
    # Fails if `not IsFinite(Val)`.
    Round<native><public>(Val:float)<computes><decides><reads>:int

    # Returns the `int` that equals `Val` without the fractional part.
    # Fails if `not IsFinite(val)`.
    Int<native><public>(Val:float)<computes><decides><reads>:int

    # Makes a `string` representation of `Val`.
    ToString<native><public>(Val:float)<computes><reads>:string

    # Returns the number of seconds since January 1, 1970 UTC, ignoring leap seconds. I.e, this function implements Unix time. This function always returns the same value within the same transaction.
    GetSecondsSinceEpoch<native><public>()<computes><reads>:float

    # Makes a printable `string` representation of `Val`.
    ToString<native><public>(Val:int)<computes>:string

    # Implemented by classes whose instances can become invalid at runtime.
    invalidatable<native><public> := interface(disposable):
        # Succeeds if this object is still valid.
        IsValid<public>()<transacts><decides>:void

    # A parametric interface combining `awaitable` and `subscribable`.
    listenable<public>(payload:type) := interface(awaitable(payload), subscribable(payload)):


    # A parameterless interface combining `awaitable` and `subscribable`.
    listenable<public>() := listenable(tuple())

    # Used for message localization.
    locale<native><public> := struct<epic_internal>:


    # A localizable text message.
    message<native><public> := class<epic_internal>:
        Key<native><epic_internal>:string

        DefaultText<native><epic_internal>:string

        Substitutions<native><epic_internal>:[string]localizable_value

    # Makes a `string` by localizing `Message` based on the current `locale`.
    Localize<native><public>(Message:message)<computes><reads>:string

    localizable_value<native><epic_internal> := class:


    localizable_string<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:string):localizable_string = external {}

    localizable_int<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:int):localizable_int = external {}

    localizable_float<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:float):localizable_float = external {}

    localizable_message<native><epic_internal> := class<internal>(localizable_value):


    MakeLocalizableValue<epic_internal>(V:message):localizable_message = external {}

    MakeMessageInternal<native><epic_internal>(K:string, D:string, S:[string]localizable_value)<converges>:message

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
    Sqrt<native><public>(X:float)<computes><reads>:float

    # Returns the sine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Sin<native><public>(X:float)<computes><reads>:float

    # Returns the cosine of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X)
    Cos<native><public>(X:float)<computes><reads>:float

    # Returns the tangent of `X` if `IsFinite(X)`.
    # Returns `NaN` if `not IsFinite(X).
    Tan<native><public>(X:float)<computes><reads>:float

    # Returns the inverse sine (arcsine) of `X` if `-1.0 <= X <= 1.0`.
    ArcSin<native><public>(X:float)<computes><reads>:float

    # Returns the inverse cosine (arccosine) of `X` if `-1.0 <= X <= 1.0`.
    ArcCos<native><public>(X:float)<computes><reads>:float

    # Returns the inverse tangent (arctangent) of `X` such that:`-PiFloat/2.0 <= ArcTan(x) <= PiFloat/2.0`.
    ArcTan<native><public>(X:float)<computes><reads>:float

    # Returns the angle in radians at the origin between a ray pointing to `(X, Y)` and the positive `X` axis such that `-PiFloat < ArcTan(Y, X) <= PiFloat`.
    # Returns 0.0 if `X=0.0 and Y=0.0`.
    ArcTan<native><public>(Y:float, X:float)<computes><reads>:float

    # Returns the hyperbolic sine of `X`.
    Sinh<native><public>(X:float)<computes><reads>:float

    # Returns the hyperbolic cosine of `X`.
    Cosh<native><public>(X:float)<computes><reads>:float

    # Returns the hyperbolic tangent of `X`.
    Tanh<native><public>(X:float)<computes><reads>:float

    # Returns the inverse hyperbolic sine of `X` if `IsFinite(X)`.
    ArSinh<native><public>(X:float)<computes><reads>:float

    # Returns the inverse hyperbolic cosine of `X` if `1.0 <= X`.
    ArCosh<native><public>(X:float)<computes><reads>:float

    # Returns the inverse hyperbolic tangent of `X` if `IsFinite(X)`.
    ArTanh<native><public>(X:float)<computes><reads>:float

    # Returns `A` to the power of `B`.
    Pow<native><public>(A:float, B:float)<computes><reads>:float

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
    Exp<native><public>(X:float)<computes><reads>:float

    # Returns the natural logarithm of `X`.
    Ln<native><public>(X:float)<computes><reads>:float

    # Returns the base `B` logarithm of `X`.
    Log<public>(B:float, X:float)<computes><reads>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<native><public>(From:float, To:float, Parameter:float)<computes><reads>:float

    # Returns the sign of `Val`:
    #   * `1` if `Val > 0`
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

    # A parametric interface implemented by events with a `payload` that can be signaled.
    # Can be used with `awaitable`, `subscribable`, or both (see: `listenable`).
    signalable<public>(payload:type) := interface:
        # Concurrently resumes the tasks waiting for this event in `awaitable.Await` and synchronously invokes any callbacks added to this event by `subscribable.Subscribe`.
        Signal<public>(Val:payload):void

    # Makes a `string` by concatenating `Separator` between the elements of `Strings`.
    Join<native><public>(Strings:[]string, Separator:string)<computes>:string

    # Returns `String` without modification.
    ToString<public>(String:string)<computes>:string = external {}

    # Makes a `string` from `Character`.
    ToString<native><public>(Character:char)<computes>:string

    # Makes a `string` by converting `Character` to UTF-8 from UTF-32.
    ToString<native><epic_internal>(Character:char32)<computes>:string

    # A parametric interface implemented by events with a `payload` that can be subscribed to.
    # Matched with `signalable.`
    subscribable<public>(t:type) := interface:
        # Registers `Callback` to be invoked on matching calls to `signable.Signal`.
        # Returns an unsubscriber object. Call `cancelable.Cancel` on the unsubscriber to unregister `Callback`.
        Subscribe<public>(Callback:type {__(:t):void})<transacts>:cancelable

    # A parameterless interface implemented by events that can be subscribed to.
    subscribable<public>() := subscribable(tuple())

# Module import path: /Verse.org/Random
Random<public> := module:
    # Returns a random `float` between `Low` and `High`, inclusive.
    GetRandomFloat<native><public>(Low:float, High:float)<transacts>:float

    # Returns a random `int` between `Low` and `High`, inclusive.
    GetRandomInt<native><public>(Low:int, High:int)<transacts>:int

    # Makes an `array` with the same elements as `Input` shuffled in a random order.
    Shuffle<public>(Input:[]t where t:type)<transacts>:[]t = external {}