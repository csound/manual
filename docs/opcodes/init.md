<!--
id:init
category:Instrument Control:Initialization and Reinitialization
-->
# init
Initializes variables, arrays, user-defined structs and object instances.

`init` runs at initialization. It does not update its outputs during performance.

## Syntax
=== "Modern"
    ``` csound-orc
    var:{a,k,i,S,OpcodeDef}[,...] = init(arg:{i,S}[,...])
    array:T[] = init(size1:i[,size2:i,...])
    array:T[] = init(source:T[])
    value:Type = init()
    value:Type = init(member1[,member2,...])
    value:Type = init(source:Type)
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
    Sres[] init size1[,size2, ...]
    array:Type[] init size1[,size2, ...]
    array:T[] init source:T[]
    value:Type init
    value:Type init member1[,member2,...]
    value:Type init source:Type
    ierr init inst:Instr[,p4:i,...]
    [xvar,...] init op:Opcode[,arg1:*,...]
    ```

### Initialization

#### Variables

The scalar form stores an init-time value in a variable. For a k-rate variable, that value remains until another statement changes it. For an a-rate variable, `init` fills its audio block with the value. A string input initializes a string variable. To initialize an `OpcodeDef`, pass the name of an existing opcode as a string.

The numeric form can initialize up to 24 variables of the same type in one statement. If there are fewer inputs than outputs, it repeats the last input for the remaining outputs. More inputs than outputs is an error.

#### Arrays

`T` is the element type, such as `i`, `k`, `a`, `S` or a user-defined struct type. Array initialization takes one i-rate size for each dimension. One size creates a one-dimensional array. Two sizes create a two-dimensional array, and so on. The arguments give sizes rather than element values.

=== "Modern"
    ``` csound-orc
    vector:i[] = init(2)    ; two elements
    grid:i[] = init(2, 3)   ; two rows of three elements
    names:S[] = init(2)     ; two strings
    ```

=== "Classic"
    ``` csound-orc
    iVector[] init 2
    iGrid[][] init 2, 3
    SNames[] init 2
    ```

The number of size arguments determines the number of dimensions. In classic syntax, repeated brackets can also show the dimensions in the variable declaration. `iGrid[] init 2, 3` allocates the same shape as `iGrid[][] init 2, 3`.

New numeric elements start at zero and new strings start empty. A 2 by 3 array contains six elements. Its first element is `grid[0][0]` and its last is `grid[1][2]`. Use [lenarray](lenarray.md) to read the number of dimensions and their sizes. To supply element values instead of sizes, use [fillarray](fillarray.md).

Passing an existing array of the same element type to `init` copies its shape and contents at initialization.

#### User-defined types and structs

In Csound 7, `struct` defines a user-defined type (UDT) with named members. `Type` in the syntax above stands for that type's name. Declare the type in the orchestra header and give each member a type.

``` csound-orc
struct Point x:i, y:i

instr 1
  origin:Point = init()
  point:Point = init(3, 4)
  copied:Point = init(point)
  print(copied.x, copied.y)
endin
```

With no arguments, a new struct keeps its default member values. Numeric members start at zero and string members start empty. This form does not reset members that already hold values.

To set members, supply one argument for each member, in declaration order and with matching types. A struct can contain another struct or an array. Pass those values as arguments too. You must supply all members or none. Unlike the numeric scalar form, struct initialization does not repeat the last argument to fill missing members.

Passing a struct of the same type initializes the output from its member values. Use a dot to read or write a member, such as `point.x`.

For an array of structs, the arguments are array sizes. For example, `points:Point[] = init(2)` creates two points with default member values. An array member inside a struct starts without elements. Initialize that array before indexing it, or pass an initialized array to the struct's member-based `init` form.

#### Instrument and opcode objects

For an `Instr` instance, `init` runs its initialization pass and returns 0 on success or an error code. The optional numeric arguments supply p4, p5 and the following p-fields. It sets p2 to 0 and p3 to -1. This does not add the instance to Csound's performance list. Use [perf](perf.md) to perform it manually after initialization.

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

### Arrays

These examples allocate numeric and string arrays, then read and change individual elements.

=== "Modern"
    [init-arrays-modern.csd](../examples/init-arrays-modern.csd)
    ``` csound-csd title="Initializing arrays" linenums="1"
    --8<-- "examples/init-arrays-modern.csd"
    ```

=== "Classic"
    [init-arrays.csd](../examples/init-arrays.csd)
    ``` csound-csd title="Initializing arrays" linenums="1"
    --8<-- "examples/init-arrays.csd"
    ```

Both examples print these values.

``` text
Vector length = 2
Grid dimensions = 2, sizes = 2 x 3
Initial grid value = 0
Initial string = ''
Assigned grid value = 7, string = 'first'
```

### Structs

[init-structs.csd](../examples/init-structs.csd) shows default members, member-based initialization, a struct copy, nested structs and an array of structs.

``` csound-csd title="Initializing structs" linenums="1"
--8<-- "examples/init-structs.csd"
```

### Instrument and opcode objects

The following example shows the init opcode in the context of
instrument and opcode initialisation.

``` csound-csd title="Examples of the instrument definition, instance and opcode init." linenums="1"
--8<-- "examples/create.csd"
```


## See also

[create](create.md), [run](run.md), [perf](perf.md), [delete](delete.md), [Instrument definitions, instances and opcode objects](../orch/instrument-and-opcode-objects.md)

[Initialization and Reinitialization](../control/reinitn.md)

[Array opcodes](../math/array.md), [User-defined types](../orch/data-types.md#user-defined-types)

## Credits

Init first appeared in the original Csound, but the extension to multiple values is by

Author: John ffitch<br>
University of Bath, and Codemist Ltd.<br>
Bath, UK<br>
February 2010<br>

Multiple form new in version 5.13.

User-defined types by Steven Yi. Available in Csound 7.
