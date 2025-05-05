<!--
id:vdelayk
category:Vectorial:Delay Paths
-->
# vdelayk
Variable time delay applied to a k-rate signal.

## Syntax
=== "Modern"
    ``` csound-orc
    kout = vdelayk(ksig, kdel, imaxdel [, iskip, imode])
    ```

=== "Classic"
    ``` csound-orc
    kout vdelayk ksig, kdel, imaxdel [, iskip, imode]
    ```

### Initialization

_imaxdel_ - maximum value of delay in seconds.

_iskip_ (optional) - Skip initialization if present and non zero.

_imode_ (optional) - if non-zero it suppresses linear interpolation. While, normally, interpolation increases the quality of a signal, it should be suppressed if using vdelay with discrete control signals, such as, for example, trigger signals.

### Performance

_kout_ - delayed output signal

_ksig_ - input signal

_kdel_ - delay time in seconds can be varied at k-rate

_vdelayk_ is similar to [vdelay](../opcodes/vdelay.md), but works at k-rate. It is designed to delay control signals, to be used, for example, in algorithmic composition.

## See also

[Vectorial Control-rate Delay Paths](../vectorial/delay.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)
