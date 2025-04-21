# Window Functions

Windowing functions are used for analysis, and as waveform envelopes, particularly in granular synthesis. Window functions are built in to some opcodes, but others require a function table to generate the window. [GEN20](../scoregens/gen20.md) is used for this purpose. The diagram of each window below, is accompanied by the f score statement and ftgen orchestra opcode used to generate it.

### Hamming

``` csound-sco title="Example F.1. Hamming" title="Example F.. Hamming window function statement"
f81   0   8192   20   1   1
```

``` csound-orc
i0 ftgen 81, 0, 8192, 20, 1, 1
```

<figure markdown="span">
![Hamming Window Function.](../images/image1.png)
<figcaption>Hamming Window Function.</figcaption>
</figure>

### Hanning

``` csound-sco title="Example F.2. Hanning window function statement"
f82   0   8192   20   2   1
```

``` csound-orc
i0 ftgen 82, 0, 8192, 20, 2, 1
```

<figure markdown="span">
![Hanning Window Function](../images/image2.png)
<figcaption>Hanning Window Function</figcaption>
</figure>

### Bartlett

``` csound-sco title="Example F.3. Bartlett window function statement"
f83   0   8192   20   3   1
```

``` csound-orc
i0 ftgen 83, 0, 8192, 20, 3, 1
```

<figure markdown="span">
![Bartlett Window Function](../images/image3.png)
<figcaption>Bartlett Window Function</figcaption>
</figure>

### Blackman

``` csound-sco title="Example F.4. Blackman window function statement"
f84   0   8192   20   4   1
```

``` csound-orc
i0 ftgen 84, 0, 8192, 20, 4, 1
```

<figure markdown="span">
![Blackman Window Function](../images/image4.png)
<figcaption>Blackman Window Function</figcaption>
</figure>

### Blackman-Harris

``` csound-sco title="Example F.5. Blackman-Harris window function statement"
f85   0   8192   20   5   1
```

``` csound-orc
i0 ftgen 85, 0, 8192, 20, 5, 1
```

<figure markdown="span">
![Blackman-Harris Window Function](../images/image5.png)
<figcaption>Blackman-Harris Window Function</figcaption>
</figure>

### Gaussian

``` csound-sco title="Example F.6. Gaussian window function statement"
f86   0   8192   20   6   1
```

``` csound-orc
i0 ftgen 86, 0, 8192, 20, 6, 1
```

<figure markdown="span">
![Blackman-Harris Window Function](../images/image6.png)
<figcaption>Blackman-Harris Window Function</figcaption>
</figure>

``` csound-sco title="Example F.6a. Gaussian window function statement with extra parameter"
f61 0 8192   20   6   1 2
```

``` csound-orc
i0 ftgen 61, 0, 8192, 20, 6, 1, 2
```

<figure markdown="span">
![Gaussian Window Function](../images/image6a.png)
<figcaption>Gaussian Window Function</figcaption>
</figure>

### Kaiser

``` csound-sco title="Example F.7. Kaiser window function statement as default (alpha=0)"
f87  0   8192   20   7   1
```

``` csound-orc
i0 ftgen 87, 0, 8192, 20, 7, 1
```

<figure markdown="span">
![Gaussian Window Function](../images/image7.png)
<figcaption>Gaussian Window Function</figcaption>
</figure>

``` csound-sco title="Example F.7a. Kaiser window function statement with alpha=5"
f71  0   8192   20  7   1  5
```

``` csound-orc
i0 ftgen 71, 0, 8192, 20, 7, 1, 5
```

<figure markdown="span">
![Gaussian Window Function](../images/image7a.png)
<figcaption>Gaussian Window Function</figcaption>
</figure>

``` csound-sco title="Example F.7b. Kaiser window function statement with alpha=10"
f72  0   8192   20   7   1  10
```

``` csound-orc
i0 ftgen 72, 0, 8192, 20, 7, 1, 10
```

<figure markdown="span">
![Kaiser Window Function](../images/image7b.png)
<figcaption>Kaiser Window Function</figcaption>
</figure>

### Rectangle

``` csound-sco title="Example F.8. Rectangle window function statement"
f88   0   8192   -20   8   .3
```

``` csound-orc
i0 ftgen 88, 0, 8192, -20, 8, .3
```

<figure markdown="span">
![Rectangle Window Function](../images/image8.png)
<figcaption>Rectangle Window Function</figcaption>
</figure>

### Sinc

``` csound-sco title="Example F.9. Sinc window function statement (default and max=0.8)"
f89  0   8192   -20   9   .8
```

``` csound-orc
i0 ftgen 89, 0, 8192, -20, 9, .8
```

<figure markdown="span">
![Rectangle Window Function](../images/image9.png)
<figcaption>Rectangle Window Function</figcaption>
</figure>

``` csound-sco title="Example F.9a. Sinc window function statement (-3&pi; to +3&pi; and normalized)"
f89  0   8192   20   9   1  3
```

``` csound-orc
i0 ftgen 89, 0, 8192, 20, 9, 1, 3
```

<figure markdown="span">
![Sinc Window Function](../images/image9a.png)
<figcaption>Sinc Window Function</figcaption>
</figure>
