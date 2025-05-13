<!--
id:changed2
category:Instrument Control:Sensing and Control
-->
# changed2
k-rate signal change detector.

This opcode outputs a trigger signal that informs when any one of its k-rate arguments has changed, or a value in an array. Useful with valuator widgets or MIDI controllers.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig = changed2(kvar1 [, kvar2,..., kvarN])
    ktrig = changed2(karr[])
    ktrig = changed2(aarr[])
    ```

=== "Classic"
    ``` csound-orc
    ktrig changed2 kvar1 [, kvar2,..., kvarN]
    ktrig changed2 karr[]
    ktrig changed2 aarr[]
    ```

### Performance

_ktrig_ - Outputs a value of 1 when any of the k-rate signals has changed, or any value in the array, otherwise outputs 0.

_kvar1 [, kvar2,..., kvarN]_ - k-rate variables to watch for changes.

_xarray_ - any array type.

Unlike the opcode _changed_ this opcode will never report the first cycle as a change.

## Examples

=== "Modern"
    Here are two examples of the changed2 opcode. They use the files [changed2-modern.csd](../examples/changed2-modern.csd) and [changed2a-modern.csd](../examples/changed2a-modern.csd).
    ``` csound-csd title="Example of the changed2 opcode." linenums="1"
    --8<-- "examples/changed2-modern.csd"
    ```

=== "Classic"
    Here are two examples of the changed2 opcode. They use the files [changed2.csd](../examples/changed2.csd) and [changed2a.csd](../examples/changed2a.csd).
    ``` csound-csd title="Example of the changed2 opcode." linenums="1"
    --8<-- "examples/changed2.csd"
    ```

Its output should include lines like:

```
i   1 time     0.00267:     0.00000
i1     0.00000
i1     1.00000
i1     0.00000
i   1 time     0.20267:     1.00000
i   1 time     0.40267:     1.00000
i1     1.00000
i1     0.00000
i   1 time     0.60267:     1.00000
i   1 time     0.80267:     1.00000
i1     1.00000
i1     0.00000
i   1 time     1.00000:     0.00000
i1     1.00000
i1     0.00000
i   1 time     1.20267:    -1.00000
i   1 time     1.40267:    -1.00000
i1     1.00000
i1     0.00000
i   1 time     1.60267:    -1.00000
i   1 time     1.80000:    -1.00000
i1     1.00000
i1     0.00000
i   1 time     2.00000:    -0.00000
i1     1.00000
i1     0.00000
.........
```

=== "Modern"
    ``` csound-csd title="Second example of the changed2 opcode." linenums="1"
    --8<-- "examples/changed2a-modern.csd"
    ```

=== "Classic"
    ``` csound-csd title="Second example of the changed2 opcode." linenums="1"
    --8<-- "examples/changed2a.csd"
    ```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Written by John ffitch.

Example written by Andrés Cabrera.

New in Csound 6.7
