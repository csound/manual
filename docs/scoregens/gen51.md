<!--
id:GEN51
category:
-->
# GEN51
This subroutine fills a table with a fully customized micro-tuning scale, in the manner of Csound opcodes [cpstun](../opcodes/cpstun.md), [cpstuni](../opcodes/cpstuni.md) et [cpstmid](../opcodes/cpstmid.md).

## Syntax
``` csound-orc
f # time size -51 numgrades interval basefreq basekey tuningRatio1 \
                  tuningRatio2  .... tuningRationN
```

### Performance

The first four parameters (i.e. p5, p6, p7 and p8) define the following generation directives:

_p5 (numgrades)_ -- the number of grades of the micro-tuning scale

_p6 (interval)_ -- the frequency range covered before repeating the grade ratios, for example 2 for one octave, 1.5 for a fifth etcetera

_p7 (basefreq)_ -- the base frequency of the scale in cps

_p8 (basekey)_ -- the integer index of the scale to which to assign basefreq unmodified

The other parameters define the ratios of the scale:

_p9...pN (tuningRatio1...etc.)_ -- the tuning ratios of the scale

For example, for a standard 12-grade scale with the base-frequency of 261 cps assigned to the key-number 60, the corresponding f-statement in the score to generate the table should be:

``` csound-sco
;             numgrades        basefreq           tuning-ratios  (eq.temp) .......
;                     interval         basekey
f1 0 64 -51     12       2      261      60        1   1.059463 1.12246 1.18920 ;..etc...
```

After the gen has been processed, the table f1 is filled with 64 different frequency values. The 60th element is filled with the frequency value of 261, and all other elements (preceding and subsequents) of the table are filled according to the tuning ratios

Another example with a 24-grade scale with a base frequency of 440 assigned to the key-number 48, and a repetition interval of 1.5:

``` csound-sco
;;            numgrades       basefreq            tuning-ratios .....
;                     interval         basekey
f1 0 64 -51     24      1.5     440      48        1   1.01  1.02  1.03  ;..etc...
```

## Examples

Here is an example of the GEN51 routine. It uses the files [gen51.csd](../examples/gen51.csd).

``` csound-csd title="An example of the GEN51 routine." linenums="1"
--8<-- "examples/gen51.csd"
```

These are the diagrams of the waveforms of the GEN51 routines, as used in the example:

<figure markdown="span">
![f 1 0 128 -51 12 2 cpsoct(8) 60 1 2^(1/12) 2^(2/12) 2^(3/12) 2^(4/12) 2^(5/12) 2^(6/12) 2^(7/12) 2^(8/12) 2^(9/12) 2^(10/12) 2^(11/12) 2^(12/12)](../images/gen51_1.png)
<figcaption>f 1 0 128 -51 12 2 cpsoct(8) 60 1 2^(1/12) 2^(2/12) 2^(3/12) 2^(4/12) 2^(5/12) 2^(6/12) 2^(7/12) 2^(8/12) 2^(9/12) 2^(10/12) 2^(11/12) 2^(12/12)</figcaption>
</figure>

<figure markdown="span">
![f 2 0 128 -51 10 2 cpsoct(8) 60 1 2^(1/10) 2^(2/10) 2^(3/10) 2^(4/10) 2^(5/10) 2^(6/10) 2^(7/10) 2^(8/10) 2^(9/10) 2^(10/10)](../images/gen51_2.png)
<figcaption>f 2 0 128 -51 10 2 cpsoct(8) 60 1 2^(1/10) 2^(2/10) 2^(3/10) 2^(4/10) 2^(5/10) 2^(6/10) 2^(7/10) 2^(8/10) 2^(9/10) 2^(10/10)</figcaption>
</figure>

<figure markdown="span">
![f 3 0 128 -51 24 2 cpsoct(8) 60 1 2^(1/24) 2^(2/24) 2^(3/24) 2^(4/24) 2^(5/24) 2^(6/24) 2^(7/24) 2^(8/24) 2^(9/24) 2^(10/24) 2^(11/24) 2^(12/24) 2^(13/24) 2^(14/24) 2^(15/24) 2^(16/24) 2^(17/24) 2^(18/24) 2^(19/24) 2^(20/24) 2^(21/24) 2^(22/24) 2^(23/24) 2^(24/24)](../images/gen51_3.png)
<figcaption>f 3 0 128 -51 24 2 cpsoct(8) 60 1 2^(1/24) 2^(2/24) 2^(3/24) 2^(4/24) 2^(5/24) 2^(6/24) 2^(7/24) 2^(8/24) 2^(9/24) 2^(10/24) 2^(11/24) 2^(12/24) 2^(13/24) 2^(14/24) 2^(15/24) 2^(16/24) 2^(17/24) 2^(18/24) 2^(19/24) 2^(20/24) 2^(21/24) 2^(22/24) 2^(23/24) 2^(24/24)</figcaption>
</figure>

## Credits

Author: Gabriel Maldonado
