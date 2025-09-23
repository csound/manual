<!--
id:pvsdisp
category:Spectral Processing:Streaming
-->
# pvsdisp
Displays a PVS signal as an amplitude vs. freq graph.

It prints the frames every hopsize. Uses X11 or FLTK windows if enabled, else (or if [-g](../invoke/cs-options-alphabetically.md#-g-asciidisplay) flag is set) displays are approximated in ASCII characters.

## Syntax
=== "Modern"
    ``` csound-orc
    pvsdisp(fsig [, ibins, iwtflg])
    ```

=== "Classic"
    ``` csound-orc
    pvsdisp fsig [, ibins, iwtflg]
    ```

### Initialization

_ibins_ (optional, default=all bins) -- optionally, display only ibins bins.

_iwtflg_ (optional, default=0) -- wait flag. If non-zero, each pvsdisp is held until released by the user. The default value is 0 (no wait).

### Performance

_pvsdisp_ -- displays the PVS signal frame-by-frame.

Note:  when there is nothing to display (silences), messages like these will accompany each plot:

```
instr 1, pvs-signal fsig:	10 points, scalemax 0.000
```

## Examples

Here is an example of the pvsdisp opcode. It uses the file [pvsdisp.csd](../examples/pvsdisp.csd).

``` csound-csd title="Example of the pvsdisp opcode" linenums="1"
--8<-- "examples/pvsdisp.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini, 2006
