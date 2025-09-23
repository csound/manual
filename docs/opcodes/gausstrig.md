<!--
id:gausstrig
category:Signal Generators:Random (Noise) Generators
-->
# gausstrig
Random impulses around a certain frequency.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gausstrig(kamp, kcps, kdev [, imode] [, ifrst1])
    kres = gausstrig(kamp, kcps, kdev [, imode] [, ifrst1])
    ```

=== "Classic"
    ``` csound-orc
    ares gausstrig kamp, kcps, kdev [, imode] [, ifrst1]
    kres gausstrig kamp, kcps, kdev [, imode] [, ifrst1]
    ```

### Initialization

_imode_ (optional, default=0) -- imode &gt; 0 means better frequency modulation. If the frequency changes, the delay before the next impulse is calculed again. With the default mode we have the classic behavior of the GaussTrig ugen in SuperCollider, where the frequency modulation is bypassed during the delay time that precedes the next impulse.

_ifrst1_ (optional, default=0) -- ifrst1 &gt; 0 changes the original behavior of the GuassTrig ugen. By default, it always generates an impulse in the very beginning. Otherwise, the first impulse appearance is random and depends on _kcps_ and _kdev_ parameters.

### Performance

_kamp_ -- amplitude.

_kcps_ -- the mean frequency over which random impulses are distributed.

_kdev_ -- random deviation from mean (0 &lt;= dev &lt; 1).

## Examples

Here is an example of the gausstrig opcode. It uses the file [gausstrig.csd](../examples/gausstrig.csd).

``` csound-orc title="Example of the gausstrig opcode." linenums="1"
--8<-- "examples/gausstrig.csd"
```

Here is an example of the gausstrig opcode with imode = 1. It uses the file [gausstrig-2.csd](../examples/gausstrig-2.csd).

``` csound-orc title="Example of the gausstrig opcode with imode = 1." linenums="1"
--8<-- "examples/gausstrig-2.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Based on Bhob Rainey's GaussTrig ugen (SuperCollider)<br>
Author: Tito Latini<br>
January 2012<br>
Modification: Gleb Rogozinsky<br>
March 2015<br>

New in Csound version 5.16
