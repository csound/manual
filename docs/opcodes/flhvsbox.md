<!--
id:FLhvsBox
category:FLTK:Other
-->
# FLhvsBox
Displays a box with a grid useful for visualizing two-dimensional Hyper Vectorial Synthesis.

Plugin opcode in widgets. This opcode is part of the plugin repository and has to be installed separately. These FLTK widgets do not work on the Mac. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins).

_FLhvsBox_ displays a box with a grid useful for visualizing two-dimensional Hyper Vectorial Synthesis.

## Syntax
``` csound-orc
ihandle FLhvsBox inumlinesX, inumlinesY, iwidth, iheight, ix, iy
```

### Initialization

_ihandle_ – an integer number used a univocally-defined handle for identifying a specific HVS box (see below).

_inumlinesX, inumlinesY_ - number of vertical and horizontal lines delimiting the HVS squared areas

_iwidth, iheight_ - width and height of the HVS box

_ix, iy_ - the position of the HVS box

### Performance

_FLhvsBox_ is a widget able to visualize current position of the HVS cursor in an HVS box (i.e. a squared area containing a grid). The number of  horizontal and vertical lines of the grid can be defined with the _inumlinesX, inumlinesY_ arguments. This opcode has to be declared inside an [FLpanel](../../opcodes/flpanel) - [FLpanelEnd](../../opcodes/flpanelend) block. See the entry for [hvs2](../../opcodes/hvs2) for an example of usage of _FLhvsBox_.

[FLhvsBoxSetValue](../../opcodes/flhvsboxsetvalue) is used to set the cursor position of an _FLhvsBox_ widget.

## See Also

[hvs2](../../opcodes/hvs2),
[FLhvsBoxSetValue](../../opcodes/flhvsboxsetvalue)

## Credits

Author: Gabriel Maldonado

New in version 5.06
