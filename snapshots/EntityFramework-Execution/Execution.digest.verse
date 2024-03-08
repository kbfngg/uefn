# Module import path: /UnrealEngine.com/Execution
Execution<public> := module:
    execution_subscription<native><public> := class(cancelable):
        Cancel<native><override>()<transacts>:void

        RunAfter<native><public>(__dupe___unnamed_parameter_46:execution_subscription)<transacts>:void

        RunBefore<native><public>(__dupe___unnamed_parameter_47:execution_subscription)<transacts>:void

    execution_subscribable<native><public> := class:
        Subscribe<native><public>(Callback:type {__():void}, ?Interval:float = external {})<transacts>:execution_subscription

        SubscribeWithTime<native><public>(Callback:type {__(:float):void}, ?Interval:float = external {})<transacts>:execution_subscription