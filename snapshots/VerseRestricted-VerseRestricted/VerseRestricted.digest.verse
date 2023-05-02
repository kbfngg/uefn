using {/Verse.org/Concurrency}
# Module import path: /Verse.org/Restricted
Restricted<public> := module:
    sticky_event<native><public>(t:type)<computes> := class(signalable(t), awaitable(t)):
        IsSignaled<native><public>()<decides>:void

        ClearSignal<native><public>():void

        GetAwaitCount<native><epic_internal>():int

        Await<native><override>()<suspends>:t

        Signal<native><override>(__dupe___unnamed_parameter_22:t):void

    sticky_event<public>()<computes> := sticky_event(void)