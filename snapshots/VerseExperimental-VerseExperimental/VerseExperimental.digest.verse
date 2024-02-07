# Module import path: /Verse.org/VerseExperimental
VerseExperimental<public> := module:
    # Enumerates the days of the week in 7-day calendars.
    day_of_week<native><public> := enum:
        Monday
        Tuesday
        Wednesday
        Thursday
        Friday
        Saturday
        Sunday

    # Enumerates the months of the year in 12-month calendars.
    month_of_year<native><public> := enum:
        January
        February
        March
        April
        May
        June
        July
        August
        September
        October
        November
        December

    date_time<native><public> := struct:


    # Creates and initializes a new instance with the specified year, month, day, hour, minute, second and millisecond.
    CreateDateTime<native><public>(Year:int, Month:int, Day:int, Hour:int, Minute:int, Second:int, Millisecond:int)<transacts><decides>:date_time

    ValidateDateTime<native><public>(Year:int, Month:int, Day:int, Hour:int, Minute:int, Second:int, Millisecond:int):logic

    # Return the number of days in the specified month of the specified year
    DaysInMonth<native><public>(Year:int, Month:int):int

    # Return the number of days in the specified year
    DaysInYear<native><public>(Year:int):int

    # Returns the maximum date value. The maximum date value is December 31, 9999, 23:59:59.9999999. See DateTimeMin
    DateTimeMax<public>()<transacts>:date_time = external {}

    # Returns the minimum date value. The minimum date value is January 1, 0001, 00:00:00.0. See DateTimeMax
    DateTimeMin<public>()<transacts>:date_time = external {}

    # Returns a string representation of the datetime in the following format: yyyy.mm.dd-hh.mm.ss. Assumes Datetime is in UTC.
    ToString<native><public>(Val:date_time):[]char

    # Returns the current UTC date_time.
    UtcNow<native><public>():date_time

    date_parts<native><public> := struct<internal>:


    time_of_day_parts<native><public> := struct<internal>:


    GetDate<native><public>(Val:date_time):date_parts

    GetTimeOfDay<native><public>(Val:date_time):time_of_day_parts

    GetYear<native><public>(Val:date_time):int

    GetMonth<native><public>(Val:date_time):int

    GetDay<native><public>(Val:date_time):int

    GetHours<native><public>(Val:date_time):int

    GetMinutes<native><public>(Val:date_time):int

    GetSeconds<native><public>(Val:date_time):int

    GetMilliseconds<native><public>(Val:date_time):int

    GetMicroseconds<native><public>(Val:date_time):int

    GetNanoseconds<native><public>(Val:date_time):int

    GetDayOfWeek<native><public>(Val:date_time):day_of_week

    GetMonthOfYear<native><public>(Val:date_time):month_of_year

    Less<public>(Left:date_time, Right:date_time)<transacts><decides>:date_time = external {}

    Greater<public>(Left:date_time, Right:date_time)<transacts><decides>:date_time = external {}

    GreaterEqual<public>(Left:date_time, Right:date_time)<transacts><decides>:date_time = external {}

    LessEqual<public>(Left:date_time, Right:date_time)<transacts><decides>:date_time = external {}

    operator'+'<public>(Left:date_time, Right:time_span):date_time = external {}

    operator'-'<public>(Left:date_time, Right:time_span):date_time = external {}

    time_span<native><public> := struct:


    # Creates and initializes a new instance with the specified days, hours, minutes, seconds and milliseconds.
    CreateTimeSpan<native><public>(Days:int, Hours:int, Minutes:int, Seconds:int, Milliseconds:int)<transacts>:time_span

    # Returns a string representation of the time span in the following format: yyyy.mm.dd-hh.mm.ss.
    ToString<native><public>(Val:time_span):[]char

    GetDays<native><public>(Val:time_span):int

    GetHours<native><public>(Val:time_span):int

    GetMinutes<native><public>(Val:time_span):int

    GetSeconds<native><public>(Val:time_span):int

    GetMilliseconds<native><public>(Val:time_span):int

    GetMicroseconds<native><public>(Val:time_span):int

    GetNanoseconds<native><public>(Val:time_span):int

    GetTotalDays<native><public>(Val:time_span):int

    GetTotalHours<native><public>(Val:time_span):int

    GetTotalMinutes<native><public>(Val:time_span):int

    GetTotalSeconds<native><public>(Val:time_span):int

    GetTotalMilliseconds<native><public>(Val:time_span):int

    GetTotalMicroseconds<native><public>(Val:time_span):int

    operator'+'<public>(Left:time_span, Right:time_span):time_span = external {}

    operator'-'<public>(Left:time_span, Right:time_span):time_span = external {}

    operator'-'<public>(Right:time_span):time_span = external {}

    operator'*'<public>(Left:time_span, Right:float):time_span = external {}

    operator'*'<public>(Left:float, Right:time_span):time_span = external {}

    operator'/'<public>(Left:time_span, Right:float):time_span = external {}

    Less<public>(Left:time_span, Right:time_span)<transacts><decides>:time_span = external {}

    Greater<public>(Left:time_span, Right:time_span)<transacts><decides>:time_span = external {}

    GreaterEqual<public>(Left:time_span, Right:time_span)<transacts><decides>:time_span = external {}

    LessEqual<public>(Left:time_span, Right:time_span)<transacts><decides>:time_span = external {}

    operator'-'<public>(Left:date_time, Right:date_time):time_span = external {}