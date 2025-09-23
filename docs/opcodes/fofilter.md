<!--
id:fofilter
category:Signal Modifiers:Specialized Filters
-->
# fofilter
Formant filter.

Fofilter generates a stream of overlapping sinewave grains, when fed with a pulse train. Each grain is the impulse response of a combination of two BP filters. The grains are defined by their attack time (determining the skirtwidth of the formant region at -60dB) and decay time (-6dB bandwidth). Overlapping will occur when 1/freq &lt; decay, but, unlike FOF, there is no upper limit on the number of overlaps. The original idea for this opcode came from J McCartney's formlet class in SuperCollider, but this is possibly implemented differently(?).

## Syntax
=== "Modern"
    ``` csound-orc
    asig = fofilter(ain, xcf, xris, xdec[, istor])
    ```

=== "Classic"
    ``` csound-orc
    asig fofilter ain, xcf, xris, xdec[, istor]
    ```

### Initialization

_istor_ --initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal.

_xcf_ -- filter centre frequency

_xris_ -- impulse response attack time (secs).

_xdec_ -- impulse response decay time (secs).

## Examples

Here is an example of the fofilter opcode. It uses the file [fofilter.csd](../examples/fofilter.csd).

``` csound-csd title="Example of the fofilter opcode." linenums="1"
--8<-- "examples/fofilter.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

Audio rate parameters introduced in version 6.02

November 2013.
