using {/Fortnite.com/Characters}
using {/UnrealEngine.com/Temporary/SpatialMath}
using {/UnrealEngine.com/Temporary/Diagnostics}
using {/Verse.org/Simulation}
using {/Fortnite.com/Devices}
# Module import path: /Fortnite.com/VerseInternalTesting/VerseFramework
VerseFramework<public> := module:
    test_device<epic_internal> := class(creative_device):
        var TestRunner<public>:test_runner = external {}

        SuiteName<public>:string = external {}

        TestCases<public>():[]test_case = external {}

        BeforeAll<public>()<suspends>:void = external {}

        AfterAll<public>()<suspends>:void = external {}

        BeforeEach<public>()<suspends>:void = external {}

        AfterEach<public>()<suspends>:void = external {}

        OnBegin<override>():void = external {}

        RegisterTests<public>():void = external {}

    test_device_event_handler_mock<public> := class<concrete>:
        ResetCallCount<public>():void = external {}

        GetCallCount<public>():int = external {}

        Cancel<public>()<transacts>:void = external {}

        Await<public>()<suspends>:void = external {}

    device_event_void_handler_mock<public> := class(test_device_event_handler_mock):
        Subscribe<public>(Event:listenable(tuple())):void = external {}

    device_event_agent_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        Subscribe<public>(Event:listenable(agent)):void = external {}

    device_event_optional_agent_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        Subscribe<public>(Event:listenable(?agent)):void = external {}

    device_event_agent_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgInt<public>:int = external {}

        Subscribe<public>(Event:listenable(tuple(agent, int))):void = external {}

    device_event_optional_agent_int_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgAgent<public>:?agent = external {}

        var ArgInt<public>:int = external {}

        Subscribe<public>(Event:listenable(tuple(?agent, int))):void = external {}

    device_event_ai_interaction_handler_mock<public> := class(test_device_event_handler_mock):
        var ArgSource<public>:?agent = external {}

        var ArgTarget<public>:?agent = external {}

        Subscribe<public>(Event:listenable(device_ai_interaction_result)):void = external {}

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

    test_runner<epic_internal> := class<reads><allocates>:
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

        CheckEqual<public>(Actual:creative_object, Expected:transform, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

        CheckEqual<public>(ActualFortCharacter:fort_character, ExpectedTranslation:vector3, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {}, ?CompareX:logic = external {}, ?CompareY:logic = external {}, ?CompareZ:logic = external {})<suspends>:void = external {}

        CheckEqual<public>(Expected:agent, Actual:agent, Message:string):void = external {}

        CheckTrue<public>(Actual:logic, Message:string):void = external {}

        CheckNotEqual<public>(Actual:creative_object, Expected:transform, Message:string, ?Tolerance:float = external {}, ?Timeout:float = external {})<suspends>:void = external {}

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

    test_runner_status<public> := enum:
        Pending
        Setup
        Running
        Complete

    test_runner_device<epic_internal> := class(creative_device):
        TestRunner<public>:test_runner = external {}

        var Status<public>:test_runner_status = external {}

        OnBegin<override>()<suspends>:void = external {}

# Module import path: /Fortnite.com/VerseInternalTesting/NexusFramework
NexusFramework<public> := module:
    nexus_test_runner<epic_internal> := class(creative_device):
        OnEnd<override>():void = external {}

    nexus_test_device<epic_internal> := class(creative_device):
        @editable
        var TestRunner<public>:nexus_test_runner = external {}

        AddResults<epic_internal>(TestName:string, Passed:logic, ContextString:string):void = external {}

        AddPass<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddFail<epic_internal>(TestName:string, ContextString:string):void = external {}

        AddCheck<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        AddSkip<epic_internal>(IsPassed:logic, TestName:string, ContextString:string):void = external {}

        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}

    example_nexus_device<epic_internal> := class(nexus_test_device):
        OnBegin<override>()<suspends>:void = external {}

        OnEnd<override>():void = external {}