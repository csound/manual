<!--
id:dispfft
category:Signal I/O:Printing and Display
-->
# dispfft
Displays the Fourier Transform of an audio or control signal.

These units will print orchestra init-values, or produce graphic display of orchestra control signals and audio signals. Uses X11 windows if enabled, else (or if [-g](../invoke/cs-options-alphabetically.md#-g-asciidisplay) flag is set) displays are approximated in ASCII characters.

## Syntax
=== "Modern"
    ``` csound-orc
    dispfft(xsig, iprd, iwsiz [, iwtyp] [, idbout] [, iwtflg] [,imin] [,imax])
    ```

=== "Classic"
    ``` csound-orc
    dispfft xsig, iprd, iwsiz [, iwtyp] [, idbout] [, iwtflg] [,imin] [,imax]
    ```

### Initialization

_iprd_ -- the period of display in seconds.

_iwsiz_ -- size of the input window in samples. A window of _iwsiz_ points will produce a Fourier transform of _iwsiz_/2 points, spread linearly in frequency from 0 to sr/2. _iwsiz_ must be a power of 2, with a minimum of 16 and a maximum of 4096. The windows are permitted to overlap.

_iwtyp_ (optional, default=0) -- window type. 0 = rectangular, 1 = Hanning. The default value is 0 (rectangular).

_idbout_ (optional, default=0) -- units of output for the Fourier coefficients. 0 = magnitude, 1 = decibels. The default is 0 (magnitude).

_iwtflg_ (optional, default=0) -- wait flag. If non-zero, each display is held until released by the user. The default value is 0 (no wait).

_imin_ (optional, default=0) -- minimum FFT bin used in display.

_imax_ (optional, default=winsize/2) -- maximum FFT bin to be used in display.

### Performance

_dispfft_ -- displays the Fourier Transform of an audio or control signal (_asig_ or _ksig_) every _iprd_ seconds using the Fast Fourier Transform method.

## Examples

Here is an example of the dispfft opcode. It uses the file [dispfft.csd](../examples/dispfft.csd).

``` csound-csd title="Example of the dispfft opcode." linenums="1"
--8<-- "examples/dispfft.csd"
```

## See also

[Printing and Display](../sigio/pdisplay.md)
