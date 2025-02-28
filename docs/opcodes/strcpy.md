<!--
id:strcpy
category:Strings:Manipulation
-->
# strcpy
Assign to a string variable by copying the source which may be a constant or another string variable.

_strcpy_ and _=_copy the string at i-time only.

## Syntax
``` csound-orc
Sdst strcpy Ssrc
Sdst = Ssrc
```

Example

``` csound-orc
Sfoo    strcpy "Hello, world !"
        puts   Sfoo, 1
```

## See Also

[String Manipulation Opcodes](../../strings/manipulate)

## Credits

Author: Istvan Varga<br>
2005<br>
