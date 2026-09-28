<!--
id:delayr
category:Signal Modifiers:Delay
-->
# delayr
Reads from an automatically established digital delay line.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = delayr(idlt [, iskip])
    ares, indx = delayr(idlt [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares delayr idlt [, iskip]
    ares, indx delayr idlt [, iskip]
    ```

### Initialization

_idlt_ -- requested delay time in seconds, rounded to the nearest whole sample. The buffer must hold at least _ksmps_ samples. Its size is limited by available memory and uses [floatsize](floatsize.md) bytes per sample.

_iskip_ (optional, default=0) -- when zero, clear the buffer and reset its position at initialization. A nonzero value preserves an existing buffer and its position during reinitialization, ignoring changes to _idlt_. The first initialization still allocates a buffer.

_indx_ (optional output) -- an i-rate index for selecting this reader with a delay tap. See [Selecting a delay line](#selecting-a-delay-line).

### Performance

_delayr_ reads from an automatically established digital delay line, in which the signal retrieved has been resident for _idlt_ seconds. This unit must be paired with and precede an accompanying [delayw](../opcodes/delayw.md) unit. Any other Csound statements can intervene.

## Examples

### Selecting a delay line

The optional second output lets a tap select an earlier _delayr_ even after another reader has appeared. Pass it as the optional final argument to [deltap](deltap.md), [deltapi](deltapi.md), [deltapn](deltapn.md), [deltap3](deltap3.md), [deltapx](deltapx.md) or [deltapxw](deltapxw.md).

Tap indices select among readers that have initialized but have not yet paired with a _delayw_. The default index 0 selects the newest reader. Positive indices count back from it, so 1 selects the previous reader. Negative indices count from the oldest reader, with -1 selecting the oldest and -2 the next. An out-of-range index causes an initialization error.

_delayr_ returns a negative index. That index records its position among the pending readers, rather than a permanent buffer identifier. Initializing a _delayw_ removes the oldest reader from that list and changes the remaining negative indices. Initialize taps that use the returned indices before any intervening _delayw_. Each tap keeps its chosen reader during performance.

The example below opens two delay lines, then selects each with its returned index. Both taps come before the writers. The first _delayw_ writes to the first _delayr_, and the second writes to the second. The index only selects a tap's reader and does not change writer order.

It uses the file [delayr-index.csd](../examples/delayr-index.csd).

``` csound-csd title="Selecting two delay lines by index." linenums="1"
--8<-- "examples/delayr-index.csd"
```

### Feedback delay

Here is an example of the delayr opcode. It uses the file [delayr.csd](../examples/delayr.csd).

``` csound-csd title="Example of the delayr opcode." linenums="1"
--8<-- "examples/delayr.csd"
```

## See also

[Delay](../sigmod/delayops.md)
