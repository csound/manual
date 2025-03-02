<!--
id:het_export
category:Utilities
-->
# het_export
Converts a .het file to a comma separated text file.

## Syntax
```
het_export het_file cstext_file
csound -U het_export het_file cstext_file
```

### Initialization

_het_file_ - Name of the input .het file.

_cstext_file_ - Name of the output comma-separated text file.

The _het_export_ utility generates a comma-separated text file for manual editing of a .het file produced by the [HETRO](../../utility/hetro) utility. It can be used in combination with [het_import](../../utility/het_import) to produce data for the [adsyn](../../opcodes/adsyn) generator.

## Credits

Author: John ffitch

1995
