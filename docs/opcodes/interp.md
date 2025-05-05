<!--
id:interp
category:Signal Modifiers:Sample Level Operators
-->
# interp
Converts a control signal to an audio signal using linear interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = interp(ksig [, iskip] [, imode] [, ivalue])
    ```

=== "Classic"
    ``` csound-orc
    ares interp ksig [, iskip] [, imode] [, ivalue]
    ```

### Initialization

_iskip_ (optional, default=0) -- if non zero
skips initialisation of internal save space (see [reson](../opcodes/reson.md)).

_imode_ (optional, default=0) -- sets the initial output value to the first k-rate input instead of zero.  The following graphs show the output of interp with a constant input value, in the original, when skipping init, and in the new mode:

**iskip=0, imode=0**

```
|    ________
|   /
|  /
| /
|/
-+------------
|
```

**iskip=1, imode=0**

```
(prev)
|  __________
| /
|/
|
|
-+------------
|
```

**iskip=0, imode=1**

```
|____________
|
|
|
|
-+------------
|
```

_ivalue_ (optional, default=0) -- initial value if both imode and iskip are zero.

### Performance

_ksig_ -- input k-rate signal.

_interp_ converts a control signal to an audio signal. It uses linear interpolation between successive kvals.

## Examples

Here is an example of the interp opcode. It uses the file [interp.csd](../examples/interp.csd).

``` csound-csd title="Example of the interp opcode." linenums="1"
--8<-- "examples/interp.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

More information on this opcode: [Csound Journal, issue10 - An Overview of Csound Variable Types](https://csoundjournal.com/issue10/CsoundRates.html), written by Andrés Cabrera

## Credits

Updated November 2002, thanks to a note from both Rasmus Ekman and Istvan Varga.
