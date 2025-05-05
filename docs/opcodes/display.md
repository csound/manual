<!--
id:display
category:Signal I/O:Printing and Display
-->
# display
Displays the audio or control signals as an amplitude vs. time graph.

These units will print orchestra init-values, or produce graphic display of orchestra control signals and audio signals. Uses X11 windows if enabled, else (or if [-g](../invoke/cs-options-alphabetically.md#-g-asciidisplay) flag is set) displays are approximated in ASCII characters.

## Syntax
=== "Modern"
    ``` csound-orc
    display(xsig, iprd [, inprds] [, iwtflg])
    ```

=== "Classic"
    ``` csound-orc
    display xsig, iprd [, inprds] [, iwtflg]
    ```

### Initialization

_iprd_ -- the period of display in seconds.

_inprds_ (optional, default=1) -- Number of display periods retained in each display graph. A value of 2 or more will provide a larger perspective of the signal motion. The default value is 1 (each graph completely new).
_inprds_ is a scaling factor for the displayed waveform, controlling how many _iprd_-sized frames of samples are drawn in the window (the default and minimum value is 1.0). Higher _inprds_ values are slower to draw (more points to draw) but will show the waveform scrolling through the window, which is useful with low _iprd_ values.

_iwtflg_ (optional, default=0) -- wait flag. If non-zero, each display is held until released by the user. The default value is 0 (no wait).

### Performance

_display_ -- displays the audio or control signal _xsig_ every _iprd_ seconds, as an amplitude vs. time graph.

## Examples

Here is an example of the display opcode. It uses the file [display.csd](../examples/display.csd).

``` csound-csd title="Example of the display opcode." linenums="1"
--8<-- "examples/display.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)

## Credits

Comments about the _inprds_ parameter contributed by Rasmus Ekman.
