<!--
id:init
category:Instrument Control:Initialization and Reinitialization
-->
# init
Initialises one or more objects.

This opcode can be used for various purposes in its different
versions, to initialise variables, arrays, and other objects.

## Syntax
=== "Modern"
    ``` csound-orc
    var:{a,k,i,S,OpcodeDef}[,...] = init(arg:{i,S}[,...])
    var{i[],k[],a[]} = init(size1:i[,size2:i,...])
    err:i = init(inst:Instr[,p4:i,...])
    [var:*,... =] init(op:Opcode[,arg1:*,...])
    ```


=== "Classic"
    ``` csound-orc
    ares[,...] init iarg[,...] 
    ires[,...] init iarg[,...] 
    kres[,...]  init iarg[,...] 
    ares[] init size1[,size2, ...]
    kres[] init size1[,size2, ...]
    ires[] init size1[,size2, ...]
    ierr init inst:Instr[,p4:i,...]
    [xvar,...] init op:Opcode[,arg1:*,...]
    ```

### Initialization

Puts the value of the i-time expression _arg_ into a variable, i.e.,
initialize the result. Note that _init_ provides the only case of an
init-time statement being permitted to write into a perf-time (k- or
a-rate) result cell; the statement has no effect at perf-time. In the
case of opcode definition variables, the name of an existing opcode
is passed as a string.

It is possible to initialise upto 24 variables 
of the same class in one statement.  If there are more output
variables  than input expressions then the last one is repeated.  
It is an error to have more inputs than outputs.

The array form allocates space for a array object (of any number of
dimensions).

In the case of instrument instances, the opcode takes any pfields
as parameters, and run an initialisation pass, returning any error
codes (or zero in case of success).

For opcode objects, the code runs the initialisation routine (if it
exists) defined for the opcode. The input arguments and outputs should match
the opcode signature for the object being initialised.

## Examples

Here is an example of the init opcode. It uses the file [init.csd](../examples/init.csd).

``` csound-csd title="Example of the init opcode." linenums="1"
--8<-- "examples/init.csd"
```

Its output should include lines like these:

```
i   1 time     0.00073:     1.00000
i   1 time     0.10014:   138.00000
i   1 time     0.20027:   276.00000
i   1 time     0.30041:   414.00000
i   1 time     0.40054:   552.00000
i   1 time     0.50068:   690.00000
i   1 time     0.60009:   827.00000
i   1 time     0.70023:   965.00000
i   1 time     0.80036:  1103.00000
i   1 time     0.90050:  1241.00000

i   2 time     2.00054:     1.00000
i   2 time     2.09995:     1.00000
i   2 time     2.20009:     1.00000
i   2 time     2.30023:     1.00000
i   2 time     2.40036:     1.00000
i   2 time     2.50050:     1.00000
i   2 time     2.59991:     1.00000
i   2 time     2.70005:     1.00000
i   2 time     2.80018:     1.00000
i   2 time     2.90032:     1.00000
```

The following example shows the init opcode in the context of
instrument and opcode initialisation.

``` csound-csd title="Examples of the instrument definition, instance and opcode init." linenums="1"
--8<-- "examples/create.csd"
```


## See also

[Initialization and Reinitialization](../control/reinitn.md)

[Array opcodes](../math/array.md)

## Credits

Init first appeared in the original Csound, but the extension to multiple values is by

Author: John ffitch<br>
University of Bath, and Codemist Ltd.<br>
Bath, UK<br>
February 2010<br>

Multiple form new in version 5.13; t-variable form new in 5.14.
