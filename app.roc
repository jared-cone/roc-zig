app [main] {
    pf: platform "platform/main.roc",
}

import pf.Native

main : Task {} {}
main =
    _ = Native.printNum! 100
    result = Native.returnI32! 200
    _ = Native.printNum! result
    Task.ok {}
