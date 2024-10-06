hosted Native
    exposes [
        stdoutLine,
        doNothing,
        returnI32,
        printNum,
    ]
    imports []

stdoutLine : Str -> Task {} {}

doNothing : {} -> Task {} {}

returnI32 : I32 -> Task I32 {}

printNum : I32 -> Task {} {}
