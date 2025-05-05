<!--
id:pvread
category:Spectral Processing:STFT
-->
# pvread
Reads from a [pvoc](../opcodes/pvoc.md) file and returns the frequency and amplitude from a single analysis channel or bin.

The returned values can be used anywhere else in the Csound instrument. For example, one can use them as arguments to an oscillator to synthesize a single component from an analyzed signal or a bank of _pvreads_ can be used to resynthesize the analyzed sound using additive synthesis by passing the frequency and magnitude values to a bank of oscillators.

## Syntax
=== "Modern"
    ``` csound-orc
    kfreq, kamp = pvread(ktimpnt, ifile, ibin)
    ```

=== "Classic"
    ``` csound-orc
    kfreq, kamp pvread ktimpnt, ifile, ibin
    ```

### Initialization

_ifile_ -- the _pvoc_ number (n in pvoc.n) or the name in quotes of the analysis file made using _pvanal_. (See [pvoc](../opcodes/pvoc.md).)

_ibin_ -- the number of the analysis channel from which to return frequency in Hz and magnitude.

### Performance

_kfreq, kamp_ -- outputs of the _pvread_ unit. These values, retrieved from a phase vocoder analysis file, represent the values of frequency and amplitude from a single analysis channel specified in the _ibin_ argument. Interpolation between analysis frames is performed at k-rate resolution and dependent of course upon the rate and direction of _ktimpnt_.

_ktimpnt_ -- the passage of time, in seconds, through this file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

## Examples

The example below shows the use _pvread_ to synthesize a single component at a time from a phase vocoder analysis file. It should be noted that the _kfreq_ and _kamp_ outputs can be used for any kind of synthesis, filtering, processing, and so on.

``` csound-csd title="Example of the pvread opcode." linenums="1"
--8<-- "examples/pvread.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Richard Karpen<br>
Seattle, Wash<br>
1997<br>

New in version 3.44
