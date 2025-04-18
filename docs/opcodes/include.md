<!--
id:include
category:Orchestra Syntax:Macros
-->
# &num;include
Includes an external file for processing.

Macros are textual replacements which are made in the orchestra as it is being read.  The [orchestra macro system](../orch/macros.md) in Csound is a very simple one, and uses the characters &num; and &dollar; to define and call macros. This can save typing, and can lead to a coherent structure and consistent style.  This is similar to, but independent of, the [macro system in the score language](../score/macros.md).

Includes an external file for processing.

## Syntax
``` csound-orc
#include "filename"
#includestr "filename"
```

### Performance

&num;includestr is similar to &num;include except that the file name must be delimited by a double quote character and the file name is subjected to macro expansion.

It is sometimes convenient to have the orchestra arranged in a number of files, for example with each instrument in a separate file.  This style is supported by the _&num;include_ facility which is part of the macro system.  A line containing the text

``` csound-orc
#include "filename"
```

where the character " can be replaced by any suitable character in &num;include (but not in &num;includestr).  For most uses the double quote symbol will probably be the most convenient. The file name can include a full path.

This takes input from the named file until it ends, when input reverts to the previous input. _Note: _Csound versions prior to 4.19 had a limit of 20 on the depth of included files and macros.

Another suggested use of _&num;include_ would be to define a set of macros which are part of the composer's style.

An extreme form would be to have each instrument defines as a macro, with the instrument number as a parameter.  Then an entire orchestra could be constructed from a number of _&num;include_ statements followed by macro calls.

``` csound-orc
#include "clarinet"
#include "flute"
#include "bassoon"
$CLARINET(1)
$FLUTE(2)
$BASSOON(3)
```

It must be stressed that these changes are at the textual level and so take no cognizance of any meaning.

If the version of Csound is built with the CURL library the filename in an _&num;include_ statement can be an URL, recognised by including the substring "://" in the name.  This will include text via protocols such as http, https, and ftp.

## Examples

Here is an example of the include opcode. It uses the file [include.csd](../examples/include.csd), and [table1.inc](../examples/table1.inc).

``` csound-sco title="Example of the include opcode."
/* table1.inc */
; Table #1, a sine wave.
f 1 0 16384 10 1
/* table1.inc */
```

``` csound-csd linenums="1"
--8<-- "examples/include.csd"
```

## See also

[Orchestra Macros](../orch/macros.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 1998<br>

&num;includestr new in version 6.12

Example written by Kevin Conder.

New in Csound version 3.48

URLs available from Csound 6.02
