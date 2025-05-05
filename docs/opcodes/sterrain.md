<!--
id:sterrain
category:Signal Generators:Wave Terrain Synthesis
-->
# sterrain
A wave-terrain synthesis opcode using curves computed with the superformula.

See [Wikipedia](https://en.wikipedia.org/wiki/Superformula) for more information.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = sterrain(kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, km1, km2, \
                    kn1, kn2, kn3, ka, kb, kperiod)
    ```

=== "Classic"
    ``` csound-orc
    aout sterrain kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, km1, km2, \
                  kn1, kn2, kn3, ka, kb, kperiod
    ```

### Performance

_ktabx, ktaby_ -- The two tables that define the terrain - they can be changed at krate.

The output is the result of drawing the superformula curve with parameters _km1, km2, kn1, kn2, kn3, ka, kb_ (see on wikipedia), scaled with _krx_ and _kry_ and centered at _kx_, _ky_ on the terrain, rotated around the center with _krot_ radians, and traversing it at frequency _kcps/kperiod_._km1,km2_ are converted to integers.

As the speed of the point can change considerably for some parameter classes when drawing curve on the terrain some different sounds can be produced compared with other standard curves e.g. it can make triangle like parts in the output wave.

The following ranges are supported and useful:

_kn1, ka, kb_ -- !=0 and continous.

_kn2, kn3_ -- continous.

_km1, km2_ -- positive integer > 0: note that the curves are not on all combinations of km1,km2 closed and have poles (closed in infinity) for example if kn1>0 and there exists an n,m in Z with 2*km1/km2 = 2m+1/n i.e curves with (3,2) (5,2) (7,2) etc and (5,4) (6,4) (7,4) (9,4) etc. have a pole which is noticeable when listening. If kn1 &lt; 0 then the curve is reversed and the poles go towards zero in this case. If km1 and km2 are zero silence is produced (a plain circ - same effect occurs with the tuple 2,2,2,2,2,1,1).

_kperiod_ -- some km1 and km2 ratios may cause pitch shifts. With the kperiod parameter this can be fixed. If the ratio is 1 then the kperiod value should also be set to km1 to get the incoming pitch out.

## Examples

Here is an example of the sterrain opcode wich shows the impact of letting kn1 running towards zero. It uses the file [sterrain.csd](../examples/sterrain.csd).

``` csound-csd title="Example of the sterrain opcode." linenums="1"
--8<-- "examples/sterrain.csd"
```

Here is an other example of the sterrain opcode showing overtone building.
It uses the file [sterrain2.csd](../examples/sterrain2.csd).

``` csound-csd title="Another Example of the sterrain opcode showing overtone building" linenums="1"
--8<-- "examples/sterrain2.csd"
```

## See Also

[Wave Terrain Synthesis](../siggen/waveterr.md)

## Credits

Author: Christian Bacher<br>
New in version 6.15<br>
