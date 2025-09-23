<!--
id:specdisp
category:Spectral Processing:Non-Standard
-->
# specdisp
Displays the magnitude values of the spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    specdisp(wsig, iprd [, iwtflg])
    ```

=== "Classic"
    ``` csound-orc
    specdisp wsig, iprd [, iwtflg]
    ```

### Initialization

_iprd_ -- the period, in seconds, of each new display.

_iwtflg_ (optional, default=0) -- wait flag. If non-zero, hold each display until released by the user. The default value is 0 (no wait).

### Performance

_wsig_ -- the input spectrum.

Displays the magnitude values of spectrum _wsig_ every _iprd_ seconds (rounded to some integral number of _wsig_'s originating _iprd_).

## Examples

``` csound-orc
  ksum     specsum   wsig, 1              ; sum the spec bins, and ksmooth
           if ksum < 2000 kgoto zero      ; if sufficient amplitude
  koct     specptrk  wsig                 ;    pitch-track the signal
           kgoto     contin
zero: 
  koct     =         0                    ; else output zero
contin:
```

## See Also

[specsum](../opcodes/specsum.md)
