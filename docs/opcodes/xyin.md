<!--
id:xyin
category:Instrument Control:Sensing and Control
-->
# xyin
Sense the cursor position in an output window.

When _xyin_ is called the position of the mouse within the output window is used to reply to the request.  This simple mechanism does mean that only one _xyin_ can be used accurately at once.  The position of the mouse is reported in the output window.

## Syntax
=== "Modern"
    ``` csound-orc
    kx, ky = xyin(iprd, ixmin, ixmax, iymin, iymax [, ixinit] [, iyinit])
    ```

=== "Classic"
    ``` csound-orc
    kx, ky xyin iprd, ixmin, ixmax, iymin, iymax [, ixinit] [, iyinit]
    ```

### Initialization

_iprd_ -- period of cursor sensing (in seconds). Typically .1 seconds.

_xmin, xmax, ymin, ymax_ -- edge values for the x-y coordinates of a cursor in the input window.

_ixinit, iyinit_ (optional) -- initial x-y coordinates reported; the default values are 0,0. If these values are not within the given min-max range, they will be coerced into that range.

### Performance

_xyin_ samples the cursor x-y position in an input window every _iprd_ seconds. Output values are repeated (not interpolated) at the k-rate, and remain fixed until a new change is registered in the window. There may be any number of input windows. This unit is useful for real-time control, but continuous motion should be avoided if _iprd_ is unusually small.

> :memo: **Note**
>
> Depending on your platform and distribution, you might need to enable displays using the _--displays_ command line flag.

## Examples

Here is an example of the xyin opcode. It uses the file [xyin.csd](../examples/xyin.csd).

``` csound-csd title="Example of the xyin opcode." linenums="1"
--8<-- "examples/xyin.csd"
```

As the values of kx and ky change, they will be printed out like this:

```
kx=8.612036, ky=22.677933
kx=10.765685, ky=15.644135
```

## See also

[Sensing and Control: Keyboard and mouse sensing](../control/sensing.md)

## Credits

Example written by Kevin Conder.
