<!--
id:changed
category:Instrument Control:Sensing and Control
-->
# changed
k-rate signal change detector.

This opcode outputs a trigger signal that informs when any one of its k-rate arguments has changed. Useful with valuator widgets or MIDI controllers.

## Syntax
=== "Modern"
    ``` csound-orc
    ktrig = changed(kvar1 [, kvar2,..., kvarN])
    ```

=== "Classic"
    ``` csound-orc
    ktrig changed kvar1 [, kvar2,..., kvarN]
    ```

### Performance

_ktrig_ - Outputs a value of 1 when any of the k-rate signals has changed, otherwise outputs 0.

_kvar1 [, kvar2,..., kvarN]_ - k-rate variables to watch for changes.

> :memo: **Note**
>
> If any of the kvars is non-zero at the first k-cycle changed is called it will report a change.  For more consistent behaviour use _changed2_.

## Examples

=== "Modern"
    Here is an example of the changed opcode. It uses the file [changed-modern.csd](../examples/changed-modern.csd).
    ``` csound-csd title="Example of the changed opcode." linenums="1"
    --8<-- "examples/changed-modern.csd"
    ```

=== "Classic"
    Here is an example of the changed opcode. It uses the file [changed.csd](../examples/changed.csd).
    ``` csound-csd title="Example of the changed opcode." linenums="1"
    --8<-- "examples/changed.csd"
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

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

Written by Gabriel Maldonado.

Example written by Andrés Cabrera.

New in Csound 5.7.
