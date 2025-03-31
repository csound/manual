<!-- Don't modify this file.
 It is generated automatically by makeAppendices.py-->
# **Opcode Quick Reference**

### Orchestra Syntax:Header
[**`0dbfs `**](../opcodes/0dbfs)`= iarg`<br>
`0dbfs`<br>


[**`A4 `**](../opcodes/A4)`= iarg`<br>


[**`kr `**](../opcodes/kr)`= iarg`<br>


[**`ksmps `**](../opcodes/ksmps)`= iarg`<br>


[**`nchnls `**](../opcodes/nchnls)`= iarg`<br>


[**`nchnls_i `**](../opcodes/nchnls_i)`= iarg`<br>


[**`sr `**](../opcodes/sr)`= iarg`<br>


### Orchestra Syntax:Block Statements
[**`endin`**](../opcodes/endin)<br>


[**`endop`**](../opcodes/endop)<br>


[**`instr `**](../opcodes/instr)`i, j, ...`<br>


[**`opcode `**](../opcodes/opcode)`name, outtypes, intypes`<br>


### Orchestra Syntax:Macros
[**`$NAME`**](../opcodes/dollar)<br>


[**`#define `**](../opcodes/define)`NAME # replacement text #`<br>
`#define NAME(a' b' c') # replacement text #`<br>


[**`#ifdef `**](../opcodes/ifdef)`NAME`<br>
`....`<br>
`#else`<br>
`....`<br>
`#end`<br>


[**`#ifndef `**](../opcodes/ifndef)`NAME`<br>
`....`<br>
`#else`<br>
`....`<br>
`#end`<br>


[**`#include `**](../opcodes/include)`"filename"`<br>
`#includestr "filename"`<br>


[**`#undef `**](../opcodes/undef)`NAME`<br>


### Signal Generators:Additive Synthesis/Resynthesis
`ares `[**`adsyn `**](../opcodes/adsyn)`kamod, kfmod, ksmod, ifilcod`<br>


`ares `[**`adsynt `**](../opcodes/adsynt)`kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs]`<br>


`ar `[**`adsynt2 `**](../opcodes/adsynt2)`kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs]`<br>


`ares `[**`hsboscil `**](../opcodes/hsboscil)`kamp, ktone, kbrite, ibasfreq, iwfn, ioctfn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioctcnt] [, iphs]`<br>


### Signal Generators:Basic Oscillators
`kres `[**`lfo `**](../opcodes/lfo)`kamp, kcps [, itype]`<br>
`ares lfo kamp, kcps [, itype]`<br>


`ares `[**`oscbnk `**](../opcodes/oscbnk)` kcps, kamd, kfmd, kpmd, iovrlap, iseed, kl1minf, kl1maxf, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`keqminq, keqmaxq, ieqmode, kfn [, il1fn] [, il2fn] [, ieqffn]   \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ieqlfn] [, ieqqfn] [, itabl] [, ioutfn]`<br>


`ares `[**`oscil `**](../opcodes/oscil)`xamp, xcps [, ifn, iphs]`<br>
`kres oscil kamp, kcps [, ifn, iphs]`<br>


`ares `[**`oscil3 `**](../opcodes/oscil3)`xamp, xcps [, ifn, iphs]`<br>
`kres oscil3 kamp, kcps [, ifn, iphs]`<br>


`ares `[**`oscili `**](../opcodes/oscili)`xamp, xcps[, ifn, iphs]`<br>
`kres oscili kamp, kcps[, ifn, iphs]`<br>


`ares `[**`oscilikt `**](../opcodes/oscilikt)`xamp, xcps, kfn [, iphs] [, istor]`<br>
`kres oscilikt kamp, kcps, kfn [, iphs] [, istor]`<br>


`ares `[**`osciliktp `**](../opcodes/osciliktp)`kcps, kfn, kphs [, istor]`<br>


`ares `[**`oscilikts `**](../opcodes/oscilikts)`xamp, xcps, kfn, async, kphs [, istor]`<br>


`ares `[**`osciln `**](../opcodes/osciln)`kamp, ifrq, ifn, itimes`<br>


`ares `[**`oscils `**](../opcodes/oscils)`iamp, icps, iphs [, iflg]`<br>




`ares `[**`poscil `**](../opcodes/poscil)`aamp, acps [, ifn, iphs]`<br>
`ares poscil aamp, kcps [, ifn, iphs]`<br>
`ares poscil kamp, acps [, ifn, iphs]`<br>
`ares poscil kamp, kcps [, ifn, iphs]`<br>
`ires poscil kamp, kcps [, ifn, iphs]`<br>
`kres poscil kamp, kcps [, ifn, iphs]`<br>


`ares `[**`poscil3 `**](../opcodes/poscil3)`aamp, acps [, ifn, iphs]`<br>
`ares poscil3 aamp, kcps [, ifn, iphs]`<br>
`ares poscil3 kamp, acps [, ifn, iphs]`<br>
`ares poscil3 kamp, kcps [, ifn, iphs]`<br>
`ires poscil3 kamp, kcps [, ifn, iphs]`<br>
`kres poscil3 kamp, kcps [, ifn, iphs]`<br>


`kout `[**`vibr `**](../opcodes/vibr)`kAverageAmp, kAverageFreq, ifn`<br>


`kout `[**`vibrato `**](../opcodes/vibrato)`kAverageAmp, kAverageFreq, kRandAmountAmp, kRandAmountFreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kAmpMinRate, kAmpMaxRate, kcpsMinRate, kcpsMaxRate, ifn [, iphs]`<br>


### Signal Generators:Dynamic Spectrum Oscillators
`ares `[**`buzz `**](../opcodes/buzz)`xamp, xcps, knh, ifn [, iphs]`<br>


`ares `[**`gbuzz `**](../opcodes/gbuzz)`xamp, xcps, knh, klh, kmul, ifn [, iphs]`<br>


`ares `[**`mpulse `**](../opcodes/mpulse)`kamp, kintvl [, ioffset]`<br>


`aout [, asyncout] `[**`squinewave `**](../opcodes/squinewave)`acps, aClip, aSkew, asyncin [, iMinSweep] [, iphase]`<br>
`aout [, asyncout] squinewave acps, aClip, aSkew [, ksyncin] [, iMinSweep] [, iphase]`<br>


`ares `[**`vco `**](../opcodes/vco)`xamp, xcps, iwave, kpw [, ifn] [, imaxd] [, ileak] [, inyx] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iphs] [, iskip]`<br>


`ares `[**`vco2 `**](../opcodes/vco2)`kamp, kcps [, imode] [, kpw] [, kphs] [, inyx]`<br>


`kfn `[**`vco2ft `**](../opcodes/vco2ft)`kcps, iwave [, inyx]`<br>


`ifn `[**`vco2ift `**](../opcodes/vco2ift)`icps, iwave [, inyx]`<br>


`ifn `[**`vco2init `**](../opcodes/vco2init)`iwave [, ibasfn] [, ipmul] [, iminsiz] [, imaxsiz] [, isrcft]`<br>


### Signal Generators:FM Synthesis
`a1, a2 `[**`crossfm `**](../opcodes/crossfm)`xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>
`a1, a2 crossfmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>
`a1, a2 crosspm xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>
`a1, a2 crosspmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>
`a1, a2 crossfmpm xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>
`a1, a2 crossfmpmi xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2]`<br>


`ares `[**`fmb3 `**](../opcodes/fmb3)`kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn]`<br>


`ares `[**`fmbell `**](../opcodes/fmbell)`kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn, isus]`<br>


`ares `[**`fmmetal `**](../opcodes/fmmetal)`kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn`<br>


`ares `[**`fmpercfl `**](../opcodes/fmpercfl)`kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn3, ifn4, ivfn]`<br>


`ares `[**`fmrhode `**](../opcodes/fmrhode)`kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn3, ifn4, ivfn`<br>


`ares `[**`fmvoice `**](../opcodes/fmvoice)`kamp, kfreq, kvowel, ktilt, kvibamt, kvibrate[, ifn1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn2, ifn3, ifn4, ivibfn]`<br>


`ares `[**`fmwurlie `**](../opcodes/fmwurlie)`kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn`<br>


`ares `[**`foscil `**](../opcodes/foscil)`xamp, kcps, xcar, xmod, kndx [, ifn , iphs]`<br>


`ares `[**`foscili `**](../opcodes/foscili)`xamp, kcps, xcar, xmod, kndx [, ifn, iphs]`<br>


### Signal Generators:Granular Synthesis
`asig `[**`diskgrain `**](../opcodes/diskgrain)`Sfname, kamp, kfreq, kpitch, kgrsize, kprate, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifun, iolaps [,imaxgrsize , ioffset]`<br>


`ares `[**`fof `**](../opcodes/fof)`xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifna, ifnb, itotdur [, iphs] [, ifmode] [, iskip]`<br>


`ares `[**`fof2 `**](../opcodes/fof2)`xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifna, ifnb, itotdur, kphs, kgliss [, iskip]`<br>


`ares `[**`fog `**](../opcodes/fog)`xamp, xdens, xtrans, aspd, koct, kband, kris, kdur, kdec, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iolaps, ifna, ifnb, itotdur [, iphs] [, itmode] [, iskip]`<br>


`ares `[**`grain `**](../opcodes/grain)`xamp, xpitch, xdens, kampoff, kpitchoff, kgdur, igfn, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iwfn, imgdur [, igrnd]`<br>


`ares `[**`grain2 `**](../opcodes/grain2)`kcps, kfmd, kgdur, iovrlp, kfn, iwfn [, irpow] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iseed] [, imode]`<br>


`ares `[**`grain3 `**](../opcodes/grain3)`kcps, kphs, kfmd, kpmd, kgdur, kdens, imaxovr, kfn, iwfn, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kfrpow, kprpow [, iseed] [, imode]`<br>


`ares `[**`granule `**](../opcodes/granule)`xamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iseed] [, ipitch1] [, ipitch2] [, ipitch3] [, ipitch4] [, ifnenv]`<br>


`a1 [, a2, a3, a4, a5, a6, a7, a8] `[**`partikkel `**](../opcodes/partikkel)`agrainfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifmamptab, kfmenv, icosine, ktraincps, knumpartials, kchroma, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kwaveform4, iwaveamptab, asamplepos1, asamplepos2, asamplepos3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asamplepos4, kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iopcode_id, ipanlaws]`<br>


`kindex `[**`partikkelget `**](../opcodes/partikkelget)`kparameterindex, iopcode_id`<br>


[**`partikkelset `**](../opcodes/partikkelset)`kparameterindex, kmaskindex, iopcode_id`<br>


`async [,aphase] `[**`partikkelsync `**](../opcodes/partikkelsync)`iopcode_id`<br>


`ares [, ac] `[**`sndwarp `**](../opcodes/sndwarp)`xamp, xtimewarp, xresample, ifn1, ibeg, iwsize, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`irandw, ioverlap, ifn2, itimemode`<br>


`ar1, ar2 [,ac1] [, ac2] `[**`sndwarpst `**](../opcodes/sndwarpst)`xamp, xtimewarp, xresample, ifn1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ibeg, iwsize, irandw, ioverlap, ifn2, itimemode`<br>


`asig `[**`syncgrain `**](../opcodes/syncgrain)`kamp, kfreq, kpitch, kgrsize, kprate, ifun1, ifun2, iolaps`<br>


`asig `[**`syncloop `**](../opcodes/syncloop)`kamp, kfreq, kpitch, kgrsize, kprate, klstart, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`klend, ifun1, ifun2, iolaps[,istart, iskip]`<br>


`ar `[**`vosim `**](../opcodes/vosim)`kamp, kFund, kForm, kDecay, kPulseCount, kPulseFactor, ifn [, iskip]`<br>


### Signal Generators:Hyper Vectorial Synthesis
[**`hvs1 `**](../opcodes/hvs1)`kx, inumParms, inumPointsX, iOutTab, iPositionsTab, iSnapTab [, iConfigTab]`<br>


[**`hvs2 `**](../opcodes/hvs2)`kx, ky, inumParms, inumPointsX, inumPointsY, iOutTab, iPositionsTab, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iSnapTab [, iConfigTab]`<br>


[**`hvs3 `**](../opcodes/hvs3)`kx, ky, kz, inumParms, inumPointsX, inumPointsY, inumPointsZ, iOutTab, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iPositionsTab, iSnapTab [, iConfigTab]`<br>


### Signal Generators:Linear and Exponential Generators
`ky `[**`bpf `**](../opcodes/bpf)`kx, kx1, ky1, kx2, ..., kxn, kyn`<br>
`iy bpf ix, ix1, iy1, ix2, ..., ixn, iyn`<br>
`kys[] bpf kxs[], kx1, ky1, kx2, ..., kxn, kyn`<br>
`iys[] bpf ixs[], ix1, iy1, ix2, ..., ixn, iyn`<br>
`ky bpf kx, kxs[], kys[]`<br>
`iy bpf ix, ixs[], iys[]`<br>
`ay bpf ax, kx1, ky1, kx2, ..., kxn, kyn`<br>
`ay bpf ax, kxs[], kys[]`<br>
`ky, kw bpf kx, kxs[], kys[], kws[]`<br>


`ky `[**`bpfcos `**](../opcodes/bpfcos)`kx, kx1, ky1, kx2, ..., kxn, kyn`<br>
`kys[] bpfcos kxs[], kx1, ky1, kx2, ..., kxn, kyn`<br>
`ky bpfcos kx, kxs[], kys[]`<br>
`ky bpfcos kx, ixs[], iys[]`<br>
`ky, kz bpfcos kx, kxs[], kys[], kzs[]`<br>
`ky, kz bpfcos kx, ixs[], iys[], izs[]`<br>


`ares `[**`cosseg `**](../opcodes/cosseg)`ia, idur1, ib [, idur2] [, ic] [...]`<br>
`kres cosseg ia, idur1, ib [, idur2] [, ic] [...]`<br>


`ares `[**`cossegb `**](../opcodes/cossegb)`ia, itim1, ib [, itim2] [, ic] [...]`<br>
`kres cossegb ia, itim1, ib [, itim2] [, ic] [...]`<br>


`ares `[**`cossegr `**](../opcodes/cossegr)`ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>
`kres cossegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>


`kout `[**`expcurve `**](../opcodes/expcurve)`kindex, ksteepness`<br>


`ares `[**`expon `**](../opcodes/expon)`ia, idur, ib`<br>
`kres expon ia, idur, ib`<br>


`ares `[**`expseg `**](../opcodes/expseg)`ia, idur1, ib [, idur2] [, ic] [...]`<br>
`kres expseg ia, idur1, ib [, idur2] [, ic] [...]`<br>


`ares `[**`expsega `**](../opcodes/expsega)`ia, idur1, ib [, idur2] [, ic] [...]`<br>


`ares `[**`expsegb `**](../opcodes/expsegb)`ia, itim1, ib [, itim2] [, ic] [...]`<br>
`kres expsegb ia, itim1, ib [, itim2] [, ic] [...]`<br>


`ares `[**`expsegba `**](../opcodes/expsegba)`ia, itim1, ib [, itim2] [, ic] [...]`<br>


`ares `[**`expsegr `**](../opcodes/expsegr)`ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>
`kres expsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>


`kout `[**`gainslider `**](../opcodes/gainslider)`kindex`<br>


`ky `[**`lincos `**](../opcodes/lincos)`kx, ky0, ky1 [, kx0, kx1 ]`<br>
`iy lincos ix, iy0, iy1 [, ix0, ix1 ]`<br>


`ares `[**`line `**](../opcodes/line)`ia, idur, ib`<br>
`kres line ia, idur, ib`<br>


`ky `[**`linlin `**](../opcodes/linlin)`kx, ky0, ky1 [, kx0, kx1 ]`<br>
`iy linlin ix, iy0, iy1 [, ix0, ix1 ]`<br>
`kys[] linlin kxs[], ky0, ky1 [, kx0, kx1 ]`<br>
`iys[] linlin ixs[], ky0, ky1, [ kx0, kx1 ]`<br>
`kC[] linlin kx, kA[], kB[] [, kx0, kx1 ]`<br>


`ares `[**`linseg `**](../opcodes/linseg)`ia, idur1, ib [, idur2] [, ic] [...]`<br>
`kres linseg ia, idur1, ib [, idur2] [, ic] [...]`<br>


`ares `[**`linsegb `**](../opcodes/linsegb)`ia, itim1, ib [, itim2] [, ic] [...]`<br>
`kres linsegb ia, itim1, ib [, itim2] [, ic] [...]`<br>


`ares `[**`linsegr `**](../opcodes/linsegr)`ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>
`kres linsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz`<br>


`kout `[**`logcurve `**](../opcodes/logcurve)`kindex, ksteepness`<br>


`ksig `[**`loopseg `**](../opcodes/loopseg)`kfreq, ktrig, iphase, kvalue0, ktime0 [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2][...]`<br>


`ksig `[**`loopsegp `**](../opcodes/loopsegp)` kphase, kvalue0, kdur0, kvalue1 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kdur1, ... , kdurN-1, kvalueN]`<br>


`ksig `[**`looptseg `**](../opcodes/looptseg)`kfreq, ktrig, iphase, kvalue0, ktype0, ktime0, [, kvalue1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,ktype1] [, ktime1] [, kvalue2] [,ktype2] [, ktime2] [...] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalueN] [,ktypeN] [, ktimeN]`<br>


`ksig `[**`loopxseg `**](../opcodes/loopxseg)`kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...]`<br>


`ksig `[**`lpshold `**](../opcodes/lpshold)`kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...]`<br>


`ksig `[**`lpsholdp `**](../opcodes/lpsholdp)` kphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...]`<br>


`kscl `[**`scale `**](../opcodes/scale)`kinput, kmax, kmin[, kimax, kimin]`<br>


`kscl `[**`scale2 `**](../opcodes/scale2)`kinput, kmin, kmax[, kimin, kimax][ihtime]`<br>


`ares `[**`transeg `**](../opcodes/transeg)`ia, idur, itype, ib [, idur2] [, itype] [, ic] ...`<br>
`kres transeg ia, idur, itype, ib [, idur2] [, itype] [, ic] ...`<br>


`ares `[**`transegb `**](../opcodes/transegb)`ia, itim, itype, ib [, itim2] [, itype] [, ic] ...`<br>
`kres transegb ia, itim, itype, ib [, itim2] [, itype] [, ic] ...`<br>


`ares `[**`transegr `**](../opcodes/transegr)`ia, idur, itype, ib [, idur2] [, itype] [, ic] ...`<br>
`kres transegr ia, idur, itype, ib [, idur2] [, itype] [, ic] ...`<br>


`ares `[**`trigexpseg `**](../opcodes/trigexpseg)`kTrig, ia, idur1, ib [, idur2] [, ic] [...]`<br>
`kres trigexpseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]`<br>


`ares `[**`triglinseg `**](../opcodes/triglinseg)`kTrig, ia, idur1, ib [, idur2] [, ic] [...]`<br>
`kres triglinseg kTrig, ia, idur1, ib [, idur2] [, ic] [...]`<br>


`kout `[**`xyscale `**](../opcodes/xyscale)`kx, ky, k00, k10, k01, k11`<br>


### Signal Generators:Envelope Generators
`ares `[**`adsr `**](../opcodes/adsr)`iatt, idec, islev, irel [, idel]`<br>
`kres adsr iatt, idec, islev, irel [, idel]`<br>


`ares `[**`envlpx `**](../opcodes/envlpx)`xamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod]`<br>
`kres envlpx kamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod]`<br>


`ares `[**`envlpxr `**](../opcodes/envlpxr)`xamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind]`<br>
`kres envlpxr kamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind]`<br>


`ares `[**`gtadsr `**](../opcodes/gtadsr)`asig, katt, kdec, ksus, krel, kgate`<br>
`xres gtadsr kamp, katt, kdec, ksus, krel, kgate`<br>


`ares `[**`linen `**](../opcodes/linen)`xamp, irise, idur, idec`<br>
`kres linen kamp, irise, idur, idec`<br>


`ares `[**`linenr `**](../opcodes/linenr)`xamp, irise, idec, iatdec`<br>
`kres linenr kamp, irise, idec, iatdec`<br>


`ares `[**`madsr `**](../opcodes/madsr)`iatt, idec, islev, irel [, idel] [, ireltim]`<br>
`kres madsr iatt, idec, islev, irel [, idel] [, ireltim]`<br>


`ares `[**`mxadsr `**](../opcodes/mxadsr)`iatt, idec, islev, irel [, idel] [, ireltim]`<br>
`kres mxadsr iatt, idec, islev, irel [, idel] [, ireltim]`<br>


`ares `[**`xadsr `**](../opcodes/xadsr)`iatt, idec, islev, irel [, idel]`<br>
`kres xadsr iatt, idec, islev, irel [, idel]`<br>


### Signal Generators:Models and Emulations
`ares `[**`bamboo `**](../opcodes/bamboo)`kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2]`<br>


`ares `[**`barmodel `**](../opcodes/barmodel)`kbcL, kbcR, iK, ib, kscan, iT30, ipos, ivel, iwid`<br>


`ares `[**`cabasa `**](../opcodes/cabasa)`iamp, idettack [, inum] [, idamp] [, imaxshake]`<br>


`aI3, aV2, aV1 `[**`chuap `**](../opcodes/chuap)`kL, kR0, kC2, kG, kGa, kGb, kE, kC1, iI3, iV2, iV1, ktime_step`<br>


`ares `[**`crunch `**](../opcodes/crunch)`iamp, idettack [, inum] [, idamp] [, imaxshake]`<br>


`ares `[**`dripwater `**](../opcodes/dripwater)`kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2]`<br>


`kfl `[**`fareylen `**](../opcodes/fareylen)`kfn`<br>


`ifl `[**`fareyleni `**](../opcodes/fareyleni)`ifn`<br>


`ares `[**`gendy `**](../opcodes/gendy)`kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum]`<br>
`kres gendy kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum]`<br>


`ares `[**`gendyc `**](../opcodes/gendyc)`kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum]`<br>
`kres gendyc kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum]`<br>


`ares `[**`gendyx `**](../opcodes/gendyx)`kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl, kcurveup, kcurvedown [, initcps] [, knum]`<br>
`kres gendyx kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl, kcurveup, kcurvedown [, initcps] [, knum]`<br>


`ares `[**`gogobel `**](../opcodes/gogobel)`kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivfn`<br>


`ares `[**`guiro `**](../opcodes/guiro)`kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] [, ifreq1]`<br>


`ax, ay, az `[**`lorenz `**](../opcodes/lorenz)`ksv, krv, kbv, kh, ix, iy, iz, iskip [, iskipinit]`<br>


`kiter, koutrig `[**`mandel `**](../opcodes/mandel)` ktrig, kx, ky, kmaxIter`<br>


`ares `[**`mandol `**](../opcodes/mandol)`kamp, kfreq, kpluck, kdetune, kgain, ksize \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn] [, iminfreq]`<br>


`ares `[**`marimba `**](../opcodes/marimba)`kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idoubles] [, itriples]`<br>


`ares `[**`moog `**](../opcodes/moog)`kamp, kfreq, kfiltq, kfiltrate, kvibf, kvamp, iafn, iwfn, ivfn`<br>


`ax, ay, az `[**`planet `**](../opcodes/planet)`kmass1, kmass2, ksep, ix, iy, iz, ivx, ivy, ivz, idelta \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifriction] [, iskip]`<br>


`ares `[**`prepiano `**](../opcodes/prepiano)`ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers]`<br>
`al, ar prepiano  ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers]`<br>


`ares `[**`sandpaper `**](../opcodes/sandpaper)`iamp, idettack [, inum] [, idamp] [, imaxshake]`<br>


`ares `[**`sekere `**](../opcodes/sekere)`iamp, idettack [, inum] [, idamp] [, imaxshake]`<br>


`ares `[**`shaker `**](../opcodes/shaker)`kamp, kfreq, kbeans, kdamp, ktimes [, idecay]`<br>


`ares `[**`sleighbells `**](../opcodes/sleighbells)`kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2]`<br>


`ares `[**`stix `**](../opcodes/stix)`iamp, idettack [, inum] [, idamp] [, imaxshake]`<br>


`ares `[**`tambourine `**](../opcodes/tambourine)`kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2]`<br>


`ares `[**`vibes `**](../opcodes/vibes)`kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec`<br>


`ares `[**`voice `**](../opcodes/voice)`kamp, kfreq, kphoneme, kform, kvibf, kvamp, ifn, ivfn`<br>


### Signal Generators:Phasors
`aexp,aph `[**`ephasor `**](../opcodes/ephasor)`kfreq, kR`<br>


`ares `[**`phasor `**](../opcodes/phasor)`xcps [, iphs]`<br>
`kres phasor kcps [, iphs]`<br>


`ares `[**`phasorbnk `**](../opcodes/phasorbnk)`xcps, kndx, icnt [, iphs]`<br>
`kres phasorbnk kcps, kndx, icnt [, iphs]`<br>


`aphase, asyncout `[**`syncphasor `**](../opcodes/syncphasor)`xcps, asyncin, [, iphs]`<br>


`aindex `[**`trigphasor `**](../opcodes/trigphasor)`xtrig, xrate, kstart, kend [, kresetPos]`<br>
`kindex trigphasor xtrig, xrate, kstart, kend [, kresetPos]`<br>


### Signal Generators:Random (Noise) Generators
`ares `[**`betarand `**](../opcodes/betarand)`krange, kalpha, kbeta`<br>
`ires betarand krange, kalpha, kbeta`<br>
`kres betarand krange, kalpha, kbeta`<br>


`ares `[**`bexprnd `**](../opcodes/bexprnd)`krange`<br>
`ires bexprnd krange`<br>
`kres bexprnd krange`<br>


`ares `[**`cauchy `**](../opcodes/cauchy)`kalpha`<br>
`ires cauchy kalpha`<br>
`kres cauchy kalpha`<br>


`ares `[**`cauchyi `**](../opcodes/cauchyi)`klambda, xamp, xcps`<br>
`ires cauchyi klambda, xamp, xcps`<br>
`kres cauchyi klambda, xamp, xcps`<br>


`aout `[**`cuserrnd `**](../opcodes/cuserrnd)`kmin, kmax, ktableNum`<br>
`iout cuserrnd imin, imax, itableNum`<br>
`kout cuserrnd kmin, kmax, ktableNum`<br>


`aout `[**`duserrnd `**](../opcodes/duserrnd)`ktableNum`<br>
`iout duserrnd itableNum`<br>
`kout duserrnd ktableNum`<br>


`ares `[**`dust `**](../opcodes/dust)`kamp, kdensity`<br>
`kres dust kamp, kdensity`<br>


`ares `[**`dust2 `**](../opcodes/dust2)`kamp, kdensity`<br>
`kres dust2 kamp, kdensity`<br>


`ares `[**`exprand `**](../opcodes/exprand)`klambda`<br>
`ires exprand klambda`<br>
`kres exprand klambda`<br>


`ares `[**`exprandi `**](../opcodes/exprandi)`klambda, xamp, xcps`<br>
`ires exprandi klambda, xamp, xcps`<br>
`kres exprandi klambda, xamp, xcps`<br>


`ares `[**`fractalnoise `**](../opcodes/fractalnoise)`kamp, kbeta`<br>


`ares `[**`gauss `**](../opcodes/gauss)`krange`<br>
`ires gauss irange`<br>
`kres gauss krange`<br>
`ares gauss kmean, ksdev`<br>
`ires gauss imean, isdev`<br>
`kres gauss kmean, ksdev`<br>


`ares `[**`gaussi `**](../opcodes/gaussi)`krange, xamp, xcps`<br>
`ires gaussi krange, xamp, xcps`<br>
`kres gaussi krange, xamp, xcps`<br>


`ares `[**`gausstrig `**](../opcodes/gausstrig)`kamp, kcps, kdev [, imode] [, ifrst1]`<br>
`kres gausstrig kamp, kcps, kdev [, imode] [, ifrst1]`<br>


`ians `[**`getseed`**](../opcodes/getseed)<br>
`kans getseed`<br>


`kout `[**`jitter `**](../opcodes/jitter)`kamp, kcpsMin, kcpsMax`<br>


`kout `[**`jitter2 `**](../opcodes/jitter2)`ktotamp, kamp1, kcps1, kamp2, kcps2, kamp3, kcps3[ , iopt]`<br>


`ares `[**`jspline `**](../opcodes/jspline)`xamp, kcpsMin, kcpsMax`<br>
`kres jspline kamp, kcpsMin, kcpsMax`<br>


`knum `[**`lfsr `**](../opcodes/lfsr)`ilen, iprob [, iseed]`<br>


`ares `[**`linrand `**](../opcodes/linrand)`krange`<br>
`ires linrand krange`<br>
`kres linrand krange`<br>


`ares `[**`noise `**](../opcodes/noise)`xamp, kbeta`<br>


`ares `[**`pcauchy `**](../opcodes/pcauchy)`kalpha`<br>
`ires pcauchy kalpha`<br>
`kres pcauchy kalpha`<br>


`ares `[**`pinker`**](../opcodes/pinker)<br>


`ares `[**`pinkish `**](../opcodes/pinkish)`xin [, imethod] [, inumbands] [, iseed] [, iskip]`<br>


`ares `[**`poisson `**](../opcodes/poisson)`klambda`<br>
`ires poisson klambda`<br>
`kres poisson klambda`<br>


`ares `[**`rand `**](../opcodes/rand)`xamp [, iseed] [, isel] [, ioffset]`<br>
`kres rand xamp [, iseed] [, isel] [, ioffset]`<br>


`ares `[**`randc `**](../opcodes/randc)`xamp, xcps [, iseed] [, isize] [, ioffset]`<br>
`kres randc kamp, kcps [, iseed] [, isize] [, ioffset]`<br>


`ares `[**`randh `**](../opcodes/randh)`xamp, xcps [, iseed] [, isize] [, ioffset]`<br>
`kres randh kamp, kcps [, iseed] [, isize] [, ioffset]`<br>


`ares `[**`randi `**](../opcodes/randi)`xamp, xcps [, iseed] [, isize] [, ioffset]`<br>
`kres randi kamp, kcps [, iseed] [, isize] [, ioffset]`<br>


`ares `[**`random `**](../opcodes/random)`kmin, kmax`<br>
`ires random imin, imax`<br>
`kres random kmin, kmax`<br>


`ares `[**`randomh `**](../opcodes/randomh)`kmin, kmax, xcps [,imode] [,ifirstval]`<br>
`kres randomh kmin, kmax, kcps [,imode] [,ifirstval]`<br>


`ares `[**`randomi `**](../opcodes/randomi)`kmin, kmax, xcps [,imode] [,ifirstval]`<br>
`kres randomi kmin, kmax, kcps [,imode] [,ifirstval]`<br>


`ax `[**`rnd31 `**](../opcodes/rnd31)`kscl, krpow [, iseed]`<br>
`ix rnd31 iscl, irpow [, iseed]`<br>
`kx rnd31 kscl, krpow [, iseed]`<br>


[**`rndseed `**](../opcodes/rndseed)`ival`<br>


`ares `[**`rspline `**](../opcodes/rspline)`xrangeMin, xrangeMax, kcpsMin, kcpsMax`<br>
`kres rspline krangeMin, krangeMax, kcpsMin, kcpsMax`<br>


[**`seed `**](../opcodes/seed)`ival`<br>


`kout `[**`trandom `**](../opcodes/trandom)`ktrig, kmin, kmax`<br>


`ares `[**`trirand `**](../opcodes/trirand)`krange`<br>
`ires trirand krange`<br>
`kres trirand krange`<br>


`ares `[**`unirand `**](../opcodes/unirand)`krange`<br>
`ires unirand krange`<br>
`kres unirand krange`<br>


`ax `[**`urandom `**](../opcodes/urandom)`[imin, imax]`<br>
`ix urandom [imin, imax]`<br>
`kx urandom [imin, imax]`<br>


`aout = `[**`urd(`**](../opcodes/urd)`ktableNum)`<br>
`iout = urd(itableNum)`<br>
`kout = urd(ktableNum)`<br>


`ares `[**`weibull `**](../opcodes/weibull)`ksigma, ktau`<br>
`ires weibull ksigma, ktau`<br>
`kres weibull ksigma, ktau`<br>


### Signal Generators:Sample Playback
`a1 `[**`bbcutm `**](../opcodes/bbcutm)`asource, ibps, isubdiv, ibarlength, iphrasebars, inumrepeats \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istutterspeed] [, istutterchance] [, ienvchoice ]`<br>


`a1,a2 `[**`bbcuts `**](../opcodes/bbcuts)`asource1, asource2, ibps, isubdiv, ibarlength, iphrasebars, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`inumrepeats [, istutterspeed] [, istutterchance] [, ienvchoice]`<br>


`asig1[, asig2] `[**`flooper `**](../opcodes/flooper)`kamp, kpitch, istart, idur, ifad, ifn`<br>


`asig1[,asig2] `[**`flooper2 `**](../opcodes/flooper2)`kamp, kpitch, kloopstart, kloopend, kcrossfade, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istart, imode, ifenv, iskip]`<br>


`aleft, aright `[**`fluidAllOut`**](../opcodes/fluidAllOut)<br>


[**`fluidCCi `**](../opcodes/fluidCCi)`iEngineNumber, iChannelNumber, iControllerNumber, iValue`<br>


[**`fluidCCk `**](../opcodes/fluidCCk)`iEngineNumber, iChannelNumber, iControllerNumber, kValue`<br>


[**`fluidControl `**](../opcodes/fluidControl)`ienginenum, kstatus, kchannel, kdata1, kdata2 [,imsgs]`<br>


`ienginenum `[**`fluidEngine `**](../opcodes/fluidEngine)`[iChorusEnabled] [, iRevervEnabled] [, iNumChannels] [, iPolyphony]`<br>


`SPrograms[] `[**`fluidInfo `**](../opcodes/fluidInfo)`ienginenum`<br>


`isfnum `[**`fluidLoad `**](../opcodes/fluidLoad)`soundfont, ienginenum[, ilistpresets]`<br>


[**`fluidNote `**](../opcodes/fluidNote)`ienginenum, ichannelnum, imidikey, imidivel`<br>


`aleft, aright `[**`fluidOut `**](../opcodes/fluidOut)`ienginenum`<br>


[**`fluidProgramSelect `**](../opcodes/fluidProgramSelect)`ienginenum, ichannelnum, isfnum, ibanknum, ipresetnum`<br>


[**`fluidSetInterpMethod `**](../opcodes/fluidSetInterpMethod)`ienginenum, ichannelnum, iInterpMethod`<br>


`ar1 [,ar2] `[**`loscil `**](../opcodes/loscil)`xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, imod2] [, ibeg2] [, iend2]`<br>
`aph, ar1 [,ar2] loscilphs xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iend1] [, imod2] [, ibeg2] [, iend2]`<br>


`ar1 [,ar2] `[**`loscil3 `**](../opcodes/loscil3)`xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, imod2] [, ibeg2] [, iend2]`<br>
`aph, ar1 [,ar2] loscil3phs xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iend1] [, imod2] [, ibeg2] [, iend2]`<br>


`ar1 [, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \`<br>
`ar15, ar16] `[**`loscilx`**](../opcodes/loscilx)` xamp, kcps, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwsize, ibas, istrt, imod, ibeg, iend]`<br>
`ar[] loscilx xamp, kcps, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwsize, ibas, istrt, imod, ibeg, iend]`<br>


`ares `[**`lphasor `**](../opcodes/lphasor)`xtrns [, ilps] [, ilpe] [, imode] [, istrt] [, istor]`<br>


`ares `[**`lposcil `**](../opcodes/lposcil)`kamp, kfreqratio, kloop, kend, ifn [, iphs]`<br>


`ares `[**`lposcil3 `**](../opcodes/lposcil3)`kamp, kfreqratio, kloop, kend, ifn [, iphs]`<br>


`ar `[**`lposcila `**](../opcodes/lposcila)`aamp, kfreqratio, kloop, kend, ift [,iphs]`<br>


`ar1, ar2 `[**`lposcilsa `**](../opcodes/lposcilsa)`aamp, kfreqratio, kloop, kend, ift [,iphs]`<br>


`ar1, ar2 `[**`lposcilsa2 `**](../opcodes/lposcilsa2)`aamp, kfreqratio, kloop, kend, ift [,iphs]`<br>


[**`sfilist `**](../opcodes/sfilist)`ifilhandle [, Sprintprefix]`<br>


`ar1, ar2 `[**`sfinstr `**](../opcodes/sfinstr)`ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset]`<br>


`ar1, ar2 `[**`sfinstr3 `**](../opcodes/sfinstr3)`ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset]`<br>


`ares `[**`sfinstr3m `**](../opcodes/sfinstr3m)`ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset]`<br>


`ares `[**`sfinstrm `**](../opcodes/sfinstrm)`ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset]`<br>


`ir `[**`sfload `**](../opcodes/sfload)`"filename"`<br>


`ar1, ar2 `[**`sflooper `**](../opcodes/sflooper)`ivel, inotenum, kamp, kpitch, ipreindex, kloopstart, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kloopend, kcrossfade [, istart, imode, ifenv, iskip, iflag]`<br>


[**`sfpassign `**](../opcodes/sfpassign)`istartindex, ifilhandle[, imsgs]`<br>


`ar1, ar2 `[**`sfplay `**](../opcodes/sfplay)`ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv]`<br>


`ar1, ar2 `[**`sfplay3 `**](../opcodes/sfplay3)`ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv]`<br>


`ares `[**`sfplay3m `**](../opcodes/sfplay3m)`ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv]`<br>


`ares `[**`sfplaym `**](../opcodes/sfplaym)`ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv]`<br>


[**`sfplist `**](../opcodes/sfplist)`ifilhandle`<br>


`ir `[**`sfpreset `**](../opcodes/sfpreset)`iprog, ibank, ifilhandle, ipreindex`<br>


`asig, krec `[**`sndloop `**](../opcodes/sndloop)`ain, kpitch, ktrig, idur, ifad`<br>


`ares `[**`waveset `**](../opcodes/waveset)`ain, krep [, ilen]`<br>


### Signal Generators:Scanned Synthesis
[**`scanhammer `**](../opcodes/scanhammer)`isrc, idst, ipos, imult`<br>


`kpos, kvel `[**`scanmap `**](../opcodes/scanmap)`iscan, kamp, kvamp [, iwhich]`<br>


`ares `[**`scans `**](../opcodes/scans)`kamp, kfreq, ifn, id [, iorder]`<br>


[**`scansmap `**](../opcodes/scansmap)`kpos, kvel, iscan, kamp, kvamp [, iwhich]`<br>


`aout `[**`scantable `**](../opcodes/scantable)`kamp, kpch, ipos, imass, istiff, idamp, ivel`<br>


[**`scanu `**](../opcodes/scanu)`init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ain, idisp, id`<br>


[**`scanu2 `**](../opcodes/scanu2)`init, irate, ifndisplace,ifnmass, ifnmatrix, ifncentr, ifndamp, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ain, idisp, id`<br>


### Signal Generators:Table Access
`kres `[**`oscil1 `**](../opcodes/oscil1)`idel, kamp, idur [, ifn]`<br>


`kres `[**`oscil1i `**](../opcodes/oscil1i)`idel, kamp, idur [, ifn]`<br>


`kr `[**`tab `**](../opcodes/tab)`kndx, ifn[, ixmode]`<br>
`ar tab xndx, ifn[, ixmode]`<br>


`ir `[**`tab_i `**](../opcodes/tab_i)`indx, ifn[, ixmode]`<br>


`ares `[**`table `**](../opcodes/table)`andx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`ires table indx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`kres table kndx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>


`ares `[**`table3 `**](../opcodes/table3)`andx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`ires table3 indx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`kres table3 kndx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>


`ares `[**`tablei `**](../opcodes/tablei)`andx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`ires tablei indx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>
`kres tablei kndx, ifn [, ixmode] [, ixoff] [, iwrap]`<br>


[**`tabw `**](../opcodes/tabw)`ksig, kndx, ifn [,ixmode]`<br>
`tabw asig, andx, ifn [,ixmode]`<br>


[**`tabw_i `**](../opcodes/tabw_i)`isig, indx, ifn [,ixmode]`<br>


### Signal Generators:Wave Terrain Synthesis
`aout `[**`sterrain `**](../opcodes/sterrain)`kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, km1, km2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kn1, kn2, kn3, ka, kb, kperiod`<br>


`aout `[**`wterrain `**](../opcodes/wterrain)`kamp, kpch, k_xcenter, k_ycenter, k_xradius, k_yradius, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`itabx, itaby`<br>


`aout `[**`wterrain2 `**](../opcodes/wterrain2)`kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kcurve, kcurveparam`<br>


### Signal Generators:Waveguide Physical Modeling
`ares `[**`pluck `**](../opcodes/pluck)`kamp, kcps, icps, ifn, imeth [, iparm1] [, iparm2]`<br>


`ares `[**`repluck `**](../opcodes/repluck)`iplk, kamp, icps, kpick, krefl, axcite`<br>


`ares `[**`streson `**](../opcodes/streson)`asig, kfr, kfdbgain`<br>


`ares `[**`wgbow `**](../opcodes/wgbow)`kamp, kfreq, kpres, krat, kvibf, kvamp [, ifn] [, iminfreq]`<br>


`ares `[**`wgbowedbar `**](../opcodes/wgbowedbar)`kamp, kfreq, kpos, kbowpres, kgain [, iconst] [, itvel] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ibowpos] [, ilow]`<br>


`ares `[**`wgbrass `**](../opcodes/wgbrass)`kamp, kfreq, ktens, iatt, kvibf, kvamp [, ifn] [, iminfreq]`<br>


`ares `[**`wgclar `**](../opcodes/wgclar)`kamp, kfreq, kstiff, iatt, idetk, kngain, kvibf, kvamp \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn] [, iminfreq]`<br>


`ares `[**`wgflute `**](../opcodes/wgflute)`kamp, kfreq, kjet, iatt, idetk, kngain, kvibf, kvamp [, ifn] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iminfreq] [, ijetrf] [, iendrf]`<br>


`ares `[**`wgpluck `**](../opcodes/wgpluck)`icps, iamp, kpick, iplk, idamp, ifilt, axcite`<br>


`ares `[**`wgpluck2 `**](../opcodes/wgpluck2)`iplk, kamp, icps, kpick, krefl`<br>


### Signal I/O:File I/O
[**`dumpk `**](../opcodes/dumpk)` ksig, ifilname, iformat, iprd`<br>


[**`dumpk2 `**](../opcodes/dumpk2)`ksig1, ksig2, ifilname, iformat, iprd`<br>


[**`dumpk3 `**](../opcodes/dumpk3)`ksig1, ksig2, ksig3, ifilname, iformat, iprd`<br>


[**`dumpk4 `**](../opcodes/dumpk4)`ksig1, ksig2, ksig3, ksig4, ifilname, iformat, iprd`<br>


[**`ficlose `**](../opcodes/ficlose)`ihandle`<br>
`ficlose Sfilename`<br>


[**`fin `**](../opcodes/fin)`ifilename, iskipframes, iformat, ain1 [, ain2] [, ain3] [,...]`<br>
`fin ifilename, iskipframes, iformat, arr[]`<br>


[**`fini `**](../opcodes/fini)`ifilename, iskipframes, iformat, in1 [, in2] [, in3] [, ...]`<br>


[**`fink `**](../opcodes/fink)`ifilename, iskipframes, iformat, kin1 [, kin2] [, kin3] [,...]`<br>


`ihandle `[**`fiopen `**](../opcodes/fiopen)`ifilename, imode`<br>


[**`fout `**](../opcodes/fout)`ifilename, iformat, aout1 [, aout2, aout3,...,aoutN]`<br>
`fout ifilename, iformat, array[]`<br>


[**`fouti `**](../opcodes/fouti)`ihandle, iformat, iflag, iout1 [, iout2, iout3,....,ioutN]`<br>


[**`foutir `**](../opcodes/foutir)`ihandle, iformat, iflag, iout1 [, iout2, iout3,....,ioutN]`<br>


[**`foutk `**](../opcodes/foutk)`ifilename, iformat, kout1 [, kout2, kout3,....,koutN]`<br>


[**`fprintks `**](../opcodes/fprintks)`"filename", "string", [, kval1] [, kval2] [...]`<br>


[**`fprints `**](../opcodes/fprints)`&quot;filename&quot;, &quot;string&quot; [, ival1] [, ival2] [...]`<br>


`xout1[, xout2, xout3, ..., xoutN] `[**`hdf5read `**](../opcodes/hdf5read)`ifilename, ivariablename1[, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ivariablename2, ivariablename3, ..., ivariablenameN]`<br>


[**`hdf5write `**](../opcodes/hdf5write)`ifilename, xout1[, xout2, xout3, ..., xoutN]`<br>


`Sres, kline `[**`readf `**](../opcodes/readf)`ifilname`<br>


`Sres, iline `[**`readfi `**](../opcodes/readfi)`ifilname`<br>


`kres `[**`readk `**](../opcodes/readk)`ifilname, iformat, iprd`<br>


`kr1, kr2 `[**`readk2 `**](../opcodes/readk2)`ifilname, iformat, iprd`<br>


`kr1, kr2, kr3 `[**`readk3 `**](../opcodes/readk3)`ifilname, iformat, iprd`<br>


`kr1, kr2, kr3, kr4 `[**`readk4 `**](../opcodes/readk4)`ifilname, iformat, iprd`<br>


`xout1[, xout2, xout3, ..., xoutN] `[**`websocket `**](../opcodes/websocket)`iport, xin`<br>


### Signal I/O:Signal Input
`ar1 [, ar2 [, ar3 [, ... arN]]] `[**`diskin `**](../opcodes/diskin)`ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwraparound[, iformat[, iskipinit]]]]]`<br>


`a1[, a2[, ... aN]] `[**`diskin2 `**](../opcodes/diskin2)`ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]]`<br>
`ar1[] diskin2 ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]]`<br>


`ar1 `[**`in`**](../opcodes/in)<br>
`aarray in`<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \`<br>
`ar15, ar16, ar17, ar18, ar19, ar20, ar21, ar22, ar23, ar24, ar25, ar26, \`<br>
`ar27, ar28, ar29, ar30, ar31, ar32 `[**`in3`**](../opcodes/in32)`2`<br>


`ain1[, ...] `[**`inch `**](../opcodes/inch)`kchan1[,...]`<br>


`ar1, ar2, ar3, ar4, ar5, ar6 `[**`inh`**](../opcodes/inh)<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8 `[**`ino`**](../opcodes/ino)<br>


`ar1, ar2,  ar3, a4 `[**`inq`**](../opcodes/inq)<br>


[**`inrg `**](../opcodes/inrg)`kstart, ain1 [,ain2, ain3, ..., ainN]`<br>


`ar1, ar2 `[**`ins`**](../opcodes/ins)<br>


`ivalue `[**`invalue `**](../opcodes/invalue)`"channel name"`<br>
`kvalue invalue "channel name"`<br>
`Sname invalue "channel name"`<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, \`<br>
`ar13, ar14, ar15, ar16 `[**`inx`**](../opcodes/inx)<br>


[**`inz `**](../opcodes/inz)`ksig1`<br>


`ar1, ar2 `[**`mp3in `**](../opcodes/mp3in)`ifilcod[, iskptim, iformat, iskipinit, ibufsize]`<br>
`ar1 mp3in ifilcod[, iskptim, iformat, iskipinit, ibufsize]`<br>


`ar1[, ar2[, ar3[, ... a24]]] `[**`soundin `**](../opcodes/soundin)`ifilcod [, iskptim] [, iformat] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iskipinit] [, ibufsize]`<br>


### Signal I/O:Signal Output
[**`mdelay `**](../opcodes/mdelay)`kstatus, kchan, kd1, kd2, kdelay`<br>


`aout1 [,aout2 ... aoutX] `[**`monitor`**](../opcodes/monitor)<br>
`aarra monitor`<br>


[**`out `**](../opcodes/out)`asig1[, asig2,....]`<br>
`out aarray`<br>


[**`out32 `**](../opcodes/out32)`asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8, asig10, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig11, asig12, asig13, asig14, asig15, asig16, asig17, asig18, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig19, asig20, asig21, asig22, asig23, asig24, asig25, asig26, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig27, asig28, asig29, asig30, asig31, asig32`<br>


[**`outall `**](../opcodes/outall)`asig`<br>


[**`outc `**](../opcodes/outc)`asig1 [, asig2] [...]`<br>


[**`outch `**](../opcodes/outch)`kchan1, asig1 [, kchan2] [, asig2] [...]`<br>


[**`outh `**](../opcodes/outh)`asig1, asig2, asig3, asig4, asig5, asig6`<br>


[**`outo `**](../opcodes/outo)`asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8`<br>


[**`outq `**](../opcodes/outq)`asig1, asig2, asig3, asig4`<br>


[**`outq1 `**](../opcodes/outq1)`asig`<br>


[**`outq2 `**](../opcodes/outq2)`asig`<br>


[**`outq3 `**](../opcodes/outq3)`asig`<br>


[**`outq4 `**](../opcodes/outq4)`asig`<br>


[**`outrg `**](../opcodes/outrg)`kstart, aout1 [,aout2, aout3, ..., aoutN]`<br>


[**`outs `**](../opcodes/outs)`asig1, asig2`<br>


[**`outs1 `**](../opcodes/outs1)`asig`<br>


[**`outs2 `**](../opcodes/outs2)`asig`<br>


[**`outvalue `**](../opcodes/outvalue)`"channel name", ivalue`<br>
`outvalue "channel name", kvalue`<br>
`outvalue "channel name", "string"`<br>


[**`outx `**](../opcodes/outx)`asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig9, asig10, asig11, asig12, asig13, asig14, asig15, asig16`<br>


[**`outz `**](../opcodes/outz)`ksig1`<br>


[**`soundout `**](../opcodes/soundout)` asig1, ifilcod [, iformat]`<br>


[**`soundouts `**](../opcodes/soundouts)` asigl, asigr, ifilcod [, iformat]`<br>


### Signal I/O:Software Bus
`kval `[**`chani `**](../opcodes/chani)`kchan`<br>
`aval chani kchan`<br>


[**`chano `**](../opcodes/chano)`kval, kchan`<br>
`chano aval, kchan`<br>


`chn_k Sname, imode[, itype, idflt, imin, ima, ix, iy, iwidth, iheight, Sattributes]`<br>
[**`chn`**](../opcodes/chn)`_a Sname, imode`<br>
`chn_S Sname, imode`<br>
`chn_S Sname, Smode`<br>
`chn_array Sname, imode, Stype, iSizes[]`<br>


[**`chnclear `**](../opcodes/chnclear)`Sname1[, Sname2,...]`<br>


`gival `[**`chnexport `**](../opcodes/chnexport)`Sname, imode[, itype, idflt, imin, imax]`<br>
`gkval chnexport Sname, imode[, itype, idflt, imin, imax]`<br>
`gaval chnexport Sname, imode`<br>
`gSval chnexport Sname, imode`<br>


`ival `[**`chnget `**](../opcodes/chnget)`Sname`<br>
`kval chnget Sname`<br>
`aval chnget Sname`<br>
`Sval chnget Sname`<br>
`Sval chngetks Sname`<br>
`ival[] chngeti Sname[]`<br>
`kval[] chngetk Sname[]`<br>
`aval[] chngeta Sname[]`<br>
`Sval[] chngets Sname[]`<br>


[**`chnmix `**](../opcodes/chnmix)`aval, Sname`<br>


`itype, imode, ictltype, idflt, imin, imax `[**`chnparams `**](../opcodes/chnparams)`Sname`<br>


[**`chnset `**](../opcodes/chnset)`ival, Sname`<br>
`chnset kval, Sname`<br>
`chnset aval, Sname`<br>
`chnset Sval, Sname`<br>
`chnsetks Sval, Sname`<br>
`chnseti ival[], []Sname`<br>
`chnsetk kval[], []Sname`<br>
`chnseta aval[], []Sname`<br>
`chnsets Sval[], []Sname`<br>


[**`oversample `**](../opcodes/oversample)`ifactor [,icvt_in, icvt_out]`<br>


[**`setksmps `**](../opcodes/setksmps)`iksmps`<br>


[**`undersample `**](../opcodes/undersample)`ifactor [,icvt_in, icvt_out]`<br>


[**`xin`**](../opcodes/xin)`arg1 [, [**`xin`**](../opcodes/xin)arg2] ... [[**`xin`**](../opcodes/xin)argN] [**`xin`**](../opcodes/xin)`<br>


[**`xout `**](../opcodes/xout)`xoutarg1 [, xoutarg2] ... [, xoutargN]`<br>


### Signal I/O:Printing and Display
[**`dispfft `**](../opcodes/dispfft)`xsig, iprd, iwsiz [, iwtyp] [, idbout] [, iwtflg] [,imin] [,imax]`<br>


[**`display `**](../opcodes/display)`xsig, iprd [, inprds] [, iwtflg]`<br>


[**`flashtxt `**](../opcodes/flashtxt)` iwhich, String`<br>


[**`print `**](../opcodes/print)`iarg [, iarg1] [, iarg2] [...]`<br>


`printf_i Sfmt, itrig, [iarg1[, iarg2[, ... ]]]`<br>
[**`printf`**](../opcodes/printf)` Sfmt, ktrig, [xarg1[, xarg2[, ... ]]]`<br>


[**`printk `**](../opcodes/printk)`itime, kval [, ispace] [, inamed]`<br>


[**`printk2 `**](../opcodes/printk2)`kvar [, inumspaces] [, inamed]`<br>


[**`printks `**](../opcodes/printks)`"string", itime [, xval1] [, xval2] [...]`<br>


`printsk "string", [, xval1] [, xval2] [...]`<br>


[**`printks2 `**](../opcodes/printks2)`"string", kval`<br>


[**`println `**](../opcodes/println)`"string", [, xval1] [, xval2] [...]`<br>


[**`prints `**](../opcodes/prints)`"string" [, xval1] [, xval2] [...]`<br>


### Signal I/O:Soundfile Queries
`ir `[**`filebit `**](../opcodes/filebit)`ifilcod [, iallowraw]`<br>


`ir `[**`filelen `**](../opcodes/filelen)`ifilcod, [iallowraw]`<br>


`ir `[**`filenchnls `**](../opcodes/filenchnls)`ifilcod [, iallowraw]`<br>


`ir `[**`filepeak `**](../opcodes/filepeak)`ifilcod [, ichnl]`<br>


`ir `[**`filesr `**](../opcodes/filesr)`ifilcod [, iallowraw]`<br>


`ir `[**`filevalid `**](../opcodes/filevalid)`ifilcod`<br>
`kr filevalid ifilcod`<br>


`ir `[**`mp3len `**](../opcodes/mp3len)`ifilcod`<br>


### Signal Modifiers:Amplitude Modifiers
`ares `[**`balance `**](../opcodes/balance)`asig, acomp [, ihp] [, iskip]`<br>


`ares `[**`balance2 `**](../opcodes/balance2)`asig, acomp [, ihp] [, iskip]`<br>


`ares `[**`clip `**](../opcodes/clip)`asig, imeth, ilimit [, iarg]`<br>


`ar `[**`compress `**](../opcodes/compress)`aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook`<br>


`ar `[**`compress2 `**](../opcodes/compress2)`aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook`<br>


`ares `[**`dam `**](../opcodes/dam)`asig, kthreshold, icomp1, icomp2, irtime, iftime`<br>


`ares `[**`gain `**](../opcodes/gain)`asig, krms [, ihp] [, iskip]`<br>


### Signal Modifiers:Convolution and Morphing


`ar1 [, ar2] [, ar3] [, ar4] `[**`convolve `**](../opcodes/convolve)`ain, ifilcod [, ichannel]`<br>


`ares `[**`cross2 `**](../opcodes/cross2)`ain1, ain2, isize, ioverlap, iwin, kbias`<br>


`ares `[**`dconv `**](../opcodes/dconv)`asig, isize, ifn`<br>


`a1[, a2[, a3[, ... a8]]] `[**`ftconv `**](../opcodes/ftconv)`ain, ift, iplen[, iskipsamples \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iirlen[, iskipinit]]]`<br>


[**`ftmorf `**](../opcodes/ftmorf)`kftndx, iftfn, iresfn`<br>


`ares `[**`liveconv `**](../opcodes/liveconv)`ain, ift, iplen, kupdate, kclear`<br>


`ar1 [, ar2] [, ar3] [, ar4] `[**`pconvolve `**](../opcodes/pconvolve)`ain, ifilcod [, ipartitionsize, ichannel]`<br>


`ares `[**`tvconv `**](../opcodes/tvconv)`asig1, asig2, xfreez1, xfreez2, iparts, ifils`<br>


### Signal Modifiers:Delay
`ares `[**`delay `**](../opcodes/delay)`asig, idlt [, iskip]`<br>


`ares `[**`delay1 `**](../opcodes/delay1)`asig [, iskip]`<br>


`kr `[**`delayk `**](../opcodes/delayk)`  ksig, idel[, imode]`<br>
`kr vdel_k   ksig, kdel, imdel[, imode]`<br>


`ares `[**`delayr `**](../opcodes/delayr)`idlt [, iskip]`<br>


[**`delayw `**](../opcodes/delayw)`asig`<br>


`ares `[**`deltap `**](../opcodes/deltap)`kdlt`<br>


`ares `[**`deltap3 `**](../opcodes/deltap3)`xdlt`<br>


`ares `[**`deltapi `**](../opcodes/deltapi)`xdlt`<br>


`ares `[**`deltapn `**](../opcodes/deltapn)`xnumsamps`<br>


`aout `[**`deltapx `**](../opcodes/deltapx)`adel, iwsize`<br>


[**`deltapxw `**](../opcodes/deltapxw)`ain, adel, iwsize`<br>


`ares `[**`multitap `**](../opcodes/multitap)`asig [, itime1, igain1] [, itime2, igain2] [...]`<br>


`ares `[**`vdelay `**](../opcodes/vdelay)`asig, adel, imaxdel [, iskip]`<br>


`ares `[**`vdelay3 `**](../opcodes/vdelay3)`asig, adel, imaxdel [, iskip]`<br>


`aout `[**`vdelayx `**](../opcodes/vdelayx)`ain, adl, imd, iws [, ist]`<br>


`aout1, aout2, aout3, aout4 `[**`vdelayxq `**](../opcodes/vdelayxq)`ain1, ain2, ain3, ain4, adl, imd, iws [, ist]`<br>


`aout1, aout2 `[**`vdelayxs `**](../opcodes/vdelayxs)`ain1, ain2, adl, imd, iws [, ist]`<br>


`aout `[**`vdelayxw `**](../opcodes/vdelayxw)`ain, adl, imd, iws [, ist]`<br>


`aout1, aout2, aout3, aout4 `[**`vdelayxwq `**](../opcodes/vdelayxwq)`ain1, ain2, ain3, ain4, adl, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imd, iws [, ist]`<br>


`aout1, aout2 `[**`vdelayxws `**](../opcodes/vdelayxws)`ain1, ain2, adl, imd, iws [, ist]`<br>


### Signal Modifiers:Panning and Spatialization
`ao1, ao2 `[**`bformdec1 `**](../opcodes/bformdec1)`isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]]`<br>
`ao1, ao2, ao3, ao4 bformdec1 isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]]`<br>
`ao1, ao2, ao3, ao4, ao5 bformdec1 isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]]`<br>
`ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8 bformdec1 isetup, aw, ax, ay, az \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ar, as, at, au, av [, abk, al, am, an, ao, ap, aq]]`<br>
`aout[] bformdec1 isetup, abform[]`<br>


`aout[] `[**`bformdec2 `**](../opcodes/bformdec2)`isetup, abform[], [idecoder, idistance, ifreq, imix, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifilel, ifiler]`<br>


`aw, ax, ay, az `[**`bformenc1 `**](../opcodes/bformenc1)`asig, kalpha, kbeta`<br>
`aw, ax, ay, az, ar, as, at, au, av bformenc1 asig, kalpha, kbeta`<br>
`aw, ax, ay, az, ar, as, at, au, av, ak, al, am, an, ao, ap, aq bformenc1 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig, kalpha, kbeta`<br>
`aarray[] bformenc1 asig, kalpha, kbeta`<br>


`aleft, aright, irt60low, irt60high, imfp `[**`hrtfearly `**](../opcodes/hrtfearly)`asrc, ksrcx, ksrcy, ksrcz, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`klstnrx, klstnry, klstnrz, ifilel, ifiler, idefroom [,ifade, isr, iorder, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ithreed, kheadrot, iroomx, iroomy, iroomz, iwallhigh, iwalllow, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iwallgain1, iwallgain2, iwallgain3, ifloorhigh, ifloorlow, ifloorgain1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifloorgain2, ifloorgain3, iceilinghigh, iceilinglow, iceilinggain1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iceilinggain2, iceilinggain3]`<br>


`aleft, aright `[**`hrtfer `**](../opcodes/hrtfer)`asig, kaz, kelev, &#8220;HRTFcompact&#8221;`<br>


`aleft, aright `[**`hrtfmove `**](../opcodes/hrtfmove)`asrc, kAz, kElev, ifilel, ifiler [, imode, ifade, isr]`<br>


`aleft, aright `[**`hrtfmove2 `**](../opcodes/hrtfmove2)`asrc, kAz, kElev, ifilel, ifiler [,ioverlap, iradius, isr]`<br>


`aleft, aright, idel `[**`hrtfreverb `**](../opcodes/hrtfreverb)`asrc, ilowrt60, ihighrt60, ifilel, ifiler \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,isr, imfp, iorder]`<br>


`aleft, aright `[**`hrtfstat `**](../opcodes/hrtfstat)`asrc, iAz, iElev, ifilel, ifiler [,iradius, isr]`<br>


`a1, a2 `[**`locsend`**](../opcodes/locsend)<br>
`a1, a2,  a3, a4 locsend`<br>


`a1, a2 `[**`locsig `**](../opcodes/locsig)`asig, kdegree, kdistance, kreverbsend`<br>
`a1, a2,  a3, a4 locsig asig, kdegree, kdistance, kreverbsend`<br>


`aleft,aright `[**`ms2st `**](../opcodes/ms2st)`am, as, kwidth`<br>


`a1, a2, a3, a4 `[**`pan `**](../opcodes/pan)`asig, kx, ky, ifn [, imode] [, ioffset]`<br>


`a1, a2 `[**`pan2 `**](../opcodes/pan2)`asig, xp [, imode]`<br>


`a1, a2, a3, a4  `[**`space `**](../opcodes/space)`asig, ifn, ktime, kreverbsend, kx, ky`<br>


`aW, aX, aY, aZ `[**`spat3d `**](../opcodes/spat3d)`ain, kX, kY, kZ, idist, ift, imode, imdel, iovr [, istor]`<br>


`aW, aX, aY, aZ `[**`spat3di `**](../opcodes/spat3di)`ain, iX, iY, iZ, idist, ift, imode [, istor]`<br>


[**`spat3dt `**](../opcodes/spat3dt)`ioutft, iX, iY, iZ, idist, ift, imode, irlen [, iftnocl]`<br>


`k1 `[**`spdist `**](../opcodes/spdist)`ifn, ktime, kx, ky`<br>


`a1, a2, a3, a4 `[**`spsend`**](../opcodes/spsend)<br>


`am,as `[**`st2ms `**](../opcodes/st2ms)`aleft,aright`<br>


`ar1[, ar2...] `[**`vbap `**](../opcodes/vbap)`asig, kazim [,kelev] [, kspread] [, ilayout]`<br>
`array[] vbap asig, kazim [,kelev] [, kspread] [, ilayout]`<br>


`ar1, ..., ar16 `[**`vbap16 `**](../opcodes/vbap16)`asig, kazim [, kelev] [, kspread]`<br>


`ar1, ..., ar16 `[**`vbap16move `**](../opcodes/vbap16move)`asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>


`ar1, ar2, ar3, ar4 `[**`vbap4 `**](../opcodes/vbap4)`asig, kazim [, kelev] [, kspread]`<br>


`ar1, ar2, ar3, ar4 `[**`vbap4move `**](../opcodes/vbap4move)`asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>


`ar1, ..., ar8 `[**`vbap8 `**](../opcodes/vbap8)`asig, kazim [, kelev] [, kspread]`<br>


`ar1, ..., ar8 `[**`vbap8move `**](../opcodes/vbap8move)`asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>


`k1[, k2...] `[**`vbapg `**](../opcodes/vbapg)`kazim [,kelev] [, kspread] [, ilayout]`<br>
`karray[] vbapg kazim [,kelev] [, kspread] [, ilayout]`<br>


`kr1[, kr2...] `[**`vbapgmove `**](../opcodes/vbapgmove)`idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>
`karray[] vbapgmove idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>


[**`vbaplsinit `**](../opcodes/vbaplsinit)`idim, ilsnum [, idir1] [, idir2] [...] [, idir32]`<br>
`vbaplsinit idim, ilsnum, ilsarray`<br>


`ar1[, ar2...] `[**`vbapmove `**](../opcodes/vbapmove)`asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>
`aarray[] vbapmove asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...]`<br>


[**`vbapz `**](../opcodes/vbapz)`inumchnls, istartndx, asig, kazim [, kelev] [, kspread]`<br>


[**`vbapzmove `**](../opcodes/vbapzmove)`inumchnls, istartndx, asig, idur, ispread, ifldnum, ifld1, ifld2, [...]`<br>


### Signal Modifiers:Reverberation
`ares `[**`alpass `**](../opcodes/alpass)`asig, xrvt, ilpt [, iskip] [, insmps]`<br>


`a1, a2 `[**`babo `**](../opcodes/babo)`asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno]`<br>
`a1, a2 babo2 asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno]`<br>


`ares `[**`comb `**](../opcodes/comb)`asig, krvt, ilpt [, iskip] [, insmps]`<br>


`ares `[**`combinv `**](../opcodes/combinv)`asig, krvt, ilpt [, iskip] [, insmps]`<br>


`aoutL, aoutR `[**`freeverb `**](../opcodes/freeverb)`ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]]`<br>


`ares `[**`nestedap `**](../opcodes/nestedap)`asig, imode, imaxdel, idel1, igain1 [, idel2] [, igain2] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idel3] [, igain3] [, istor]`<br>


`ares `[**`nreverb `**](../opcodes/nreverb)`asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, inumAlpas] [, ifnAlpas]`<br>


`a1[, a2, ...] `[**`platerev `**](../opcodes/platerev)`itabexcite. itabouts, kbndry, iaspect, istiff, idecay, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iloss, aexcite1[, aexcite2, ...]`<br>


`ares `[**`reverb `**](../opcodes/reverb)`asig, krvt [, iskip]`<br>


`ares `[**`reverb2 `**](../opcodes/reverb2)`asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, inumAlpas] [, ifnAlpas]`<br>


`aoutL, aoutR `[**`reverbsc `**](../opcodes/reverbsc)`ainL, ainR, kfblvl, kfco[, israte[, ipitchm[, iskip]]]`<br>


`ares `[**`valpass `**](../opcodes/valpass)`asig, krvt, xlpt, imaxlpt [, iskip] [, insmps]`<br>


`ares `[**`vcomb `**](../opcodes/vcomb)`asig, krvt, xlpt, imaxlpt [, iskip] [, insmps]`<br>


### Signal Modifiers:Sample Level Operators
[**`S(`**](../opcodes/ops)`x) (control-rate or init-rate arg)`<br>


[**`a(`**](../opcodes/opa)`x) (control-rate args only)`<br>


[**`denorm `**](../opcodes/denorm)`a1[, a2[, a3[, ... ]]]`<br>


`ares `[**`diff `**](../opcodes/diff)`asig [, iskip]`<br>
`kres diff ksig [, iskip]`<br>


`kres `[**`downsamp `**](../opcodes/downsamp)`asig [, iwlen]`<br>


`ares `[**`fold `**](../opcodes/fold)`asig, kincr`<br>


[**`i(`**](../opcodes/opi)`x) (control-rate or init-rate arg)`<br>
`i(karray,index1, ...) (k-array with indices)`<br>


`ares `[**`integ `**](../opcodes/integ)`asig [, iskip]`<br>
`kres integ ksig [, iskip]`<br>


`ares `[**`interp `**](../opcodes/interp)`ksig [, iskip] [, imode] [, ivalue]`<br>


[**`k(`**](../opcodes/opk)`x) (i-rate args only)`<br>
`k(x) (a-rate args only)`<br>


`ares `[**`ntrpol `**](../opcodes/ntrpol)`asig1, asig2, kpoint [, imin] [, imax]`<br>
`ires ntrpol isig1, isig2, ipoint [, imin] [, imax]`<br>
`kres ntrpol ksig1, ksig2, kpoint [, imin] [, imax]`<br>


`ares `[**`samphold `**](../opcodes/samphold)`asig, agate [, ival] [, ivstor]`<br>
`kres samphold ksig, kgate [, ival] [, ivstor]`<br>


`ares `[**`upsamp `**](../opcodes/upsamp)`ksig`<br>


`kval `[**`vaget `**](../opcodes/vaget)`kndx, avar`<br>


[**`vaset `**](../opcodes/vaset)`kval, kndx, avar`<br>


### Signal Modifiers:Signal Limiters
`ares `[**`limit `**](../opcodes/limit)`asig, klow, khigh`<br>
`ires limit isig, ilow, ihigh`<br>
`kres limit ksig, klow, khigh`<br>
`ires[] limit isig[], ilow, ihigh`<br>
`kres[] limit ksig[], klow, khigh`<br>
``<br>


`ares `[**`mirror `**](../opcodes/mirror)`asig, klow, khigh`<br>
`ires mirror isig, ilow, ihigh`<br>
`kres mirror ksig, klow, khigh`<br>


`ares `[**`wrap `**](../opcodes/wrap)`asig, klow, khigh`<br>
`ires wrap isig, ilow, ihigh`<br>
`kres wrap ksig, klow, khigh`<br>


### Signal Modifiers:Special Effects
`ar `[**`distort `**](../opcodes/distort)`asig, kdist, ifn[, ihp, istor]`<br>


`ares `[**`distort1 `**](../opcodes/distort1)`asig, kpregain, kpostgain, kshape1, kshape2[, imode]`<br>


`ashifted `[**`doppler `**](../opcodes/doppler)`asource, ksourceposition, kmicposition [, isoundspeed, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifiltercutoff]`<br>


`ares `[**`flanger `**](../opcodes/flanger)`asig, adel, kfeedback [, imaxd]`<br>


`ares `[**`harmon `**](../opcodes/harmon)`asig, kestfrq, kmaxvar, kgenfreq1, kgenfreq2, imode, iminfrq, iprd`<br>


`ares `[**`harmon2 `**](../opcodes/harmon234)`asig, koct, kfrq1, kfrq2, icpsmode, ilowest[, ipolarity]`<br>
`ares harmon3 asig, koct, kfrq1, kfrq2, kfrq3, icpsmode, ilowest[, ipolarity]`<br>
`ares harmon4 asig, koct, kfrq1, kfrq2, kfrq3, kfrq4, icpsmode, ilowest \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipolarity]`<br>


`ares `[**`phaser1 `**](../opcodes/phaser1)`asig, kfreq, kord, kfeedback [, iskip]`<br>


`ares `[**`phaser2 `**](../opcodes/phaser2)`asig, kfreq, kq, kord, kmode, ksep, kfeedback`<br>


### Signal Modifiers:Standard Filters
`asig `[**`K35_hpf `**](../opcodes/k35_hpf)`ain, xcf, xQ [, inlp, isaturation, istor]`<br>


`asig `[**`K35_lpf `**](../opcodes/k35_lpf)`ain, xcf, xQ [, inlp, isaturation, istor]`<br>


`ares `[**`atone `**](../opcodes/atone)`asig, khp [, iskip]`<br>


`ares `[**`atonex `**](../opcodes/atonex)`asig, khp [, inumlayer] [, iskip]`<br>
`ares atonex asig, ahp [, inumlayer] [, iskip]`<br>


`ares `[**`biquad `**](../opcodes/biquad)`asig, kb0, kb1, kb2, ka0, ka1, ka2 [, iskip]`<br>


`ares `[**`biquada `**](../opcodes/biquada)`asig, ab0, ab1, ab2, aa0, aa1, aa2 [, iskip]`<br>


`ares `[**`butbp `**](../opcodes/butbp)`asig, kfreq, kband [, iskip]`<br>


`ares `[**`butbr `**](../opcodes/butbr)`asig, kfreq, kband [, iskip]`<br>


`ares `[**`buthp `**](../opcodes/buthp)`asig, kfreq [, iskip]`<br>
`ares buthp asig, afreq [, iskip]`<br>


`ares `[**`butlp `**](../opcodes/butlp)`asig, kfreq [, iskip]`<br>
`ares butlp asig, afreq [, iskip]`<br>


`ares `[**`butterbp `**](../opcodes/butterbp)`asig, xfreq, xband [, iskip]`<br>


`ares `[**`butterbr `**](../opcodes/butterbr)`asig, xfreq, xband [, iskip]`<br>


`ares `[**`butterhp `**](../opcodes/butterhp)`asig, kfreq [, iskip]`<br>
`ares butterhp asig, afreq [, iskip]`<br>


`ares `[**`butterlp `**](../opcodes/butterlp)`asig, kfreq [, iskip]`<br>
`ares butterlp asig, afreq [, iskip]`<br>


`ares `[**`clfilt `**](../opcodes/clfilt)`asig, kfreq, itype, inpol [, ikind] [, ipbr] [, isba] [, iskip]`<br>


`asig `[**`diode_ladder `**](../opcodes/diode_ladder)`ain, xcf, xk [, inlp, isaturation, istor]`<br>


`ares `[**`median `**](../opcodes/median)`asig, ksize, imaxsize [, iskip]`<br>


`kres `[**`mediank `**](../opcodes/mediank)`kin, ksize, imaxsize [, iskip]`<br>


`aout `[**`mode `**](../opcodes/mode)`ain, xfreq, xQ [, iskip]`<br>


`ares `[**`tone `**](../opcodes/tone)`asig, khp [, iskip]`<br>


`ares `[**`tonex `**](../opcodes/tonex)` asig, khp [, inumlayer] [, iskip]`<br>
`ares tonex  asig, ahp [, inumlayer] [, iskip]`<br>


`asig `[**`zdf_1pole `**](../opcodes/zdf_1pole)`ain, xcf [, kmode, istor]`<br>


`alp, ahp `[**`zdf_1pole_mode `**](../opcodes/zdf_1pole_mode)`ain, xcf [, istor]`<br>


`asig `[**`zdf_2pole `**](../opcodes/zdf_2pole)`ain, xcf, xQ [, kmode, istor]`<br>


`alp, abp, ahp `[**`zdf_2pole_mode `**](../opcodes/zdf_2pole_mode)`ain, xcf, Q [, istor]`<br>


`asig `[**`zdf_ladder `**](../opcodes/zdf_ladder)`ain, xcf, xQ [, istor]`<br>


### Signal Modifiers:Standard Filters:Resonant
`ares `[**`areson `**](../opcodes/areson)`asig, kcf, kbw [, iscl] [, iskip]`<br>
`ares areson asig, acf, kbw [, iscl] [, iskip]`<br>
`ares areson asig, kcf, abw [, iscl] [, iskip]`<br>
`ares areson asig, acf, abw [, iscl] [, iskip]`<br>


`asig `[**`bob `**](../opcodes/bob)`ain, xcf, xres, xsat [, iosamps, istor]`<br>


`ares `[**`bqrez `**](../opcodes/bqrez)`asig, xfco, xres [, imode] [, iskip]`<br>


`ares `[**`lowpass2 `**](../opcodes/lowpass2)`asig, kcf, kq [, iskip]`<br>


`ares `[**`lowres `**](../opcodes/lowres)`asig, xcutoff, xresonance [, iskip]`<br>


`ares `[**`lowresx `**](../opcodes/lowresx)`asig, xcutoff, xresonance [, inumlayer] [, iskip]`<br>


`ares `[**`lpf18 `**](../opcodes/lpf18)`asig, xfco, xres, xdist [, iskip]`<br>


`asig `[**`moogladder `**](../opcodes/moogladder)`ain, kcf, kres[, istor]`<br>
`asig moogladder ain, acf, kres[, istor]`<br>
`asig moogladder ain, kcf, ares[, istor]`<br>
`asig moogladder ain, acf, ares[, istor]`<br>


`asig `[**`moogladder2 `**](../opcodes/moogladder2)`ain, kcf, kres[, istor]`<br>
`asig moogladder2 ain, acf, kres[, istor]`<br>
`asig moogladder2 ain, kcf, ares[, istor]`<br>
`asig moogladder2 ain, acf, ares[, istor]`<br>


`ares `[**`moogvcf `**](../opcodes/moogvcf)`asig, xfco, xres [,iscale, iskip]`<br>


`ares `[**`moogvcf2 `**](../opcodes/moogvcf2)`asig, xfco, xres [,iscale, iskip]`<br>


`asig `[**`mvchpf `**](../opcodes/mvchpf)`ain, xcf[, istor]`<br>


`asig `[**`mvclpf1 `**](../opcodes/mvclpf1)`ain, xcf, xres[,istor]`<br>


`asig `[**`mvclpf2 `**](../opcodes/mvclpf2)`ain, xcf, xres[, istor]`<br>


`asig `[**`mvclpf3 `**](../opcodes/mvclpf3)`ain, xcf, xres[, istor]`<br>


`asig1,asig2,asig3,asig4 `[**`mvclpf4 `**](../opcodes/mvclpf4)`ain, xcf, xres[, istor]`<br>


`ares `[**`reson `**](../opcodes/reson)`asig, xcf, xbw [, iscl] [, iskip]`<br>


`ares `[**`resonr `**](../opcodes/resonr)`asig, xcf, xbw [, iscl] [, iskip]`<br>


`ares `[**`resonx `**](../opcodes/resonx)`asig, xcf, xbw [, inumlayer] [, iscl] [, iskip]`<br>


`ares `[**`resony `**](../opcodes/resony)`asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip]`<br>


`ares `[**`resonz `**](../opcodes/resonz)`asig, xcf, xbw [, iscl] [, iskip]`<br>


`ares `[**`rezzy `**](../opcodes/rezzy)`asig, xfco, xres [, imode, iskip]`<br>


`asig `[**`skf `**](../opcodes/skf)`asig, xcf, xK[, ihp, istor]`<br>


`asig `[**`spf `**](../opcodes/spf)`alp,ahp,abp, xcf, xR[, istor]`<br>


`ahp, alp, abp, abr `[**`statevar `**](../opcodes/statevar)`ain, xcf, xq [, iosamps, istor]`<br>


`alow, ahigh, aband `[**`svfilter `**](../opcodes/svfilter)` asig, kcf, kq [, iscl] [, iskip]`<br>


`ahp,alp,abp,abr `[**`svn `**](../opcodes/svn)`asig, xcf, xQ, kdrive[, ifn,inm,imx, istor]`<br>


`ares `[**`tbvcf `**](../opcodes/tbvcf)`asig, xfco, xres, kdist, kasym [, iskip]`<br>


`asig `[**`vclpf `**](../opcodes/vclpf)`ain, xcf, xres[, istor]`<br>


`ares `[**`vlowres `**](../opcodes/vlowres)`asig, kfco, kres, iord, ksep`<br>


### Signal Modifiers:Standard Filters:Control
`kres `[**`aresonk `**](../opcodes/aresonk)`ksig, kcf, kbw [, iscl] [, iskip]`<br>


`kres `[**`atonek `**](../opcodes/atonek)`ksig, khp [, iskip]`<br>


`aout `[**`lag `**](../opcodes/lag)`ain, klagtime [, initialvalue]`<br>
`kout lag kin, klagtime [, initialvalue]`<br>


`aout `[**`lagud `**](../opcodes/lagud)`ain, klagup, klagdown [, initialvalue]`<br>
`kout lagud kin, klagup, klagdown [, initialvalue]`<br>


`kres `[**`lineto `**](../opcodes/lineto)`ksig, ktime`<br>


`kres `[**`port `**](../opcodes/port)`ksig, ihtim [, isig]`<br>


`kres `[**`portk `**](../opcodes/portk)`ksig, khtim [, isig]`<br>


`kres `[**`resonk `**](../opcodes/resonk)`ksig, kcf, kbw [, iscl] [, iskip]`<br>


`kres `[**`resonxk `**](../opcodes/resonxk)`ksig, kcf, kbw[, inumlayer, iscl, istor]`<br>


`kres `[**`tlineto `**](../opcodes/tlineto)`ksig, ktime, ktrig`<br>


`kres `[**`tonek `**](../opcodes/tonek)`ksig, khp [, iskip]`<br>


`aout `[**`trighold `**](../opcodes/trighold)`ain, kdur`<br>
`kout trighold kin, kdur`<br>


### Signal Modifiers:Specialized Filters
`ares `[**`dcblock `**](../opcodes/dcblock)`ain [, igain]`<br>


`ares `[**`dcblock2 `**](../opcodes/dcblock2)`ain [, iorder] [, iskip]`<br>


`asig `[**`eqfil `**](../opcodes/eqfil)`ain, kcf, kbw, kgain[, istor]`<br>


`ares `[**`exciter `**](../opcodes/exciter)`asig, kfreq, kceil, kharmonics, kblend`<br>


`ares `[**`filter2 `**](../opcodes/filter2)`asig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN`<br>
`kres filter2 ksig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN`<br>


`am, af `[**`fmanal `**](../opcodes/fmanal)`are, aim`<br>


`asig `[**`fofilter `**](../opcodes/fofilter)`ain, xcf, xris, xdec[, istor]`<br>


`aout `[**`gtf `**](../opcodes/gtf)`ain, kfreq, idecay[, iorder, iphase]`<br>


`ar1, ar2 `[**`hilbert `**](../opcodes/hilbert)`asig`<br>


`ar1, ar2 `[**`hilbert2 `**](../opcodes/hilbert2)`asig, ifftsize, ihopsize`<br>


`aout `[**`mvmfilter `**](../opcodes/mvmfilter)`ain, xfreq, xTau [, iskip]`<br>


`ares `[**`nlfilt `**](../opcodes/nlfilt)`ain, ka, kb, kd, kC, kL`<br>


`ares `[**`nlfilt2 `**](../opcodes/nlfilt2)`ain, ka, kb, kd, kC, kL`<br>


`ares `[**`pareq `**](../opcodes/pareq)`asig, kc, kv, kq [, imode] [, iskip]`<br>


`ar `[**`rbjeq `**](../opcodes/rbjeq)`asig, kfco, klvl, kQ, kS[, imode]`<br>


`ares `[**`zfilter2 `**](../opcodes/zfilter2)`asig, kdamp, kfreq, iM, iN, ib0, ib1, ..., ibM, ia1,ia2, ..., iaN`<br>


### Signal Modifiers:Waveguides
`ares `[**`wguide1 `**](../opcodes/wguide1)`asig, xfreq, kcutoff, kfeedback`<br>


`ares `[**`wguide2 `**](../opcodes/wguide2)`asig, xfreq1, xfreq2, kcutoff1, kcutoff2, kfeedback1, kfeedback2`<br>


### Signal Modifiers:Waveshaping
`aout `[**`chebyshevpoly `**](../opcodes/chebyshevpoly)`ain, k0 [, k1 [, k2 [...]]]`<br>


`aout `[**`pdclip `**](../opcodes/pdclip)`ain, kWidth, kCenter [, ibipolar [, ifullscale]]`<br>


`aout `[**`pdhalf `**](../opcodes/pdhalf)`ain, kShapeAmount [, ibipolar [, ifullscale]]`<br>


`aout `[**`pdhalfy `**](../opcodes/pdhalfy)`ain, kShapeAmount [, ibipolar [, ifullscale]]`<br>


`aout `[**`powershape `**](../opcodes/powershape)`ain, kShapeAmount [, ifullscale]`<br>


### Signal Modifiers:Phase Shaping
`avp `[**`vps `**](../opcodes/vps)`aph,kd,kv`<br>


### Signal Modifiers:Comparators and Accumulators
`aout `[**`cmp `**](../opcodes/cmp)`a1, S_operator, a2`<br>
`aout cmp a1, S_operator, kb`<br>
`kOut[] cmp kA[], S_operator, kb`<br>
`kOut[] cmp kA[], S_operator, kB[]`<br>
`kOut[] cmp k1, S_operator1, kIn[], S_operator2, k2`<br>


`a`[**`max `**](../opcodes/max)`[**`max `**](../opcodes/max)ain1, ain2 [, ain3] [, ain4] [...]`<br>
`kmax max kin1, kin2 [, kin3] [, kin4] [...]`<br>
`imax max iin1, iin2 [, iin3] [, iin4] [...]`<br>


`knumkout `[**`max_k `**](../opcodes/max_k)`asig, ktrig, itype`<br>


`amax `[**`maxabs `**](../opcodes/maxabs)`ain1, ain2 [, ain3] [, ain4] [...]`<br>
`kmax maxabs kin1, kin2 [, kin3] [, kin4] [...]`<br>


[**`maxabsaccum `**](../opcodes/maxabsaccum)`aAccumulator, aInput`<br>


[**`maxaccum `**](../opcodes/maxaccum)`aAccumulator, aInput`<br>


`a`[**`min `**](../opcodes/min)`[**`min `**](../opcodes/min)ain1, ain2 [, ain3] [, ain4] [...]`<br>
`kmin min kin1, kin2 [, kin3] [, kin4] [...]`<br>
`imin min iin1, iin2 [, iin3] [, iin4] [...]`<br>


`amin `[**`minabs `**](../opcodes/minabs)`ain1, ain2 [, ain3] [, ain4] [...]`<br>
`kmin minabs kin1, kin2 [, kin3] [, kin4] [...]`<br>


[**`minabsaccum `**](../opcodes/minabsaccum)`aAccumulator, aInput`<br>


[**`minaccum `**](../opcodes/minaccum)`aAccumulator, aInput`<br>


### Instrument Control:Clock Control
[**`clockoff `**](../opcodes/clockoff)`inum`<br>


[**`clockon `**](../opcodes/clockon)`inum`<br>


### Instrument Control:Conditional Values
`(a `[**`!= `**](../opcodes/notequal)`b ? v1 : v2)`<br>


`(a `[**`> `**](../opcodes/greaterthan)` b ? v1 : v2)`<br>


`(a `[**`>= `**](../opcodes/greaterequal)`b ? v1 : v2)`<br>


`(a `[**`< `**](../opcodes/lessthan)` b ? v1 : v2)`<br>


`(a `[**`<= `**](../opcodes/lessequal)`b ? v1 : v2)`<br>


`(a `[**`== `**](../opcodes/equals)`b ? v1 : v2)`<br>


### Instrument Control:Compilation
`ires `[**`compilecsd `**](../opcodes/compilecsd)`Sfilename`<br>


`ires `[**`compileorc `**](../opcodes/compileorc)`Sfilename`<br>


`ires `[**`compilestr `**](../opcodes/compilestr)`Sorch`<br>


`ires `[**`evalstr `**](../opcodes/evalstr)`Scode`<br>
`kres evalstr Scode, ktrig`<br>


[**`return `**](../opcodes/return)`ival`<br>


### Instrument Control:Duration Control
[**`ihold`**](../opcodes/ihold)<br>


[**`turnoff`**](../opcodes/turnoff)<br>
`turnoff inst`<br>
`turnoff knst`<br>


[**`turnoff2 `**](../opcodes/turnoff2)`kinsno, kmode, krelease`<br>
`turnoff2_i insno, imode, irelease`<br>


[**`turnoff3 `**](../opcodes/turnoff3)`kinsno`<br>


[**`turnon `**](../opcodes/turnon)`insnum [, itime]`<br>


### Instrument Control:Invocation
[**`event `**](../opcodes/event)`"scorechar", kinsnum, kdelay, kdur, [, kp4] [, kp5] [, ...]`<br>
`event "scorechar", "insname", kdelay, kdur, [, kp4] [, kp5] [, ...]`<br>


[**`event_i `**](../opcodes/event_i)`"scorechar", iinsnum, idelay, idur, [, ip4] [, ip5] [, ...]`<br>
`event_i "scorechar", "insname", idelay, idur, [, ip4] [, ip5] [, ...]`<br>


[**`mute `**](../opcodes/mute)`insnum [, iswitch]`<br>
`mute "insname" [, iswitch]`<br>


`iHandle `[**`nstance `**](../opcodes/nstance)`insnum, iwhen, idur [, ip4] [, ip5] [...]`<br>
`iHandle nstance "insname", iwhen, idur [, ip4] [, ip5] [...]`<br>


[**`readscore `**](../opcodes/readscore)`Sin`<br>


[**`remove `**](../opcodes/remove)`insnum`<br>


[**`schedkwhen `**](../opcodes/schedkwhen)`ktrigger, kmintim, kmaxnum, kinsnum, kwhen, kdur `<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...]`<br>
`schedkwhen ktrigger, kmintim, kmaxnum, "insname", kwhen, kdur \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...]`<br>


[**`schedkwhennamed `**](../opcodes/schedkwhennamed)`ktrigger, kmintim, kmaxnum, "name", kwhen, kdur \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...]`<br>


[**`schedule `**](../opcodes/schedule)`insnum, iwhen, idur [, ip4] [, ip5] [...]`<br>
`schedule "insname", iwhen, idur [, ip4] [, ip5] [...]`<br>
`schedule iPar[]`<br>


[**`schedulek `**](../opcodes/schedulek)`knsnum, kwhen, kdur [, kp4] [, kp5] [...]`<br>
`schedulek "insname", kwhen, kdur [, kp4] [, kp5] [...]`<br>
`schedulek kPar[]`<br>


[**`schedwhen `**](../opcodes/schedwhen)`ktrigger, kinsnum, kwhen, kdur [, ip4] [, ip5] [...]`<br>
`schedwhen ktrigger, "insname", kwhen, kdur [, ip4] [, ip5] [...]`<br>


[**`scoreline `**](../opcodes/scoreline)`Sin, ktrig`<br>


[**`scoreline_i `**](../opcodes/scoreline_i)`Sin`<br>


### Instrument Control:Program Flow Control
[**`cggoto `**](../opcodes/cggoto)`condition, label`<br>


[**`cigoto `**](../opcodes/cigoto)`condition, label`<br>


[**`ckgoto `**](../opcodes/ckgoto)`condition, label`<br>


[**`cngoto `**](../opcodes/cngoto)`condition, label`<br>


[**`else`**](../opcodes/else)<br>


[**`elseif `**](../opcodes/elseif)`xa R xb then`<br>


[**`endif`**](../opcodes/endif)<br>


[**`goto `**](../opcodes/goto)`label`<br>


[**`if `**](../opcodes/if)`ia R ib igoto label`<br>
`if ka R kb kgoto label`<br>
`if xa R xb goto label`<br>
`if xa R xb then`<br>


[**`igoto `**](../opcodes/igoto)`label`<br>


[**`kgoto `**](../opcodes/kgoto)`label`<br>


[**`loop_ge `**](../opcodes/loop_ge)` indx, idecr, imin, label`<br>
`loop_ge  kndx, kdecr, kmin, label`<br>


[**`loop_gt `**](../opcodes/loop_gt)` indx, idecr, imin, label`<br>
`loop_gt  kndx, kdecr, kmin, label`<br>


[**`loop_le `**](../opcodes/loop_le)` indx, incr, imax, label`<br>
`loop_le  kndx, kncr, kmax, label`<br>


[**`loop_lt `**](../opcodes/loop_lt)` indx, incr, imax, label`<br>
`loop_lt  kndx, kncr, kmax, label`<br>


[**`tigoto `**](../opcodes/tigoto)`label`<br>


[**`timout `**](../opcodes/timout)`istrt, idur, label`<br>


[**`until `**](../opcodes/until)`condition do`<br>
`... od`<br>


[**`while `**](../opcodes/while)`condition do`<br>
`... od`<br>


### Instrument Control:Realtime Performance Control
`ir `[**`active `**](../opcodes/active)`insnum [,iopt [,inorel]]`<br>
`ir active Sinsname [,iopt [,inorel]]`<br>
`kres active kinsnum [,iopt [,inorel]]`<br>


`ktot[,kcpu1, kcpu2,...]`[**`cpumeter `**](../opcodes/cpumeter)`ifreq`<br>


[**`cpuprc `**](../opcodes/cpuprc)`insnum, ipercent`<br>
`cpuprc Sinsname, ipercent`<br>


[**`exitnow `**](../opcodes/exitnow)`[ivalue]`<br>


[**`maxalloc `**](../opcodes/maxalloc)`insnum, icount`<br>
`maxalloc Sinsname, icount`<br>


[**`prealloc `**](../opcodes/prealloc)`insnum, icount`<br>
`prealloc "insname", icount`<br>


### Instrument Control:Initialization and Reinitialization
`ares `[**`+= `**](../opcodes/plusbecomes)`xarg`<br>
`ires += iarg`<br>
`kres += karg`<br>
`table [ kval] += karg`<br>


`ares `[**`= `**](../opcodes/assign)`xarg`<br>
`ires = iarg`<br>
`kres = karg`<br>
`ires, ... = iarg, ...`<br>
`kres, ... = karg, ...`<br>
`table [ kval] = karg`<br>


`ares `[**`init `**](../opcodes/init)`iarg`<br>
`ires init iarg`<br>
`kres init iarg`<br>
`ares, ... init iarg, ...`<br>
`ires, ... init iarg, ...`<br>
`kres, ... init iarg, ...`<br>
`tab init isize[, ival]`<br>


`insno `[**`nstrnum `**](../opcodes/nstrnum)`"name"`<br>


`Sname `[**`nstrstr `**](../opcodes/nstrstr)`insno`<br>
`Sname nstrstr knsno`<br>


[**`p(`**](../opcodes/p)`x)`<br>


`ivar1, ... `[**`passign `**](../opcodes/passign)`[istart][, iend]`<br>
`iarray passign [istart][, iend]`<br>
`karray passign [istart][, iend]`<br>


[**`pset `**](../opcodes/pset)`icon1 [, icon2] [...]`<br>


[**`reinit `**](../opcodes/reinit)`label`<br>


[**`rigoto `**](../opcodes/rigoto)`label`<br>


[**`rireturn`**](../opcodes/rireturn)<br>


`ir `[**`tival`**](../opcodes/tival)<br>


### Instrument Control:Sensing and Control
`kres `[**`button `**](../opcodes/button)`knum`<br>


`ktrig `[**`changed `**](../opcodes/changed)`kvar1 [, kvar2,..., kvarN]`<br>


`ktrig `[**`changed2 `**](../opcodes/changed2)`kvar1 [, kvar2,..., kvarN]`<br>
`ktrig changed2 karr[]`<br>
`ktrig changed2 aarr[]`<br>


`kres `[**`checkbox `**](../opcodes/checkbox)`knum`<br>


`icnt `[**`cntCreate `**](../opcodes/cntcreate)`[imax, imin, inc]`<br>


`kval `[**`cntCycles `**](../opcodes/cntcycles)`icnt`<br>


`kval `[**`cntDelete `**](../opcodes/cntDelete)`icnt`<br>


`ival `[**`cntDelete_i `**](../opcodes/cntDelete_i)`icnt`<br>


`kval `[**`cntRead `**](../opcodes/cntread)`icnt`<br>


[**`cntReset `**](../opcodes/cntreset)`icnt`<br>


`kmax, kmin, kinc `[**`cntState `**](../opcodes/cntstate)`icnt`<br>


`kres `[**`control `**](../opcodes/control)`knum`<br>


`kval `[**`count `**](../opcodes/count)`icnt`<br>


`ival `[**`count_i `**](../opcodes/count_i)`icnt`<br>


`ares `[**`follow `**](../opcodes/follow)`asig, idt`<br>


`ares `[**`follow2 `**](../opcodes/follow2)`asig, katt, krel`<br>


`Svalue `[**`getcfg `**](../opcodes/getcfg)`iopt`<br>


`kres `[**`joystick `**](../opcodes/joystick)`kdevice, ktab`<br>


`ktrig  `[**`metro `**](../opcodes/metro)` kfreq [, initphase]`<br>


`ktrig  `[**`metro2 `**](../opcodes/metro2)` kfreq, kswing [, iamp, initphase]`<br>


`ktrig  `[**`metrobpm `**](../opcodes/metrobpm)` kfreq [, initphase] [, kgate]`<br>


`ksig  `[**`miditempo`**](../opcodes/miditempo)<br>


[**`p5gconnect`**](../opcodes/p5gconnect)<br>


`kres `[**`p5gdata `**](../opcodes/p5gdata)`kcontrol`<br>


`icount `[**`pcount`**](../opcodes/pcount)<br>


`kres `[**`peak `**](../opcodes/peak)`asig`<br>
`kres peak ksig`<br>


`ivalue `[**`pindex `**](../opcodes/pindex)`ipfieldIndex`<br>


`koct, kamp `[**`pitch `**](../opcodes/pitch)`asig, iupdte, ilo, ihi, idbthresh [, ifrqs] [, iconf] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istrt] [, iocts] [, iq] [, inptls] [, irolloff] [, iskip]`<br>


`kcps, krms `[**`pitchamdf `**](../opcodes/pitchamdf)`asig, imincps, imaxcps [, icps] [, imedi] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idowns] [, iexcps] [, irmsmedi]`<br>


`acps, alock `[**`plltrack `**](../opcodes/plltrack)`asig, kd [, kloopf, kloopq, klf, khf, kthresh]`<br>


`kcps, kamp `[**`ptrack `**](../opcodes/ptrack)`asig, ihopsize[,ipeaks]`<br>


`ival `[**`readscratch `**](../opcodes/readscratch)`[index]`<br>


[**`rewindscore`**](../opcodes/rewindscore)<br>


`kres `[**`rms `**](../opcodes/rms)`asig [, ihp] [, iskip]`<br>




`kres[, kkeydown] `[**`sensekey`**](../opcodes/sensekey)<br>


`ktrig_out `[**`seqtime `**](../opcodes/seqtime)`ktime_unit, kstart, kloop, kinitndx, kfn_times`<br>


`ktrig_out `[**`seqtime2 `**](../opcodes/seqtime2)`ktrig_in, ktime_unit, kstart, kloop, kinitndx, kfn_times`<br>


`kres `[**`sequ `**](../opcodes/sequencer)`irhythm[], iinstr[], idata[], kbpm, klen [, kmode] [, kstep] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kreset] [, kverbose]`<br>
`kres sequ irhythm[], iinstr[], idata[][], kbpm, klen [, kmode] [, kstep] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kreset] [, kverbose]`<br>


[**`setctrl `**](../opcodes/setctrl)`inum, ival, itype`<br>


[**`setscorepos `**](../opcodes/setscorepos)`ipos`<br>


[**`splitrig `**](../opcodes/splitrig)`ktrig, kndx, imaxtics, ifn, kout1 [,kout2,...,koutN]`<br>


`ktemp `[**`tempest `**](../opcodes/tempest)`kin, iprd, imindur, imemdur, ihp, ithresh, ihtim, ixfdbak, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`istartempo, ifn [, idisprd] [, itweek]`<br>


[**`tempo `**](../opcodes/tempo)`ktempo, istartempo`<br>


`kres `[**`tempoval`**](../opcodes/tempoval)<br>


`ktrig  `[**`timedseq `**](../opcodes/timedseq)` ktimpnt, ifn, kp1 [,kp2, kp3, ...,kpN]`<br>


`kout `[**`trigger `**](../opcodes/trigger)`ksig, kthreshold, kmode`<br>


[**`trigseq `**](../opcodes/trigseq)`ktrig_in, kstart, kloop, kinitndx, kfn_values, kout1 [, kout2] [...]`<br>


`ares `[**`vactrol `**](../opcodes/vactrol)`asig [iup, idown]`<br>


`ires `[**`wiiconnect `**](../opcodes/wiiconnect)`[itimeout, imaxnum]`<br>


`kres `[**`wiidata `**](../opcodes/wiidata)`kcontrol [, knum]`<br>


[**`wiirange `**](../opcodes/wiirange)`icontrol, iminimum, imaximum [, inum]`<br>


`kres `[**`wiisend `**](../opcodes/wiisend)`kcontrol, kvalue [, knum]`<br>


`writescratchival [index]`<br>


`kx, ky `[**`xyin `**](../opcodes/xyin)`iprd, ixmin, ixmax, iymin, iymax [, ixinit] [, iyinit]`<br>


### Instrument Control:Stacks
`xval1, [xval2, ... , xval31] `[**`pop`**](../opcodes/pop)<br>
`ival1, [ival2, ... , ival31] pop`<br>


`fsig `[**`pop_f`**](../opcodes/pop_f)<br>


[**`push `**](../opcodes/push)` xval1, [xval2, ... , xval31]`<br>
`push  ival1, [ival2, ... , ival31]`<br>


[**`push_f `**](../opcodes/push_f)` fsig`<br>


[**`stack `**](../opcodes/stack)` iStackSize`<br>


### Instrument Control:Subinstrument Control
`a1, [...] [, a8] `[**`subinstr `**](../opcodes/subinstr)`instrnum [, p4] [, p5] [...]`<br>
`a1, [...] [, a8] subinstr "insname" [, p4] [, p5] [...]`<br>


[**`subinstrinit `**](../opcodes/subinstrinit)`instrnum [, p4] [, p5] [...]`<br>
`subinstrinit "insname" [, p4] [, p5] [...]`<br>


### Instrument Control:Time Reading
`ir[, inano] `[**`date`**](../opcodes/date)<br>
`kr[, knano] date`<br>


`Sir `[**`dates `**](../opcodes/dates)`[ itime]`<br>


`ires `[**`elapsedcycles`**](../opcodes/elapsedcycles)<br>
`kres elapsedcycles`<br>


`ires `[**`elapsedtime`**](../opcodes/elapsedtime)<br>
`kres elapsedtime`<br>


`kres `[**`eventcycles`**](../opcodes/eventcycles)<br>


`kres `[**`eventtime`**](../opcodes/eventtime)<br>


`ir `[**`readclock `**](../opcodes/readclock)`inum`<br>


`ires `[**`rtclock`**](../opcodes/rtclock)<br>
`kres rtclock`<br>


`kres `[**`timeinstk`**](../opcodes/timeinstk)<br>


`kres `[**`timeinsts`**](../opcodes/timeinsts)<br>


`ires `[**`timek`**](../opcodes/timek)<br>
`kres timek`<br>


`ires `[**`times`**](../opcodes/times)<br>
`kres times`<br>


### Serial I/O
`kval `[**`arduinoRead `**](../opcodes/arduinoRead)`iPort, iStream [, iSmooth]`<br>


`kval `[**`arduinoReadF `**](../opcodes/arduinoReadF)`iPort, iStream1, iStream2, iStream3`<br>


`iPort `[**`arduinoStart `**](../opcodes/arduinoStart)`SPortName [, ibaudRate]`<br>


[**`arduinoStop `**](../opcodes/arduinoStop)`iPort`<br>


`iPort `[**`serialBegin `**](../opcodes/serialBegin)`SPortName [, ibaudRate]`<br>


[**`serialEnd `**](../opcodes/serialEnd)`iPort`<br>


[**`serialFlush `**](../opcodes/serialFlush)`iPort`<br>


[**`serialPrint `**](../opcodes/serialPrint)`iPort`<br>


`kByte `[**`serialRead `**](../opcodes/serialRead)`iPort`<br>


[**`serialWrite `**](../opcodes/serialWrite)`iPort, iByte`<br>
`serialWrite iPort, kByte`<br>
`serialWrite iPort, SBytes`<br>


[**`serialWrite_i `**](../opcodes/serialWrite_i)`iPort, iByte`<br>
`serialWrite_i iPort, SBytes`<br>


### Table Control
[**`ftfree `**](../opcodes/ftfree)`ifno, iwhen`<br>


`gir `[**`ftgen `**](../opcodes/ftgen)`ifn, itime, isize, igen, iarga [, iargb ] [...]`<br>
`gir ftgen ifn, itime, isize, igen, iarray`<br>


`ifno `[**`ftgentmp `**](../opcodes/ftgentmp)`ip1, ip2dummy, isize, igen, iarga, iargb, ...`<br>


`Sdst `[**`getftargs `**](../opcodes/getftargs)`iftno, ktrig`<br>


[**`sndload `**](../opcodes/sndload)`Sfname[, ifmt[, ichns[, isr[, ibas[, iamp[, istrt [, ilpmod[, ilps \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ilpe]]]]]]]]]`<br>


### Table Control:Table Queries
`karray[] `[**`fillarray `**](../opcodes/fillarray)`ival1, ival2,.....ivaln`<br>
`karray fillarray ival1, ival2,.....ivaln`<br>
`karray fillarray kval1, kval2,.....kvaln`<br>


[**`ftchnls(`**](../opcodes/ftchnls)`x) (init-rate args only)`<br>


[**`ftcps(`**](../opcodes/ftcps)`x) (init-rate args only)`<br>


`iexists `[**`ftexists `**](../opcodes/ftexists)`ifn`<br>
`kexists ftexists kfn / ifn`<br>


[**`ftlen(`**](../opcodes/ftlen)`x) (init-rate args only)`<br>


[**`ftlptim(`**](../opcodes/ftlptim)`x) (init-rate args only)`<br>


[**`ftsr(`**](../opcodes/ftsr)`x) (init-rate args only)`<br>


`karray `[**`genarray `**](../opcodes/genarray)`kstart, kens [, inc]`<br>
`iarray genarray istart, iens [, inc]`<br>


`karray `[**`genarray_i `**](../opcodes/genarray_i)`istart, iend [,inc]`<br>


`ir `[**`lenarray `**](../opcodes/lenarray)`karray[, iwhich]`<br>
`kr lenarray karray[, iwhich]`<br>


`karray `[**`maparray `**](../opcodes/maparray)`kinarray, String`<br>
`karray maparray_i kinarray, String`<br>


[**`nsamp(`**](../opcodes/nsamp)`x) (init-rate args only)`<br>


`karray `[**`slicearray `**](../opcodes/slicearray)`kinarray, istart, iend [,istride]`<br>


`ires `[**`tableng `**](../opcodes/tableng)`ifn`<br>
`kres tableng kfn`<br>


`kr `[**`tabsum `**](../opcodes/tabsum)`ifn[[, kmin] [, kmax]]`<br>


### Table Control:Dynamic Selection
`ares `[**`tableikt `**](../opcodes/tableikt)`xndx, kfn [, ixmode] [, ixoff] [, iwrap]`<br>
`kres tableikt kndx, kfn [, ixmode] [, ixoff] [, iwrap]`<br>


`ares `[**`tablekt `**](../opcodes/tablekt)`xndx, kfn [, ixmode] [, ixoff] [, iwrap]`<br>
`kres tablekt kndx, kfn [, ixmode] [, ixoff] [, iwrap]`<br>


`ares `[**`tablexkt `**](../opcodes/tablexkt)`xndx, kfn, kwarp, iwsize [, ixmode] [, ixoff] [, iwrap]`<br>


### Table Control:Read/Write Operations
`ians `[**`ftaudio `**](../opcodes/ftaudio)`ifn, "filename", iformat[, ibeg, iend]`<br>
`kans ftaudio ktrig, kfn, "filename", kformat [, isync, kbeg, kend]`<br>


[**`ftload `**](../opcodes/ftload)`Sfilename, iflag, ifn1 [, ifn2] [...]`<br>


[**`ftloadk `**](../opcodes/ftloadk)`Sfilename, ktrig, iflag, ifn1 [, ifn2] [...]`<br>


``<br>
[**`ftprint`**](../opcodes/ftprint)` ifn [, ktrig, kstart, kend, kstep, inumcols ]`<br>


`iNumberOfFile `[**`ftsamplebank `**](../opcodes/ftsamplebank)`SDirectory, iFirstTableNumber, iSkipTime, iFormat, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iChannel,`<br>
`kNumberOfFile ftsamplebank SDirectory, kFirstTableNumber, kTrigger, kSkipTime, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kFormat, kChannel,`<br>


[**`ftsave `**](../opcodes/ftsave)`"filename", iflag, ifn1 [, ifn2] [...]`<br>


[**`ftsavek `**](../opcodes/ftsavek)`"filename", ktrig, iflag, ifn1 [, ifn2] [...]`<br>


[**`ftset `**](../opcodes/ftset)`ktablenum, kvalue [, kstart=0, kend=0, kstep=1 ]`<br>
`ftset itablenum, ivalue [, istart=0, iend=0, istep=1 ]`<br>


[**`ftslice `**](../opcodes/ftslice)`ifnsource, ifndest [, kstart, kend, kstep ]`<br>
`ftslice kfnsource, kfndest [, kstart, kend, kstep ]`<br>


[**`ftslicei `**](../opcodes/ftslicei)`ifnsource, ifndest [, istart, iend, istep ]`<br>


[**`tablecopy `**](../opcodes/tablecopy)`kdft, ksft`<br>


`knumpassed `[**`tablefilter `**](../opcodes/tablefilter)`kouttable, kintatble, kmode, kparam`<br>


`inumpassed `[**`tablefilteri `**](../opcodes/tablefilteri)`iouttable, iintatble, imode, iparam`<br>


[**`tablegpw `**](../opcodes/tablegpw)`kfn`<br>


[**`tableicopy `**](../opcodes/tableicopy)`idft, isft`<br>


[**`tableigpw `**](../opcodes/tableigpw)`ifn`<br>


[**`tableimix `**](../opcodes/tableimix)`idft, idoff, ilen, is1ft, is1off, is1g, is2ft, is2off, is2g`<br>


[**`tablemix `**](../opcodes/tablemix)`kdft, kdoff, klen, ks1ft, ks1off, ks1g, ks2ft, ks2off, ks2g`<br>


`ares `[**`tablera `**](../opcodes/tablera)`kfn, kstart, koff`<br>


[**`tablew `**](../opcodes/tablew)`asig, andx, ifn [, ixmode] [, ixoff] [, iwgmode]`<br>
`tablew isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode]`<br>
`tablew ksig, kndx, ifn [, ixmode] [, ixoff] [, iwgmode]`<br>


`kstart `[**`tablewa `**](../opcodes/tablewa)`kfn, asig, koff`<br>


[**`tablewkt `**](../opcodes/tablewkt)`asig, andx, kfn [, ixmode] [, ixoff] [, iwgmode]`<br>
`tablewkt ksig, kndx, kfn [, ixmode] [, ixoff] [, iwgmode]`<br>


`kout `[**`tabmorph `**](../opcodes/tabmorph)`kindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ...,ifnN]`<br>


`aout `[**`tabmorpha `**](../opcodes/tabmorpha)`aindex, aweightpoint, atabnum1, atabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ... ifnN]`<br>


`aout `[**`tabmorphak `**](../opcodes/tabmorphak)`aindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ... ifnN]`<br>


`kout `[**`tabmorphi `**](../opcodes/tabmorphi)`kindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ..., ifnN]`<br>


[**`tabplay `**](../opcodes/tabplay)` ktrig, knumtics, kfn, kout1 [,kout2,..., koutN]`<br>


[**`tabrec `**](../opcodes/tabrec)`  ktrig_start, ktrig_stop, knumtics, kfn, kin1 [,kin2,...,kinN]`<br>


### FLTK:Other
`ihandle `[**`FLhvsBox `**](../opcodes/flhvsbox)`inumlinesX, inumlinesY, iwidth, iheight, ix, iy`<br>


[**`vphaseseg `**](../opcodes/vphaseseg)`kphase, ioutab, ielems, itab1,idist1,itab2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,idist2,itab3, ... ,idistN-1,itabN]`<br>


### Mathematical Operations:Arithmetic and Logic Operations
[**`! `**](../opcodes/opnot)`a  (logical NOT; not audio-rate)`<br>


`a `[**`& `**](../opcodes/opbitand)`b  (bitwise AND)`<br>


`a `[**`&& `**](../opcodes/opand)`b  (logical AND; not audio-rate)`<br>


`a * b  (no rate restriction)`<br>


`a `[**`^ `**](../opcodes/raises)`b  (b not audio-rate)`<br>


`a `[**`>> `**](../opcodes/opbitshr)`b  (bitshift left)`<br>


`a `[**`<< `**](../opcodes/opbitshl)`b  (bitshift left)`<br>


`a `[**`% `**](../opcodes/modulus)`b  (no rate restriction)`<br>


`a `[**`/ `**](../opcodes/divides)`b  (no rate restriction)`<br>


`a `[**`| `**](../opcodes/opbitor)`b  (bitwise OR)`<br>


`a `[**`|| `**](../opcodes/opor)`b  (logical OR; not audio-rate)`<br>


`+a  (no rate restriction)`<br>
`a `[**`+`**](../opcodes/adds)` b  (no rate restriction)`<br>


`-a  (no rate restriction)`<br>
`a `[**`-`**](../opcodes/subtracts)` b  (no rate restriction)`<br>


`a `[**`# `**](../opcodes/opnonequiv)`b  (bitwise NON EQUIVALENCE)`<br>


[**`~ `**](../opcodes/opbitnot)`a  (bitwise NOT)`<br>


### Mathematical Operations:Arrays
`ires[] `[**`cbrt `**](../opcodes/cbrt)`iarg`<br>
`kres[] cbrt karg`<br>


`ires[] `[**`fmax `**](../opcodes/fmax)`iarg1[], iarg2[]`<br>
`kres[] fmax karg1[], karg2[]`<br>
`ires[] fmax iarg1[], iarg2`<br>
`kres[] fmax karg[], karg2`<br>


`ires[] `[**`fmin `**](../opcodes/fmin)`iarg1[], iarg2[]`<br>
`kres[] fmin karg1[], karg2[]`<br>
`ires[] fmin iarg1[], iarg2`<br>
`kres[] fmin karg[], karg2`<br>


`ires[] `[**`fmod `**](../opcodes/fmod)`iarg1[], iarg2[]`<br>
`kres[] fmod karg1[], karg2[]`<br>
`ires[] fmod iarg1[], iarg2`<br>
`kres[] fmod karg[], karg2`<br>


`ires[] `[**`hypot `**](../opcodes/hypot)`iarg1[], iarg2[]`<br>
`kres[] hypot karg1[], karg2[]`<br>


`ires[] `[**`limit1 `**](../opcodes/limit1)`iarg`<br>
`kres[] limit1 karg`<br>


### Mathematical Operations:Comparators and Accumulators
[**`clear `**](../opcodes/clear)`avar1 [, avar2] [, avar3] [...]`<br>
`clear avar[]`<br>


[**`vincr `**](../opcodes/vincr)`accum, aincr`<br>


### Mathematical Operations:Mathematical Functions
[**`abs(`**](../opcodes/abs)`x) (no rate restriction)`<br>
`abs(k/i[]) (k- or i-arrays )`<br>


[**`ceil(`**](../opcodes/ceil)`x) (init-, control-, or audio-rate arg allowed)`<br>
`ceil(k/i[]) (k- or i-arrays )`<br>


[**`exp(`**](../opcodes/exp)`x) (no rate restriction)`<br>
`exp(k/i[]) (k- or i-arrays)`<br>


[**`floor(`**](../opcodes/floor)`x) (init-, control-, or audio-rate arg allowed)`<br>
`floor(k/i[]) (k- or i-arrays )`<br>


[**`frac(`**](../opcodes/frac)`x) (init-rate or control-rate args; also works at audio rate in Csound5)`<br>
`frac(k/i[]) (k- or i-arrays )`<br>


[**`int(`**](../opcodes/int)`x)  (init-rate or control-rate; also works at audio rate in Csound5)`<br>


[**`log(`**](../opcodes/log)`x) (no rate restriction)`<br>
`log(k/i[]) (k- or i-arrays )`<br>
`kout[] log kin[], ibas`<br>


[**`log10(`**](../opcodes/log10)`x) (no rate restriction)`<br>
`log10(k/i[]) (k- or i-arrays )`<br>


[**`log2(`**](../opcodes/log2)`x) (no rate restriction)`<br>
`log2(k/i[]) (k- or i-arrays )`<br>


[**`logbtwo(`**](../opcodes/logbtwo)`x)  (init-rate or control-rate args only)`<br>


[**`powoftwo(`**](../opcodes/powoftwo)`x)  (init-rate or control-rate args only)`<br>


[**`qinf(`**](../opcodes/qinf)`x) (no rate restriction)`<br>


[**`qnan(`**](../opcodes/qnan)`x) (no rate restriction)`<br>


[**`round(`**](../opcodes/round)`x)      (init-, control-, or audio-rate arg allowed)`<br>
`round(k/i[])  (k- or i-arrays )`<br>


[**`sqrt(`**](../opcodes/sqrt)`x)      (no rate restriction)`<br>
`sqrt(k/i[])  (k- or i-arrays )`<br>


### Mathematical Operations:Trigonometric Functions
[**`cos(`**](../opcodes/cos)`x)     (no rate restriction)`<br>
`cos(k/i[]) (k- or i-arrays )`<br>


[**`cosh(`**](../opcodes/cosh)`x)     (no rate restriction)`<br>
`cosh(k/i[]) (k- or i-arrays )`<br>


[**`cosinv(`**](../opcodes/cosinv)`x)     (no rate restriction)`<br>
`cosinv(k/i[]) (k- or i-arrays )`<br>


[**`signum(`**](../opcodes/signum)`x) (no rate restriction)`<br>


[**`sin(`**](../opcodes/sin)`x)     (no rate restriction)`<br>
`sin(k/i[]) (k- or i-arrays )`<br>


[**`sinh(`**](../opcodes/sinh)`x)     (no rate restriction)`<br>
`sinh(k/i[]) (k- or i-arrays )`<br>


[**`sininv(`**](../opcodes/sininv)`x)     (no rate restriction)`<br>
`sininv(k/i[]) (k- or i-arrays)`<br>


[**`tan(`**](../opcodes/tan)`x)     (no rate restriction)`<br>
`tan(k/i[]) (k- or i-arrays )`<br>


[**`tanh(`**](../opcodes/tanh)`x)     (no rate restriction)`<br>
`tanh(k/i[]) (k- or i-arrays )`<br>


[**`taninv(`**](../opcodes/taninv)`x)     (no rate restriction)`<br>
`taninv(k/i[]) (k- or i-arrays )`<br>


### Mathematical Operations:Amplitude Functions
[**`ampdb(`**](../opcodes/ampdb)`x)  (no rate restriction)`<br>


[**`ampdbfs(`**](../opcodes/ampdbfs)`x)  (no rate restriction)`<br>


[**`db(`**](../opcodes/db)`x)`<br>


[**`dbamp(`**](../opcodes/dbamp)`x)  (init-rate or control-rate args only)`<br>


[**`dbfsamp(`**](../opcodes/dbfsamp)`x)  (init-rate or control-rate args only)`<br>


### Mathematical Operations:Random Functions
[**`birnd(`**](../opcodes/birnd)`x) (init- or control-rate only)`<br>


[**`rnd(`**](../opcodes/rnd)`x) (init- or control-rate only)`<br>


### Mathematical Operations:Opcode Equivalents of Functions
`ares `[**`divz `**](../opcodes/divz)`xa, xb, ksubst`<br>
`ires divz ia, ib, isubst`<br>
`kres divz ka, kb, ksubst`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`... divz(ka, kb, ksubst)... (no rate restriction)`<br>


`ares `[**`mac `**](../opcodes/mac)`ksig1, asig1 [, ksig2] [, asig2] [, ksig3] [, asig3] [...]`<br>


`ares `[**`maca `**](../opcodes/maca)`asig1 , asig2 [, asig3] [, asig4] [, asig5] [...]`<br>


`aout `[**`polynomial `**](../opcodes/polynomial)`ain, k0 [, k1 [, k2 [...]]]`<br>


`ares `[**`pow `**](../opcodes/pow)`aarg, k[**`pow `**](../opcodes/pow)[, inorm]`<br>
`ires pow iarg, ipow [, inorm]`<br>
`kres pow karg, kpow [, inorm]`<br>
``<br>
`ires[] pow iarg[], ipow[]`<br>
`kres[] pow karg[], kpow[]`<br>
`ires[] pow iarg[], ipow`<br>
`kres[] pow karg[], kpow`<br>


`ares `[**`product `**](../opcodes/product)`asig1, asig2 [, asig3] [...]`<br>


`ares `[**`sum `**](../opcodes/sum)`asig1 [, asig2] [, asig3] [...]`<br>
`kres sum karr`<br>
`ires sum iarr`<br>


`ares `[**`taninv2 `**](../opcodes/taninv2)`ay, ax`<br>
`ires taninv2 iy, ix`<br>
`kres taninv2 ky, kx`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`... taninv2(ky, kx)... (no rate restriction)`<br>


### Pitch Converters:Functions
[**`cent(`**](../opcodes/cent)`x)`<br>


[**`cpsmidinn `**](../opcodes/cpsmidinn)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`cpsoct `**](../opcodes/cpsoct)`(oct)  (no rate restriction)`<br>


[**`cpspch `**](../opcodes/cpspch)`(pch)  (init- or control-rate args only)`<br>


`imidi `[**`ftom `**](../opcodes/ftom)`ifreq [,irnd]`<br>
`kmidi ftom kfreq [,irnd]`<br>
`imidis[] ftom ifreqs[] [,irnd]`<br>
`kmidis[] ftom kfreqs[] [,irnd]`<br>


`ifreq `[**`mtof `**](../opcodes/mtof)`imidi`<br>
`kfreq mtof kmidi`<br>
`ifreqs[] mtof imidis[]`<br>
`kfreqs[] mtof kmidis[]`<br>


`Snote `[**`mton `**](../opcodes/mton)`kmidi`<br>
`Snote mton imidi`<br>


`kfreq `[**`ntof `**](../opcodes/ntof)`Snote`<br>
`ifreq ntof Snote`<br>


`kmidi `[**`ntom `**](../opcodes/ntom)`Snote`<br>
`imidi ntom Snote`<br>


[**`octave(`**](../opcodes/octave)`x)`<br>


[**`octcps `**](../opcodes/octcps)`(cps)  (init- or control-rate args only)`<br>


[**`octmidinn `**](../opcodes/octmidinn)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`octpch `**](../opcodes/octpch)`(pch)  (init- or control-rate args only)`<br>


[**`pchmidinn `**](../opcodes/pchmidinn)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`pchoct `**](../opcodes/pchoct)`(oct)  (init- or control-rate args only)`<br>


`imidi `[**`pchtom `**](../opcodes/pchtom)`ipch`<br>
`kmidi pchtom kpch`<br>


[**`semitone(`**](../opcodes/semitone)`x)`<br>


### Pitch Converters:Tuning Opcodes
`icps `[**`cps2pch `**](../opcodes/cps2pch)`ipch, iequal`<br>


`kcps `[**`cpstun `**](../opcodes/cpstun)`ktrig, kindex, kfn`<br>


`icps `[**`cpstuni `**](../opcodes/cpstuni)`index, ifn`<br>


`icps `[**`cpsxpch `**](../opcodes/cpsxpch)`ipch, iequal, irepeat, ibase`<br>


### Real-time MIDI:Input
`kaft `[**`aftouch `**](../opcodes/aftouch)`[imin] [, imax]`<br>


`ival `[**`chanctrl `**](../opcodes/chanctrl)`ichnl, ictlno [, ilow] [, ihigh]`<br>
`kval chanctrl ichnl, ictlno [, ilow] [, ihigh]`<br>


`idest `[**`ctrl14 `**](../opcodes/ctrl14)`ichan, ictlno1, ictlno2, imin, imax [, ifn]`<br>
`kdest ctrl14 ichan, ictlno1, ictlno2, kmin, kmax [, ifn]`<br>


`idest `[**`ctrl21 `**](../opcodes/ctrl21)`ichan, ictlno1, ictlno2, ictlno3, imin, imax [, ifn]`<br>
`kdest ctrl21 ichan, ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn]`<br>


`idest `[**`ctrl7 `**](../opcodes/ctrl7)`ichan, ictlno, imin, imax [, ifn]`<br>
`kdest ctrl7 ichan, ictlno, kmin, kmax [, ifn]`<br>
`adest ctrl7 ichan, ictlno, kmin, kmax [, ifn] [, icutoff]`<br>


[**`ctrlinit `**](../opcodes/ctrlinit)`ichnl, ictlno1, ival1 [, ictlno2] [, ival2] [, ictlno3] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ival3] [,...ival32]`<br>


`kpreset `[**`ctrlpreset `**](../opcodes/ctrlpreset)`ktag, kchnl, kctlno1, [kctlno2] [, kctlno3] ...`<br>


[**`ctrlprint `**](../opcodes/ctrlprint)`kcont[][, Sfile]`<br>


[**`ctrlprintpresets `**](../opcodes/ctrlprintpresets)`[Sfilenam]`<br>


`kconnt[] `[**`ctrlsave `**](../opcodes/ctrlsave)`ichnl, ictlno1, [ictlno2] [, ictlno3] ...`<br>


[**`ctrlselect `**](../opcodes/ctrlselect)`kpre`<br>


[**`initc14 `**](../opcodes/initc14)`ichan, ictlno1, ictlno2, ivalue`<br>


[**`initc21 `**](../opcodes/initc21)`ichan, ictlno1, ictlno2, ictlno3, ivalue`<br>


[**`initc7 `**](../opcodes/initc7)`ichan, ictlno, ivalue`<br>


[**`massign `**](../opcodes/massign)`ichnl, insnum[, ireset]`<br>
`massign ichnl, "insname"[, ireset]`<br>


`idest `[**`midic14 `**](../opcodes/midic14)`ictlno1, ictlno2, imin, imax [, ifn]`<br>
`kdest midic14 ictlno1, ictlno2, kmin, kmax [, ifn]`<br>


`idest `[**`midic21 `**](../opcodes/midic21)`ictlno1, ictlno2, ictlno3, imin, imax [, ifn]`<br>
`kdest midic21 ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn]`<br>


`idest `[**`midic7 `**](../opcodes/midic7)`ictlno, imin, imax [, ifn]`<br>
`kdest midic7 ictlno, kmin, kmax [, ifn]`<br>


`ival `[**`midictrl `**](../opcodes/midictrl)`inum [, imin] [, imax]`<br>
`kval midictrl inum [, imin] [, imax]`<br>


`ival `[**`notnum`**](../opcodes/notnum)<br>


`ibend `[**`pchbend `**](../opcodes/pchbend)`[imin] [, imax]`<br>
`kbend pchbend [imin] [, imax]`<br>


[**`pgmassign `**](../opcodes/pgmassign)`ipgm, inst[, ichn]`<br>
`pgmassign ipgm, "insname"[, ichn]`<br>


`ires `[**`polyaft `**](../opcodes/polyaft)`inote [, ilow] [, ihigh]`<br>
`kres polyaft inote [, ilow] [, ihigh]`<br>


`ival `[**`veloc `**](../opcodes/veloc)`[ilow] [, ihigh]`<br>


### Real-time MIDI:Output
[**`nrpn `**](../opcodes/nrpn)`kchan, kparmnum, kparmvalue`<br>


[**`outiat `**](../opcodes/outiat)`ichn, ivalue, imin, imax`<br>


[**`outic `**](../opcodes/outic)`ichn, inum, ivalue, imin, imax`<br>


[**`outic14 `**](../opcodes/outic14)`ichn, imsb, ilsb, ivalue, imin, imax`<br>


[**`outipat `**](../opcodes/outipat)`ichn, inotenum, ivalue, imin, imax`<br>


[**`outipb `**](../opcodes/outipb)`ichn, ivalue, imin, imax`<br>


[**`outipc `**](../opcodes/outipc)`ichn, iprog, imin, imax`<br>


[**`outkat `**](../opcodes/outkat)`kchn, kvalue, kmin, kmax`<br>


[**`outkc `**](../opcodes/outkc)`kchn, knum, kvalue, kmin, kmax`<br>


[**`outkc14 `**](../opcodes/outkc14)`kchn, kmsb, klsb, kvalue, kmin, kmax`<br>


[**`outkpat `**](../opcodes/outkpat)`kchn, knotenum, kvalue, kmin, kmax`<br>


[**`outkpb `**](../opcodes/outkpb)`kchn, kvalue, kmin, kmax`<br>


[**`outkpc `**](../opcodes/outkpc)`kchn, kprog, kmin, kmax`<br>


### Real-time MIDI:Converters
`iamp `[**`ampmidi `**](../opcodes/ampmidi)`iscal [, ifn]`<br>


`igain `[**`ampmidicurve `**](../opcodes/ampmidicurve)`ivelocity, idynamicrange, iexponent`<br>
`kgain ampmidicurve kvelocity, kdynamicrange, kexponent`<br>


`iamplitude `[**`ampmidid `**](../opcodes/ampmidid)`ivelocity, idecibels`<br>
`kamplitude ampmidid kvelocity, idecibels`<br>


`icps `[**`cpsmidi`**](../opcodes/cpsmidi)<br>


`icps `[**`cpsmidib `**](../opcodes/cpsmidib)`[irange]`<br>
`kcps cpsmidib [irange]`<br>


`icps `[**`cpstmid `**](../opcodes/cpstmid)`ifn`<br>


`ioct `[**`octmidi`**](../opcodes/octmidi)<br>


`ioct `[**`octmidib `**](../opcodes/octmidib)`[irange]`<br>
`koct octmidib [irange]`<br>


`ipch `[**`pchmidi`**](../opcodes/pchmidi)<br>


`ipch `[**`pchmidib `**](../opcodes/pchmidib)`[irange]`<br>
`kpch pchmidib [irange]`<br>


### Real-time MIDI:Generic I/O
`kstatus, kchan, kdata1, kdata2 `[**`midiin`**](../opcodes/midiin)<br>


[**`midiout `**](../opcodes/midiout)`kstatus, kchan, kdata1, kdata2`<br>


[**`midiout_i `**](../opcodes/midiout_i)`istatus, ichan, idata1, idata2`<br>


### Real-time MIDI:Event Extenders
`kflag `[**`lastcycle`**](../opcodes/lastcycle)<br>


`kflag `[**`release`**](../opcodes/release)<br>


[**`xtratim `**](../opcodes/xtratim)`iextradur`<br>


### Real-time MIDI:Note Output
`kMidiNoteNum, kTrigger `[**`midiarp `**](../opcodes/midiarp)`kRate[, kMode]`<br>


[**`midion `**](../opcodes/midion)`kchn, knum, kvel`<br>


[**`midion2 `**](../opcodes/midion2)`kchn, knum, kvel, ktrig`<br>


[**`moscil `**](../opcodes/moscil)`kchn, knum, kvel, kdur, kpause`<br>


[**`noteoff `**](../opcodes/noteoff)`ichn, inum, ivel`<br>


[**`noteon `**](../opcodes/noteon)`ichn, inum, ivel`<br>


[**`noteondur `**](../opcodes/noteondur)`ichn, inum, ivel, idur`<br>


[**`noteondur2 `**](../opcodes/noteondur2)`ichn, inum, ivel, idur`<br>


### Real-time MIDI:MIDI/Score Interoperability
[**`midichannelaftertouch `**](../opcodes/midichannelaftertouch)`xchannelaftertouch [, ilow] [, ihigh]`<br>


`ichn `[**`midichn`**](../opcodes/midichn)<br>


[**`midicontrolchange `**](../opcodes/midicontrolchange)`xcontroller, xcontrollervalue [, ilow] [, ihigh]`<br>


[**`mididefault `**](../opcodes/mididefault)`xdefault, xvalue`<br>


[**`midinoteoff `**](../opcodes/midinoteoff)`xkey, xvelocity`<br>


[**`midinoteoncps `**](../opcodes/midinoteoncps)`xcps, xvelocity`<br>


[**`midinoteonkey `**](../opcodes/midinoteonkey)`xkey, xvelocity`<br>


[**`midinoteonoct `**](../opcodes/midinoteonoct)`xoct, xvelocity`<br>


[**`midinoteonpch `**](../opcodes/midinoteonpch)`xpch, xvelocity`<br>


[**`midipitchbend `**](../opcodes/midipitchbend)`xpitchbend [, ilow] [, ihigh]`<br>


[**`midipolyaftertouch `**](../opcodes/midipolyaftertouch)`xpolyaftertouch, xkey [, ilow] [, ihigh]`<br>


[**`midiprogramchange `**](../opcodes/midiprogramchange)`xprogram`<br>


### Real-time MIDI:System Realtime
[**`mclock `**](../opcodes/mclock)`ifreq`<br>


[**`mrtmsg `**](../opcodes/mrtmsg)`imsgtype`<br>


### Real-time MIDI:Slider Banks
`i1, ..., i16 `[**`s16b14 `**](../opcodes/s16b14)`ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb16, ictlno_lsb16, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin16, imax16, initvalue16, ifn16`<br>
`k1, ..., k16 s16b14 ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb16, ictlno_lsb16, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin16, imax16, initvalue16, ifn16`<br>


`i1, ..., i32 `[**`s32b14 `**](../opcodes/s32b14)`ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb32, ictlno_lsb32, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin32, imax32, initvalue32, ifn32`<br>
`k1, ..., k32 s32b14 ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb32, ictlno_lsb32, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin32, imax32, initvalue32, ifn32`<br>


`i1, ..., i16 `[**`slider16 `**](../opcodes/slider16)`ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16`<br>
`k1, ..., k16 slider16 ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16`<br>


`k1, ..., k16 `[**`slider16f `**](../opcodes/slider16f)`ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum16, imin16, imax16, init16, ifn16, icutoff16`<br>


`kflag `[**`slider16table `**](../opcodes/slider16table)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16`<br>


`kflag `[**`slider16tablef `**](../opcodes/slider16tablef)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16, icutoff16`<br>


`i1, ..., i32 `[**`slider32 `**](../opcodes/slider32)`ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32`<br>
`k1, ..., k32 slider32 ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32`<br>


`k1, ..., k32 `[**`slider32f `**](../opcodes/slider32f)`ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum32, imin32, imax32, init32, ifn32, icutoff32`<br>


`kflag `[**`slider32table `**](../opcodes/slider32table)`ichan, ioutTable, ioffset, ictlnum1, imin1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imax1, init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32`<br>


`kflag `[**`slider32tablef `**](../opcodes/slider32tablef)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32, icutoff32`<br>


`i1, ..., i64 `[**`slider64 `**](../opcodes/slider64)`ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64`<br>
`k1, ..., k64 slider64 ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64`<br>


`k1, ..., k64 `[**`slider64f `**](../opcodes/slider64f)`ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum64, imin64, imax64, init64, ifn64, icutoff64`<br>


`kflag `[**`slider64table `**](../opcodes/slider64table)`ichan, ioutTable, ioffset, ictlnum1, imin1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imax1, init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64`<br>


`kflag `[**`slider64tablef `**](../opcodes/slider64tablef)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64, icutoff64`<br>


`i1, ..., i8 `[**`slider8 `**](../opcodes/slider8)`ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8`<br>
`k1, ..., k8 slider8 ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8`<br>


`k1, ..., k8 `[**`slider8f `**](../opcodes/slider8f)`ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum8, imin8, imax8, init8, ifn8, icutoff8`<br>


`kflag `[**`slider8table `**](../opcodes/slider8table)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, ..., ictlnum8, imin8, imax8, init8, ifn8`<br>


`kflag `[**`slider8tablef `**](../opcodes/slider8tablef)`ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8, icutoff8`<br>


`k1, k2, ...., k16 `[**`sliderKawai `**](../opcodes/sliderkawai)`imin1, imax1, init1, ifn1, imin2, imax2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init2, ifn2, ..., imin16, imax16, init16, ifn16`<br>


### MIDI files:MIDI input and Initialization
`ksig  `[**`midifilestatus`**](../opcodes/midifilestatus)<br>


### Signal Flow Graph Opcodes
[**`alwayson `**](../opcodes/alwayson)`Tinstrument [p4, ..., pn]`<br>


[**`connect `**](../opcodes/connect)`Tsource1, Soutlet1, Tsink1, Sinlet1`<br>


`ifno `[**`ftgenonce `**](../opcodes/ftgenonce)`ip1, ip2dummy, isize, igen, iarga, iargb, ...`<br>


`asignal `[**`inleta `**](../opcodes/inleta)`Sname`<br>


`fsignal `[**`inletf `**](../opcodes/inletf)`Sname`<br>


`ksignal `[**`inletk `**](../opcodes/inletk)`Sname`<br>


`ksignal `[**`inletkid `**](../opcodes/inletkid)`Sname, SinstanceID`<br>


`array `[**`inletv `**](../opcodes/inletv)`Sname`<br>


[**`outleta `**](../opcodes/outleta)`Sname, asignal`<br>


[**`outletf `**](../opcodes/outletf)`Sname, fsignal`<br>


[**`outletk `**](../opcodes/outletk)`Sname, ksignal`<br>


[**`outletkid `**](../opcodes/outletkid)`Sname, SinstanceID, ksignal`<br>


[**`outletv `**](../opcodes/outletv)`Sname, array`<br>


### Spectral Processing:STFT
`ares `[**`pvadd `**](../opcodes/pvadd)`ktimpnt, kfmod, ifilcod, ifn, ibins [, ibinoffset] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ibinincr] [, iextractmode] [, ifreqlim] [, igatefn]`<br>


[**`pvbufread `**](../opcodes/pvbufread)`ktimpnt, ifile`<br>


`ares `[**`pvcross `**](../opcodes/pvcross)`ktimpnt, kfmod, ifile, kampscale1, kampscale2 [, ispecwp]`<br>


`ares `[**`pvinterp `**](../opcodes/pvinterp)`ktimpnt, kfmod, ifile, kfreqscale1, kfreqscale2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscale1, kampscale2, kfreqinterp, kampinterp`<br>


`ares `[**`pvoc `**](../opcodes/pvoc)`ktimpnt, kfmod, ifilcod [, ispecwp] [, iextractmode] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreqlim] [, igatefn]`<br>


`kfreq, kamp `[**`pvread `**](../opcodes/pvread)`ktimpnt, ifile, ibin`<br>


[**`tableseg `**](../opcodes/tableseg)`ifn1, idur1, ifn2 [, idur2] [, ifn3] [...]`<br>


[**`tablexseg `**](../opcodes/tablexseg)`ifn1, idur1, ifn2 [, idur2] [, ifn3] [...]`<br>


`ares `[**`vpvoc `**](../opcodes/vpvoc)`ktimpnt, kfmod, ifile [, ispecwp] [, ifn]`<br>


### Spectral Processing:LPC
`ares `[**`allpole `**](../opcodes/allpole)`asig, kCoef[]`<br>


`kPar[]`[**`apoleparams `**](../opcodes/apoleparams)`kCoef[]`<br>


`kCoef[],krms,kerr,kcps `[**`lpcanal `**](../opcodes/lpcanal)`asrc, kflg, kprd, isiz, iord [, iwin]`<br>
`kCoef[],krms,kerr,kcps lpcanal koff, kflg, ifn, isiz, iord [, iwin]`<br>
`iCoef[],irms,ierr,icps lpcanal ioff, iflg, ifn, isiz, iord [, iwin]`<br>


`ares `[**`lpcfilter `**](../opcodes/lpcfilter)`asig, asrc, kflg, kprd, isiz, iord [, iwin]`<br>
`ares lpcfilter asig, koff, kflg, ifn, isiz, iord [, iwin]`<br>


`ares `[**`lpfreson `**](../opcodes/lpfreson)`asig, kfrqratio`<br>


[**`lpinterp `**](../opcodes/lpinterp)`islot1, islot2, kmix`<br>


`krmsr, krmso, kerr, kcps `[**`lpread `**](../opcodes/lpread)`ktimpnt, ifilcod [, inpoles] [, ifrmrate]`<br>


`ares `[**`lpreson `**](../opcodes/lpreson)`asig`<br>


[**`lpslot `**](../opcodes/lpslot)`islot`<br>


`kCoef[], krms, kerr  `[**`pvscfs `**](../opcodes/pvscfs)`fsig, iord [, imod]`<br>


`fsig `[**`pvslpc `**](../opcodes/pvslpc)`asrc, idftsiz, ihop, iord [, iwin]`<br>


`asig `[**`resonbnk `**](../opcodes/resonbnk)`ain, kPar[], kmin, kmax, iper [, imode, iscal, iskip]`<br>


### Spectral Processing:Non-Standard
`wsig `[**`specaddm `**](../opcodes/specaddm)`wsig1, wsig2 [, imul2]`<br>


`wsig `[**`specdiff `**](../opcodes/specdiff)`wsigin`<br>


[**`specdisp `**](../opcodes/specdisp)`wsig, iprd [, iwtflg]`<br>


`wsig `[**`specfilt `**](../opcodes/specfilt)`wsigin, ifhtim`<br>


`wsig `[**`spechist `**](../opcodes/spechist)`wsigin`<br>


`koct, kamp `[**`specptrk `**](../opcodes/specptrk)`wsig, kvar, ilo, ihi, istr, idbthresh, inptls, irolloff \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iodd] [, iconfs] [, interp] [, ifprd] [, iwtflg]`<br>


`wsig `[**`specscal `**](../opcodes/specscal)`wsigin, ifscale, ifthresh`<br>


`ksum `[**`specsum `**](../opcodes/specsum)`wsig [, interp]`<br>


`wsig `[**`spectrum `**](../opcodes/spectrum)`xsig, iprd, iocts, ifrqa [, iq] [, ihann] [, idbout] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idsprd] [, idsinrs]`<br>


### Spectral Processing:Streaming
`fsig `[**`binit `**](../opcodes/binit)`fin, isize`<br>


[**`part2txt `**](../opcodes/part2txt)`SFile, ftrks`<br>


`ftrks `[**`partials `**](../opcodes/partials)`ffr, fphs, kthresh, kminpts, kmaxgap, imaxtracks`<br>


`kframe `[**`pvs2tab `**](../opcodes/pvs2tab)`tvar|kvar[], fsig`<br>
`kframe pvs2tab kmags[], kfreqs[], fsig`<br>


`ares `[**`pvsadsyn `**](../opcodes/pvsadsyn)`fsrc, inoscs, kfmod [, ibinoffset] [, ibinincr] [, iinit]`<br>


`fsig `[**`pvsanal `**](../opcodes/pvsanal)`ain, ifftsize, ioverlap, iwinsize, iwintype [, iformat] [, iinit]`<br>


`fsig `[**`pvsarp `**](../opcodes/pvsarp)`fsigin, kbin, kdepth, kgain`<br>


`fsig `[**`pvsbandp `**](../opcodes/pvsbandp)`fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype]`<br>


`fsig `[**`pvsbandr `**](../opcodes/pvsbandr)`fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype]`<br>


`kbnd `[**`pvsbandwidth `**](../opcodes/pvsbandwidth)`fsig`<br>


`kamp, kfr `[**`pvsbin `**](../opcodes/pvsbin)`fsig, kbin`<br>


`fsig `[**`pvsblur `**](../opcodes/pvsblur)`fsigin, kblurtime, imaxdel`<br>


`ihandle, ktime  `[**`pvsbuffer `**](../opcodes/pvsbuffer)`fsig, ilen`<br>


`fsig `[**`pvsbufread `**](../opcodes/pvsbufread)` ktime, khandle [, ilo, ihi, iclear]`<br>


`fsig `[**`pvsbufread2 `**](../opcodes/pvsbufread2)` ktime, khandle, ift1, ift2`<br>


`fsig `[**`pvscale `**](../opcodes/pvscale)`fsigin, kscal [, kkeepform, kgain, kcoefs]`<br>


`kcent `[**`pvscent `**](../opcodes/pvscent)`fsig`<br>
`acent pvscent fsig`<br>


`keps[] `[**`pvsceps `**](../opcodes/pvsceps)`fsig[, icoefs]`<br>


`fsig `[**`pvscross `**](../opcodes/pvscross)`fsrc, fdest, kamp1, kamp2`<br>


`fsig `[**`pvsdemix `**](../opcodes/pvsdemix)`fleft, fright, kpos, kwidth, ipoints`<br>


`fsig `[**`pvsdiskin `**](../opcodes/pvsdiskin)`SFname, ktscal, kgain [, ioffset, ichan]`<br>


[**`pvsdisp `**](../opcodes/pvsdisp)`fsig [, ibins, iwtflg]`<br>


`fsig `[**`pvsfilter `**](../opcodes/pvsfilter)`fsigin, fsigfil, kdepth [, igain]`<br>


`fsig `[**`pvsfread `**](../opcodes/pvsfread)`ktimpt, ifn [, ichan]`<br>


`fsig `[**`pvsfreeze `**](../opcodes/pvsfreeze)`fsigin, kfreeza, kfreezf`<br>


[**`pvsftr `**](../opcodes/pvsftr)`fsrc, ifna [, ifnf]`<br>


`kflag `[**`pvsftw `**](../opcodes/pvsftw)`fsrc, ifna [, ifnf]`<br>


[**`pvsfwrite `**](../opcodes/pvsfwrite)`fsig, ifile`<br>


`fsig `[**`pvsgain `**](../opcodes/pvsgain)`fsigin, kgain`<br>


`fsig `[**`pvshift `**](../opcodes/pvshift)`fsigin, kshift, klowest [, kkeepform, igain, kcoefs]`<br>


`ffr, fphs `[**`pvsifd `**](../opcodes/pvsifd)`ain, ifftsize, ihopsize, iwintype [,iscal]`<br>


`fsig `[**`pvsin `**](../opcodes/pvsin)`kchan [, isize, iolap, iwinsize, iwintype, iformat]`<br>


`ioverlap, inumbins, iwinsize, iformat `[**`pvsinfo `**](../opcodes/pvsinfo)`fsrc`<br>


`fsig `[**`pvsinit `**](../opcodes/pvsinit)`isize [, iolap, iwinsize, iwintype, iformat]`<br>


`fsig `[**`pvsmaska `**](../opcodes/pvsmaska)`fsrc, ifn, kdepth`<br>


`fsig `[**`pvsmix `**](../opcodes/pvsmix)`fsigin1, fsigin2`<br>


`fsig `[**`pvsmooth `**](../opcodes/pvsmooth)`fsigin, kacf, kfcf`<br>


`fsig `[**`pvsmorph `**](../opcodes/pvsmorph)`fsig1, fsig2, kampint, kfrqint`<br>


`fsig `[**`pvsosc `**](../opcodes/pvsosc)`kamp, kfreq, ktype, isize [,ioverlap] [, iwinsize] [, iwintype] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iformat]`<br>


[**`pvsout `**](../opcodes/pvsout)`fsig, kchan`<br>


`kfr, kamp `[**`pvspitch `**](../opcodes/pvspitch)`fsig, kthresh`<br>


`fsig `[**`pvstanal `**](../opcodes/pvstanal)`ktimescal, kamp, kpitch, ktab, [kdetect, kwrap, ioffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifftsize, ihop, idbthresh]`<br>
``<br>


`fsig `[**`pvstencil `**](../opcodes/pvstencil)`fsigin, kgain, klevel, iftable`<br>


`fsig `[**`pvstrace `**](../opcodes/pvstrace)`fsigin, kn`<br>
`fsig, kBins[] pvstrace fsigin, kn [, isort, imin, imax]`<br>


`fsig `[**`pvsvoc `**](../opcodes/pvsvoc)`famp, fexc, kdepth, kgain [, kcoefs]`<br>


`fsig `[**`pvswarp `**](../opcodes/pvswarp)`fsigin, kscal, kshift [, klowest, kmeth, kgain, kcoefs]`<br>


`ares `[**`pvsynth `**](../opcodes/pvsynth)`fsrc, [iinit]`<br>


`asig `[**`resyn `**](../opcodes/resyn)`fin, kscal, kpitch, kmaxtracks, ifn`<br>


`asig `[**`sinsyn `**](../opcodes/sinsyn)`fin, kscal, kmaxtracks, ifn`<br>


`fsig `[**`tab2pvs `**](../opcodes/tab2pvs)`tvar|karr[] [, ihopsize, iwinsize, iwintype]`<br>
`fsig tab2pvs kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype]`<br>


`ffr,fphs `[**`tabifd `**](../opcodes/tabifd)`ktimpt, kamp, kpitch, ifftsize, ihopsize, iwintype,ifn`<br>


`asig `[**`tradsyn `**](../opcodes/tradsyn)`fin, kscal, kpitch, kmaxtracks, ifn`<br>


`fsig `[**`trcross `**](../opcodes/trcross)`fin1, fin2, ksearch, kdepth [, kmode]`<br>


`fsig `[**`trfilter `**](../opcodes/trfilter)`fin, kamnt, ifn`<br>


`fsig, kfr, kamp `[**`trhighest `**](../opcodes/trhighest)`fin1, kscal`<br>


`fsig, kfr, kamp `[**`trlowest `**](../opcodes/trlowest)`fin1, kscal`<br>


`fsig `[**`trmix `**](../opcodes/trmix)`fin1, fin2`<br>


`fsig `[**`trscale `**](../opcodes/trscale)`fin, kpitch [, kgain]`<br>


`fsig `[**`trshift `**](../opcodes/trshift)`fin, kpshift [, kgain]`<br>


`fsiglow, fsighi `[**`trsplit `**](../opcodes/trsplit)`fin, ksplit [, kgainlow, kgainhigh]`<br>


### Spectral Processing:ATS
`ar `[**`ATSadd `**](../opcodes/ATSadd)`ktimepnt, kfmod, iatsfile, ifn, ipartials [, ipartialoffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ipartialincr, igatefn]`<br>


`ar `[**`ATSaddnz `**](../opcodes/ATSaddnz)`ktimepnt, iatsfile, ibands [, ibandoffset, ibandincr]`<br>


[**`ATSbufread `**](../opcodes/ATSbufread)`ktimepnt, kfmod, iatsfile, ipartials [, ipartialoffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ipartialincr]`<br>


`ar `[**`ATScross `**](../opcodes/ATScross)`ktimepnt, kfmod, iatsfile, ifn, kmylev, kbuflev, ipartials \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipartialoffset, ipartialincr]`<br>


`idata `[**`ATSinfo `**](../opcodes/ATSinfo)`iatsfile, ilocation`<br>


`kamp `[**`ATSinterpread `**](../opcodes/ATSinterpread)`kfreq`<br>


`kfrq, kamp `[**`ATSpartialtap `**](../opcodes/ATSpartialtap)`ipartialnum`<br>


`kfreq, kamp `[**`ATSread `**](../opcodes/ATSread)`ktimepnt, iatsfile, ipartial`<br>


`kenergy `[**`ATSreadnz `**](../opcodes/ATSreadnz)`ktimepnt, iatsfile, iband`<br>


`ar `[**`ATSsinnoi `**](../opcodes/ATSsinnoi)`ktimepnt, ksinlev, knzlev, kfmod, iatsfile, ipartials \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipartialoffset, ipartialincr]`<br>


### Spectral Processing:Other
`kcent `[**`centroid `**](../opcodes/centroid)`asig, ktrig, ifftsize`<br>


`asig [,asig2] `[**`filescal `**](../opcodes/filescal)`ktimescal, kamp, kpitch, Sfile, klock \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,ifftsize, idecim, ithresh]`<br>


`asig `[**`mincer `**](../opcodes/mincer)`atimpt, kamp, kpitch, ktab, klock [ ,ifftsize, idecim]`<br>


`asig, asig2, ktime `[**`mp3scal `**](../opcodes/mp3scal)`Sfile, ktimescal, kpitch, kamp \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iskip, ifftsize, idecim, ilock]`<br>
``<br>


`asig `[**`paulstretch `**](../opcodes/paulstretch)`istretch, iwindowsize, ift`<br>


`asig `[**`temposcal `**](../opcodes/temposcal)`ktimescal, kamp, kpitch, ktab, klock [,ifftsize, idecim, ithresh]`<br>


### Strings:Definition
`Sdst `[**`strfromurl `**](../opcodes/strfromurl)`StringURL`<br>


`Sdst `[**`strget `**](../opcodes/strget)`indx`<br>


[**`strset `**](../opcodes/strset)`iarg, istring`<br>


### Strings:Manipulation
[**`puts `**](../opcodes/puts)`Sstr, ktrig [, inonl]`<br>


`Sdst `[**`sprintf `**](../opcodes/sprintf)`Sfmt, xarg1[, xarg2[, ... ]]`<br>


`Sdst `[**`sprintfk `**](../opcodes/sprintfk)`Sfmt, xarg1[, xarg2[, ... ]]`<br>


`Sdst `[**`strcat `**](../opcodes/strcat)`Ssrc1, Ssrc2`<br>


`Sdst `[**`strcatk `**](../opcodes/strcatk)`Ssrc1, Ssrc2`<br>


`ires `[**`strcmp `**](../opcodes/strcmp)`S1, S2`<br>


`kres `[**`strcmpk `**](../opcodes/strcmpk)`S1, S2`<br>


`Sdst `[**`strcpy `**](../opcodes/strcpy)`Ssrc`<br>
`Sdst = Ssrc`<br>


`Sdst `[**`strcpyk `**](../opcodes/strcpyk)`Ssrc`<br>


`ipos `[**`strindex `**](../opcodes/strindex)`S1, S2`<br>


`kpos `[**`strindexk `**](../opcodes/strindexk)`S1, S2`<br>


`ilen `[**`strlen `**](../opcodes/strlen)`Sstr`<br>


`klen `[**`strlenk `**](../opcodes/strlenk)`Sstr`<br>


`ipos `[**`strrindex `**](../opcodes/strrindex)`S1, S2`<br>


`kpos `[**`strrindexk `**](../opcodes/strrindexk)`S1, S2`<br>


`Sout `[**`strstrip `**](../opcodes/strstrip)`Sin [, Smode]`<br>


`Sdst `[**`strsub `**](../opcodes/strsub)`Ssrc [, istart[, iend]]`<br>


`Sdst `[**`strsubk `**](../opcodes/strsubk)`Ssrc, kstart, kend`<br>


### Strings:Conversion
`ichr `[**`strchar `**](../opcodes/strchar)`Sstr [, ipos]`<br>


`kchr `[**`strchark `**](../opcodes/strchark)`Sstr [, kpos]`<br>


`Sdst `[**`strlower `**](../opcodes/strlower)`Ssrc`<br>


`Sdst `[**`strlowerk `**](../opcodes/strlowerk)`Ssrc`<br>


`ir `[**`strtod `**](../opcodes/strtod)`Sstr`<br>
`ir strtod indx`<br>


`kr `[**`strtodk `**](../opcodes/strtodk)`Sstr`<br>
`kr strtodk kndx`<br>


`ir `[**`strtol `**](../opcodes/strtol)`Sstr`<br>
`ir strtol indx`<br>


`kr `[**`strtolk `**](../opcodes/strtolk)`Sstr`<br>
`kr strtolk kndx`<br>


`Sdst `[**`strupper `**](../opcodes/strupper)`Ssrc`<br>


`Sdst `[**`strupperk `**](../opcodes/strupperk)`Ssrc`<br>


### Vectorial:Tables
[**`vtaba `**](../opcodes/vtaba)` andx, ifn, aout1 [, aout2, aout3, .... , aoutN ]`<br>


[**`vtabi `**](../opcodes/vtabi)` indx, ifn, iout1 [, iout2, iout3, .... , ioutN ]`<br>


[**`vtabk `**](../opcodes/vtabk)` kndx, ifn, kout1 [, kout2, kout3, .... , koutN ]`<br>


[**`vtable1k `**](../opcodes/vtable1k)` kfn, kout1 [, kout2, kout3, .... , koutN ]`<br>


[**`vtablea `**](../opcodes/vtablea)` andx, kfn, kinterp, ixmode, aout1 [, aout2, aout3, .... , aoutN ]`<br>


[**`vtablei `**](../opcodes/vtablei)` indx, ifn, interp, ixmode, iout1 [, iout2, iout3, .... , ioutN ]`<br>


[**`vtablek `**](../opcodes/vtablek)` kndx, kfn, kinterp, ixmode, kout1 [, kout2, kout3, .... , koutN ]`<br>


[**`vtablewa `**](../opcodes/vtablewa)` andx, kfn, ixmode, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ]`<br>


[**`vtablewi `**](../opcodes/vtablewi)` indx, ifn, ixmode, inarg1 [, inarg2, inarg3 , .... , inargN ]`<br>


[**`vtablewk `**](../opcodes/vtablewk)` kndx, kfn, ixmode, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ]`<br>


[**`vtabwa `**](../opcodes/vtabwa)` andx, ifn, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ]`<br>


[**`vtabwi `**](../opcodes/vtabwi)` indx, ifn, inarg1 [, inarg2, inarg3 , .... , inargN ]`<br>


[**`vtabwk `**](../opcodes/vtabwk)` kndx, ifn, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ]`<br>


### Vectorial:Scalar operations
[**`vadd `**](../opcodes/vadd)` ifn, kval, kelements [, kdstoffset] [, kverbose]`<br>


[**`vadd_i `**](../opcodes/vadd_i)` ifn, ival, ielements [, idstoffset]`<br>


[**`vexp `**](../opcodes/vexp)` ifn, kval, kelements [, kdstoffset] [, kverbose]`<br>


[**`vexp_i `**](../opcodes/vexp_i)` ifn, ival, ielements [, idstoffset]`<br>


[**`vmult `**](../opcodes/vmult)` ifn, kval, kelements [, kdstoffset] [, kverbose]`<br>


[**`vmult_i `**](../opcodes/vmult_i)` ifn, ival, ielements [, idstoffset]`<br>


[**`vpow `**](../opcodes/vpow)` ifn, kval, kelements [, kdstoffset] [, kverbose]`<br>


[**`vpow_i `**](../opcodes/vpow_i)` ifn, ival, ielements [, idstoffset]`<br>


### Vectorial:Vectorial operations
[**`vaddv `**](../opcodes/vaddv)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vaddv_i `**](../opcodes/vaddv_i)` ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


[**`vcopy `**](../opcodes/vcopy)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [, kverbose]`<br>


[**`vcopy_i `**](../opcodes/vcopy_i)` ifn1, ifn2, ielements [,idstoffset, isrcoffset]`<br>


[**`vdivv `**](../opcodes/vdivv)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vdivv_i `**](../opcodes/vdivv_i)` ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


[**`vexpv `**](../opcodes/vexpv)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vexpv_i `**](../opcodes/vexpv_i)` ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


[**`vmap `**](../opcodes/vmap)` ifn1, ifn2, ielements [,idstoffset, isrcoffset]`<br>


[**`vmultv `**](../opcodes/vmultv)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vmultv_i `**](../opcodes/vmultv_i)` ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


[**`vpowv `**](../opcodes/vpowv)`ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vpowv_i `**](../opcodes/vpowv_i)`ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


[**`vsubv `**](../opcodes/vsubv)` ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose]`<br>


[**`vsubv_i `**](../opcodes/vsubv_i)` ifn1, ifn2, ielements [, idstoffset] [, isrcoffset]`<br>


### Vectorial:Envelopes
[**`vexpseg `**](../opcodes/vexpseg)` ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]]`<br>


[**`vlinseg `**](../opcodes/vlinseg)` ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]]`<br>


### Vectorial:Limiting and Wrapping
[**`vlimit `**](../opcodes/vlimit)` ifn, kmin, kmax, ielements`<br>


[**`vmirror `**](../opcodes/vmirror)` ifn, kmin, kmax, ielements`<br>


[**`vwrap `**](../opcodes/vwrap)` ifn, kmin, kmax, ielements`<br>


### Vectorial:Delay Paths
`kout `[**`vdelayk `**](../opcodes/vdelayk)` ksig, kdel, imaxdel [, iskip, imode]`<br>


[**`vecdelay `**](../opcodes/vecdelay)` ifn, ifnIn, ifnDel, ielements, imaxdel [, iskip]`<br>


[**`vport `**](../opcodes/vport)`ifn, khtime, ielements [, ifnInit]`<br>


### Vectorial:Random
[**`vrandh `**](../opcodes/vrandh)` ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, isize] [, ioffset]`<br>


[**`vrandi `**](../opcodes/vrandi)` ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, isize] [, ioffset]`<br>


### Vectorial:Cellular Automata
[**`cell `**](../opcodes/cell)`ktrig, kreinit, ioutFunc, initStateFunc, iRuleFunc, ielements`<br>


[**`vcella `**](../opcodes/vcella)`ktrig, kreinit, ioutFunc, initStateFunc, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iRuleFunc, ielements, irulelen [, iradius]`<br>


### Zak Patch System
[**`zacl `**](../opcodes/zacl)`kfirst [, klast]`<br>


[**`zakinit `**](../opcodes/zakinit)`isizea, isizek`<br>


`ares `[**`zamod `**](../opcodes/zamod)`asig, kzamod`<br>


`ares `[**`zar `**](../opcodes/zar)`kndx`<br>


`ares `[**`zarg `**](../opcodes/zarg)`kndx, kgain`<br>


[**`zaw `**](../opcodes/zaw)`asig, kndx`<br>


[**`zawm `**](../opcodes/zawm)`asig, kndx [, imix]`<br>


`ir `[**`zir `**](../opcodes/zir)`indx`<br>


[**`ziw `**](../opcodes/ziw)`isig, indx`<br>


[**`ziwm `**](../opcodes/ziwm)`isig, indx [, imix]`<br>


[**`zkcl `**](../opcodes/zkcl)`kfirst, klast`<br>


`kres `[**`zkmod `**](../opcodes/zkmod)`ksig, kzkmod`<br>


`kres `[**`zkr `**](../opcodes/zkr)`kndx`<br>


[**`zkw `**](../opcodes/zkw)`kval, kndx`<br>


[**`zkwm `**](../opcodes/zkwm)`ksig, kndx [, imix]`<br>


### OSC
[**`OSCbundle `**](../opcodes/OSCbundle)`kwhen, ihost, iport, Sdest[], Stype[], kArgs[][] [, isize]`<br>


`kans `[**`OSCcount`**](../opcodes/OSCcount)<br>


`ihandle `[**`OSCinit `**](../opcodes/OSCinit)`iport`<br>


`ihandle `[**`OSCinitM `**](../opcodes/OSCinitM)`Sgroup, iport`<br>


`kans `[**`OSClisten `**](../opcodes/OSClisten)`ihandle, idest, itype [, xdata1, xdata2, ...]`<br>
`kans, kdata[] OSClisten ihandle, idest, itype`<br>
`kans, ... OSClisten idest, itype`<br>
``<br>


`Smess[], klen `[**`OSCraw `**](../opcodes/OSCraw)`iport`<br>


[**`OSCsend `**](../opcodes/OSCsend)`kwhen, ihost, iport, idestination [, itype , xdata1, xdata2, ...]`<br>


### Network
[**`remoteport `**](../opcodes/remoteport)`iportnum`<br>


`asig `[**`sockrecv `**](../opcodes/sockrecv)`iport, ilength`<br>
`ksig sockrecv iport, ilength`<br>
`asigl, asigr sockrecvs iport, ilength`<br>
`String sockrecv iport, ilength`<br>
`asig [,kstate] strecv Sipaddr, iport`<br>


[**`socksend `**](../opcodes/socksend)`asig, Sipaddr, iport, ilength`<br>
`socksend ksig, Sipaddr, iport, ilength`<br>
`socksends asigl, asigr, Sipaddr, iport, ilength`<br>
`stsend asig, Sipaddr, iport`<br>


### Remote Opcodes
[**`insglobal `**](../opcodes/insglobal)`isource, instrnum [,instrnum...]`<br>


[**`insremot `**](../opcodes/insremot)`idestination, isource, instrnum [, instrnum...]`<br>


[**`midglobal `**](../opcodes/midglobal)`isource, instrnum [, instrnum...]`<br>


[**`midremot `**](../opcodes/midremot)`idestination, isource, instrnum [, instrnum...]`<br>


### Mixer Opcodes
[**`MixerClear`**](../opcodes/mixerclear)<br>


`kgain `[**`MixerGetLevel `**](../opcodes/mixergetlevel)`isend, ibuss`<br>


`asignal `[**`MixerReceive `**](../opcodes/mixerreceive)`ibuss, ichannel`<br>


[**`MixerSend `**](../opcodes/mixersend)`asignal, isend, ibuss, ichannel`<br>


[**`MixerSetLevel `**](../opcodes/mixersetlevel)`isend, ibuss, kgain`<br>


[**`MixerSetLevel_i `**](../opcodes/mixersetlevel_i)`isend, ibuss, igain`<br>


### Array Opcodes
[**`copya2ftab `**](../opcodes/copya2ftab)`kArray[], ktab [, koffset]`<br>
`copya2ftab iArray[], itab [, ioffset]`<br>


[**`copyf2array `**](../opcodes/copyf2array)`tab, kftbl`<br>


`kout1[], kout2[] `[**`deinterleave `**](../opcodes/deinterleave)`kin[]`<br>


`i/kout[] `[**`getcol `**](../opcodes/getcol)`i/kin[], i/kcol`<br>


`i/kout[] `[**`getrow `**](../opcodes/getrow)`i/kin[], i/krow`<br>


`kout[] `[**`interleave `**](../opcodes/interleave)`kin1[], kin2[]`<br>


`kmax [,kindx] `[**`maxarray `**](../opcodes/maxarray)`karray`<br>


`kmin [,kindx] `[**`minarray `**](../opcodes/minarray)`karray`<br>


[**`printarray `**](../opcodes/printarray)`ixs[] [, Smft, Slabel ]`<br>
`printarray kxs[] [, ktrig, Sfmt, Slabel ]`<br>


`kres/ires `[**`product `**](../opcodes/productarray)`karr[]/iarr[]  (k- or i-arrays )`<br>


[**`reshapearray `**](../opcodes/reshapearray)`array[], isize0 [, isize1 ]`<br>


[**`scalearray `**](../opcodes/scalearray)`tarray, kmin, kmax[, kleft, kright]`<br>


`i/kout[] `[**`setcol `**](../opcodes/setcol)`i/kin[], i/kcol`<br>


`i/kout[] `[**`setrow `**](../opcodes/setrow)`i/kin[], i/krow`<br>


`kout[] `[**`shiftin `**](../opcodes/shiftin)`asig`<br>


`asig `[**`shiftout `**](../opcodes/shiftout)`kIn[] [, ioff]`<br>


`ksum `[**`sumarray `**](../opcodes/sumarray)`karray`<br>


`kout[] `[**`tab2array `**](../opcodes/tab2array)`ifn [, kstart, kend, kstep ]`<br>
`iout[] tab2array ifn [, istart, iend, istep ]`<br>


`trim_i iarray, ilen`<br>
[**`trim`**](../opcodes/trim)` xarray, klen`<br>


### Array Operations: Fast Fourier Transform
`kout[] `[**`fft `**](../opcodes/fft)`kin[]`<br>


`kout[] `[**`fftinv `**](../opcodes/ifft)`kin[]`<br>


`kout[] `[**`rfft `**](../opcodes/rfft)`kin[]`<br>


`kout[] `[**`rifft `**](../opcodes/rifft)`kin[]`<br>


`kout[] `[**`unwrap `**](../opcodes/unwrap)`kin[]`<br>


`kout[] `[**`window `**](../opcodes/window)`kin[] [, koff, itype]`<br>


### Array Operations: complex numbers
`kout[] `[**`c2r `**](../opcodes/c2r)`kin[]`<br>


`kout[] `[**`cmplxprod `**](../opcodes/cmplxprod)`kin1[], kin2[]`<br>


`kout[] `[**`mags `**](../opcodes/mags)`kin[]`<br>


`kout[] `[**`phs `**](../opcodes/phs)`kin[]`<br>


`kout[] `[**`pol2rect `**](../opcodes/pol2rect)`kin[]`<br>
`kout[] pol2rect kmags[], kphs[]`<br>


`kout[] `[**`r2c `**](../opcodes/r2c)`kin[]`<br>


`kout[] `[**`rect2pol `**](../opcodes/rect2pol)`kin[]`<br>


### Array Operations: dot product
`kres/ires `[**`dot `**](../opcodes/dot)`karr1[]/iarr1[], karr2[]/iarr2[]   (k- or i-arrays )`<br>


### Array Operations: sorting
`k/i[] `[**`sorta `**](../opcodes/sorta)`k/i[]  (k- or i-arrays )`<br>


`k/i[] `[**`sortd `**](../opcodes/sortd)`k/i[]  (k- or i-arrays )`<br>


### Array Operations: Cepstrum
`keps[] `[**`ceps `**](../opcodes/ceps)`kmags[] [, icoefs]`<br>


`kenv `[**`cepsinv `**](../opcodes/cepsinv)`keps[]`<br>


### Array Operations: Autocorrelation
`kout[] `[**`autocorr `**](../opcodes/autocorr)`kin[]`<br>


### Array Operations: Discrete Cosine Transform
`kout[] `[**`dct `**](../opcodes/dct)`kin[]`<br>
`iout[] dct iin[]`<br>


`kout[] `[**`dctinv `**](../opcodes/dctinv)`kin[]`<br>
`iout[] dctinv iin[]`<br>


### Array Operations: Mel scale filterbank
`kout[] `[**`mfb `**](../opcodes/mfb)`kin[], klow, khigh, ibands`<br>


### Deprecated
[**`tableiw `**](../opcodes/tableiw)`isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode]`<br>


### Miscellaneous
`SFiles[] `[**`directory `**](../opcodes/directory)`SDirectory [, SExtention]`<br>


`kout[] `[**`framebuffer `**](../opcodes/framebuffer)`ain, isize`<br>
`aout framebuffer kin, isize`<br>


[**`modmatrix `**](../opcodes/modmatrix)`iresfn, isrcmodfn, isrcparmfn, imodscale, inum_mod, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`inum_parm, kupdate`<br>


`idacc, iadcc `[**`nchnls_hw`**](../opcodes/nchnls_hw)<br>


`aout `[**`olabuffer `**](../opcodes/olabuffer)`kin, ioverlap`<br>


`Sres `[**`pwd`**](../opcodes/pwd)<br>


`aout `[**`select `**](../opcodes/select)`a1, a2, aless, aequal, amore`<br>


`ires system_i itrig, Scmd, [inowait]`<br>
`kres `[**`system`**](../opcodes/system)` ktrig, Scmd, [knowait]`<br>


[**`tableshuffle `**](../opcodes/tableshuffle)`ktablenum`<br>
`tableshufflei itablenum`<br>


### Utilities
`kmom, kint, kshort `[**`lufs `**](../opcodes/lufs)`kreset, ain1 [, ain2]`<br>


