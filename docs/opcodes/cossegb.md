<!--
id:cossegb
category:Signal Generators:Linear and Exponential Generators
-->
# cossegb
Trace a series of line segments between specified absolute points with
cosine interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cossegb(ia, itim1, ib [, itim2] [, ic] [...])
    kres = cossegb(ia, itim1, ib [, itim2] [, ic] [...])
    ```

=== "Classic"
    ``` csound-orc
    ares cossegb ia, itim1, ib [, itim2] [, ic] [...]
    kres cossegb ia, itim1, ib [, itim2] [, ic] [...]
    ```

### Initialization

_ia_ -- starting value.

_ib, ic_, etc. -- value at _tim1_ seconds, etc.

_itim1_ -- time in seconds of end of first segment. A zero or negative value will cause all initialization to be skipped.

_itim2, itim3_, etc. -- time in seconds at the end of subsequent segments.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. The last _tim_ value may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the last value to be repeated until the end of the note.

## Examples

Here is an example of the cossegb opcode. It uses the file [cossegb.csd](../examples/cossegb.csd).

``` csound-orc title="Example of the cossegb opcode." linenums="1"
--8<-- "examples/cossegb.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch<br>
Aug 2012 <br>

New in version 5.18
