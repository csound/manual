# Included files

It is sometimes convenient to have the score in more than one file. This use is supported by the [#include](../opcodes/include.md) facility which is part of the macro system. A line containing the text

``` csound-sco
#include "filename"
```

where the character `"` can be replaced by any suitable character. For most uses the double quote symbol will probably be the most convenient. The file name can include a full path.

This takes input from the named file until it ends, when input reverts to the previous input. There is currently a limit of 20 on the depth of included files and macros.

A suggested use of `#include` would be to define a set of macros which are part of the composer's style. It could also be used to provide repeated sections.

``` csound-sco
s
#include :section1:
;; Repeat that
s
#include :section1:
```

Alternative methods of doing repeats, use the [r statement](../scoregens/r.md), [m statement](../scoregens/m.md), and [n statement](../scoregens/n.md).

The form `#includestr` is the same as `#include` except the deliminator must be a double quote and the file name may contain macro calls.
