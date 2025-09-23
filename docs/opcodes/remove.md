<!--
id:remove
category:Instrument Control:Invocation
-->
# remove
Removes the definition of an instrument as long as it is not in use.

## Syntax
=== "Modern"
    ``` csound-orc
    remove(insnum)
    ```

=== "Classic"
    ``` csound-orc
    remove insnum
    ```

### Initialization

_insnum_ -- number or name of the instrument to be deleted

### Performance

As long as the indicated instrument is not active, _remove_ deletes the instrument and memory associated with it.  It should be treated with care as it is possible that in some cases its use may lead to a crash.

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
June, 2006<br>

New in Csound version 5.04
