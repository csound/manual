<!--
id:cpumeter
category:Instrument Control:Realtime Performance Control
-->
# cpumeter
Reports system-wide CPU usage, overall or per logical CPU. This includes other processes; it does not measure Csound's CPU usage alone.

Supported on GNU/Linux and macOS.

## Syntax
=== "Modern"
    ``` csound-orc
    ktot [, kcpu1, kcpu2, ...] = cpumeter(ifreq)
    ```

=== "Classic"
    ``` csound-orc
    ktot [, kcpu1, kcpu2, ...] cpumeter ifreq
    ```

### Initialization

_ifreq_ is the refresh interval in seconds. A value of 0.1 is a useful starting point. Updates occur at control block boundaries, so the interval is rounded up to a whole number of control blocks. Very short intervals can give coarse readings such as zero or one hundred percent.

In Csound 7, _ifreq_ must be finite and nonnegative. Zero requests an update every control block. Initialization and reinitialization set all outputs to zero and take a new CPU counter snapshot. The first interval reading is available at the next update.

### Performance

_ktot_ reports the percentage of non-idle CPU time between counter snapshots. Its range is 0 to 100 across all logical CPUs, even when no per-CPU outputs are requested. It is not the sum of the per-CPU percentages.

The optional _kcpu1_, _kcpu2_, and subsequent outputs report the same percentage for individual logical CPUs, starting with CPU 0. Up to 32 outputs are supported: the overall reading and the first 31 logical CPUs. Outputs for CPUs that are not present report zero.

Outputs retain their values between updates. In Csound 7, a reading is zero when no CPU counter ticks have elapsed. On macOS, Csound 7 measures usage over the refresh interval; earlier versions used counters accumulated since system startup.

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

New in Csound version 5.14.
