<!--
id:arrayOpcodes
category:
-->
# Array Opcodes

List of Array Opcodes (6.12):

* [init](../../opcodes/init) initiatlise array
* [fillarray](../../opcodes/fillarray) fill array with values
* [genarray](../../opcodes/genarray) create array with artithmetic sequence
* [=](../../opcodes/assign) create or reset array as copy of another array
* [slicearray](../../opcodes/slicearray) take slice of an array
* [maparray](../../opcodes/maparray) apply a function to an array
* [scalearray](../../opcodes/scalearray) scale values in an array
* [sorta](../../opcodes/sorta) sort an array in ascending order
* [sortd](../../opcodes/sortd) sort an array in descending order
* [limit](../../opcodes/limit) and [limit1](../../opcodes/limit1) limit array values
* [reshapearray](../../opcodes/reshapearray) change dimensions of an array
* [trim](../../opcodes/trim) adjust size of a one-dimensional array
* [copya2ftab](../../opcodes/copya2ftab) copy array to a function table
* [copyf2array](../../opcodes/copyf2array) copy function table to an array
* [tab2array](../../opcodes/tab2array) copy a slice from a table to an array
* [dot](../../opcodes/dot) calculate dot product from two arrays
* [interleave](../../opcodes/interleave) interleave two arrays to a single one
* [deinterleave](../../opcodes/deinterleave) deinterleave an array to two ones
* [getrow](../../opcodes/getrow) get a row from a two-dimensional array
* [getcol](../../opcodes/getcol) get a column from a two-dimensional array
* [setrow](../../opcodes/setrow) set a row of a two-dimensional array
* [setcol](../../opcodes/setcol) set a column of a two-dimensional array
* [lenarray](../../opcodes/lenarray) returns length of an array
* [minarray](../../opcodes/minarray) returns minimum value in an array
* [maxarray](../../opcodes/maxarray) returns maximum value in an array
* [sumarray](../../opcodes/sumarray) returns sum of values in an array
* [cmp](../../opcodes/cmp) compare two arrays
* [printarray](../../opcodes/printarray) print an array
* [product](../../opcodes/product) calculates the product of an array
* the unary functions [ceil](../../opcodes/ceil), [floor](../../opcodes/floor) [round](../../opcodes/round), [int](../../opcodes/int), [frac](../../opcodes/frac), [powoftwo](../../opcodes/powoftwo), [abs](../../opcodes/abs), [log2](../../opcodes/log2), [log10](../../opcodes/log10), [log](../../opcodes/log), [exp](../../opcodes/exp), [sqrt](../../opcodes/sqrt), [cos](../../opcodes/cos), [sin](../../opcodes/sin), [tan](../../opcodes/tan), [cosinv](../../opcodes/cosinv), [sininv](../../opcodes/sininv), [taninv](../../opcodes/taninv), [sinh](../../opcodes/sinh), [cosh](../../opcodes/cosh), [tanh](../../opcodes/tanh), [cbrt](../../opcodes/cbrt), [limit1](../../opcodes/limit1), and the binary functions [taninv2](../../opcodes/taninv2), [pow](../../opcodes/pow), [hypot](../../opcodes/hypot), [fmod](../../opcodes/fmod), [fmax](../../opcodes/fmax), [fmin](../../opcodes/fmin) accept arrays as input.

Some instructions to work with arrays in Csound (see also the [array chapter in the Csound FLOSS Manual:](https://flossmanual.csound.com/csound-language/arrays))

## Variable Name

An array must be created (via [init](../../opcodes/init) or [fillarray](../../opcodes/fillarray)) as kMyName plus_ ending brackets. The brackets determine the dimensions of the array. So,

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

The function _lenarray(kArr)_ reports the length of an array. See example for function [lenarray](../../opcodes/lenarray).

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
[copyf2array](../../opcodes/copyf2array) and [copya2ftab](../../opcodes/copya2ftab).

## Array Operations: Math

### +, -, *, / on a Number

If the four basic math operators are used between an array and a scalar (number), the operation is applied to each element. The safest way to do this is to store the result in a new array:

``` csound-orc
kArr1[] fillarray 1, 2, 3
kArr2[] = kArr1 + 10    ;(kArr2 is now [11, 12, 13])
```

Here is an example of array/scalar operations. It uses the file [array_scalar_math.csd](../../examples/array_scalar_math.csd).

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

Here is an example of array operations. It uses the file [array_array_math.csd](../../examples/array_array_math.csd).

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

See example for opcode [maparray](../../opcodes/maparray).

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
[minarray](../../opcodes/minarray) and [maxarray](../../opcodes/maxarray).

### Sum

``` csound-orc
kSum sumarray kArr
```

returns the sum of all values in kArr. See example for opcode [sumarray](../../opcodes/sumarray).

### Scale

``` csound-orc
scalearray kArr, kMin, kMax
```

scales all values in kArr between kMin and kMax.

``` csound-orc
  kArr[] fillarray  1, 3, 9, 5, 6
         scalearray kArr, 1, 3
```

changes _kArr_ to [1, 1.5, 3, 2, 2.25]. See example for opcode [scalearray](../../opcodes/scalearray).

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

See example for opcode [slicearray](../../opcodes/slicearray).

### Reshape

Use reshapearray to change the shape of an array without changing its capacity (change a 1D to a 2D array and viceversa). See example for opcode [reshapearray](../../opcodes/reshapearray).

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

Here is an example of an array in an UDO. It uses the file [array_udo.csd](../../examples/array_udo.csd).

``` csound-csd title="Example of an array in an UDO" linenums="1"
--8<-- "examples/array_udo.csd"
```

Note that if an opcode (for example inrg), alters arguments on its right hand argument list, an array index should not be used there. Unlike a normal variable, the array won't changed by the opcode.

## Credits

This manual page has been written by Joachim Heintz.<br>
July 2013<br>

New in Csound 6.00
