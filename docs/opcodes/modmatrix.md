<!--
id:modmatrix
category:Miscellaneous
-->
# modmatrix
Modulation matrix opcode with optimizations for sparse matrices.

The opcode can be used to let a large number of k-rate modulator variables modulate a large number of k-rate parameter variables, with arbitrary scaling of each modulator-to-parameter connection.  Csound ftables are used to hold both the input (parameter)  variables, the modulator variables, and the scaling coefficients. Output variables are written to another Csound ftable.

## Syntax
=== "Modern"
    ``` csound-orc
    modmatrix(iresfn, isrcmodfn, isrcparmfn, imodscale, inum_mod, \
              inum_parm, kupdate)
    ```

=== "Classic"
    ``` csound-orc
    modmatrix iresfn, isrcmodfn, isrcparmfn, imodscale, inum_mod, \
              inum_parm, kupdate
    ```

### Initialization

_iresfn_ --  ftable number for the parameter output variables

_isrcmodfn_ -- ftable number for the modulation source variables

_isrcparmfn_ -- ftable number for the parameter input variables

_imodscale_ -- scaling/routing coefficient matrix. This is also a csound ftable, used as a matrix of inum_mod rows and inum_parm columns.

_inum_mod_ -- number of modulation variables

_inum_parm_ -- number of parmeter (input and output) variables.

The arguments _inum_mod_ and _inum_parm_ do not have to be set to power-of-two values.

### Performance

_kupdate_ -- flag to update the scaling coefficients. When the flag is set to a nonzero value, the scaling coefficients are read directly from the imodscale ftable. When the flag is set to zero, the scaling coefficients are scanned, and an optimized scaling matrix stored internally in the opcode.

For each modulator in _isrcmodfn_, scale it with the coefficient (in _imodscale_) determining to what degree it should influence each parameter. Then sum all modulators for each parameter and add the resulting modulator value to the input parameter value read from _iscparmfn_. Finally, write the output parameter values to table _iresfn_.

The following tables give insight into the processing performed by the modmatrix opcode, for a simplified example using 3 parameter and 2 modulators. Let’s call the parameters "cps1", "cps2", and "cutoff", and the modulators "lfo1" and "lfo2".

The input variables may at a given point in time have these values:

|             | **cps1** | **cps2** | **cutoff** |
|-------------|----------|----------|------------|
| _isrcparmfn_ | 400      | 800      | 3          |

... while the modulator variables have these values:

|             | **lfo1** | **lfo2** |
|-------------|----------|----------|
| _isrcmodfn_ | 0.5      | -0.2     |

The scaling/routing coefficients used:

| _imodscale_ | **cps1** | **cps2** | **cutoff** |
|-------------|----------|----------|------------|
| _lfo1_      | 40       | 0        | -2         |
| _lfo2_      | -50      | 100      | 3          |

... and the resulting output values:

|          | **cps1** | **cps2** | **cutoff** |
|----------|----------|----------|------------|
| _iresfn_ | 430      | 780      | 1.4        |
| _lfo2_   | -50      | 100      | 3          |

The output value for "cps1" is calculated as 400+(0.5*40)+(-0.2*-50), similarly for "cps2" 800+(0.5*0)+(-0.2*100), and for cutoff: 3+(0.5*-2)+(-0.2*3)

The imodscale ftable may be specified in the score like this:

``` csound-sco
f1  0  8  -2  200 0 2 50 300 -1.5
```

Or more conveniently using [ftgen](../opcodes/ftgen.md) in the orchestra:

``` csound-orc
gimodscale ftgen 0, 0, 8, -2, 200, 0, 2, 50, 300, -1.5
```

Obviously, the parameter and modulator variables need not be static values, and similarly, the scaling routing coefficient table may be continuously rewritten using opcodes like [tablew](../opcodes/tablew.md).

## Examples

Here is an example of the modmatrix opcode. It uses the file [modmatrix.csd](../examples/modmatrix.csd).

``` csound-csd title="Example of the modmatrix opcode." linenums="1"
--8<-- "examples/modmatrix.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

By:

Oeyvind Brandtsegg and Thom Johansen

New in version 5.12
