app [main] {
    pf: platform "platform/main.roc",
}

import pf.Native
import pf.Stdout

main : Task {} {}
main =
    _ = Native.printNum! 1
    result = Native.returnI32! 2
    _ = Native.printNum! result
    _ = Native.printNum! 3
    Task.ok {}
