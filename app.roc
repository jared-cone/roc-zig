app [main] {
    pf: platform "platform/main.roc",
}

import pf.Stdout
import pf.Native

main : Task {} {}
main =
    # _ = Stdout.line! "Hello"
    result = Native.test! {}
    _ = Stdout.line! "Result=$(Num.toStr result)"
    Task.ok {}
