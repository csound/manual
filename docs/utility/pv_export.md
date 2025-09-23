<!--
id:pv_export
category:Utilities
-->
# pv_export
Converts a .pvx file to a comma separated text file.

## Syntax
```
pv_export pv_file cstext_file
csound -U pv_export pv_file cstext_file
```

### Initialization

_pv_file_ - Name of the input .pvx file.

_cstext_file_ - Name of the output comma-separated text file.

The _pv_export_ utility generates a comma-separated text file for manual editing of a .pvx file produced by the [PVANAL](../utility/pvanal.md) utility. It can be used in combination with [pv_import](../utility/pv_import.md) to produce data for the [pvoc](../opcodes/pvoc.md) generator.

## Credits

Author: John ffitch

1995
