<!--
id:strset
category:Strings:Definition
-->
# strset
Allows a string to be linked with a numeric value.

## Syntax
=== "Modern"
    ``` csound-orc
    strset(iarg, istring)
    ```

=== "Classic"
    ``` csound-orc
    strset iarg, istring
    ```

### Initialization

_iarg_ -- the numeric value.

_istring_ -- the alphanumeric string (in double-quotes).

_strset_ (optional) allows a string, such as a filename, to be linked with a numeric value. Its use is optional.

## Examples

The following statement, used in the orchestra header, will allow the numeric value 10 to be substituted anywhere the soundfile _asound.wav_ is called for.

``` csound-orc
strset 10, "asound.wav"
```

Here is an example of the strset opcode. It uses the file [strset.csd](../examples/strset.csd).

``` csound-csd title="Example of the strset opcode." linenums="1"
--8<-- "examples/strset.csd"
```

## See Also

[String Manipulation Opcodes](../strings/manipulate.md)

[Orchestra Header Statements](../orch/header.md)
