<!--
id:strcatk
category:Strings:Manipulation
-->
# strcatk
Concatenate two strings and store the result in a variable.

_strcatk_ does the concatenation both at initialization and performance time. It is allowed for any of the input arguments to be the same as the output variable.

## Syntax
=== "Modern"
    ``` csound-orc
    Sdst = strcatk(Ssrc1, Ssrc2)
    ```

=== "Classic"
    ``` csound-orc
    Sdst strcatk Ssrc1, Ssrc2
    ```

## Examples

Here is an example of the strcatk opcode. It uses the file [strcatk.csd](../examples/strcatk.csd).

``` csound-csd title="Example of the strcatk opcode." linenums="1"
--8<-- "examples/strcatk.csd"
```

Its output should include lines like this:

```
1 + 1 = 2
1 + 1 + 1 = 3
1 + 1 + 1 + 1 = 4
1 + 1 + 1 + 1 + 1 = 5
1 + 1 + 1 + 1 + 1 + 1 = 6
1 + 1 + 1 + 1 + 1 + 1 + 1 = 7
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 8
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 9
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 10
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 11
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 12
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>

New in version 5.02
