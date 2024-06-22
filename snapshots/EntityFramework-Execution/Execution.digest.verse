@experimental
execution_subscription<native><epic_internal> := class(cancelable):
    @experimental
    Cancel<native><override>()<transacts>:void

    @experimental
    RunAfter<native><epic_internal>(__dupe___unnamed_parameter_46:execution_subscription):void

    @experimental
    RunBefore<native><epic_internal>(__dupe___unnamed_parameter_47:execution_subscription):void

@experimental
# Used to subscribe a callback to a DeltaTime based callback from one of the phases in a component's `TickEvents` object.'IMPORTANT: You must keep a pointer on your component to the returned `cancelable`. Otherwise the GC will eventuallyclean up your subscription and your callback will stop being invoked.
execution_subscribable<native><public> := class<epic_internal>(subscribable(float)):
    @experimental
    # Subscribe a callback function to this TickEvent phase. The input parameter to your function (DeltaTime) is the time that haspassed between the last update and the current update.
    Subscribe<native><override>(Callback:type {__(:float):void})<transacts>:cancelable