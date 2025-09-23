<!--
id:het_import
category:Utilities
-->
# het_import
Converts a comma-separated text file to a .het file.

## Syntax
```
het_import cstext_file het_file
csound -U het_import cstext_file het_file
```

### Initialization

_cstext_file_ - Name of the input comma-separated text file.

_het_file_ - Name of the output .het file.

The _het_import_ utility generates a _.het_ file usable with the [adsyn](../opcodes/adsyn.md) generator. It can be used in combination with [het_export](../utility/het_export.md) to modify sound analysis made by the [HETRO](../utility/hetro.md) utility.

## Credits

Author: John ffitch

1995
