# Data Types and Variables

## Implicit Types

Data types in Csound 6 and earlier were declared one of the characters *i, k, a, S, w* as first character of the variable name. This applied for local variables which are only valid in the scope of an instrument. For global variables these type specifiers were prefixed by the *g* character.

| Local | Global | Data type | Updated at | Examples
| ------ | --------- | --------- | ---------- | ------- |
| **i** | **gi** | number | initalization (i-rate) | `iFreq` `giTable` |
| **k** | **gk** | number | control cycle (k-rate) | `kAmp` `gkCount` |
| **a** | **ga** | number | audio sample (a-rate) | `aOut` `gaReverb` |
| **S** | **gS** | string | i-rate or k-rate | `S_file` `gS_host` |
| **f** | **gf** | spectral | k-rate | `fSig` `gfSig` |
| **w** | - | spectral (old) | k-rate | - |
| **i[]** | **gi[]** | array | i-rate | `iArr[]` `giArr[]` |
| **k[]** | **gk[]** | array | k-rate | `kArr[]` `gkArr[]` |


## Explicit Types

In Csound 7 the data type can be given explicitely, without being bound to the name. 

```
nchnls	=	2
0dbfs	=	1

instr 1
  freq:i = 442
  amp:k = linen:k(1,.1,p3,.1)
  sine:a = poscil:a(.2,freq)
  outch(1,sine*amp)
  dB@global:i = -6
  env@global:k = linseg(1,p3,0)
  tri@global:a = vco2(.3,200)
endin
schedule(1,0,3)

instr 2
  outch(2,tri*ampdb(dB)*env)
endin
schedule(2,0,3)
```

## Constants and Reserved Symbols

Constants are available continuously and do not change in value. Usually they are connected with reserved symbols and written in the orchestra header:

```
sr = 44100
ksmps = 64
0dbfs = 1
nchnls = 2
```

