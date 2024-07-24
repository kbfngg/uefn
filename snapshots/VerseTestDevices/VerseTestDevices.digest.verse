using {/Verse.org/Simulation}
using {/Verse.org/TestFramework}
using {/Fortnite.com/Devices}
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

    Cancel<public>():void = external {}

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

test_runner_status<public> := enum:
    Pending
    Setup
    Running
    Complete

test_runner_device<epic_internal> := class(creative_device):
    TestRunner<public>:test_runner = external {}

    var Status<public>:test_runner_status = external {}

    OnBegin<override>()<suspends>:void = external {}