using {/Verse.org/Native}
using {/Verse.org/Simulation}
# Module import path: /UnrealEngine.com/Temporary/SpatialMath
SpatialMath<public> := module:
    @editable
    @import_as("/Script/EpicGamesTemporary.FVerseRotation")
    rotation<native><public> := struct<concrete>:


    # Makes a `rotation` from `Axis` and `AngleRadians` using a left-handed sign convention (e.g. a positive rotation around +Z takes +X to +Y). If `Axis.IsAlmostZero[]`, make the identity rotation.
    MakeRotation<native><public>(Axis:vector3, AngleRadians:float)<varies>:rotation

    # Makes a `rotation` by applying `YawRightDegrees`, `PitchUpDegrees`, and `RollClockwiseDegrees`, in that order:
    #  * first a *yaw* about the Z axis with a positive angle indicating a clockwise rotation when viewed from above,
    #  * then a *pitch* about the new Y axis with a positive angle indicating 'nose up',
    #  * followed by a *roll* about the new X axis axis with a positive angle indicating a clockwise rotation when viewed along +X.
    # Note that these conventions differ from `MakeRotation` but match `ApplyYaw`, `ApplyPitch`, and `ApplyRoll`.
    MakeRotationFromYawPitchRollDegrees<native><public>(YawRightDegrees:float, PitchUpDegrees:float, RollClockwiseDegrees:float)<varies>:rotation

    # Makes the identity `rotation`.
    IdentityRotation<native><public>()<converges>:rotation

    # Returns the 'distance' between `Rotation1` and `Rotation2`. The result will be between:
    #  * `0.0`, representing equivalent rotations and
    #  * `1.0` representing rotations which are 180 degrees apart (i.e., the shortest rotation between them is 180 degrees around some axis).
    Distance<native><public>(Rotation1:rotation, Rotation2:rotation)<varies>:float

    # Returns the 'smallest angular distance' between `Rotation1` and `Rotation2` in radians.
    AngularDistance<native><public>(Rotation1:rotation, Rotation2:rotation)<varies>:float

    # Makes a `rotation` by applying `PitchUpRadians` of right-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyPitch<native><public>(PitchUpRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `RollClockwiseRadians` of right-handed rotation around the local +X axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyRoll<native><public>(RollClockwiseRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `YawRightRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyYaw<native><public>(YawRightRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +X axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationX<native><public>(AngleRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Y axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationY<native><public>(AngleRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the world +Z axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyWorldRotationZ<native><public>(AngleRadians:float)<transacts>:rotation

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Y axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyLocalRotationY<public>(AngleRadians:float)<transacts>:rotation = external {}

    # Makes a `rotation` by applying `AngleRadians` of left-handed rotation around the local +Z axis to `InitialRotation`.
    (InitialRotation:rotation).ApplyLocalRotationZ<public>(AngleRadians:float)<transacts>:rotation = external {}

    # Makes a `rotation` by composing `AdditionalRotation` to `InitialRotation`.
    (InitialRotation:rotation).RotateBy<native><public>(AdditionalRotation:rotation)<transacts>:rotation

    # Makes a `rotation` by composing the inverse of `RotationToRemove` from `InitialRotation`. such that InitialRotation = RotateBy(UnrotateBy(InitialRotation, RotationToRemove), RotationToRemove). This is equivalent to RotateBy(InitialRotation, InvertRotation(RotationToRemove))
    (InitialRotation:rotation).UnrotateBy<native><public>(RotationToRemove:rotation)<transacts>:rotation

    # Makes an `[]float` with three elements:
    #  * *yaw* degrees of `rotation`
    #  * *pitch* degrees of `rotation`
    #  * *roll* degrees of `rotation`
    # using the conventions of `MakeRotationFromYawPitchRollDegrees`.
    (Rotation:rotation).GetYawPitchRollDegrees<native><public>()<varies>:[]float

    # Makes a `vector3` from the axis of `rotation`.
    # If `rotation` is nearly identity, this will return the +X axis. See also `GetAngle`.
    (Rotation:rotation).GetAxis<native><public>()<varies>:vector3

    # Returns the radians of `rotation` around the axis of `rotation`. See also `GetAxis`.
    (Rotation:rotation).GetAngle<native><public>()<varies>:float

    # Makes the smallest angular `rotation` from `InitialRotation` to `FinalRotation` such that:
    # `InitialRotation.RotateBy(MakeShortestRotationBetween(InitialRotation, FinalRotation)) = FinalRotation` and
    # `MakeShortestRotationBetween(InitialRotation, FinalRotation)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialRotation:rotation, FinalRotation:rotation)<transacts>:rotation

    # Makes the smallest angular `rotation` from `InitialVector` to `FinalVector` such that:
    # `InitialVector.RotateBy(MakeShortestRotationBetween(InitialVector, Vector)) = FinalVector` and
    # `MakeShortestRotationBetween(InitialVector, FinalVector)?.GetAngle()` is as small as possible.
    MakeShortestRotationBetween<native><public>(InitialVector:vector3, FinalVector:vector3)<transacts>:rotation

    # Makes a new `rotation` from the component wise subtraction of the Euler angle components in `RotationA` by 
    # the Euler angle components in `RotationB` and ensures the returned value is normalized.
    MakeComponentWiseDeltaRotation<native><public>(RotationA:rotation, RotationB:rotation)<transacts>:rotation

    # Used to perform spherical linear interpolation between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that `0.0 <= Parameter <= 1.0`.
    Slerp<native><public>(InitialRotation:rotation, FinalRotation:rotation, Parameter:float)<transacts><decides>:rotation

    # Makes a `vector3` by applying `Rotation` to `Vector`.
    (Rotation:rotation).RotateVector<native><public>(Vector:vector3)<transacts>:vector3

    # Makes a `vector3` by applying the inverse of `Rotation` to `Vector`.
    (Rotation:rotation).UnrotateVector<native><public>(Vector:vector3)<transacts>:vector3

    # Makes a `rotation` by inverting `Rotation` such that `ApplyRotation(Rotation, Rotation.Invert())) = IdentityRotation`.
    (Rotation:rotation).Invert<native><public>()<transacts>:rotation

    # Returns `Rotation` if it does not contain `NaN`, `Inf` or `-Inf`.
    (Rotation:rotation).IsFinite<native><public>()<computes><decides>:rotation

    # Makes a unit `vector3` pointing in the local space *forward* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=1.0, Y:=0.0, Z:=0.0})`.
    (Rotation:rotation).GetLocalForward<public>()<transacts>:vector3 = external {}

    # Makes a unit `vector3` pointing in the the local space *right* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=1.0, Z:=0.0})`.
    (Rotation:rotation).GetLocalRight<public>()<transacts>:vector3 = external {}

    # Makes a unit `vector3` pointing in the local space *up* direction in world space coordinates.
    # This is equivalent to: `RotateVector(Rotation, vector3{X:=0.0, Y:=0.0, Z:=1.0})`.
    (Rotation:rotation).GetLocalUp<public>()<transacts>:vector3 = external {}

    # Makes a `string` representation of `rotation` in axis/degrees format with a left-handed sign convention.
    # `ToString(MakeRotation(vector3{X:=1.0, Y:=0.0, Z:=0.0}, PiFloat/2.0))` produces the string: `"Axis: {x=1.000000,y=0.000000,z=0.000000} Angle: 90.000000"`.
    ToString<native><public>(Rotation:rotation)<varies>:string

    # Returns radians from `Degrees`.
    DegreesToRadians<public>(Degrees:float)<varies>:float = external {}

    # Returns degrees from `Radians`.
    RadiansToDegrees<public>(Radians:float)<varies>:float = external {}

    # A combination of scale, rotation, and translation, applied in that order.
    transform<native><public> := struct<concrete><computes>:
        @editable
        # The scale of this `transform`.
        Scale<native><public>:vector3 = external {}

        @editable
        # The rotation of this `transform`.
        Rotation<native><public>:rotation = external {}

        @editable
        # The location of this `transform`.
        Translation<native><public>:vector3 = external {}

    # Makes a `vector3` by applying `InTransform` to `InVector`.
    TransformVector<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

    # Makes a `vector3` by applying `InTransform` to `InVector` without applying `InTransform.Scale`.
    TransformVectorNoScale<native><public>(InTransform:transform, InVector:vector3)<varies>:vector3

    # Makes a `string` representation of `InTransform` where the result is on the form.
    # `"Scale: {ToString(`InTransform.Scale`)} Rotation: {ToString(`InTransform.Rotation`)} Translation: {ToString(`InTransform.Translation`)}.
    ToString<native><epic_internal>(InTransform:transform)<varies>:string

    # 2-dimensional vector with `float` components.
    vector2<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:float = external {}

        @editable
        Y<native><public>:float = external {}

    # Makes a `vector2` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction:vector2, SurfaceNormal:vector2)<varies><decides>:vector2

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1:vector2, V2:vector2)<varies>:float

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1:vector2, V2:vector2)<varies>:float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1:vector2, V2:vector2)<varies>:float

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V:vector2).MakeUnitVector<native><public>()<varies><decides>:vector2

    # Returns the length of `V`.
    (V:vector2).Length<public>()<varies>:float = external {}

    # Returns the squared length of `V`.
    (V:vector2).LengthSquared<public>()<varies>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From:vector2, To:vector2, Parameter:float)<varies>:vector2 = external {}

    # Makes a `string` representation of `V`.
    ToString<native><public>(V:vector2)<varies>:string

    # Makes a `vector2` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

    # Makes a `vector2` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left:float, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left:vector2, Right:float)<computes>:vector2 = external {}

    # Makes a `vector2` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left:vector2, Right:vector2)<computes>:vector2 = external {}

    # Makes a `vector2` by converting the components of `V` to `float`s.
    ToVector2<public>(V:vector2i)<transacts>:vector2 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector2).IsFinite<public>()<computes><decides>:vector2 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector2).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1:vector2, V2:vector2, AbsoluteTolerance:float)<computes><decides>:void = external {}

    # 2-dimensional vector with `int` components.
    vector2i<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:int = external {}

        @editable
        Y<native><public>:int = external {}

    # Returns the dot product of `V1` and `V2`.
    DotProduct<public>(V1:vector2i, V2:vector2i)<computes>:int = external {}

    # Makes a `vector2i` that is component-wise equal to `V1` and `V2`.
    # Fails if any component of `V1` does not equal the corresponding component of `V2`.
    Equals<public>(V1:vector2i, V2:vector2i)<computes><decides>:vector2i = external {}

    # Makes a `string` representation of `V`.
    ToString<native><public>(V:vector2i)<computes>:string

    # Makes a `vector2i` by component-wise truncation of `V` to `ints`s.
    ToVector2i<public>(V:vector2)<varies><decides>:vector2i = external {}

    # Makes a `vector2i` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left:vector2i, Right:vector2i)<computes>:vector2i = external {}

    # Makes a `vector2i` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left:vector2i, Right:int)<computes>:vector2i = external {}

    # Makes a `vector2i` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left:int, Right:vector2i)<computes>:vector2i = external {}

    # 3-dimensional vector with `float` components.
    vector3<native><public> := struct<concrete><computes><persistable>:
        @editable
        X<native><public>:float = external {}

        @editable
        Y<native><public>:float = external {}

        @editable
        Z<native><public>:float = external {}

    # Makes a unit `vector3` pointing in the positive X axis (forward)
    XAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Y axis (right)
    YAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a unit `vector3` pointing in the positive Z axis (up)
    ZAxis<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` with all components `0.0`.
    Zero<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` with all components `1.0`.
    Ones<epic_internal>()<computes>:vector3 = external {}

    # Makes a `vector3` by inverting the `SurfaceNormal` component of `Direction`.
    # Fails if `not SurfaceNormal.MakeUnitVector[]`.
    ReflectVector<native><public>(Direction:vector3, SurfaceNormal:vector3)<varies><decides>:vector3

    # Returns the dot product of `V1` and `V2`.
    DotProduct<native><public>(V1:vector3, V2:vector3)<varies>:float

    # Returns the cross product of `V1` and `V2`.
    CrossProduct<native><public>(V1:vector3, V2:vector3)<varies>:vector3

    # Returns the Euclidean distance between `V1` and `V2`.
    Distance<native><public>(V1:vector3, V2:vector3)<varies>:float

    # Returns the squared Euclidean distance between `V1` and `V2`.
    DistanceSquared<native><public>(V1:vector3, V2:vector3)<varies>:float

    # Returns the 2-D Euclidean distance between `V1` and `V2` by ignoring the difference in `Z`.
    DistanceXY<native><public>(V1:vector3, V2:vector3)<varies>:float

    # Returns the squared 2-D Euclidean distance between `V1` and `V2` by ignoring their difference in `Z`.
    DistanceSquaredXY<native><public>(V1:vector3, V2:vector3)<varies>:float

    # Makes a unit length `vector3` pointing in the same direction of `V`.
    # Fails if `V.IsAlmostZero[] or not V.IsFinite[]`.
    (V:vector3).MakeUnitVector<native><public>()<varies><decides>:vector3

    # Makes a `string` representation of `V`.
    ToString<native><public>(V:vector3)<varies>:string

    # Returns the length of `V`.
    (V:vector3).Length<public>()<varies>:float = external {}

    # Returns the squared length of `V`.
    (V:vector3).LengthSquared<public>()<computes>:float = external {}

    # Returns the length of `V` as if `V.Z = 0.0`.
    (V:vector3).LengthXY<public>()<varies>:float = external {}

    # Returns the squared length of `V` as if `V.Z = 0.0`.
    (V:vector3).LengthSquaredXY<public>()<varies>:float = external {}

    # Used to linearly interpolate/extrapolate between `From` (when `Parameter = 0.0`) and `To` (when `Parameter = 1.0`). Expects that all arguments are finite.
    # Returns `From*(1 - Parameter) + To*Parameter`.
    Lerp<public>(From:vector3, To:vector3, Parameter:float)<varies>:vector3 = external {}

    # Makes a `vector3` by inverting the signs of `Operand`.
    prefix'-'<public>(Operand:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise addition of `Left` and `Right`.
    operator'+'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise subtraction of `Right` from `Left`.
    operator'-'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise multiplication of `Left` and `Right`.
    operator'*'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Left` by `Right`.
    operator'*'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by multiplying the components of `Right` by `Left`.
    operator'*'<public>(Left:float, Right:vector3)<computes>:vector3 = external {}

    # Makes a `vector3` by dividing the components of `Left` by `Right`.
    operator'/'<public>(Left:vector3, Right:float)<computes>:vector3 = external {}

    # Makes a `vector3` by component-wise division of `Left` by `Right`.
    operator'/'<public>(Left:vector3, Right:vector3)<computes>:vector3 = external {}

    # Returns `V` if all components are finite.
    # Fails if any of the components are not finite.
    (V:vector3).IsFinite<public>()<computes><decides>:vector3 = external {}

    # Succeeds when each component of `V` is within `AbsoluteTolerance` of `0.0`.
    (V:vector3).IsAlmostZero<public>(AbsoluteTolerance:float)<computes><decides>:void = external {}

    # Succeeds when each component of `V1` and `V2` are within `AbsoluteTolerance` of each other.
    IsAlmostEqual<public>(V1:vector3, V2:vector3, AbsoluteTolerance:float)<computes><decides>:void = external {}