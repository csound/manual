# **Random (Noise) Generators**

Opcodes that generate random numbers are:

* [betarand](../../opcodes/betarand)
* [bexprnd](../../opcodes/bexprnd)
* [cauchy](../../opcodes/cauchy)
* [cauchyi](../../opcodes/cauchyi)
* [cuserrnd](../../opcodes/cuserrnd)
* [duserrnd](../../opcodes/duserrnd)
* [dust](../../opcodes/dust)
* [dust2](../../opcodes/dust2)
* [exprand](../../opcodes/exprand)
* [exprandi](../../opcodes/exprandi)
* [fractalnoise](../../opcodes/fractalnoise)
* [gauss](../../opcodes/gauss)
* [gausstrig](../../opcodes/gausstrig)
* [jitter](../../opcodes/jitter)
* [jitter2](../../opcodes/jitter2)
* [lfsr](../../opcodes/lfsr)
* [linrand](../../opcodes/linrand)
* [noise](../../opcodes/noise)
* [pcauchy](../../opcodes/pcauchy)
* [pinkish](../../opcodes/pinkish)
* [pinker](../../opcodes/pinker)
* [poisson](../../opcodes/poisson)
* [rand](../../opcodes/rand)
* [randc](../../opcodes/randc)
* [randh](../../opcodes/randh)
* [randi](../../opcodes/randi)
* [rnd31](../../opcodes/rnd31)
* [random](../../opcodes/random)
* [randomh](../../opcodes/randomh)
* [randomi](../../opcodes/randomi)
* [trandom](../../opcodes/trandom)
* [trirand](../../opcodes/trirand)
* [unirand](../../opcodes/unirand)
* [urd](../../opcodes/urd)
* [urandom](../../opcodes/urandom)
* [weibull](../../opcodes/weibull)

See [seed](../../opcodes/seed) which sets the global seed value for all x-class noise generators, as well as other opcodes that use a random call, such as [grain](../../opcodes/grain). And [getseed](../../opcodes/getseed) returns the global seed value used for all x-class noise generators.

[rand](../../opcodes/rand), [randh](../../opcodes/randh), [randi](../../opcodes/randi), [rnd(x)](../../opcodes/rnd) and [birnd(x)](../../opcodes/birnd) are not affected by seed. Use [rndseed](../../opcodes/rndseed) for that.	  

See also functions which generate random numbers in the section [Random Functions](../../math/rndfunc).
