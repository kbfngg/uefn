# A parametric interface implemented by events with a `payload` that can be waited on. Matched with `signalable.`
awaitable<public>(payload:type)<computes> := interface:
    # Suspends the current task until resumed by a matching call to `signalable.Signal`. Returns the event `payload`.
    Await<public>()<suspends>:payload

awaitable<public>()<computes> := awaitable(void)

task<native><public>(t:type)<computes> := class<abstract><final>(awaitable(t)):
    Active<native><epic_internal>()<transacts><decides>:void

    Completed<native><epic_internal>()<transacts><decides>:void

    Canceling<native><epic_internal>()<transacts><decides>:void

    Canceled<native><epic_internal>()<transacts><decides>:void

    Unsettled<native><epic_internal>()<transacts><decides>:void

    Settled<native><epic_internal>()<transacts><decides>:void

    Uninterrupted<native><epic_internal>()<transacts><decides>:void

    Interrupted<native><epic_internal>()<transacts><decides>:void

    Await<native><override>()<suspends>:t

    Cancel<native><epic_internal>():void