<!--
id:specsum
category:Spectral Processing:Non-Standard
-->
# specsum
Sums the magnitudes across all channels of the spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    ksum = specsum(wsig [, interp])
    ```

=== "Classic"
    ``` csound-orc
    ksum specsum wsig [, interp]
    ```

### Initialization

_interp_ (optional, default-0) -- if non-zero, interpolate the output signal (_koct_or _ksum_). The default value is 0 (repeat the signal value between changes).

### Performance

_ksum_ -- the output signal.

_wsig_ -- the input spectrum.

Sums the magnitudes across all channels of the spectrum. At each new frame of _wsig_, the magnitudes are summed and released as a scalar _ksum_ signal. Between frames, the output is either repeated or interpolated at the k-rate. This unit produces a k-signal summation of the magnitudes present in the spectral data, and is thereby a running measure of its moment-to-moment overall strength.

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

[specdisp](../opcodes/specdisp.md)
