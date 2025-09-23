<!--
id:pv_import
category:Utilities
-->
# pv_import
Converts a comma-separated text file to a .pvx file.

## Syntax
```
pv_import cstext_file pv_file
csound -U pv_import cstext_file pv_file
```

### Initialization

_cstext_file_ - Name of the input comma-separated text file.

_pv_file_ - Name of the output .pvx file.

The _pv_import_ utility generates a _.pvx_ file usable with the [pvoc](../opcodes/pvoc.md) generator. It can be used in combination with [pv_export](../utility/pv_export.md) to modify sound analysis made by the [PVANAL](../utility/pvanal.md) utility.

## Credits

Author: John ffitch

1995
