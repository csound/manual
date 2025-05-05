<!--
id:strcmp
category:Strings:Manipulation
-->
# strcmp
Compare strings.

Set the result to -1, 0, or 1 if the first string is less than, equal to, or greater than the second, respectively. strcmp compares at i-time only.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = strcmp(S1, S2)
    ```

=== "Classic"
    ``` csound-orc
    ires strcmp S1, S2
    ```

## Examples

Here is an example of the strcmp opcode. It uses the file [strcmp.csd](../examples/strcmp.csd).

``` csound-csd title="Example of the strcmp opcode." linenums="1"
--8<-- "examples/strcmp.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

## Credits

Author: Istvan Varga<br>
2005<br>
