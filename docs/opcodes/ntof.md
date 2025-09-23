<!--
id:ntof
category:Pitch Converters:Functions
-->
# ntof
Convert note name to frequency.

Plugin opcode in emugens.

It allows note name to include microtones or a deviation in cents.

## Syntax
=== "Modern"
    ``` csound-orc
    kfreq = ntof(Snote)
    ifreq = ntof(Snote)
    ```

=== "Classic"
    ``` csound-orc
    kfreq ntof Snote
    ifreq ntof Snote
    ```

### Performance

_Snote_ -- Note name

_kfreq_ -- Frequency

> :memo: **Note**
>
> The frequency returned depends on the value of the global variable A4

> :memo: **Note**
>
> 4C is the central C in the piano.

## Examples

Here is an example of the ntof opcode. It uses the file [ntof.csd](../examples/ntof.csd).

``` csound-csd title="Example of the ntof opcode." linenums="1"
--8<-- "examples/ntof.csd"
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

[Midi Converters](../midi/convert.md)

## Credits

By: Eduardo Moguillansky 2019

New in 6.13
