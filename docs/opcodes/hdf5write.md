<!--
id:hdf5write
category:Signal I/O:File I/O
-->
# hdf5write
Write signals and arrays to an hdf5 file.

Plugin opcode in hdf5ops. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

## Syntax
``` csound-orc
hdf5write ifilename, xout1[, xout2, xout3, ..., xoutN]
```

### Initialization

_ifilename_ -- the hdf5 file's name (in double-quotes). If the file does not exist it will be created.

### Performance

_xout1,... xoutN_ -- signals or arrays to be written to the hdf5 file. This opcode accepts i-rate, k-rate, a-rate signals or i-rate, k-rate, a-rate arrays of any dimension. These signals or arrays are written to a dataset within the hdf5 file using the same variable name as in Csound. For example, if the Csound variable is called 'ksignal', then the name of the hdf5 dataset is 'ksignal'. Any number and multiple types of datasets may be written at a time.

## Examples

Here is a simple example of the hdf5write opcode. It uses the file [hdf5write.csd](../../examples/hdf5write.csd).

``` csound-csd title="Example of the hdf5write opcode." linenums="1"
--8<-- "examples/hdf5write.csd"
```

## See also

[File Input and Output](../../sigio/fileio)

## Credits

Author: Edward Costello;<br>
NUIM, 2014<br>
