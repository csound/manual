<!--
id:pvstencil
category:Spectral Processing:Streaming
-->
# pvstencil
Transforms a pvoc stream according to a masking function table.

If the pvoc stream amplitude falls below the value of the function for a specific pvoc channel, it applies a gain to that channel.

The pvoc stream amplitudes are compared to a masking table, if the fall below the table values, they are scaled by _kgain_. Prior to the operation, table values are scaled by _klevel_, which can be used as masking depth control.

Tables have to be at least fftsize/2 in size; for most GENS it is important to use an extended-guard point (size power-of-two plus one), however this is not necessary with GEN43.

One of the typical uses of _pvstencil_ would be in noise reduction. A noise print can be analysed with _pvanal_ into a PVOC-EX file and loaded in a table with _GEN43_. This then can be used as the masking table for _pvstencil_ and the amount of reduction would be controlled by _kgain_. Skipping post-normalisation will keep the original noise print average amplitudes. This would provide a good starting point for a successful noise reduction (so that _klevel_ can be generally set to close to 1).

Other possible transformation effects are possible, such as filtering and `inverse-masking'.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvstencil(fsigin, kgain, klevel, iftable)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvstencil fsigin, kgain, klevel, iftable
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_kgain_ -- `stencil' gain.

_klevel_ -- masking function level (scales the ftable prior to `stenciling') .

_iftable_ -- masking function table.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvstencil opcode. It uses the file [pvstencil.csd](../examples/pvstencil.csd).

``` csound-csd title="Example of the pvstencil opcode." linenums="1"
--8<-- "examples/pvstencil.csd"
```

For another example of pvstencil, see [GEN43](../scoregens/gen43.md)

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
November 2004 <br>

New plugin in version 5

November 2004.
