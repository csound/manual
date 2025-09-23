<!--
id:planet
category:Signal Generators:Models and Emulations
-->
# planet
Simulates a planet orbiting in a binary star system.

_planet_ simulates a planet orbiting in a binary star system. The outputs are the x, y and z coordinates of the orbiting planet. It is possible for the planet to achieve escape velocity by a close encounter with a star. This makes this system somewhat unstable.

## Syntax
=== "Modern"
    ``` csound-orc
    ax, ay, az = planet(kmass1, kmass2, ksep, ix, iy, iz, ivx, ivy, ivz, idelta \
                        [, ifriction] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ax, ay, az planet kmass1, kmass2, ksep, ix, iy, iz, ivx, ivy, ivz, idelta \
                      [, ifriction] [, iskip]
    ```

### Initialization

_ix, iy, iz_ -- the initial x, y and z coordinates of the planet

_ivx, ivy, ivz_ -- the initial velocity vector components for the planet.

_idelta_ -- the step size used to approximate the differential equation.

_ifriction_ (optional, default=0) -- a value for friction, which can be used to keep the system from blowing up

_iskip_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_ax, ay, az_ -- the output x, y, and z coodinates of the planet

_ksep_ -- the separation between the two stars

_kmass1_ -- the mass of the first star

_kmass2_ -- the mass of the second star

## Examples

Here is an example of the planet opcode. It uses the file [planet.csd](../examples/planet.csd).

``` csound-orc title="Example of the planet opcode." linenums="1"
--8<-- "examples/planet.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

More information on this opcode: [http://www.csoundjournal.com/issue9/FlutesInOrbit.html](http://www.csoundjournal.com/issue9/FlutesInOrbit.html)  , written by Brian Redfern.

## Credits

Author: Hans Mikelson<br>
December 1998<br>

New in Csound version 3.50
