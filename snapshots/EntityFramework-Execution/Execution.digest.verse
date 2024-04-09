execution_subscription<native><epic_internal> := class(cancelable):
    Cancel<native><override>()<transacts>:void

    RunAfter<native><epic_internal>(__dupe___unnamed_parameter_46:execution_subscription):void

    RunBefore<native><epic_internal>(__dupe___unnamed_parameter_47:execution_subscription):void

execution_subscribable<native><epic_internal> := class(subscribable(float)):
    Subscribe<native><override>(Callback:type {__(:float):void})<transacts>:cancelable