<!--
id:envlpx
category:Signal Generators:Envelope Generators
-->
# envlpx
Applies an envelope consisting of 3 segments.

1.  stored function rise shape
2.  modified exponential pseudo steady state
3.  exponential decay

## Syntax
=== "Modern"
    ``` csound-orc
    ares = envlpx(xamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod])
    kres = envlpx(kamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod])
    ```

=== "Classic"
    ``` csound-orc
    ares envlpx xamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod]
    kres envlpx kamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod]
    ```

### Initialization

_irise_ -- rise time in seconds. A zero or negative value signifies no rise modification.

_idur_ -- overall duration in seconds. A zero or negative value will cause initialization to be skipped.

_idec_ -- decay time in seconds. Zero means no decay. An _idec_ &gt; _idur_ will cause a truncated decay.

_ifn_ -- function table number of stored rise shape with extended guard point.

_iatss_ -- the ratio of the final value of the pseudo-steady-state period to the value at its beginning (i.e the attenuation from the end of the rise segment to the start of the decay). A ratio greater than 1 causes an exponential growth and a ratio less than 1 creates an exponential decay. A ratio of 1 will maintain a true steady state at the last rise value. Note that this attenuation is not at a fixed rate (as in a piano), but is sensitive to a note's duration. However, if _iatss_ is negative (or if steady state &lt; 4 k-periods) a fixed attenuation rate of _abs_(_iatss_) per second will be used. 0 is illegal.

_iatdec_ --  the ratio of the value at the end of the decay period to the value at its beginning (the end of the steady-state segment) . It must be positive and is normally of the order of .01. A large or excessively small value is apt to produce a cutoff which is audible. A zero or negative value is illegal.

_ixmod_ (optional, between +- .9 or so) -- exponential curve modifier, influencing the steepness of the exponential trajectory during the steady state. Values less than zero will cause an accelerated growth or decay towards the target (e.g. _subito piano_). Values greater than zero will cause a retarded growth or decay. The default value is zero (unmodified exponential).

### Performance

_kamp, xamp_ -- input amplitude signal.

Rise modifications are applied for the first _irise_ seconds, and decay from time 
_idur - idec_. If these periods are separated in time there will be a steady state during which _amp_ will be modified by the first exponential pattern. If the overall duration _idur_ is exceeded in performance, the final decay will continue on in the same direction, tending asymptotically to zero.

## Examples

Here is an example of the envlpx opcode. It uses the file [envlpx.csd](../examples/envlpx.csd).

``` csound-csd title="Example of the envlpx opcode." linenums="1"
--8<-- "examples/envlpx.csd"
```

## See Also

[Envelope Generators](../siggen/envelope.md)

## Credits

Thanks goes to Luis Jure for pointing out a mistake with _iatss_.
