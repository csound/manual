<!--
id:ephasor
category:Signal Generators:Phasors
-->
# ephasor
Produces two outputs: a periodic phase signal and a periodic exponential decaying signal.

The latter is synchronised to the former, starting at 1 and then decreasing at the same time as the phase signal increases from 0 to 1. The rate of exponential decay can be controlled by the second parameter.

## Syntax
=== "Modern"
    ``` csound-orc
    aexp,aph = ephasor(kfreq, kR)
    ```

=== "Classic"
    ``` csound-orc
    aexp,aph ephasor kfreq, kR
    ```

### Performance

_kfreq_ - the rate at which the phase and exponential signals are generated

_kR_ - a parameter controlling the decay rate of the exponential signal, 0 &lt; kR &lt; 1. Lower values produce faster decays.

## Examples

Here is an example of the ephasor opcode. It uses the file [ephasor.csd](../examples/ephasor.csd).

``` csound-orc title="Example of the ephasor opcode." linenums="1"
--8<-- "examples/ephasor.csd"
```

## See also

[Phasors](../siggen/phasors.md)

## Credits

Author: Victor Lazzarini<br>
2008<br>

New in version 5.10
