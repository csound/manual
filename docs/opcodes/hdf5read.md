<!--
id:hdf5read
category:Signal I/O:File I/O
-->
# hdf5read
Read signals and arrays from an hdf5 file.

Plugin opcode in hdf5ops. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

## Syntax
``` csound-orc
xout1[, xout2, xout3, ..., xoutN] hdf5read ifilename, ivariablename1[, \
    ivariablename2, ivariablename3, ..., ivariablenameN]
```

### Initialization

_ifilename_ -- the hdf5 file's name (in double-quotes).

_ivariablename1[, ivariablename2, ivariablename3, ..., ivariablenameN]_ -- the names of the datasets (in double-quotes) to be read from the hdf5 file, if the dataset name is suffixed with an asterisk, e.g. "mydataset*", the entire dataset is copied to the array regardless of array type.

### Performance

_xout1,... xoutN_ -- The specified types of variables that the hdf5 datasets are to be read  as. Datasets with a rank larger than 1 must be read as arrays, i-rate signals must also be read as i-rate signals. Other than these restrictions datasets may be read as any type of array or signal. When reading has reached the end of a dataset it no longer outputs any new values.

## Examples

Here is a simple example of the hdf5read opcode. It uses the file [hdf5read.csd](../../examples/hdf5read.csd).

``` csound-csd title="Example of the hdf5read opcode." linenums="1"
--8<-- "examples/hdf5read.csd"
```

## See also

[Signal Input](../../sigio/input)

## Credits

Author: Edward Costello;<br>
NUIM, 2014<br>
