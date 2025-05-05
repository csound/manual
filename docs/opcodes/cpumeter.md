<!--
id:cpumeter
category:Instrument Control:Realtime Performance Control
-->
# cpumeter
Reports the usage of cpu either total or per core to monitor how close to max-out the processing is.

Please note that this opcode is currently only supported on GNU/Linux .

## Syntax
=== "Modern"
    ``` csound-orc
    ktot[,kcpu1, kcpu2,...] = cpumeter(ifreq)
    ```

=== "Classic"
    ``` csound-orc
    ktot[,kcpu1, kcpu2,...] cpumeter ifreq
    ```

### Initialization

_ifreq_ is the time in seconds that the meter is refreshed. If this is too low then mainly figures of zero or one hundred occur. A value of 0.1 seems acceptable.

### Performance

_cpumeter_ reads the total idle time in the last _ifreq_ seconds and reports it as a percentage usage.  If more than just _ktot_ results are requested these report the same value for individual cores.

## Examples

Here is an example of the cpumeter opcode. It uses the file [cpumeter.csd](../examples/cpumeter.csd).

``` csound-csd title="Example of the cpumeter opcode." linenums="1"
--8<-- "examples/cpumeter.csd"
```

## See also

[Real-time Performance Control](../control/realtime.md)

## Credits

Author: John ffitch<br>
May 2011<br>

New in Csound version 5.14, for Linux/Unix and OSX only
