module [line]

import Native

line : Str -> Task {} {}
line = Native.stdoutLine
