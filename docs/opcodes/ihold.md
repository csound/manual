<!--
id:ihold
category:Instrument Control:Duration Control
-->
# ihold
Causes a finite-duration note to become a &#8220;held&#8221; note

## Syntax
``` csound-orc
ihold
```

### Performance

_ihold_ -- this i-time statement causes a finite-duration note to become a &#8220;held&#8221; note. It thus has the same effect as a negative p3 ( see score [i Statement](../../scoregens/i)), except that p3 here remains positive and the instrument reclassifies itself to being held indefinitely. The note can be turned off explicitly with _turnoff_, or its space taken over by another note of the same instrument number (i.e. it is tied into that note). Effective at i-time only; no-op during a _reinit_ pass.

## Examples

Here is an example of the ihold opcode. It uses the file [ihold.csd](../../examples/ihold.csd).

``` csound-csd title="Example of the ihold opcode." linenums="1"
--8<-- "examples/ihold.csd"
```

## See also

[Duration Control Statements](../../control/durctl)

## Credits

Example written by Kevin Conder.
