<!--
id:lorenz
category:Signal Generators:Models and Emulations
-->
# lorenz
Implements the Lorenz system of equations.

Implements the Lorenz system of equations.  The Lorenz system is a chaotic-dynamic system which was originally used to simulate the motion of a particle in convection currents and simplified weather systems. Small differences in initial conditions rapidly lead to diverging values. This is sometimes expressed as the butterfly effect. If a butterfly flaps its wings in Australia, it will have an effect on the weather in Alaska. This system is one of the milestones in the development of chaos theory. It is useful as a chaotic audio source or as a low frequency modulation source.

## Syntax
=== "Modern"
    ``` csound-orc
    ax, ay, az = lorenz(ksv, krv, kbv, kh, ix, iy, iz, iskip [, iskipinit])
    ```

=== "Classic"
    ``` csound-orc
    ax, ay, az lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip [, iskipinit]
    ```

### Initialization

_ix_, _iy_, _iz_ -- the initial coordinates of the particle.

_iskip_ -- used to skip generated values. If _iskip_ is set to 5, only every fifth value generated is output. This is useful in generating higher pitched tones.

_iskipinit_ (optional, default=0) -- if non zero skip the initialisation of the filter. (New in Csound version 4.23f13 and 5.0)

### Performance

_ksv_ -- the Prandtl number or sigma

_krv_ -- the Rayleigh number

_kbv_ -- the ratio of the length and width of the box in which the convection currents are generated

_kh_ -- the step size used in approximating the differential equation. This can be used to control the pitch of the systems. Values of .1-.001 are typical.

The equations are approximated as follows:

```
x = x + h*(s*(y - x))
y = y + h*(-x*z + r*x - y)
z = z + h*(x*y - b*z)
```

The historical values of these parameters are:

```
ks = 10
kr = 28
kb = 8/3
```

> :memo: **Note**
>
> This algorithm uses internal non linear feedback loops which causes audio result to depend on the orchestra sampling rate. For example, if you develop a project with _sr_=48000Hz and if you want to produce an audio CD from it, you should record a file with _sr_=48000Hz and then downsample the file to 44100Hz using the [src_conv](../utility/src_conv.md) utility.

## Examples

Here is an example of the lorenz opcode. It uses the file [lorenz.csd](../examples/lorenz.csd).

``` csound-orc title="Example of the lorenz opcode." linenums="1"
--8<-- "examples/lorenz.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Hans Mikelson<br>
February 1999<br>

New in Csound version 3.53

Note added by François Pinot, August 2009
