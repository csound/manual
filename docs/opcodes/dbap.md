<!--
id:dbap
category:Signal Modifiers:Panning and Spatialization
-->
# dbap
Distance-Based Amplitude Panning for arbitrary 2D and 3D loudspeaker layouts.

Implements the Distance-Based Amplitude Panning (DBAP) algorithm as described by Lossius and Baltazar.  
The opcode is particularly suitable for irregular loudspeaker arrangements in both two- and three-dimensional configurations. A soft-limiting spread control is included to focus or defocus the spatial image by attenuating distant loudspeakers exponentially.

## Syntax
=== "Modern"
    ``` csound-orc
        var:a[] = dbap(sig:a, mode:i, src:k[], lpos:i[][], sprd:k, rloff:i [, wgts:i[]])
        var:a[] = dbap(sig:a, mode:i, src:k[], ldim:i, lpos:i, sprd:k, rloff:i [, wgts:i[]])
    ```

=== "Classic"
    ``` csound-orc
        avar[] dbap asig, imode, ksrc[], ilpos[][], ksprd, irloff [, iwgts[]]
        avar[] dbap asig, imode, ksrc[], ildim, ilpos, ksprd, irloff [, iwgts[]]
    ```

### Initialization
_mode_ -- Coordinate interpretation mode. Specifies how loudspeaker coordinates are interpreted: 0 = cartesian coordinates (x, y, z); 1 = polar coordinates in degrees (rho, phi, theta or phi, theta); 2 = polar coordinates in radians (rho, phi, theta or phi, theta). 

_ldim_ -- Dimension of loudspeaker position (2 or 3). This argument is only required when a function table is used to define the loudspeaker positions, indicating whether the data represents a 2D or 3D layout. 

_lpos:i[][]_/_lpos:i_ -- Loudspeaker position definition. Defines the loudspeaker layout. It can be either: a 2D i-rate array of size n x 2 or n 3 (where n is the number of loudspeakers), or a function table containing the same data sequentially. Depending on coordinate _mode_ arg, each loudspeaker can be defines in two- (x, y or phi, theta) or three-dimension (x, y, z or rho, phi, theta). 

_rloff_ -- rolloff coefficient controlling amplitude decay as a function of distance. Higher values produce a steeper attenuation with distance, increasing localization sharpness, while lower values result in a more diffuse spatial distribution.

_wgts_ -- (optional, default to 1) per-loudspeaker weighting factors. If provided, the array must contain one value per loudspeaker. Each weight w_i scales the corresponding gain.

### Performance
_asig_ -- input signal

_sprd:k_ -- spread factor (>= 0) controlling spatial focus. The gain for each loudspeaker is computed as
```
g_i = (k * w_i * b_i) / (d_i^a) * exp(-beta d_i)
```
where
```
beta = spread / (mean_distance + 1e-6)
```
The exponential term introduces a soft decay:
```
gain *= exp(-beta * distance)
```
Increasing sprd results in tighter spatial focus.  
When sprd = 0, the algorithm reduces to the classical DBAP formulation.

## Examples
Here is an example of the dbap opcode. It uses the file [dbap.csd](../examples/dbap.csd).
``` csound-csd title="Example of the dbap opcode." linenums="1"
--8<-- "examples/dbap.csd"
```

## See also
[Panning and Spatialization: Distance Based Amplitude Panning](../sigmod/panspatl.md)

## Credits
Author: Pasquale Mainolfi<br>
Italy<br>
New in Csound version 7.0
February 2026.
