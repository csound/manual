<!--
id:if
category:Instrument Control:Program Flow Control
-->
# if
Branches conditionally at initialization or during performance time.

_if...igoto_ -- conditional branch at initialization time, depending on the truth value of the logical expression _ia_ _R_ _ib_. The branch is taken only if the result is true.

_if...kgoto_ -- conditional branch during performance time, depending on the truth value of the logical expression _ka_ _R_ _kb_. The branch is taken only if the result is true.

_if...goto_ -- combination of the above. Condition tested on every pass.

_if...then_ -- allows the ability to specify conditional _if_/_else_/_endif_ blocks.  All _if...then_ blocks must end with an _endif_ statement. _elseif_ and _else_ statements are optional. Any number of _elseif_ statements are allowed. Only one _else_ statement may occur and it must be the last conditional statement before the _endif_ statement. Nested _if...then_ blocks are allowed.

> :memo: **Note**
>
> Note that if the condition uses a k-rate variable (for instance, &#8220;if kval &gt; 0&#8221;), the _if...goto_ or _if...then_ statement will be ignored during the i-time pass. This allows for opcode initialization, even if the k-rate variable has already been assigned an appropriate value by an earlier init statement.

## Syntax
``` csound-orc
if ia R ib igoto label
if ka R kb kgoto label
if xa R xb goto label
if xa R xb then
```

where _label_ is in the same instrument block and is not an expression, and where _R_ is one of the Relational operators (_&lt;_, _=_, _&lt;=_, _==_, _!=_) (and _=_ for convenience, see also under [Conditional Values](../control/conditional.md)).

If _goto_ or _then_ is used instead of _kgoto_ or _igoto_, the behavior is determined by the type being compared. If the comparison used k-type variables, kgoto is used and viceversa.

> :memo: **Note**
>
> _If/then/goto_ statements cannot do audio-type comparisons. You cannot put a-type variables in the comparison expressions for these opcodes. The reason for this is that audio variables are actually vectors, which cannot be compared in the same way as scalars. If you need to compare individua audio samples, use  [kr = 1](../opcodes/kr.md) or [Comparators](../sigmod/compaccum.md)

## Examples

Here is an example of the if...igoto combination. It uses the file [igoto.csd](../examples/igoto.csd).

``` csound-csd title="Example of the if...igoto combination." linenums="1"
--8<-- "examples/igoto.csd"
```

Its output should include lines like this:

```
instr 1:  iparam = 0.000
instr 1:  ifreq = 440.000
instr 1:  iparam = 1.000
instr 1:  ifreq = 880.000
```

Here is an example of the if...kgoto combination. It uses the file [kgoto.csd](../examples/kgoto.csd).

``` csound-csd title="Example of the if...kgoto combination." linenums="1"
--8<-- "examples/kgoto.csd"
```

Its output should include lines like this:

```
kval = 0.000000, kfreq = 440.000000
kval = 0.999732, kfreq = 440.000000
kval = 1.999639, kfreq = 880.000000
```

Here is an example of the if...then combo. It uses the file [ifthen.csd](../examples/ifthen.csd).

``` csound-csd title="Example of the if...then combo." linenums="1"
--8<-- "examples/ifthen.csd"
```

## See also

[Program Flow Control](../control/pgmctl.md)

## Credits

Examples written by Kevin Conder.

Added a note by Jim Aikin.

February 2004. Added a note by Matt Ingalls.
