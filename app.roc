app [main] {
    pf: platform "platform/main.roc",
}

import pf.Stdout
import pf.Native

main : Task {} {}
main =
    _ = Stdout.line! "Getting result..."
    result = Native.test! {}
    _ = Stdout.line! "Result=$(result)"
    Task.ok {}
