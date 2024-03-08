using {/Verse.org/Simulation}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/Temporary/Diagnostics}
test_case<public> := struct:
    Name<public>:string

    Func<public>:type {__()<suspends>:void}

    Category<public>:[]string

    TimeoutOverride<public>:?float = external {}

test_suite<public> := struct:
    Name<public>:string

    Cases<public>:[]test_case

    BeforeAllFunc<public>:type {__()<suspends>:void}

    AfterAllFunc<public>:type {__()<suspends>:void}

    BeforeEachFunc<public>:type {__()<suspends>:void}

    AfterEachFunc<public>:type {__()<suspends>:void}

test_runner<epic_internal> := class<varies>:
    var TargetTestSuite<public>:string = external {}

    var EnableFlakinessEvaluation<public>:logic = external {}

    var FlakinessRunCount<public>:int = external {}

    var EnableVerboseOutput<public>:logic = external {}

    var EnableDebugOutput<public>:logic = external {}

    var EnableLogOutput<public>:logic = external {}

    var EnableTimeTracking<public>:logic = external {}

    DefaultSetupFunctionTimeoutInSeconds<public>:float = external {}

    var SetupFunctionTimeoutInSeconds<public>:float = external {}

    DefaultTestTimeoutInSeconds<public>:float = external {}

    var TestTimeoutInSeconds<public>:float = external {}

    var LogOutput<public>:[]string = external {}

    ClearLogOutput<public>():void = external {}

    PrintLogOutput<public>()<transacts>:void = external {}

    Log<public>(Level:log_level, Message:string)<transacts>:void = external {}

    RecordFlakinessTestResult<public>(TestName:string, Succeeded:logic)<transacts>:void = external {}

    ClearTests<public>()<transacts>:void = external {}

    RegisterTests<public>(TestSuite:test_suite)<transacts>:void = external {}

    ResetIncludeFilters<public>()<transacts>:void = external {}

    AddIncludeFilter<public>(Filter:string)<transacts>:void = external {}

    ResetExcludeFilters<public>()<transacts>:void = external {}

    AddExcludeFilter<public>(Filter:string)<transacts>:void = external {}

    IsTestCaseIncluded<public>(TestCase:test_case)<transacts><decides>:void = external {}

    Run<public>()<suspends>:void = external {}

    RaiseFunctionFailure<public>(FuncName:string)<transacts>:void = external {}

    CheckEqual<public>(Expected:string, Actual:string, Message:string):void = external {}

    CheckEqual<public>(Expected:int, Actual:int, Message:string):void = external {}

    CheckEqualIntArray<public>(Expected:[]int, Actual:[]int, Message:string):void = external {}

    CheckEqualFloatArray<public>(Expected:[]float, Actual:[]float, Message:string):void = external {}

    CheckEqual<public>(Expected:float, Actual:float, Message:string):void = external {}

    CheckEqual<public>(Expected:transform, Actual:transform, Message:string, ?Tolerance:float = external {}):void = external {}

    CheckEqual<public>(Expected:agent, Actual:agent, Message:string):void = external {}

    CheckTrue<public>(Actual:logic, Message:string):void = external {}

    CheckNotEqual<public>(Expected:string, Actual:string, Message:string):void = external {}

    CheckNotEqual<public>(Expected:int, Actual:int, Message:string):void = external {}

    CheckNotEqual<public>(Expected:float, Actual:float, Message:string):void = external {}

    CheckNotEqual<public>(Expected:transform, Actual:transform, Message:string, ?Tolerance:float = external {}):void = external {}

    CheckNotEqual<public>(Expected:agent, Actual:agent, Message:string):void = external {}

    CheckNotTrue<public>(Actual:logic, Message:string):void = external {}

    CheckArrayContains<public>(ActualArray:[]string, Expected:string, Message:string):void = external {}

    CheckArrayDoesNotContain<public>(ActualArray:[]string, Expected:string, Message:string):void = external {}

    CheckFailure<public>(TestFuncEval:?any, FuncName:string)<decides>:void = external {}

    Require<public>(OptionalAgent:?agent, Message:string)<transacts><decides>:agent = external {}

    var LastTestErrors<public>:[]string = external {}

    ClearLastTestResult<public>():void = external {}

    GetDisplayTime<public>(DurationInSec:float):string = external {}

    RunTestSuites<public>()<suspends>:void = external {}