<!--
id:turnoff2
category:Instrument Control:Duration Control
-->
# turnoff2
Turn off instance(s) of other instruments at performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    turnoff2(kinsno, kmode, krelease)
    turnoff2_i(insno, imode, irelease)
    ```

=== "Classic"
    ``` csound-orc
    turnoff2 kinsno, kmode, krelease
    turnoff2_i insno, imode, irelease
    ```

### Initialization

_insno_
-- instrument to be turned off (can be fractional) if zero or negative, no instrument is turned off

_imode_ -- sum of the following values:

*   0, 1, or 2: turn off all instances (0), oldest only (1), or newest only (2)
*   4: only turn off notes with exactly matching (fractional) instrument number, rather than ignoring fractional part
*   8: only turn off notes with indefinite duration (p3 &lt; 0 or MIDI)

_irelease_ -- if non-zero, the turned off instances are allowed to release, otherwise are deactivated immediately (possibly resulting in clicks)

### Performance

_kinsno_
-- instrument to be turned off (can be fractional) if zero or negative, no instrument is turned off

_kmode_ -- sum of the following values:

*   0, 1, or 2: turn off all instances (0), oldest only (1), or newest only (2)
*   4: only turn off notes with exactly matching (fractional) instrument number, rather than ignoring fractional part
*   8: only turn off notes with indefinite duration (p3 &lt; 0 or MIDI)

_krelease_ -- if non-zero, the turned off instances are allowed to release, otherwise are deactivated immediately (possibly resulting in clicks)

> :memo: **Note**
>
> As a rule of thumb, you should turn off instruments with a higher instrument number than the one where turnoff is called, as doing otherwise might cause initialization issues.

## Examples

Here is an example of the turnoff2 opcode. It uses the file [turnoff2.csd](../examples/turnoff2.csd).

``` csound-csd title="Example of the turnoff2 opcode." linenums="1"
--8<-- "examples/turnoff2.csd"
```

## See also

[Duration Control Statements](../control/durctl.md)

## Credits

Author: Istvan Varga<br>
2005<br>

New in Csound 5.00
