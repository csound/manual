# **Random (Noise) Generators**

Opcodes that generate random numbers are:

* [betarand](../opcodes/betarand.md)
* [bexprnd](../opcodes/bexprnd.md)
* [cauchy](../opcodes/cauchy.md)
* [cauchyi](../opcodes/cauchyi.md)
* [cuserrnd](../opcodes/cuserrnd.md)
* [duserrnd](../opcodes/duserrnd.md)
* [dust](../opcodes/dust.md)
* [dust2](../opcodes/dust2.md)
* [exprand](../opcodes/exprand.md)
* [exprandi](../opcodes/exprandi.md)
* [fractalnoise](../opcodes/fractalnoise.md)
* [gauss](../opcodes/gauss.md)
* [gausstrig](../opcodes/gausstrig.md)
* [jitter](../opcodes/jitter.md)
* [jitter2](../opcodes/jitter2.md)
* [lfsr](../opcodes/lfsr.md)
* [linrand](../opcodes/linrand.md)
* [noise](../opcodes/noise.md)
* [pcauchy](../opcodes/pcauchy.md)
* [pinkish](../opcodes/pinkish.md)
* [pinker](../opcodes/pinker.md)
* [poisson](../opcodes/poisson.md)
* [rand](../opcodes/rand.md)
* [randc](../opcodes/randc.md)
* [randh](../opcodes/randh.md)
* [randi](../opcodes/randi.md)
* [rnd31](../opcodes/rnd31.md)
* [random](../opcodes/random.md)
* [randomh](../opcodes/randomh.md)
* [randomi](../opcodes/randomi.md)
* [trandom](../opcodes/trandom.md)
* [trirand](../opcodes/trirand.md)
* [unirand](../opcodes/unirand.md)
* [urd](../opcodes/urd.md)
* [urandom](../opcodes/urandom.md)
* [weibull](../opcodes/weibull.md)

See [seed](../opcodes/seed.md) which sets the global seed value for all x-class noise generators, as well as other opcodes that use a random call, such as [grain](../opcodes/grain.md). And [getseed](../opcodes/getseed.md) returns the global seed value used for all x-class noise generators.

[rand](../opcodes/rand.md), [randh](../opcodes/randh.md), [randi](../opcodes/randi.md), [rnd(x)](../opcodes/rnd.md) and [birnd(x)](../opcodes/birnd.md) are not affected by seed. Use [rndseed](../opcodes/rndseed.md) for that.	  

See also functions which generate random numbers in the section [Random Functions](../math/rndfunc.md).
