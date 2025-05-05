<!--
id:poisson
category:Signal Generators:Random (Noise) Generators
-->
# poisson
Poisson distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = poisson(klambda)
    ires = poisson(klambda)
    kres = poisson(klambda)
    ```

=== "Classic"
    ``` csound-orc
    ares poisson klambda
    ires poisson klambda
    kres poisson klambda
    ```

### Performance

_ares, kres, ires_ - number of events occuring (always an integer).

_klambda_ - the expected number of occurrences that occur during the rate interval.

#### Adapted from Wikipedia:

In probability theory and statistics, the Poisson distribution is a discrete probability distribution. It expresses the probability of a number of events occurring in a fixed period of time if these events occur with a known average rate, and are independent of the time since the last event.

The Poisson distribution describing the probability that there are exactly _k_ occurrences (_k_ being a non-negative integer, k = 0, 1, 2, ...) is:

<figure markdown="span">
![[The Poisson distribution equation.]](../images/poisson_equation.png)
<figcaption></figcaption>
</figure>
where:

* &lambda; is a positive real number, equal to the expected number of occurrences that occur during the given interval. For instance, if the events occur on average every 4 minutes, and you are interested in the number of events occurring in a 10 minute interval, you would use as model a Poisson distribution with &lambda; = 10/4 = 2.5. This parameter is called _klambda_ on the _poisson_ opcodes.
* _k_ refers to the number of i- , k- or a- periods elapsed.

The Poisson distribution arises in connection with Poisson processes. It applies to various phenomena of discrete nature (that is, those that may happen 0, 1, 2, 3, ... times during a given period of time or in a given area) whenever the probability of the phenomenon happening is constant in time or space. Examples of events that can be modelled as Poisson distributions include:

* The number of cars that pass through a certain point on a road (sufficiently distant from traffic lights) during a given period of time.
* The number of spelling mistakes one makes while typing a single page.
* The number of phone calls at a call center per minute.
* The number of times a web server is accessed per minute.
* The number of roadkill (animals killed) found per unit length of road.
* The number of mutations in a given stretch of DNA after a certain amount of radiation.
* The number of unstable nuclei that decayed within a given period of time in a piece of radioactive substance. The radioactivity of the substance will weaken with time, so the total time interval used in the model should be significantly less than the mean lifetime of the substance.
* The number of pine trees per unit area of mixed forest.
* The number of stars in a given volume of space.
* The distribution of visual receptor cells in the retina of the human eye.
* The number of viruses that can infect a cell in cell culture.

<figure markdown="span">
![[A diagram showing the Poisson distribution.]](../images/Poisson_distribution_PMF.png)
<figcaption>A diagram showing the Poisson distribution.</figcaption>
</figure>

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the poisson opcode. It uses the file [poisson.csd](../examples/poisson.csd). It is written for *NIX systems, and will generate errors on Windows.

``` csound-orc title="Example of the poisson opcode." linenums="1"
--8<-- "examples/poisson.csd"
```

Here is another example of the poisson opcode. It uses the file [poisson2.csd](../examples/poisson2.csd).

``` csound-orc linenums="1"
--8<-- "examples/poisson2.csd"
```

A musical example featuring the poisson opcode: [Poisson_Cucchi.csd](../examples/musical/Poisson_Cucchi.csd) by Stefano Cucchi.

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>
