<!--
id:envext
category:Utilities
-->
# envext
Extracts the envelope of a file to a text file.

## Syntax
```
envext [-flags] soundfile
csound -U envext [-flags] soundfile
```

### Initialization

_soundfile_ -- Name of the input soundfile.

The following flags are available for _envext_ (The default values are stated in parenthesis):

_-o fnam_ Name of output filename (newenv)<br>
_-w_ size (in seconds) of analysis window (0.25)<br>

The _envext_ utility generates a text file containing time and amplitude pairs by finding the absolute peak within each window.

## Examples

Here is an example of the envext utility. It uses the file [envext.csd](../examples/envext.csd).

``` csound-csd title="Example of the envext utility." linenums="1"
--8<-- "examples/envext.csd"
```

This example will produce a text file containing the following:

```
0.000	0.000
0.039	0.426
0.053	0.606
0.108	0.494
0.163	0.333
0.208	0.301
0.297	0.587
0.309	0.622
0.399	0.624
0.414	0.676
.........
.........
15.411	0.293
15.452	0.123
15.502	0.014
15.551	0.000
```

Which shows the time for the peak amplitude within each measured window.

## Credits

Author: John ffitch

1995
