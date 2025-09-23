<!--
id:nlfilt2
category:Signal Modifiers:Specialized Filters
-->
# nlfilt2
A filter with a non-linear effect and blowup protection.

Implements the filter:

$$
Y[n] = tanh(a \; Y[n-1] + b \; Y[n-2] + d \; Y^2[n-L] + X[n] - C)
$$

described in Dobson and Fitch (ICMC'96) as modified by Risto Holopainen.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = nlfilt2(ain, ka, kb, kd, kC, kL)
    ```

=== "Classic"
    ``` csound-orc
    ares nlfilt2 ain, ka, kb, kd, kC, kL
    ```

### Performance

1.   Non-linear effect. The range of parameters are:
```
a = b = 0
d = 0.8, 0.9, 0.7
C = 0.4, 0.5, 0.6
L = 20
```
This affects the lower register most but there are audible effects over the whole range. We suggest that it may be useful for coloring drums, and for adding arbitrary highlights to notes.
2.   Low Pass with non-linear. The range of parameters are:
```
a = 0.4
b = 0.2
d = 0.7
C = 0.11
L = 20, ... 200
```
There are instability problems with this variant but the effect is more pronounced of the lower register, but is otherwise much like the pure comb. Short values of _L_ can add attack to a sound.
3.   High Pass with non-linear. The range of parameters are:
```
a = 0.35
b = -0.3
d = 0.95
C = 0,2, ... 0.4
L = 200
```
4.   High Pass with non-linear. The range of parameters are:
```
a = 0.7
b = -0.2, ... 0.5
d = 0.9
C = 0.12, ... 0.24
L = 500, 10
```

The high pass version is less likely to oscillate. It adds scintillation to medium-high registers. With a large delay _L_ it is a little like a reverberation, while with small values there appear to be formant-like regions. There are arbitrary color changes and resonances as the pitch changes. Works well with individual notes.

> :warning: **Warning**
>
> The "useful" ranges of parameters are not yet mapped.

## Examples

Here is an example of the nlfilt2 opcode. It uses the file [nlfilt2.csd](../examples/nlfilt2.csd).

``` csound-csd title="Example of the nlfilt2 opcode." linenums="1"
--8<-- "examples/nlfilt2.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
2012<br>

New in version 5.19
