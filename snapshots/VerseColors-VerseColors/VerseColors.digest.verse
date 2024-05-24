using {/Verse.org/Simulation}
# Module import path: /Verse.org/Colors
Colors<public> := module:
    # Represents colors as RGB triples in the ACES 2065-1 color space.
    # Component values are linear (i.e. `*gamma* = 1.0`).
    color<native><public> := struct<concrete><computes><persistable>:
        @editable
        # Red component of this `color`.
        R<native><public>:float = external {}

        @editable
        # Green component of this `color`.
        G<native><public>:float = external {}

        @editable
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
    # Normal sRGB component values are between `0.0` and `1.0`, but this can handle larger values.
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
    MakeColorFromHex<native><public>(hexString:string)<converges>:color

    # Makes an ACES 2065-1 `color` from `Hue`, `Saturation`, and `Value` components.
    # Components use the HSV color model in the sRGB color space. Expected ranges:
    #  * `0.0 <= Hue <= 360.0`
    #  * `0.0 <= Saturation <= 1.0`
    #  * `0.0 <= Value <= 1.0`
    # Values out of expected ranges will undergo range reduction and conversion.
    MakeColorFromHSV<native><public>(Hue:float, Saturation:float, Value:float)<converges>:color

    # Makes an HSV `tuple` by converting `InColor` from an ACES 2065-1 `color` to sRGB and applying the HSV color model.
    MakeHSVFromColor<native><public>(InColor:color):tuple(float, float, float)

    # Makes an ACES 2065-1 `color` from the chromaticity of a blackbody radiator at `Temperature` Kelvin.
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