# Module import path: /UnrealEngine.com/Temporary/Diagnostics
Diagnostics<public> := module:
    # log levels available for various log commands
    log_level<native><public> := enum:
        Debug
        Verbose
        Normal
        Warning
        Error

    # log_channel is the base class used to define log channels. When printing a message to a log, the log channel class name will be prefixed to the output message.
    log_channel<native><public> := class<abstract>:


    # log class to send messages to the default log
    log<native><public> := class:
        # Channel class name will be added as a prefix used when printing the message e.g. '[log_channel]: #Message
        Channel<native><public>:subtype(log_channel)

        # Sets the default log level of the displayed message. See log_level enum for more info on log levels. Defaults to log_level.Normal.
        DefaultLevel<native><public>:log_level = external {}

        # Print message using the given log level
        (log:)Print<native><public>(Message:[]char, ?Level:log_level = external {})<computes>:void

        # Prints current script call stack using the give log level
        PrintCallStack<native><public>(?Level:log_level = external {})<computes>:void

# Module import path: /UnrealEngine.com/Temporary/Curves
Curves<public> := module:
    editable_curve<native><public> := class<final>:
        # Evaluates this float curve at the specified time and returns the result as a float
        Evaluate<native><public>(Time:float):float