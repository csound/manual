<!--
id:samphold
category:Signal Modifiers:Sample Level Operators
-->
# samphold
Performs a sample-and-hold operation on its input.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = samphold(asig, agate [, ival] [, ivstor])
    kres = samphold(ksig, kgate [, ival] [, ivstor])
    ```

=== "Classic"
    ``` csound-orc
    ares samphold asig, agate [, ival] [, ivstor]
    kres samphold ksig, kgate [, ival] [, ivstor]
    ```

### Initialization

_ival, ivstor_ (optional) -- controls initial disposition of internal save space. If _ivstor_ is zero the internal &#8220;hold&#8221; value is set to _ival_ ; else it retains its previous value. Defaults are 0,0 (i.e. init to zero)

### Performance

_kgate, xgate_ -- controls whether to hold the signal.

_samphold_ performs a sample-and-hold operation on its input according to the value of _gate_. If _gate != 0_, the input samples are passed to the output; if _gate = 0_, the last output value is repeated. The controlling _gate_ can be a constant, a control signal, or an audio signal.

## Examples

``` csound-orc linenums="1"
asrc  buzz      10000, 440, 20, 1     ; band-limited pulse train
adif  diff      asrc                  ; emphasize the highs
anew  balance   adif, asrc            ;   but retain the power
agate reson     asrc, 0, 440          ; use a lowpass of the original
asamp samphold  anew, agate           ;   to gate the new audiosig
aout  tone      asamp, 100            ; smooth out the rough edges
```

Here is another example of the samphold opcode. It uses the file [samphold.csd](../examples/samphold.csd).

``` csound-csd title="Example of the samphold opcode." linenums="1"
--8<-- "examples/samphold.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)
