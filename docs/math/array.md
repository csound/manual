<!--
id:arrayOpcodes
category:
-->
# Array Opcodes

Array Opcodes:

* [init](../opcodes/init.md) initiatlise array
* [fillarray](../opcodes/fillarray.md) fill array with values
* [genarray](../opcodes/genarray.md) create array with artithmetic sequence
* [=](../opcodes/assign.md) create or reset array as copy of another array
* [slicearray](../opcodes/slicearray.md) take slice of an array
* [maparray](../opcodes/maparray.md) apply a function to an array
* [scalearray](../opcodes/scalearray.md) scale values in an array
* [sorta](../opcodes/sorta.md) sort an array in ascending order
* [sortd](../opcodes/sortd.md) sort an array in descending order
* [limit](../opcodes/limit.md) and [limit1](../opcodes/limit1.md) limit array values
* [reshapearray](../opcodes/reshapearray.md) change dimensions of an array
* [trim](../opcodes/trim.md) adjust size of a one-dimensional array
* [copya2ftab](../opcodes/copya2ftab.md) copy array to a function table
* [copyf2array](../opcodes/copyf2array.md) copy function table to an array
* [tab2array](../opcodes/tab2array.md) copy a slice from a table to an array
* [dot](../opcodes/dot.md) calculate dot product from two arrays
* [interleave](../opcodes/interleave.md) interleave two arrays to a single one
* [deinterleave](../opcodes/deinterleave.md) deinterleave an array to two ones
* [getrow](../opcodes/getrow.md) get a row from a two-dimensional array
* [getcol](../opcodes/getcol.md) get a column from a two-dimensional array
* [setrow](../opcodes/setrow.md) set a row of a two-dimensional array
* [setcol](../opcodes/setcol.md) set a column of a two-dimensional array
* [lenarray](../opcodes/lenarray.md) returns length of an array
* [minarray](../opcodes/minarray.md) returns minimum value in an array
* [maxarray](../opcodes/maxarray.md) returns maximum value in an array
* [sumarray](../opcodes/sumarray.md) returns sum of values in an array
* [cmp](../opcodes/cmp.md) compare two arrays
* [printarray](../opcodes/printarray.md) print an array
* [product](../opcodes/product.md) calculates the product of an array
* the unary functions [ceil](../opcodes/ceil.md), [floor](../opcodes/floor.md) [round](../opcodes/round.md), [int](../opcodes/int.md), [frac](../opcodes/frac.md), [powoftwo](../opcodes/powoftwo.md), [abs](../opcodes/abs.md), [log2](../opcodes/log2.md), [log10](../opcodes/log10.md), [log](../opcodes/log.md), [exp](../opcodes/exp.md), [sqrt](../opcodes/sqrt.md), [cos](../opcodes/cos.md), [sin](../opcodes/sin.md), [tan](../opcodes/tan.md), [cosinv](../opcodes/cosinv.md), [sininv](../opcodes/sininv.md), [taninv](../opcodes/taninv.md), [sinh](../opcodes/sinh.md), [cosh](../opcodes/cosh.md), [tanh](../opcodes/tanh.md), [cbrt](../opcodes/cbrt.md), [limit1](../opcodes/limit1.md), and the binary functions [taninv2](../opcodes/taninv2.md), [pow](../opcodes/pow.md), [hypot](../opcodes/hypot.md), [fmod](../opcodes/fmod.md), [fmax](../opcodes/fmax.md), [fmin](../opcodes/fmin.md) accept arrays as input.
* Other operations such as fft, etc are documented in their respective manual pages.

Some instructions to work with arrays in Csound (see also the [array chapter in the Csound FLOSS Manual:](https://flossmanual.csound.com/csound-language/arrays))

## Variable Name

An array must be created (via [init](../opcodes/init.md) or [fillarray](../opcodes/fillarray.md)) as kMyName plus_ ending brackets. The brackets determine the dimensions of the array. So,

``` csound-orc
kArr[] init 10
```

creates a one-dimensional array of length 10, whereas

``` csound-orc
kArr[][] init 10, 10
```

creates a two-dimensional array with 10 rows and 10 columns.

After the initalization of the array, referring to the array as a whole is done without any brackets. Brackets are only used if an element is indexed:

``` csound-orc
kArr[]   init 10             ;with brackets because of initialization
kLen     = lenarray(kArr)    ;without brackets
kFirstEl = kArr[0]           ;indexing with brackets
```

The same syntax is used for a simple copy via the '=' operator:

``` csound-orc
kArr1[] fillarray 1, 2, 3, 4, 5
kArr2[] = kArr1              ;creates kArr2 as copy of kArr1
```

## k-rate

Note that most array operations are currently k-rate only. So like any other k-rate opcode, an operation on arrays will be automatically repeated every k-cycle. For instance, this code will repeat re-writing the array with different random values every k-cycle, as long as the instrument runs:

``` csound-orc
kArr[] init 10
kIndx  = 0
until kIndx == lenarray(kArr) do
  kArr[kIndx] rnd31 10, 0
  kIndx += 1
od
```

If you want to avoid this, you must organize it in one of the usual ways, for instance by using a trigger:

``` csound-orc
kArr[] init 10
kTrig metro 1
if kTrig == 1 then ;do the following once a second
  kIndx  = 0
  until kIndx == lenarray(kArr) do
    kArr[kIndx] rnd31 10, 0
    kIndx += 1
  od
endif
```

## Complex arrays

Arrays of the Complex type can be used for various mathematical
applications. All operations of complex arithmetic are implemented
for these, as well as a number of special functions (see [Mathematical
Functions](../math/mathfunc.md)). FFT and Hilbert transforms for
these types are also available.

## Creation/Initialization

The usual way to create an array is with init:

``` csound-orc
kArr[]   init 10     ;creates one-dimensional array with length 10
kArr[][] init 10, 10 ;creates two-dimensional array
```

A one-dimensional array can also be created and filled with distinct values by the opcode _fillarray_. This line creates a vector with length 4 and puts in the numbers [1, 2, 3, 4]:

``` csound-orc
kArr[] fillarray 1, 2, 3, 4
```

## Length

The function _lenarray(kArr)_ reports the length of an array. See example for function [lenarray](../opcodes/lenarray.md).

Copy Arrays to/from Tables

``` csound-orc
copyf2array kArr, kfn
```

copies data from an ftable to a vector.

``` csound-orc
copya2ftab kArr, kfn
```

copies data from a vector to an function table.

See examples for opcodes
[copyf2array](../opcodes/copyf2array.md) and [copya2ftab](../opcodes/copya2ftab.md).

## Array Operations: Math

### +, -, *, / on a Number

If the four basic math operators are used between an array and a scalar (number), the operation is applied to each element. The safest way to do this is to store the result in a new array:

``` csound-orc
kArr1[] fillarray 1, 2, 3
kArr2[] = kArr1 + 10    ;(kArr2 is now [11, 12, 13])
```

=== "Modern"
    Here is an example of array/scalar operations. It uses the file [array_scalar_math-modern.csd](../examples/array_scalar_math-modern.csd).
    ``` csound-csd title="Example of array operations" linenums="1"
    --8<-- "examples/array_scalar_math-modern.csd"
    ```

=== "Classic"
    Here is an example of array/scalar operations. It uses the file [array_scalar_math.csd](../examples/array_scalar_math.csd).
    ``` csound-csd title="Example of array operations" linenums="1"
    --8<-- "examples/array_scalar_math.csd"
    ```

### +, -, *, / on a Second Array

If the four basic math operators are used between two arrays, the operation is applied element by element. The result can be straightforward stored in a new array:

``` csound-orc
kArr1[] fillarray 1, 2, 3
kArr2[] fillarray 10, 20, 30
kArr3[] = kArr1 + kArr2    ;(kArr3 is now [11, 22, 33])
```

=== "Modern"
    Here is an example of array operations. It uses the file [array_array_math-modern.csd](../examples/array_array_math-modern.csd).
    ``` csound-csd title="Example of array operations" linenums="1"
    --8<-- "examples/array_array_math-modern.csd"
    ```

=== "Classic"
    Here is an example of array operations. It uses the file [array_array_math.csd](../examples/array_array_math.csd).
    ``` csound-csd title="Example of array operations" linenums="1"
    --8<-- "examples/array_array_math.csd"
    ```

## Map a Function to an Array

``` csound-orc
kArrRes maparray kArrSrc, "fun"
```

maps the k-rate 1-arg function in the string to every element of the vector.

Possible functions are for instance _abs, ceil, exp, floor, frac, int, log, log10, round, sqrt_. This is a simple example:

``` csound-orc
kArrSrc[] fillarray 1, 2, 3, 4, 5
kArrRes[] init      5
kArrRes   maparray  kArrSrc, "sqrt"
```

See example for opcode [maparray](../opcodes/maparray.md).

## Array Operations: min, max, sum, scale, slice

### Minimum and Maximum

``` csound-orc
kMin [,kMinIndx] minarray kArr
```

returns the smallest value in an array, and optionally its index.

``` csound-orc
kMax [,kMaxIndx] maxarray kArr
```

returns the largest value in an array, and optionally its index. See examples for opcodes
[minarray](../opcodes/minarray.md) and [maxarray](../opcodes/maxarray.md).

### Sum

``` csound-orc
kSum sumarray kArr
```

returns the sum of all values in kArr. See example for opcode [sumarray](../opcodes/sumarray.md).

### Scale

``` csound-orc
scalearray kArr, kMin, kMax
```

scales all values in kArr between kMin and kMax.

``` csound-orc
  kArr[] fillarray  1, 3, 9, 5, 6
         scalearray kArr, 1, 3
```

changes _kArr_ to [1, 1.5, 3, 2, 2.25]. See example for opcode [scalearray](../opcodes/scalearray.md).

### Slice

``` csound-orc
slicearray kArr, iStart, iEnd
```

returns a slice of _kArr_ from index _iStart_ to index _iEnd_ (included).

The array for receiving the slice must have been created in advance:

``` csound-orc
  kArr[]  fillarray  1, 2, 3, 4, 5, 6, 7, 8, 9
  kArr1[] init       5
  kArr2[] init       4
  kArr1   slicearray kArr, 0, 4        ;[1, 2, 3, 4, 5]
  kArr2   slicearray kArr, 5, 8        ;[6, 7, 8, 9]
```

See example for opcode [slicearray](../opcodes/slicearray.md).

### Reshape

Use reshapearray to change the shape of an array without changing its capacity (change a 1D to a 2D array and viceversa). See example for opcode [reshapearray](../opcodes/reshapearray.md).

## Arrays in UDOs

The dimension of an input array must be declared in two places:

*  as k[] or k[][] in the type input list
*  as kName[], kName[][] etc in the xin list.

For instance :

``` csound-orc
opcode FirstEl, k, k[]
;returns the first element of vector kArr
kArr[] xin
       xout   kArr[0]
endop
```

=== "Modern"
    Here is an example of an array in an UDO. It uses the file [array_udo-modern.csd](../examples/array_udo-modern.csd).
    ``` csound-csd title="Example of an array in an UDO" linenums="1"
    --8<-- "examples/array_udo-modern.csd"
    ```

=== "Classic"
    Here is an example of an array in an UDO. It uses the file [array_udo.csd](../examples/array_udo.csd).
    ``` csound-csd title="Example of an array in an UDO" linenums="1"
    --8<-- "examples/array_udo.csd"
    ```

Note that if an opcode (for example inrg), alters arguments on its right hand argument list, an array index should not be used there. Unlike a normal variable, the array won't changed by the opcode.

## Credits

This manual page has been written by Joachim Heintz.<br>
July 2013<br>

New in Csound 6.00
