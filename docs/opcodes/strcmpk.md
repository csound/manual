<!--
id:strcmpk
category:Strings:Manipulation
-->
# strcmpk
Compare strings.

Set the result to -1, 0, or 1 if the first string is less than, equal to, or greater than the second, respectively. _strcmpk_ does the comparison both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = strcmpk(S1, S2)
    ```

=== "Classic"
    ``` csound-orc
    kres strcmpk S1, S2
    ```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
