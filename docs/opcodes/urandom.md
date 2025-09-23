<!--
id:urandom
category:Signal Generators:Random (Noise) Generators
-->
# urandom
Truly random opcodes with controllable range.

Plugin opcode in urandom.

These units are for Unix-like systems only and use /dev/urandom to construct Csound random values

## Syntax
=== "Modern"
    ``` csound-orc
    ax = urandom([imin, imax])
    ix = urandom([imin, imax])
    kx = urandom([imin, imax])
    ```

=== "Classic"
    ``` csound-orc
    ax urandom [imin, imax]
    ix urandom [imin, imax]
    kx urandom [imin, imax]
    ```

### Initialization

_ix_ -- i-rate output value.

_imin_ -- minimum value of range; defaults to -1.

_imax_ -- maximum value of range; defaults to +1.

> :memo: **Notes**
>
> The algorithm produces 2^64 different possible values which are scaled to fit the range requested.  The randomness comes form the usual Linux/OSX /dev/urandom method, and there is no guarantee that it will be truly random, but there is a good chance. It does not show any cycles.


### Performance

_ax_ -- a-rate output value.

_kx_ -- k-rate output value.

## Examples

Here is an example of the urandom opcode at a-rate. It uses the file [urandom.csd](../examples/urandom.csd).

``` csound-orc title="An example of the urandom opcode at a-rate." linenums="1"
--8<-- "examples/urandom.csd"
```

Here is an example of the urandom opcode at k-rate. It uses the file [urandom_krate.csd](../examples/urandom_krate.csd).

``` csound-orc title="An example of the urandom opcode at k-rate." linenums="1"
--8<-- "examples/urandom_krate.csd"
```

Its output should include lines like this:

```
k1=0.229850
k1=-0.077047
k1=-0.199339
k1=-0.620577
k1=-0.119447
k1=-0.596258
k1=0.525800
k1=-0.171583
k1=-0.017196
k1=-0.974613
k1=-0.036276
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch

New in version 5.13
