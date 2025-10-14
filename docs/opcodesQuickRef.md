<!-- Don't modify this file.
 It is generated automatically by makeAppendices.py-->
# **Opcode Quick Reference**

### Orchestra Syntax:Header
[**`0dbfs`**](opcodes/0dbfs.md)` = iarg`<br>
`0dbfs`<br>


[**`A4`**](opcodes/A4.md)` = iarg`<br>


[**`kr`**](opcodes/kr.md)` = iarg`<br>


[**`ksmps`**](opcodes/ksmps.md)` = iarg`<br>


[**`nchnls`**](opcodes/nchnls.md)` = iarg`<br>


[**`nchnls_i`**](opcodes/nchnls_i.md)` = iarg`<br>


[**`sr`**](opcodes/sr.md)` = iarg`<br>


### Orchestra Syntax:Block Statements
[**`endin`**](opcodes/endin.md)<br>


[**`endop`**](opcodes/endop.md)<br>


[**`instr`**](opcodes/instr.md)` i, j, ...`<br>


[**`opcode`**](opcodes/opcode.md)` name, outtypes, intypes`<br>


### Orchestra Syntax:Macros
[**`$NAME`**](opcodes/dollar.md)<br>


[**`#define`**](opcodes/define.md)` NAME # replacement text #`<br>
`#define NAME(a' b' c') # replacement text #`<br>


[**`#ifdef`**](opcodes/ifdef.md)` NAME`<br>
`....`<br>
`#else`<br>
`....`<br>
`#end`<br>


[**`#ifndef`**](opcodes/ifndef.md)` NAME`<br>
`....`<br>
`#else`<br>
`....`<br>
`#end`<br>


[**`#include`**](opcodes/include.md)` "filename"`<br>
`#includestr "filename"`<br>


[**`#undef`**](opcodes/undef.md)` NAME`<br>


### Signal Generators:Additive Synthesis/Resynthesis
`ares = `[**`adsyn`**](opcodes/adsyn.md)`(kamod, kfmod, ksmod, ifilcod)`<br>


`ares = `[**`adsynt`**](opcodes/adsynt.md)`(kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs])`<br>


`ar = `[**`adsynt2`**](opcodes/adsynt2.md)`(kamp, kcps, iwfn, ifreqfn, iampfn, icnt [, iphs])`<br>


`ares = `[**`hsboscil`**](opcodes/hsboscil.md)`(kamp, ktone, kbrite, ibasfreq, iwfn, ioctfn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioctcnt] [, iphs])`<br>


### Signal Generators:Basic Oscillators
`kres = `[**`lfo`**](opcodes/lfo.md)`(kamp, kcps [, itype])`<br>
`ares = lfo(kamp, kcps [, itype])`<br>


`ares = `[**`oscbnk`**](opcodes/oscbnk.md)`(kcps, kamd, kfmd, kpmd, iovrlap, iseed, kl1minf, kl1maxf, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kl2minf, kl2maxf, ilfomode, keqminf, keqmaxf, keqminl, keqmaxl, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`keqminq, keqmaxq, ieqmode, kfn [, il1fn] [, il2fn] [, ieqffn]   \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ieqlfn] [, ieqqfn] [, itabl] [, ioutfn])`<br>


`ares = `[**`oscil`**](opcodes/oscil.md)`(xamp, xcps [, ifn, iphs])`<br>
`kres = oscil(kamp, kcps [, ifn, iphs])`<br>


`ares = `[**`oscil3`**](opcodes/oscil3.md)`(xamp, xcps [, ifn, iphs])`<br>
`kres = oscil3(kamp, kcps [, ifn, iphs])`<br>


`ares = `[**`oscili`**](opcodes/oscili.md)`(xamp, xcps[, ifn, iphs])`<br>
`kres = oscili(kamp, kcps[, ifn, iphs])`<br>


`ares = `[**`oscilikt`**](opcodes/oscilikt.md)`(xamp, xcps, kfn [, iphs] [, istor])`<br>
`kres = oscilikt(kamp, kcps, kfn [, iphs] [, istor])`<br>


`ares = `[**`osciliktp`**](opcodes/osciliktp.md)`(kcps, kfn, kphs [, istor])`<br>


`ares = `[**`oscilikts`**](opcodes/oscilikts.md)`(xamp, xcps, kfn, async, kphs [, istor])`<br>


`ares = `[**`osciln`**](opcodes/osciln.md)`(kamp, ifrq, ifn, itimes)`<br>


`ares = `[**`oscils`**](opcodes/oscils.md)`(iamp, icps, iphs [, iflg])`<br>




`ares = `[**`poscil`**](opcodes/poscil.md)`(aamp, acps [, ifn, iphs])`<br>
`ares = poscil(aamp, kcps [, ifn, iphs])`<br>
`ares = poscil(kamp, acps [, ifn, iphs])`<br>
`ares = poscil(kamp, kcps [, ifn, iphs])`<br>
`ires = poscil(kamp, kcps [, ifn, iphs])`<br>
`kres = poscil(kamp, kcps [, ifn, iphs])`<br>


`ares = `[**`poscil3`**](opcodes/poscil3.md)`(aamp, acps [, ifn, iphs])`<br>
`ares = poscil3(aamp, kcps [, ifn, iphs])`<br>
`ares = poscil3(kamp, acps [, ifn, iphs])`<br>
`ares = poscil3(kamp, kcps [, ifn, iphs])`<br>
`ires = poscil3(kamp, kcps [, ifn, iphs])`<br>
`kres = poscil3(kamp, kcps [, ifn, iphs])`<br>


`kout = `[**`vibr`**](opcodes/vibr.md)`(kAverageAmp, kAverageFreq, ifn)`<br>


`kout = `[**`vibrato`**](opcodes/vibrato.md)`(kAverageAmp, kAverageFreq, kRandAmountAmp, kRandAmountFreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kAmpMinRate, kAmpMaxRate, kcpsMinRate, kcpsMaxRate, ifn [, iphs])`<br>


### Signal Generators:Dynamic Spectrum Oscillators
`ares = `[**`buzz`**](opcodes/buzz.md)`(xamp, xcps, knh, ifn [, iphs])`<br>


`ares = `[**`gbuzz`**](opcodes/gbuzz.md)`(xamp, xcps, knh, klh, kmul, ifn [, iphs])`<br>


`ares = `[**`mpulse`**](opcodes/mpulse.md)`(kamp, kintvl [, ioffset])`<br>


`aout [, asyncout] = `[**`squinewave`**](opcodes/squinewave.md)`(acps, aClip, aSkew, asyncin [, iMinSweep] [, iphase])`<br>
`aout [, asyncout] = squinewave(acps, aClip, aSkew [, ksyncin] [, iMinSweep] [, iphase])`<br>


`ares = `[**`vco`**](opcodes/vco.md)`(xamp, xcps, iwave, kpw [, ifn] [, imaxd] [, ileak] [, inyx] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iphs] [, iskip])`<br>


`ares = `[**`vco2`**](opcodes/vco2.md)`(kamp, kcps [, imode] [, kpw] [, kphs] [, inyx])`<br>


`kfn = `[**`vco2ft`**](opcodes/vco2ft.md)`(kcps, iwave [, inyx])`<br>


`ifn = `[**`vco2ift`**](opcodes/vco2ift.md)`(icps, iwave [, inyx])`<br>


`ifn = `[**`vco2init`**](opcodes/vco2init.md)`(iwave [, ibasfn] [, ipmul] [, iminsiz] [, imaxsiz] [, isrcft])`<br>


### Signal Generators:FM Synthesis
`a1, a2 = `[**`crossfm`**](opcodes/crossfm.md)`(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>
`a1, a2 = crossfmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>
`a1, a2 = crosspm(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>
`a1, a2 = crosspmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>
`a1, a2 = crossfmpm(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>
`a1, a2 = crossfmpmi(xfrq1, xfrq2, xndx1, xndx2, kcps, ifn1, ifn2 [, iphs1] [, iphs2])`<br>


`ares = `[**`fmb3`**](opcodes/fmb3.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn])`<br>


`ares = `[**`fmbell`**](opcodes/fmbell.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn, isus])`<br>


`ares = `[**`fmmetal`**](opcodes/fmmetal.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn)`<br>


`ares = `[**`fmpercfl`**](opcodes/fmpercfl.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate[, ifn1, ifn2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn3, ifn4, ivfn])`<br>


`ares = `[**`fmrhode`**](opcodes/fmrhode.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn3, ifn4, ivfn)`<br>


`ares = `[**`fmvoice`**](opcodes/fmvoice.md)`(kamp, kfreq, kvowel, ktilt, kvibamt, kvibrate[, ifn1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn2, ifn3, ifn4, ivibfn])`<br>


`ares = `[**`fmwurlie`**](opcodes/fmwurlie.md)`(kamp, kfreq, kc1, kc2, kvdepth, kvrate, ifn1, ifn2, ifn3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifn4, ivfn)`<br>


`ares = `[**`foscil`**](opcodes/foscil.md)`(xamp, kcps, xcar, xmod, kndx [, ifn , iphs])`<br>


`ares = `[**`foscili`**](opcodes/foscili.md)`(xamp, kcps, xcar, xmod, kndx [, ifn, iphs])`<br>


### Signal Generators:Granular Synthesis
`asig = `[**`diskgrain`**](opcodes/diskgrain.md)`(Sfname, kamp, kfreq, kpitch, kgrsize, kprate, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifun, iolaps [,imaxgrsize , ioffset])`<br>


`ares = `[**`fof`**](opcodes/fof.md)`(xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifna, ifnb, itotdur [, iphs] [, ifmode] [, iskip])`<br>


`ares = `[**`fof2`**](opcodes/fof2.md)`(xamp, xfund, xform, koct, kband, kris, kdur, kdec, iolaps, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifna, ifnb, itotdur, kphs, kgliss [, iskip])`<br>


`ares = `[**`fog`**](opcodes/fog.md)`(xamp, xdens, xtrans, aspd, koct, kband, kris, kdur, kdec, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iolaps, ifna, ifnb, itotdur [, iphs] [, itmode] [, iskip])`<br>


`ares = `[**`grain`**](opcodes/grain.md)`(xamp, xpitch, xdens, kampoff, kpitchoff, kgdur, igfn, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iwfn, imgdur [, igrnd])`<br>


`ares = `[**`grain2`**](opcodes/grain2.md)`(kcps, kfmd, kgdur, iovrlp, kfn, iwfn [, irpow] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iseed] [, imode])`<br>


`ares = `[**`grain3`**](opcodes/grain3.md)`(kcps, kphs, kfmd, kpmd, kgdur, kdens, imaxovr, kfn, iwfn, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kfrpow, kprpow [, iseed] [, imode])`<br>


`ares = `[**`granule`**](opcodes/granule.md)`(xamp, ivoice, iratio, imode, ithd, ifn, ipshift, igskip, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`igskip_os, ilength, kgap, igap_os, kgsize, igsize_os, iatt, idec \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iseed] [, ipitch1] [, ipitch2] [, ipitch3] [, ipitch4] [, ifnenv])`<br>


`a1 [, a2, a3, a4, a5, a6, a7, a8] = `[**`partikkel`**](opcodes/partikkel.md)`(agrainfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kdistribution, idisttab, async, kenv2amt, ienv2tab, ienv_attack, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ienv_decay, ksustain_amount, ka_d_ratio, kduration, kamp, igainmasks, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kwavfreq, ksweepshape, iwavfreqstarttab, iwavfreqendtab, awavfm, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifmamptab, kfmenv, icosine, ktraincps, knumpartials, kchroma, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ichannelmasks, krandommask, kwaveform1, kwaveform2, kwaveform3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kwaveform4, iwaveamptab, asamplepos1, asamplepos2, asamplepos3, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asamplepos4, kwavekey1, kwavekey2, kwavekey3, kwavekey4, imax_grains \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iopcode_id, ipanlaws])`<br>


`kindex = `[**`partikkelget`**](opcodes/partikkelget.md)`(kparameterindex, iopcode_id)`<br>


[**`partikkelset`**](opcodes/partikkelset.md)`(kparameterindex, kmaskindex, iopcode_id)`<br>


`async [,aphase] = `[**`partikkelsync`**](opcodes/partikkelsync.md)`(iopcode_id)`<br>


`ares [, ac] = `[**`sndwarp`**](opcodes/sndwarp.md)`(xamp, xtimewarp, xresample, ifn1, ibeg, iwsize, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`irandw, ioverlap, ifn2, itimemode)`<br>


`ar1, ar2 [,ac1] [, ac2] = `[**`sndwarpst`**](opcodes/sndwarpst.md)`(xamp, xtimewarp, xresample, ifn1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ibeg, iwsize, irandw, ioverlap, ifn2, itimemode)`<br>


`asig = `[**`syncgrain`**](opcodes/syncgrain.md)`(kamp, kfreq, kpitch, kgrsize, kprate, ifun1, ifun2, iolaps)`<br>


`asig = `[**`syncloop`**](opcodes/syncloop.md)`(kamp, kfreq, kpitch, kgrsize, kprate, klstart, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`klend, ifun1, ifun2, iolaps[,istart, iskip])`<br>


`ar = `[**`vosim`**](opcodes/vosim.md)`(kamp, kFund, kForm, kDecay, kPulseCount, kPulseFactor, ifn [, iskip])`<br>


### Signal Generators:Hyper Vectorial Synthesis
[**`hvs1`**](opcodes/hvs1.md)`(kx, inumParms, inumPointsX, iOutTab, iPositionsTab, iSnapTab [, iConfigTab])`<br>


[**`hvs2`**](opcodes/hvs2.md)`(kx, ky, inumParms, inumPointsX, inumPointsY, iOutTab, iPositionsTab, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iSnapTab [, iConfigTab])`<br>


[**`hvs3`**](opcodes/hvs3.md)`(kx, ky, kz, inumParms, inumPointsX, inumPointsY, inumPointsZ, iOutTab, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iPositionsTab, iSnapTab [, iConfigTab])`<br>


### Signal Generators:Linear and Exponential Generators
`ky = `[**`bpf`**](opcodes/bpf.md)`(kx, kx1, ky1, kx2, ..., kxn, kyn)`<br>
`iy = bpf(ix, ix1, iy1, ix2, ..., ixn, iyn)`<br>
`kys[] = bpf(kxs[], kx1, ky1, kx2, ..., kxn, kyn)`<br>
`iys[] = bpf(ixs[], ix1, iy1, ix2, ..., ixn, iyn)`<br>
`ky = bpf(kx, kxs[], kys[])`<br>
`iy = bpf(ix, ixs[], iys[])`<br>
`ay = bpf(ax, kx1, ky1, kx2, ..., kxn, kyn)`<br>
`ay = bpf(ax, kxs[], kys[])`<br>
`ky, kw = bpf(kx, kxs[], kys[], kws[])`<br>


`ky = `[**`bpfcos`**](opcodes/bpfcos.md)`(kx, kx1, ky1, kx2, ..., kxn, kyn)`<br>
`kys[] = bpfcos(kxs[], kx1, ky1, kx2, ..., kxn, kyn)`<br>
`ky = bpfcos(kx, kxs[], kys[])`<br>
`ky = bpfcos(kx, ixs[], iys[])`<br>
`ky, kz = bpfcos(kx, kxs[], kys[], kzs[])`<br>
`ky, kz = bpfcos(kx, ixs[], iys[], izs[])`<br>


`ares = `[**`cosseg`**](opcodes/cosseg.md)`(ia, idur1, ib [, idur2] [, ic] [...])`<br>
`kres = cosseg(ia, idur1, ib [, idur2] [, ic] [...])`<br>


`ares = `[**`cossegb`**](opcodes/cossegb.md)`(ia, itim1, ib [, itim2] [, ic] [...])`<br>
`kres = cossegb(ia, itim1, ib [, itim2] [, ic] [...])`<br>


`ares = `[**`cossegr`**](opcodes/cossegr.md)`(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>
`kres = cossegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>


`kout = `[**`expcurve`**](opcodes/expcurve.md)`(kindex, ksteepness)`<br>


`ares = `[**`expon`**](opcodes/expon.md)`(ia, idur, ib)`<br>
`kres = expon(ia, idur, ib)`<br>


`ares = `[**`expseg`**](opcodes/expseg.md)`(ia, idur1, ib [, idur2] [, ic] [...])`<br>
`kres = expseg(ia, idur1, ib [, idur2] [, ic] [...])`<br>


`ares = `[**`expsega`**](opcodes/expsega.md)`(ia, idur1, ib [, idur2] [, ic] [...])`<br>


`ares = `[**`expsegb`**](opcodes/expsegb.md)`(ia, itim1, ib [, itim2] [, ic] [...])`<br>
`kres = expsegb(ia, itim1, ib [, itim2] [, ic] [...])`<br>


`ares = `[**`expsegba`**](opcodes/expsegba.md)`(ia, itim1, ib [, itim2] [, ic] [...])`<br>


`ares = `[**`expsegr`**](opcodes/expsegr.md)`(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>
`kres = expsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>


`kout = `[**`gainslider`**](opcodes/gainslider.md)`(kindex)`<br>


`ky = `[**`lincos`**](opcodes/lincos.md)`(kx, ky0, ky1 [, kx0, kx1 ])`<br>
`iy = lincos(ix, iy0, iy1 [, ix0, ix1 ])`<br>


`ares = `[**`line`**](opcodes/line.md)`(ia, idur, ib)`<br>
`kres = line(ia, idur, ib)`<br>


`ky = `[**`linlin`**](opcodes/linlin.md)`(kx, ky0, ky1 [, kx0, kx1 ])`<br>
`iy = linlin(ix, iy0, iy1 [, ix0, ix1 ])`<br>
`kys[] = linlin(kxs[], ky0, ky1 [, kx0, kx1 ])`<br>
`iys[] = linlin(ixs[], ky0, ky1, [ kx0, kx1 ])`<br>
`kC[] = linlin(kx, kA[], kB[] [, kx0, kx1 ])`<br>


`ares = `[**`linseg`**](opcodes/linseg.md)`(ia, idur1, ib [, idur2] [, ic] [...])`<br>
`kres = linseg(ia, idur1, ib [, idur2] [, ic] [...])`<br>


`ares = `[**`linsegb`**](opcodes/linsegb.md)`(ia, itim1, ib [, itim2] [, ic] [...])`<br>
`kres = linsegb(ia, itim1, ib [, itim2] [, ic] [...])`<br>


`ares = `[**`linsegr`**](opcodes/linsegr.md)`(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>
`kres = linsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)`<br>


`kout = `[**`logcurve`**](opcodes/logcurve.md)`(kindex, ksteepness)`<br>


`ksig = `[**`loopseg`**](opcodes/loopseg.md)`(kfreq, ktrig, iphase, kvalue0, ktime0 [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2][...])`<br>


`ksig = `[**`loopsegp`**](opcodes/loopsegp.md)`(kphase, kvalue0, kdur0, kvalue1 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kdur1, ... , kdurN-1, kvalueN])`<br>


`ksig = `[**`looptseg`**](opcodes/looptseg.md)`(kfreq, ktrig, iphase, kvalue0, ktype0, ktime0, [, kvalue1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,ktype1] [, ktime1] [, kvalue2] [,ktype2] [, ktime2] [...] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalueN] [,ktypeN] [, ktimeN])`<br>


`ksig = `[**`loopxseg`**](opcodes/loopxseg.md)`(kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...])`<br>


`ksig = `[**`lpshold`**](opcodes/lpshold.md)`(kfreq, ktrig, iphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...])`<br>


`ksig = `[**`lpsholdp`**](opcodes/lpsholdp.md)`(kphase, kvalue0, ktime0  [, kvalue1] [, ktime1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kvalue2] [, ktime2] [...])`<br>


`kscl = `[**`scale`**](opcodes/scale.md)`(kinput, kmax, kmin[, kimax, kimin])`<br>


`kscl = `[**`scale2`**](opcodes/scale2.md)`(kinput, kmin, kmax[, kimin, kimax][ihtime])`<br>


`ares = `[**`transeg`**](opcodes/transeg.md)`(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)`<br>
`kres = transeg(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)`<br>


`ares = `[**`transegb`**](opcodes/transegb.md)`(ia, itim, itype, ib [, itim2] [, itype] [, ic] ...)`<br>
`kres = transegb(ia, itim, itype, ib [, itim2] [, itype] [, ic] ...)`<br>


`ares = `[**`transegr`**](opcodes/transegr.md)`(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)`<br>
`kres = transegr(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)`<br>


`ares = `[**`trigexpseg`**](opcodes/trigexpseg.md)`(kTrig, ia, idur1, ib [, idur2] [, ic] [...])`<br>
`kres = trigexpseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])`<br>


`ares = `[**`triglinseg`**](opcodes/triglinseg.md)`(kTrig, ia, idur1, ib [, idur2] [, ic] [...])`<br>
`kres = triglinseg(kTrig, ia, idur1, ib [, idur2] [, ic] [...])`<br>


`kout = `[**`xyscale`**](opcodes/xyscale.md)`(kx, ky, k00, k10, k01, k11)`<br>


### Signal Generators:Envelope Generators
`ares = `[**`adsr`**](opcodes/adsr.md)`(iatt, idec, islev, irel [, idel])`<br>
`kres = adsr(iatt, idec, islev, irel [, idel])`<br>


`ares = `[**`envlpx`**](opcodes/envlpx.md)`(xamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod])`<br>
`kres = envlpx(kamp, irise, idur, idec, ifn, iatss, iatdec [, ixmod])`<br>


`ares = `[**`envlpxr`**](opcodes/envlpxr.md)`(xamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind])`<br>
`kres = envlpxr(kamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind])`<br>


`ares = `[**`gtadsr`**](opcodes/gtadsr.md)`(asig, katt, kdec, ksus, krel, kgate)`<br>
`xres = gtadsr(kamp, katt, kdec, ksus, krel, kgate)`<br>


`ares = `[**`linen`**](opcodes/linen.md)`(xamp, irise, idur, idec)`<br>
`kres = linen(kamp, irise, idur, idec)`<br>


`ares = `[**`linenr`**](opcodes/linenr.md)`(xamp, irise, idec, iatdec)`<br>
`kres = linenr(kamp, irise, idec, iatdec)`<br>


`ares = `[**`madsr`**](opcodes/madsr.md)`(iatt, idec, islev, irel [, idel] [, ireltim])`<br>
`kres = madsr(iatt, idec, islev, irel [, idel] [, ireltim])`<br>


`ares = `[**`mxadsr`**](opcodes/mxadsr.md)`(iatt, idec, islev, irel [, idel] [, ireltim])`<br>
`kres = mxadsr(iatt, idec, islev, irel [, idel] [, ireltim])`<br>


`ares = `[**`xadsr`**](opcodes/xadsr.md)`(iatt, idec, islev, irel [, idel])`<br>
`kres = xadsr(iatt, idec, islev, irel [, idel])`<br>


### Signal Generators:Models and Emulations
`ares = `[**`bamboo`**](opcodes/bamboo.md)`(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2])`<br>


`ares = `[**`barmodel`**](opcodes/barmodel.md)`(kbcL, kbcR, iK, ib, kscan, iT30, ipos, ivel, iwid)`<br>


`ares = `[**`cabasa`**](opcodes/cabasa.md)`(iamp, idettack [, inum] [, idamp] [, imaxshake])`<br>


`ares = `[**`crunch`**](opcodes/crunch.md)`(iamp, idettack [, inum] [, idamp] [, imaxshake])`<br>


`ares = `[**`dripwater`**](opcodes/dripwater.md)`(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2])`<br>


`kfl = `[**`fareylen`**](opcodes/fareylen.md)`(kfn)`<br>


`ifl = `[**`fareyleni`**](opcodes/fareyleni.md)`(ifn)`<br>


`ares = `[**`gendy`**](opcodes/gendy.md)`(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum])`<br>
`kres = gendy(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum])`<br>


`ares = `[**`gendyc`**](opcodes/gendyc.md)`(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum])`<br>
`kres = gendyc(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl [, initcps] [, knum])`<br>


`ares = `[**`gendyx`**](opcodes/gendyx.md)`(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl, kcurveup, kcurvedown [, initcps] [, knum])`<br>
`kres = gendyx(kamp, kampdist, kdurdist, kadpar, kddpar, kminfreq, kmaxfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscl, kdurscl, kcurveup, kcurvedown [, initcps] [, knum])`<br>


`ares = `[**`gogobel`**](opcodes/gogobel.md)`(kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivfn)`<br>


`ares = `[**`guiro`**](opcodes/guiro.md)`(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] [, ifreq1])`<br>


`ax, ay, az = `[**`lorenz`**](opcodes/lorenz.md)`(ksv, krv, kbv, kh, ix, iy, iz, iskip [, iskipinit])`<br>


`kiter, koutrig = `[**`mandel`**](opcodes/mandel.md)`( ktrig, kx, ky, kmaxIter)`<br>


`ares = `[**`mandol`**](opcodes/mandol.md)`(kamp, kfreq, kpluck, kdetune, kgain, ksize \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn] [, iminfreq])`<br>


`ares = `[**`marimba`**](opcodes/marimba.md)`(kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idoubles] [, itriples])`<br>


`ares = `[**`moog`**](opcodes/moog.md)`(kamp, kfreq, kfiltq, kfiltrate, kvibf, kvamp, iafn, iwfn, ivfn)`<br>


`ax, ay, az = `[**`planet`**](opcodes/planet.md)`(kmass1, kmass2, ksep, ix, iy, iz, ivx, ivy, ivz, idelta \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifriction] [, iskip])`<br>


`ares = `[**`prepiano`**](opcodes/prepiano.md)`(ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers])`<br>
`al, ar = prepiano(ifreq, iNS, iD, iK, iT30, iB, kbcl, kbcr, imass, ihvfreq, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iinit, ipos, ivel, isfreq, isspread[, irattles, irubbers])`<br>


`ares = `[**`sandpaper`**](opcodes/sandpaper.md)`(iamp, idettack [, inum] [, idamp] [, imaxshake])`<br>


`ares = `[**`sekere`**](opcodes/sekere.md)`(iamp, idettack [, inum] [, idamp] [, imaxshake])`<br>


`ares = `[**`shaker`**](opcodes/shaker.md)`(kamp, kfreq, kbeans, kdamp, ktimes [, idecay])`<br>


`ares = `[**`sleighbells`**](opcodes/sleighbells.md)`(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2])`<br>


`ares = `[**`stix`**](opcodes/stix.md)`(iamp, idettack [, inum] [, idamp] [, imaxshake])`<br>


`ares = `[**`tambourine`**](opcodes/tambourine.md)`(kamp, idettack [, inum] [, idamp] [, imaxshake] [, ifreq] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreq1] [, ifreq2])`<br>


`ares = `[**`vibes`**](opcodes/vibes.md)`(kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec)`<br>


`ares = `[**`voice`**](opcodes/voice.md)`(kamp, kfreq, kphoneme, kform, kvibf, kvamp, ifn, ivfn)`<br>


### Signal Generators:Phasors
`aexp,aph = `[**`ephasor`**](opcodes/ephasor.md)`(kfreq, kR)`<br>


`ares = `[**`phasor`**](opcodes/phasor.md)`(xcps [, iphs])`<br>
`kres = phasor(kcps [, iphs])`<br>


`ares = `[**`phasorbnk`**](opcodes/phasorbnk.md)`(xcps, kndx, icnt [, iphs])`<br>
`kres = phasorbnk(kcps, kndx, icnt [, iphs])`<br>


`aphase, asyncout = `[**`syncphasor`**](opcodes/syncphasor.md)`(xcps, asyncin, [, iphs])`<br>


`aindex = `[**`trigphasor`**](opcodes/trigphasor.md)`(xtrig, xrate, kstart, kend [, kresetPos])`<br>
`kindex = trigphasor(xtrig, xrate, kstart, kend [, kresetPos])`<br>


### Signal Generators:Random (Noise) Generators
`ares = `[**`betarand`**](opcodes/betarand.md)`(krange, kalpha, kbeta)`<br>
`ires = betarand(krange, kalpha, kbeta)`<br>
`kres = betarand(krange, kalpha, kbeta)`<br>


`ares = `[**`bexprnd`**](opcodes/bexprnd.md)`(krange)`<br>
`ires = bexprnd(krange)`<br>
`kres = bexprnd(krange)`<br>


`ares = `[**`cauchy`**](opcodes/cauchy.md)`(kalpha)`<br>
`ires = cauchy(kalpha)`<br>
`kres = cauchy(kalpha)`<br>


`ares = `[**`cauchyi`**](opcodes/cauchyi.md)`(klambda, xamp, xcps)`<br>
`ires = cauchyi(klambda, xamp, xcps)`<br>
`kres = cauchyi(klambda, xamp, xcps)`<br>


`aout = `[**`cuserrnd`**](opcodes/cuserrnd.md)`(kmin, kmax, ktableNum)`<br>
`iout = cuserrnd(imin, imax, itableNum)`<br>
`kout = cuserrnd(kmin, kmax, ktableNum)`<br>


`aout = `[**`duserrnd`**](opcodes/duserrnd.md)`(ktableNum)`<br>
`iout = duserrnd(itableNum)`<br>
`kout = duserrnd(ktableNum)`<br>


`ares = `[**`dust`**](opcodes/dust.md)`(kamp, kdensity)`<br>
`kres = dust(kamp, kdensity)`<br>


`ares = `[**`dust2`**](opcodes/dust2.md)`(kamp, kdensity)`<br>
`kres = dust2(kamp, kdensity)`<br>


`ares = `[**`exprand`**](opcodes/exprand.md)`(klambda)`<br>
`ires = exprand(klambda)`<br>
`kres = exprand(klambda)`<br>


`ares = `[**`exprandi`**](opcodes/exprandi.md)`(klambda, xamp, xcps)`<br>
`ires = exprandi(klambda, xamp, xcps)`<br>
`kres = exprandi(klambda, xamp, xcps)`<br>


`ares = `[**`fractalnoise`**](opcodes/fractalnoise.md)`(kamp, kbeta)`<br>


`ares = `[**`gauss`**](opcodes/gauss.md)`(krange)`<br>
`ires = gauss(irange)`<br>
`kres = gauss(krange)`<br>
`ares = gauss(kmean, ksdev)`<br>
`ires = gauss(imean, isdev)`<br>
`kres = gauss(kmean, ksdev)`<br>


`ares = `[**`gaussi`**](opcodes/gaussi.md)`(krange, xamp, xcps)`<br>
`ires = gaussi(krange, xamp, xcps)`<br>
`kres = gaussi(krange, xamp, xcps)`<br>


`ares = `[**`gausstrig`**](opcodes/gausstrig.md)`(kamp, kcps, kdev [, imode] [, ifrst1])`<br>
`kres = gausstrig(kamp, kcps, kdev [, imode] [, ifrst1])`<br>


`ians = `[**`getseed`**](opcodes/getseed.md)`()`<br>
`kans = getseed()`<br>


`kout = `[**`jitter`**](opcodes/jitter.md)`(kamp, kcpsMin, kcpsMax)`<br>


`kout = `[**`jitter2`**](opcodes/jitter2.md)`(ktotamp, kamp1, kcps1, kamp2, kcps2, kamp3, kcps3[ , iopt])`<br>


`ares = `[**`jspline`**](opcodes/jspline.md)`(xamp, kcpsMin, kcpsMax)`<br>
`kres = jspline(kamp, kcpsMin, kcpsMax)`<br>


`knum = `[**`lfsr`**](opcodes/lfsr.md)`(ilen, iprob [, iseed])`<br>


`ares = `[**`linrand`**](opcodes/linrand.md)`(krange)`<br>
`ires = linrand(krange)`<br>
`kres = linrand(krange)`<br>


`ares = `[**`noise`**](opcodes/noise.md)`(xamp, kbeta)`<br>


`ares = `[**`pcauchy`**](opcodes/pcauchy.md)`(kalpha)`<br>
`ires = pcauchy(kalpha)`<br>
`kres = pcauchy(kalpha)`<br>


`ares = `[**`pinker`**](opcodes/pinker.md)`()`<br>


`ares = `[**`pinkish`**](opcodes/pinkish.md)`(xin [, imethod] [, inumbands] [, iseed] [, iskip])`<br>


`ares = `[**`poisson`**](opcodes/poisson.md)`(klambda)`<br>
`ires = poisson(klambda)`<br>
`kres = poisson(klambda)`<br>


`ares = `[**`rand`**](opcodes/rand.md)`(xamp [, iseed] [, isel] [, ioffset])`<br>
`kres = rand(xamp [, iseed] [, isel] [, ioffset])`<br>


`ares = `[**`randc`**](opcodes/randc.md)`(xamp, xcps [, iseed] [, isize] [, ioffset])`<br>
`kres = randc(kamp, kcps [, iseed] [, isize] [, ioffset])`<br>


`ares = `[**`randh`**](opcodes/randh.md)`(xamp, xcps [, iseed] [, isize] [, ioffset])`<br>
`kres = randh(kamp, kcps [, iseed] [, isize] [, ioffset])`<br>


`ares = `[**`randi`**](opcodes/randi.md)`(xamp, xcps [, iseed] [, isize] [, ioffset])`<br>
`kres = randi(kamp, kcps [, iseed] [, isize] [, ioffset])`<br>


`ares = `[**`random`**](opcodes/random.md)`(kmin, kmax)`<br>
`ires = random(imin, imax)`<br>
`kres = random(kmin, kmax)`<br>


`ares = `[**`randomh`**](opcodes/randomh.md)`(kmin, kmax, xcps [,imode] [,ifirstval])`<br>
`kres = randomh(kmin, kmax, kcps [,imode] [,ifirstval])`<br>


`ares = `[**`randomi`**](opcodes/randomi.md)`(kmin, kmax, xcps [,imode] [,ifirstval])`<br>
`kres = randomi(kmin, kmax, kcps [,imode] [,ifirstval])`<br>


`ax = `[**`rnd31`**](opcodes/rnd31.md)`(kscl, krpow [, iseed])`<br>
`ix = rnd31(iscl, irpow [, iseed])`<br>
`kx = rnd31(kscl, krpow [, iseed])`<br>


[**`rndseed`**](opcodes/rndseed.md)`(ival)`<br>


`ares = `[**`rspline`**](opcodes/rspline.md)`(xrangeMin, xrangeMax, kcpsMin, kcpsMax)`<br>
`kres = rspline(krangeMin, krangeMax, kcpsMin, kcpsMax)`<br>


[**`seed`**](opcodes/seed.md)`(ival)`<br>


`kout = `[**`trandom`**](opcodes/trandom.md)`(ktrig, kmin, kmax)`<br>


`ares = `[**`trirand`**](opcodes/trirand.md)`(krange)`<br>
`ires = trirand(krange)`<br>
`kres = trirand(krange)`<br>


`ares = `[**`unirand`**](opcodes/unirand.md)`(krange)`<br>
`ires = unirand(krange)`<br>
`kres = unirand(krange)`<br>


`ax = `[**`urandom`**](opcodes/urandom.md)`([imin, imax])`<br>
`ix = urandom([imin, imax])`<br>
`kx = urandom([imin, imax])`<br>


`aout = `[**`urd`**](opcodes/urd.md)`(ktableNum)`<br>
`iout = urd(itableNum)`<br>
`kout = urd(ktableNum)`<br>


`ares = `[**`weibull`**](opcodes/weibull.md)`(ksigma, ktau)`<br>
`ires = weibull(ksigma, ktau)`<br>
`kres = weibull(ksigma, ktau)`<br>


### Signal Generators:Sample Playback
`a1 = `[**`bbcutm`**](opcodes/bbcutm.md)`(asource, ibps, isubdiv, ibarlength, iphrasebars, inumrepeats \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istutterspeed] [, istutterchance] [, ienvchoice ])`<br>


`a1,a2 = `[**`bbcuts`**](opcodes/bbcuts.md)`(asource1, asource2, ibps, isubdiv, ibarlength, iphrasebars, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`inumrepeats [, istutterspeed] [, istutterchance] [, ienvchoice])`<br>


`asig1[, asig2] = `[**`flooper`**](opcodes/flooper.md)`(kamp, kpitch, istart, idur, ifad, ifn)`<br>


`asig1[,asig2] = `[**`flooper2`**](opcodes/flooper2.md)`(kamp, kpitch, kloopstart, kloopend, kcrossfade, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istart, imode, ifenv, iskip])`<br>


`ar1 [,ar2] = `[**`loscil`**](opcodes/loscil.md)`(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, imod2] [, ibeg2] [, iend2])`<br>
`aph, ar1 [,ar2] = loscilphs(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iend1] [, imod2] [, ibeg2] [, iend2])`<br>


`ar1 [,ar2] = `[**`loscil3`**](opcodes/loscil3.md)`(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, imod2] [, ibeg2] [, iend2])`<br>
`aph, ar1 [,ar2] = loscil3phs(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iend1] [, imod2] [, ibeg2] [, iend2])`<br>


`ar1 [, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \`<br>
`ar15, ar16] = `[**`loscil`**](opcodes/loscilx.md)`x(xamp, kcps, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwsize, ibas, istrt, imod, ibeg, iend])`<br>
`ar[] = loscilx(xamp, kcps, ifn \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwsize, ibas, istrt, imod, ibeg, iend])`<br>


`ares = `[**`lphasor`**](opcodes/lphasor.md)`(xtrns [, ilps] [, ilpe] [, imode] [, istrt] [, istor])`<br>


`ares = `[**`lposcil`**](opcodes/lposcil.md)`(kamp, kfreqratio, kloop, kend, ifn [, iphs])`<br>


`ares = `[**`lposcil3`**](opcodes/lposcil3.md)`(kamp, kfreqratio, kloop, kend, ifn [, iphs])`<br>


`ar = `[**`lposcila`**](opcodes/lposcila.md)`(aamp, kfreqratio, kloop, kend, ift [,iphs])`<br>


`ar1, ar2 = `[**`lposcilsa`**](opcodes/lposcilsa.md)`(aamp, kfreqratio, kloop, kend, ift [,iphs])`<br>


`ar1, ar2 = `[**`lposcilsa2`**](opcodes/lposcilsa2.md)`(aamp, kfreqratio, kloop, kend, ift [,iphs])`<br>


[**`sfilist`**](opcodes/sfilist.md)`(ifilhandle [, Sprintprefix])`<br>


`ar1, ar2 = `[**`sfinstr`**](opcodes/sfinstr.md)`(ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset])`<br>


`ar1, ar2 = `[**`sfinstr3`**](opcodes/sfinstr3.md)`(ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset])`<br>


`ares = `[**`sfinstr3m`**](opcodes/sfinstr3m.md)`(ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset])`<br>


`ares = `[**`sfinstrm`**](opcodes/sfinstrm.md)`(ivel, inotenum, xamp, xfreq, instrnum, ifilhandle \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iflag] [, ioffset])`<br>


`ir = `[**`sfload`**](opcodes/sfload.md)`("filename")`<br>


`ar1, ar2 = `[**`sflooper`**](opcodes/sflooper.md)`(ivel, inotenum, kamp, kpitch, ipreindex, kloopstart, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kloopend, kcrossfade [, istart, imode, ifenv, iskip, iflag])`<br>


[**`sfpassign`**](opcodes/sfpassign.md)`(istartindex, ifilhandle[, imsgs])`<br>


`ar1, ar2 = `[**`sfplay`**](opcodes/sfplay.md)`(ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv])`<br>


`ar1, ar2 = `[**`sfplay3`**](opcodes/sfplay3.md)`(ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv])`<br>


`ares = `[**`sfplay3m`**](opcodes/sfplay3m.md)`(ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv])`<br>


`ares = `[**`sfplaym`**](opcodes/sfplaym.md)`(ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ioffset] [, ienv])`<br>


[**`sfplist`**](opcodes/sfplist.md)`(ifilhandle)`<br>


`ir = `[**`sfpreset`**](opcodes/sfpreset.md)`(iprog, ibank, ifilhandle, ipreindex)`<br>


`asig, krec = `[**`sndloop`**](opcodes/sndloop.md)`(ain, kpitch, ktrig, idur, ifad)`<br>


`ares = `[**`waveset`**](opcodes/waveset.md)`(ain, krep [, ilen])`<br>


### Signal Generators:Scanned Synthesis
[**`scanhammer`**](opcodes/scanhammer.md)`(isrc, idst, ipos, imult)`<br>


`kpos, kvel = `[**`scanmap`**](opcodes/scanmap.md)`(iscan, kamp, kvamp [, iwhich])`<br>


`ares = `[**`scans`**](opcodes/scans.md)`(kamp, kfreq, ifn, id [, iorder])`<br>


[**`scansmap`**](opcodes/scansmap.md)`(kpos, kvel, iscan, kamp, kvamp [, iwhich])`<br>


`aout = `[**`scantable`**](opcodes/scantable.md)`(kamp, kpch, ipos, imass, istiff, idamp, ivel)`<br>


[**`scanu`**](opcodes/scanu.md)`(init, irate, ifndisplace, ifnmass, ifnmatrix, ifncentr, ifndamp, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ain, idisp, id)`<br>


[**`scanu2`**](opcodes/scanu2.md)`(init, irate, ifndisplace,ifnmass, ifnmatrix, ifncentr, ifndamp, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kmass, kmtrxstiff, kcentr, kdamp, ileft, iright, kpos, kdisplace, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ain, idisp, id)`<br>


### Signal Generators:Table Access
`kres = `[**`oscil1`**](opcodes/oscil1.md)`(idel, kamp, idur [, ifn])`<br>


`kres = `[**`oscil1i`**](opcodes/oscil1i.md)`(idel, kamp, idur [, ifn])`<br>


`kr = `[**`tab`**](opcodes/tab.md)`(kndx, ifn[, ixmode])`<br>
`ar = tab(xndx, ifn[, ixmode])`<br>


`ir = `[**`tab_i`**](opcodes/tab_i.md)`(indx, ifn[, ixmode])`<br>


`ares = `[**`table`**](opcodes/table.md)`(andx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`ires = table(indx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`kres = table(kndx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>


`ares = `[**`table3`**](opcodes/table3.md)`(andx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`ires = table3(indx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`kres = table3(kndx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>


`ares = `[**`tablei`**](opcodes/tablei.md)`(andx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`ires = tablei(indx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>
`kres = tablei(kndx, ifn [, ixmode] [, ixoff] [, iwrap])`<br>


[**`tabw`**](opcodes/tabw.md)`(ksig, kndx, ifn [,ixmode])`<br>
`tabw(asig, andx, ifn [,ixmode])`<br>


[**`tabw_i`**](opcodes/tabw_i.md)`(isig, indx, ifn [,ixmode])`<br>


### Signal Generators:Wave Terrain Synthesis
`aout = `[**`sterrain`**](opcodes/sterrain.md)`(kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, km1, km2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kn1, kn2, kn3, ka, kb, kperiod)`<br>


`aout = `[**`wterrain`**](opcodes/wterrain.md)`(kamp, kpch, k_xcenter, k_ycenter, k_xradius, k_yradius, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`itabx, itaby)`<br>


`aout = `[**`wterrain2`**](opcodes/wterrain2.md)`(kamp, kcps, kx, ky, krx, kry, krot, ktab0, ktab1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kcurve, kcurveparam)`<br>


### Signal Generators:Waveguide Physical Modeling
`ares = `[**`pluck`**](opcodes/pluck.md)`(kamp, kcps, icps, ifn, imeth [, iparm1] [, iparm2])`<br>


`ares = `[**`repluck`**](opcodes/repluck.md)`(iplk, kamp, icps, kpick, krefl, axcite)`<br>


`ares = `[**`streson`**](opcodes/streson.md)`(asig, kfr, kfdbgain)`<br>


`ares = `[**`wgbow`**](opcodes/wgbow.md)`(kamp, kfreq, kpres, krat, kvibf, kvamp [, ifn] [, iminfreq])`<br>


`ares = `[**`wgbowedbar`**](opcodes/wgbowedbar.md)`(kamp, kfreq, kpos, kbowpres, kgain [, iconst] [, itvel] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ibowpos] [, ilow])`<br>


`ares = `[**`wgbrass`**](opcodes/wgbrass.md)`(kamp, kfreq, ktens, iatt, kvibf, kvamp [, ifn] [, iminfreq])`<br>


`ares = `[**`wgclar`**](opcodes/wgclar.md)`(kamp, kfreq, kstiff, iatt, idetk, kngain, kvibf, kvamp \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn] [, iminfreq])`<br>


`ares = `[**`wgflute`**](opcodes/wgflute.md)`(kamp, kfreq, kjet, iatt, idetk, kngain, kvibf, kvamp [, ifn] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iminfreq] [, ijetrf] [, iendrf])`<br>


`ares = `[**`wgpluck`**](opcodes/wgpluck.md)`(icps, iamp, kpick, iplk, idamp, ifilt, axcite)`<br>


`ares = `[**`wgpluck2`**](opcodes/wgpluck2.md)`(iplk, kamp, icps, kpick, krefl)`<br>


### Signal I/O:File I/O
[**`dumpk`**](opcodes/dumpk.md)`(ksig, ifilname, iformat, iprd)`<br>


[**`dumpk2`**](opcodes/dumpk2.md)`(ksig1, ksig2, ifilname, iformat, iprd)`<br>


[**`dumpk3`**](opcodes/dumpk3.md)`(ksig1, ksig2, ksig3, ifilname, iformat, iprd)`<br>


[**`dumpk4`**](opcodes/dumpk4.md)`(ksig1, ksig2, ksig3, ksig4, ifilname, iformat, iprd)`<br>


[**`ficlose`**](opcodes/ficlose.md)`(ihandle)`<br>
`ficlose(Sfilename)`<br>


[**`fin`**](opcodes/fin.md)`(ifilename, iskipframes, iformat, ain1 [, ain2] [, ain3] [,...])`<br>
`fin(ifilename, iskipframes, iformat, arr[])`<br>


[**`fini`**](opcodes/fini.md)`(ifilename, iskipframes, iformat, in1 [, in2] [, in3] [, ...])`<br>


[**`fink`**](opcodes/fink.md)`(ifilename, iskipframes, iformat, kin1 [, kin2] [, kin3] [,...])`<br>


`ihandle = `[**`fiopen`**](opcodes/fiopen.md)`(ifilename, imode)`<br>


[**`fout`**](opcodes/fout.md)`(ifilename, iformat, aout1 [, aout2, aout3,...,aoutN])`<br>
`fout(ifilename, iformat, array[])`<br>


[**`fouti`**](opcodes/fouti.md)`(ihandle, iformat, iflag, iout1 [, iout2, iout3,....,ioutN])`<br>


[**`foutir`**](opcodes/foutir.md)`(ihandle, iformat, iflag, iout1 [, iout2, iout3,....,ioutN])`<br>


[**`foutk`**](opcodes/foutk.md)`(ifilename, iformat, kout1 [, kout2, kout3,....,koutN])`<br>


[**`fprintks`**](opcodes/fprintks.md)`("filename", "string", [, kval1] [, kval2] [...])`<br>


[**`fprints`**](opcodes/fprints.md)`("filename", "string" [, ival1] [, ival2] [...])`<br>


`Sres, kline = `[**`readf`**](opcodes/readf.md)`(ifilname)`<br>


`Sres, iline = `[**`readfi`**](opcodes/readfi.md)`(ifilname)`<br>


`kres = `[**`readk`**](opcodes/readk.md)`(ifilname, iformat, iprd)`<br>


`kr1, kr2 = `[**`readk2`**](opcodes/readk2.md)`(ifilname, iformat, iprd)`<br>


`kr1, kr2, kr3 = `[**`readk3`**](opcodes/readk3.md)`(ifilname, iformat, iprd)`<br>


`kr1, kr2, kr3, kr4 = `[**`readk4`**](opcodes/readk4.md)`(ifilname, iformat, iprd)`<br>


### Signal I/O:Signal Input
`ar1 [, ar2 [, ar3 [, ... arN]]] = `[**`diskin`**](opcodes/diskin.md)`(ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwraparound[, iformat[, iskipinit]]]]])`<br>


`a1[, a2[, ... aN]] = `[**`diskin2`**](opcodes/diskin2.md)`(ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]])`<br>
`ar1[] = diskin2(ifilcod[, kpitch[, iskiptim \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]])`<br>


`ar1 = `[**`in`**](opcodes/in.md)`()`<br>
`aarray = in()`<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \`<br>
`ar15, ar16, ar17, ar18, ar19, ar20, ar21, ar22, ar23, ar24, ar25, ar26, \`<br>
`ar27, ar28, ar29, ar30, ar31, ar32 = `[**`in`**](opcodes/in32.md)`32()`<br>


`ain1[, ...] = `[**`inch`**](opcodes/inch.md)`(kchan1[,...])`<br>


`ar1, ar2, ar3, ar4, ar5, ar6 = `[**`inh`**](opcodes/inh.md)`()`<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8 = `[**`ino`**](opcodes/ino.md)`()`<br>


`ar1, ar2,  ar3, a4 = `[**`inq`**](opcodes/inq.md)`()`<br>


[**`inrg`**](opcodes/inrg.md)`(kstart, ain1 [,ain2, ain3, ..., ainN])`<br>


`ar1, ar2 = `[**`ins`**](opcodes/ins.md)`()`<br>


`ivalue = `[**`invalue`**](opcodes/invalue.md)`("channel name")`<br>
`kvalue = invalue("channel name")`<br>
`Sname = invalue("channel name")`<br>


`ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, \`<br>
`ar13, ar14, ar15, ar16 = `[**`in`**](opcodes/inx.md)`x()`<br>


[**`inz`**](opcodes/inz.md)`(ksig1)`<br>


`ar1, ar2 = `[**`mp3in`**](opcodes/mp3in.md)`(ifilcod[, iskptim, iformat, iskipinit, ibufsize])`<br>
`ar1 = mp3in(ifilcod[, iskptim, iformat, iskipinit, ibufsize])`<br>


`ar1[, ar2[, ar3[, ... a24]]] = `[**`soundin`**](opcodes/soundin.md)`(ifilcod [, iskptim] [, iformat] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iskipinit] [, ibufsize])`<br>


### Signal I/O:Signal Output
[**`mdelay`**](opcodes/mdelay.md)`(kstatus, kchan, kd1, kd2, kdelay)`<br>


`aout1 [,aout2 ... aoutX] = `[**`monitor`**](opcodes/monitor.md)`()`<br>
`aarra = monitor()`<br>


[**`out`**](opcodes/out.md)`(asig1[, asig2,....])`<br>
`out(aarray)`<br>


[**`out32`**](opcodes/out32.md)`(asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8, asig10, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig11, asig12, asig13, asig14, asig15, asig16, asig17, asig18, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig19, asig20, asig21, asig22, asig23, asig24, asig25, asig26, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig27, asig28, asig29, asig30, asig31, asig32)`<br>


[**`outall`**](opcodes/outall.md)`(asig)`<br>


[**`outc`**](opcodes/outc.md)`(asig1 [, asig2] [...])`<br>


[**`outch`**](opcodes/outch.md)`(kchan1, asig1 [, kchan2] [, asig2] [...])`<br>


[**`outh`**](opcodes/outh.md)`(asig1, asig2, asig3, asig4, asig5, asig6)`<br>


[**`outo`**](opcodes/outo.md)`(asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8)`<br>


[**`outq`**](opcodes/outq.md)`(asig1, asig2, asig3, asig4)`<br>


[**`outq1`**](opcodes/outq1.md)`(asig)`<br>


[**`outq2`**](opcodes/outq2.md)`(asig)`<br>


[**`outq3`**](opcodes/outq3.md)`(asig)`<br>


[**`outq4`**](opcodes/outq4.md)`(asig)`<br>


[**`outrg`**](opcodes/outrg.md)`(kstart, aout1 [,aout2, aout3, ..., aoutN])`<br>


[**`outs`**](opcodes/outs.md)`(asig1, asig2)`<br>


[**`outs1`**](opcodes/outs1.md)`(asig)`<br>


[**`outs2`**](opcodes/outs2.md)`(asig)`<br>


[**`outvalue`**](opcodes/outvalue.md)`("channel name", ivalue)`<br>
`outvalue("channel name", kvalue)`<br>
`outvalue("channel name", "string")`<br>


[**`outx`**](opcodes/outx.md)`(asig1, asig2, asig3, asig4, asig5, asig6, asig7, asig8, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig9, asig10, asig11, asig12, asig13, asig14, asig15, asig16)`<br>


[**`outz`**](opcodes/outz.md)`(ksig1)`<br>


[**`soundout`**](opcodes/soundout.md)`(asig1, ifilcod [, iformat])`<br>


[**`soundouts`**](opcodes/soundouts.md)`(asigl, asigr, ifilcod [, iformat])`<br>


### Signal I/O:Software Bus
`kval = `[**`chani`**](opcodes/chani.md)`(kchan)`<br>
`aval = chani(kchan)`<br>


[**`chano`**](opcodes/chano.md)`(kval, kchan)`<br>
`chano(aval, kchan)`<br>


[**`chn`**](opcodes/chn.md)`_k(Sname, imode[, itype, idflt, imin, ima, ix, iy, iwidth, iheight, Sattributes])`<br>
`chn_a(Sname, imode)`<br>
`chn_S(Sname, imode)`<br>
`chn_S(Sname, Smode)`<br>
`chn_array(Sname, imode, Stype, iSizes[])`<br>


[**`chnclear`**](opcodes/chnclear.md)`(Sname1[, Sname2,...])`<br>


`gival = `[**`chnexport`**](opcodes/chnexport.md)`(Sname, imode[, itype, idflt, imin, imax])`<br>
`gkval = chnexport(Sname, imode[, itype, idflt, imin, imax])`<br>
`gaval = chnexport(Sname, imode)`<br>
`gSval = chnexport(Sname, imode)`<br>


`ival = `[**`chnget`**](opcodes/chnget.md)`(Sname)`<br>
`kval = chnget(Sname)`<br>
`aval = chnget(Sname)`<br>
`Sval = chnget(Sname)`<br>
`Sval = chngetks(Sname)`<br>
`ival[] = chngeti(Sname[])`<br>
`kval[] = chngetk(Sname[])`<br>
`aval[] = chngeta(Sname[])`<br>
`Sval[] = chngets(Sname[])`<br>


[**`chnmix`**](opcodes/chnmix.md)`(aval, Sname)`<br>


`itype, imode, ictltype, idflt, imin, imax = `[**`chnparams`**](opcodes/chnparams.md)`(Sname)`<br>


[**`chnset`**](opcodes/chnset.md)`(ival, Sname)`<br>
`chnset(kval, Sname)`<br>
`chnset(aval, Sname)`<br>
`chnset(Sval, Sname)`<br>
`chnsetks(Sval, Sname)`<br>
`chnseti(ival[], []Sname)`<br>
`chnsetk(kval[], []Sname)`<br>
`chnseta(aval[], []Sname)`<br>
`chnsets(Sval[], []Sname)`<br>


[**`oversample`**](opcodes/oversample.md)`(ifactor [,icvt_in, icvt_out])`<br>


[**`setksmps`**](opcodes/setksmps.md)`(iksmps)`<br>


[**`undersample`**](opcodes/undersample.md)`(ifactor [,icvt_in, icvt_out])`<br>


[**`xin`**](opcodes/xin.md)`arg1 [, [**`xin`**](opcodes/xin.md)arg2] ... [[**`xin`**](opcodes/xin.md)argN] [**`xin`**](opcodes/xin.md)`<br>


[**`xout`**](opcodes/xout.md)`([**`xout`**](opcodes/xout.md)arg1 [, [**`xout`**](opcodes/xout.md)arg2] ... [, [**`xout`**](opcodes/xout.md)argN])`<br>


### Signal I/O:Printing and Display
[**`dispfft`**](opcodes/dispfft.md)`(xsig, iprd, iwsiz [, iwtyp] [, idbout] [, iwtflg] [,imin] [,imax])`<br>


[**`display`**](opcodes/display.md)`(xsig, iprd [, inprds] [, iwtflg])`<br>


[**`flashtxt`**](opcodes/flashtxt.md)`( iwhich, String)`<br>


[**`print`**](opcodes/print.md)`(iarg [, iarg1] [, iarg2] [...])`<br>


[**`printf`**](opcodes/printf.md)`_i(Sfmt, itrig, [iarg1[, iarg2[, ... ]]])`<br>
`printf(Sfmt, ktrig, [xarg1[, xarg2[, ... ]]])`<br>


[**`printk`**](opcodes/printk.md)`(itime, kval [, ispace] [, inamed])`<br>


[**`printk2`**](opcodes/printk2.md)`(kvar [, inumspaces] [, inamed])`<br>


[**`printks`**](opcodes/printks.md)`("string", itime [, xval1] [, xval2] [...])`<br>


[**`printks2`**](opcodes/printks2.md)`("string", kval)`<br>


[**`println`**](opcodes/println.md)`("string", [, xval1] [, xval2] [...])`<br>


[**`prints`**](opcodes/prints.md)`("string" [, xval1] [, xval2] [...])`<br>


[**`printsk`**](opcodes/printsk.md)`("string", [, xval1] [, xval2] [...])`<br>


### Signal I/O:Soundfile Queries
`ir = `[**`filebit`**](opcodes/filebit.md)`(ifilcod [, iallowraw])`<br>


`ir = `[**`filelen`**](opcodes/filelen.md)`(ifilcod, [iallowraw])`<br>


`ir = `[**`filenchnls`**](opcodes/filenchnls.md)`(ifilcod [, iallowraw])`<br>


`ir = `[**`filepeak`**](opcodes/filepeak.md)`(ifilcod [, ichnl])`<br>


`ir = `[**`filesr`**](opcodes/filesr.md)`(ifilcod [, iallowraw])`<br>


`ir = `[**`filevalid`**](opcodes/filevalid.md)`(ifilcod)`<br>
`kr = filevalid(ifilcod)`<br>


`ir = `[**`mp3len`**](opcodes/mp3len.md)`(ifilcod)`<br>


### Signal Modifiers:Amplitude Modifiers
`ares = `[**`balance`**](opcodes/balance.md)`(asig, acomp [, ihp] [, iskip])`<br>


`ares = `[**`balance2`**](opcodes/balance2.md)`(asig, acomp [, ihp] [, iskip])`<br>


`ares = `[**`clip`**](opcodes/clip.md)`(asig, imeth, ilimit [, iarg])`<br>


`ar = `[**`compress`**](opcodes/compress.md)`(aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook)`<br>


`ar = `[**`compress2`**](opcodes/compress2.md)`(aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook)`<br>


`ares = `[**`dam`**](opcodes/dam.md)`(asig, kthreshold, icomp1, icomp2, irtime, iftime)`<br>


`ares = `[**`gain`**](opcodes/gain.md)`(asig, krms [, ihp] [, iskip])`<br>


### Signal Modifiers:Convolution and Morphing


`ar1 [, ar2] [, ar3] [, ar4] = `[**`convolve`**](opcodes/convolve.md)`(ain, ifilcod [, ichannel])`<br>


`ares = `[**`cross2`**](opcodes/cross2.md)`(ain1, ain2, isize, ioverlap, iwin, kbias)`<br>


`ares = `[**`dconv`**](opcodes/dconv.md)`(asig, isize, ifn)`<br>


`a1[, a2[, a3[, ... a8]]] = `[**`ftconv`**](opcodes/ftconv.md)`(ain, ift, iplen[, iskipsamples \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iirlen[, iskipinit]]])`<br>


[**`ftmorf`**](opcodes/ftmorf.md)`(kftndx, iftfn, iresfn)`<br>


`ares = `[**`liveconv`**](opcodes/liveconv.md)`(ain, ift, iplen, kupdate, kclear)`<br>


`ar1 [, ar2 [, ar3 [, ar4]]] = `[**`pconvolve`**](opcodes/pconvolve.md)`(ain, ifilcod [, ipartitionsize [, ichannel]])`<br>


`ares = `[**`tvconv`**](opcodes/tvconv.md)`(asig1, asig2, xfreez1, xfreez2, iparts, ifils)`<br>


### Signal Modifiers:Delay
`ares = `[**`delay`**](opcodes/delay.md)`(asig, idlt [, iskip])`<br>


`ares = `[**`delay1`**](opcodes/delay1.md)`(asig [, iskip])`<br>


`kr = `[**`delayk`**](opcodes/delayk.md)`(ksig, idel[, imode])`<br>
`kr = vdel_k(ksig, kdel, imdel[, imode])`<br>


`ares = `[**`delayr`**](opcodes/delayr.md)`(idlt [, iskip])`<br>


[**`delayw`**](opcodes/delayw.md)`(asig)`<br>


`ares = `[**`deltap`**](opcodes/deltap.md)`(kdlt)`<br>


`ares = `[**`deltap3`**](opcodes/deltap3.md)`(xdlt)`<br>


`ares = `[**`deltapi`**](opcodes/deltapi.md)`(xdlt)`<br>


`ares = `[**`deltapn`**](opcodes/deltapn.md)`(xnumsamps)`<br>


`aout = `[**`deltapx`**](opcodes/deltapx.md)`(adel, iwsize)`<br>


[**`deltapxw`**](opcodes/deltapxw.md)`(ain, adel, iwsize)`<br>


`ares = `[**`multitap`**](opcodes/multitap.md)`(asig [, itime1, igain1] [, itime2, igain2] [...])`<br>


`ares = `[**`vdelay`**](opcodes/vdelay.md)`(asig, adel, imaxdel [, iskip])`<br>


`ares = `[**`vdelay3`**](opcodes/vdelay3.md)`(asig, adel, imaxdel [, iskip])`<br>


`aout = `[**`vdelayx`**](opcodes/vdelayx.md)`(ain, adl, imd, iws [, ist])`<br>


`aout1, aout2, aout3, aout4 = `[**`vdelayxq`**](opcodes/vdelayxq.md)`(ain1, ain2, ain3, ain4, adl, imd, iws [, ist])`<br>


`aout1, aout2 = `[**`vdelayxs`**](opcodes/vdelayxs.md)`(ain1, ain2, adl, imd, iws [, ist])`<br>


`aout = `[**`vdelayxw`**](opcodes/vdelayxw.md)`(ain, adl, imd, iws [, ist])`<br>


`aout1, aout2, aout3, aout4 = `[**`vdelayxwq`**](opcodes/vdelayxwq.md)`(ain1, ain2, ain3, ain4, adl, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imd, iws [, ist])`<br>


`aout1, aout2 = `[**`vdelayxws`**](opcodes/vdelayxws.md)`(ain1, ain2, adl, imd, iws [, ist])`<br>


### Signal Modifiers:Panning and Spatialization
`ao1, ao2 = `[**`bformdec1`**](opcodes/bformdec1.md)`(isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]])`<br>
`ao1, ao2, ao3, ao4 = bformdec1(isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]])`<br>
`ao1, ao2, ao3, ao4, ao5 = bformdec1(isetup, aw, ax, ay, az [, ar, as, at, au, av \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, abk, al, am, an, ao, ap, aq]])`<br>
`ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8 = bformdec1(isetup, aw, ax, ay, az \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ar, as, at, au, av [, abk, al, am, an, ao, ap, aq]])`<br>
`aout[] = bformdec1(isetup, abform[])`<br>


`aout[] = `[**`bformdec2`**](opcodes/bformdec2.md)`(isetup, abform[], [idecoder, idistance, ifreq, imix, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifilel, ifiler])`<br>


`aw, ax, ay, az = `[**`bformenc1`**](opcodes/bformenc1.md)`(asig, kalpha, kbeta)`<br>
`aw, ax, ay, az, ar, as, at, au, av = bformenc1(asig, kalpha, kbeta)`<br>
`aw, ax, ay, az, ar, as, at, au, av, ak, al, am, an, ao, ap, aq = bformenc1(\`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`asig, kalpha, kbeta)`<br>
`aarray[] = bformenc1(asig, kalpha, kbeta)`<br>


`aleft, aright, irt60low, irt60high, imfp = `[**`hrtfearly`**](opcodes/hrtfearly.md)`(asrc, ksrcx, ksrcy, ksrcz, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`klstnrx, klstnry, klstnrz, ifilel, ifiler, idefroom [,ifade, isr, iorder, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ithreed, kheadrot, iroomx, iroomy, iroomz, iwallhigh, iwalllow, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iwallgain1, iwallgain2, iwallgain3, ifloorhigh, ifloorlow, ifloorgain1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifloorgain2, ifloorgain3, iceilinghigh, iceilinglow, iceilinggain1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iceilinggain2, iceilinggain3])`<br>


`aleft, aright = `[**`hrtfer`**](opcodes/hrtfer.md)`(asig, kaz, kelev, "HRTFcompact")`<br>


`aleft, aright = `[**`hrtfmove`**](opcodes/hrtfmove.md)`(asrc, kAz, kElev, ifilel, ifiler [, imode, ifade, isr])`<br>


`aleft, aright = `[**`hrtfmove2`**](opcodes/hrtfmove2.md)`(asrc, kAz, kElev, ifilel, ifiler [,ioverlap, iradius, isr])`<br>


`aleft, aright, idel = `[**`hrtfreverb`**](opcodes/hrtfreverb.md)`(asrc, ilowrt60, ihighrt60, ifilel, ifiler \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,isr, imfp, iorder])`<br>


`aleft, aright = `[**`hrtfstat`**](opcodes/hrtfstat.md)`(asrc, iAz, iElev, ifilel, ifiler [,iradius, isr])`<br>


`a1, a2 = `[**`locsend`**](opcodes/locsend.md)`()`<br>
`a1, a2,  a3, a4 = locsend()`<br>


`a1, a2 = `[**`locsig`**](opcodes/locsig.md)`(asig, kdegree, kdistance, kreverbsend)`<br>
`a1, a2,  a3, a4 = locsig(asig, kdegree, kdistance, kreverbsend)`<br>


`aleft,aright = `[**`ms2st`**](opcodes/ms2st.md)`(am, as, kwidth)`<br>


`a1, a2, a3, a4 = `[**`pan`**](opcodes/pan.md)`(asig, kx, ky, ifn [, imode] [, ioffset])`<br>


`a1, a2 = `[**`pan2`**](opcodes/pan2.md)`(asig, xp [, imode])`<br>
`aouts[] = pan2(asig, xp [, imode])`<br>


`a1, a2, a3, a4  = `[**`space`**](opcodes/space.md)`(asig, ifn, ktime, kreverbsend, kx, ky)`<br>


`aW, aX, aY, aZ = `[**`spat3d`**](opcodes/spat3d.md)`(ain, kX, kY, kZ, idist, ift, imode, imdel, iovr [, istor])`<br>


`aW, aX, aY, aZ = `[**`spat3di`**](opcodes/spat3di.md)`(ain, iX, iY, iZ, idist, ift, imode [, istor])`<br>


[**`spat3dt`**](opcodes/spat3dt.md)`(ioutft, iX, iY, iZ, idist, ift, imode, irlen [, iftnocl])`<br>


`k1 = `[**`spdist`**](opcodes/spdist.md)`(ifn, ktime, kx, ky)`<br>


`a1, a2, a3, a4 = `[**`spsend`**](opcodes/spsend.md)`()`<br>


`am,as = `[**`st2ms`**](opcodes/st2ms.md)`(aleft,aright)`<br>


`ar1[, ar2...] = `[**`vbap`**](opcodes/vbap.md)`(asig, kazim [,kelev] [, kspread] [, ilayout])`<br>
`array[] = vbap(asig, kazim [,kelev] [, kspread] [, ilayout])`<br>


`ar1, ..., ar16 = `[**`vbap16`**](opcodes/vbap16.md)`(asig, kazim [, kelev] [, kspread])`<br>


`ar1, ..., ar16 = `[**`vbap16move`**](opcodes/vbap16move.md)`(asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>


`ar1, ar2, ar3, ar4 = `[**`vbap4`**](opcodes/vbap4.md)`(asig, kazim [, kelev] [, kspread])`<br>


`ar1, ar2, ar3, ar4 = `[**`vbap4move`**](opcodes/vbap4move.md)`(asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>


`ar1, ..., ar8 = `[**`vbap8`**](opcodes/vbap8.md)`(asig, kazim [, kelev] [, kspread])`<br>


`ar1, ..., ar8 = `[**`vbap8move`**](opcodes/vbap8move.md)`(asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>


`k1[, k2...] = `[**`vbapg`**](opcodes/vbapg.md)`(kazim [,kelev] [, kspread] [, ilayout])`<br>
`karray[] = vbapg(kazim [,kelev] [, kspread] [, ilayout])`<br>


`kr1[, kr2...] = `[**`vbapgmove`**](opcodes/vbapgmove.md)`(idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>
`karray[] = vbapgmove(idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>


[**`vbaplsinit`**](opcodes/vbaplsinit.md)`(idim, ilsnum [, idir1] [, idir2] [...] [, idir32])`<br>
`vbaplsinit(idim, ilsnum, ilsarray)`<br>


`ar1[, ar2...] = `[**`vbapmove`**](opcodes/vbapmove.md)`(asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>
`aarray[] = vbapmove(asig, idur, ispread, ifldnum, ifld1 [, ifld2] [...])`<br>


[**`vbapz`**](opcodes/vbapz.md)`(inumchnls, istartndx, asig, kazim [, kelev] [, kspread])`<br>


[**`vbapzmove`**](opcodes/vbapzmove.md)`(inumchnls, istartndx, asig, idur, ispread, ifldnum, ifld1, ifld2, [...])`<br>


### Signal Modifiers:Reverberation
`ares = `[**`alpass`**](opcodes/alpass.md)`(asig, xrvt, ilpt [, iskip] [, insmps])`<br>


`a1, a2 = `[**`babo`**](opcodes/babo.md)`(asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno])`<br>
`a1, a2 = babo2(asig, ksrcx, ksrcy, ksrcz, irx, iry, irz [, idiff] [, ifno])`<br>


`ares = `[**`comb`**](opcodes/comb.md)`(asig, krvt, ilpt [, iskip] [, insmps])`<br>


`ares = `[**`combinv`**](opcodes/combinv.md)`(asig, krvt, ilpt [, iskip] [, insmps])`<br>


`aoutL, aoutR = `[**`freeverb`**](opcodes/freeverb.md)`(ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]])`<br>


`ares = `[**`nestedap`**](opcodes/nestedap.md)`(asig, imode, imaxdel, idel1, igain1 [, idel2] [, igain2] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idel3] [, igain3] [, istor])`<br>


`ares = `[**`nreverb`**](opcodes/nreverb.md)`(asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, inumAlpas] [, ifnAlpas])`<br>


`a1[, a2, ...] = `[**`platerev`**](opcodes/platerev.md)`(itabexcite. itabouts, kbndry, iaspect, istiff, idecay, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iloss, aexcite1[, aexcite2, ...])`<br>


`ares = `[**`reverb`**](opcodes/reverb.md)`(asig, krvt [, iskip])`<br>


`ares = `[**`reverb2`**](opcodes/reverb2.md)`(asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, inumAlpas] [, ifnAlpas])`<br>


`aoutL, aoutR = `[**`reverbsc`**](opcodes/reverbsc.md)`(ainL, ainR, kfblvl, kfco[, israte[, ipitchm[, iskip]]])`<br>


`ares = `[**`valpass`**](opcodes/valpass.md)`(asig, krvt, xlpt, imaxlpt [, iskip] [, insmps])`<br>


`ares = `[**`vcomb`**](opcodes/vcomb.md)`(asig, krvt, xlpt, imaxlpt [, iskip] [, insmps])`<br>


### Signal Modifiers:Sample Level Operators
[**`S`**](opcodes/ops.md)`(x) (control-rate or init-rate arg)`<br>


[**`a`**](opcodes/opa.md)`(k)`<br>
`a(k[])`<br>


[**`denorm`**](opcodes/denorm.md)`(a1[, a2[, a3[, ... ]]])`<br>


`ares = `[**`diff`**](opcodes/diff.md)`(asig [, iskip])`<br>
`kres = diff(ksig [, iskip])`<br>


`kres = `[**`downsamp`**](opcodes/downsamp.md)`(asig [, iwlen])`<br>


`ares = `[**`fold`**](opcodes/fold.md)`(asig, kincr)`<br>


[**`i`**](opcodes/opi.md)`(x) (control-rate or [**`i`**](opcodes/opi.md)n[**`i`**](opcodes/opi.md)t-rate arg)`<br>
`i(karray,index1, ...) (k-array with indices)`<br>


`ares = `[**`integ`**](opcodes/integ.md)`(asig [, iskip])`<br>
`kres = integ(ksig [, iskip])`<br>


`ares = `[**`interp`**](opcodes/interp.md)`(ksig [, iskip] [, imode] [, ivalue])`<br>


[**`k`**](opcodes/opk.md)`(x) (i-rate args only)`<br>
`k(x) (a-rate args only)`<br>


`ares = `[**`ntrpol`**](opcodes/ntrpol.md)`(asig1, asig2, kpoint [, imin] [, imax])`<br>
`ires = ntrpol(isig1, isig2, ipoint [, imin] [, imax])`<br>
`kres = ntrpol(ksig1, ksig2, kpoint [, imin] [, imax])`<br>


`ares = `[**`samphold`**](opcodes/samphold.md)`(asig, agate [, ival] [, ivstor])`<br>
`kres = samphold(ksig, kgate [, ival] [, ivstor])`<br>


`ares = `[**`upsamp`**](opcodes/upsamp.md)`(ksig)`<br>


`kval = `[**`vaget`**](opcodes/vaget.md)`(kndx, avar)`<br>


[**`vaset`**](opcodes/vaset.md)`(kval, kndx, avar)`<br>


### Signal Modifiers:Signal Limiters
`ares = `[**`limit`**](opcodes/limit.md)`(asig, klow, khigh)`<br>
`ires = limit(isig, ilow, ihigh)`<br>
`kres = limit(ksig, klow, khigh)`<br>
`ires[] = limit(isig[], ilow, ihigh)`<br>
`kres[] = limit(ksig[], klow, khigh)`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`)`<br>


`ares = `[**`mirror`**](opcodes/mirror.md)`(asig, klow, khigh)`<br>
`ires = mirror(isig, ilow, ihigh)`<br>
`kres = mirror(ksig, klow, khigh)`<br>


`ares = `[**`wrap`**](opcodes/wrap.md)`(asig, klow, khigh)`<br>
`ires = wrap(isig, ilow, ihigh)`<br>
`kres = wrap(ksig, klow, khigh)`<br>


### Signal Modifiers:Special Effects
`ar = `[**`distort`**](opcodes/distort.md)`(asig, kdist, ifn[, ihp, istor])`<br>


`ares = `[**`distort1`**](opcodes/distort1.md)`(asig, kpregain, kpostgain, kshape1, kshape2[, imode])`<br>


`ashifted = `[**`doppler`**](opcodes/doppler.md)`(asource, ksourceposition, kmicposition [, isoundspeed, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifiltercutoff])`<br>


`ares = `[**`flanger`**](opcodes/flanger.md)`(asig, adel, kfeedback [, imaxd])`<br>


`ares = `[**`harmon`**](opcodes/harmon.md)`(asig, kestfrq, kmaxvar, kgenfreq1, kgenfreq2, imode, iminfrq, iprd)`<br>


`ares = `[**`harmon2`**](opcodes/harmon234.md)`(asig, koct, kfrq1, kfrq2, icpsmode, ilowest[, ipolarity])`<br>
`ares = harmon3(asig, koct, kfrq1, kfrq2, kfrq3, icpsmode, ilowest[, ipolarity])`<br>
`ares = harmon4(asig, koct, kfrq1, kfrq2, kfrq3, kfrq4, icpsmode, ilowest \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipolarity])`<br>


`ares = `[**`phaser1`**](opcodes/phaser1.md)`(asig, kfreq, kord, kfeedback [, iskip])`<br>


`ares = `[**`phaser2`**](opcodes/phaser2.md)`(asig, kfreq, kq, kord, kmode, ksep, kfeedback)`<br>


### Signal Modifiers:Standard Filters
`asig = `[**`K35_hpf`**](opcodes/k35_hpf.md)`(ain, xcf, xQ [, inlp, isaturation, istor])`<br>


`asig = `[**`K35_lpf`**](opcodes/k35_lpf.md)`(ain, xcf, xQ [, inlp, isaturation, istor])`<br>


`ares = `[**`atone`**](opcodes/atone.md)`(asig, khp [, iskip])`<br>


`ares = `[**`atonex`**](opcodes/atonex.md)`(asig, khp [, inumlayer] [, iskip])`<br>
`ares = atonex(asig, ahp [, inumlayer] [, iskip])`<br>


`ares = `[**`biquad`**](opcodes/biquad.md)`(asig, kb0, kb1, kb2, ka0, ka1, ka2 [, iskip])`<br>


`ares = `[**`biquada`**](opcodes/biquada.md)`(asig, ab0, ab1, ab2, aa0, aa1, aa2 [, iskip])`<br>


`ares = `[**`butbp`**](opcodes/butbp.md)`(asig, kfreq, kband [, iskip])`<br>


`ares = `[**`butbr`**](opcodes/butbr.md)`(asig, kfreq, kband [, iskip])`<br>


`ares = `[**`buthp`**](opcodes/buthp.md)`(asig, kfreq [, iskip])`<br>
`ares = buthp(asig, afreq [, iskip])`<br>


`ares = `[**`butlp`**](opcodes/butlp.md)`(asig, kfreq [, iskip])`<br>
`ares = butlp(asig, afreq [, iskip])`<br>


`ares = `[**`butterbp`**](opcodes/butterbp.md)`(asig, xfreq, xband [, iskip])`<br>


`ares = `[**`butterbr`**](opcodes/butterbr.md)`(asig, xfreq, xband [, iskip])`<br>


`ares = `[**`butterhp`**](opcodes/butterhp.md)`(asig, kfreq [, iskip])`<br>
`ares = butterhp(asig, afreq [, iskip])`<br>


`ares = `[**`butterlp`**](opcodes/butterlp.md)`(asig, kfreq [, iskip])`<br>
`ares = butterlp(asig, afreq [, iskip])`<br>


`ares = `[**`clfilt`**](opcodes/clfilt.md)`(asig, kfreq, itype, inpol [, ikind] [, ipbr] [, isba] [, iskip])`<br>


`asig = `[**`diode_ladder`**](opcodes/diode_ladder.md)`(ain, xcf, xk [, inlp, isaturation, istor])`<br>


`ares = `[**`median`**](opcodes/median.md)`(asig, ksize, imaxsize [, iskip])`<br>


`kres = `[**`mediank`**](opcodes/mediank.md)`(kin, ksize, imaxsize [, iskip])`<br>


`aout = `[**`mode`**](opcodes/mode.md)`(ain, xfreq, xQ [, iskip])`<br>


`ares = `[**`tone`**](opcodes/tone.md)`(asig, khp [, iskip])`<br>


`ares = `[**`tonex`**](opcodes/tonex.md)`(asig, khp [, inumlayer] [, iskip])`<br>
`ares = tonex(asig, ahp [, inumlayer] [, iskip])`<br>


`asig = `[**`zdf_1pole`**](opcodes/zdf_1pole.md)`(ain, xcf [, kmode, istor])`<br>


`alp, ahp = `[**`zdf_1pole_mode`**](opcodes/zdf_1pole_mode.md)`(ain, xcf [, istor])`<br>


`asig = `[**`zdf_2pole`**](opcodes/zdf_2pole.md)`(ain, xcf, xQ [, kmode, istor])`<br>


`alp, abp, ahp = `[**`zdf_2pole_mode`**](opcodes/zdf_2pole_mode.md)`(ain, xcf, Q [, istor])`<br>


`asig = `[**`zdf_ladder`**](opcodes/zdf_ladder.md)`(ain, xcf, xQ [, istor])`<br>


### Signal Modifiers:Standard Filters:Resonant
`ares = `[**`areson`**](opcodes/areson.md)`(asig, kcf, kbw [, iscl] [, iskip])`<br>
`ares = areson(asig, acf, kbw [, iscl] [, iskip])`<br>
`ares = areson(asig, kcf, abw [, iscl] [, iskip])`<br>
`ares = areson(asig, acf, abw [, iscl] [, iskip])`<br>


`asig = `[**`bob`**](opcodes/bob.md)`(ain, xcf, xres, xsat [, iosamps, istor])`<br>


`ares = `[**`bqrez`**](opcodes/bqrez.md)`(asig, xfco, xres [, imode] [, iskip])`<br>


`ares = `[**`lowpass2`**](opcodes/lowpass2.md)`(asig, kcf, kq [, iskip])`<br>


`ares = `[**`lowres`**](opcodes/lowres.md)`(asig, xcutoff, xresonance [, iskip])`<br>


`ares = `[**`lowresx`**](opcodes/lowresx.md)`(asig, xcutoff, xresonance [, inumlayer] [, iskip])`<br>


`ares = `[**`lpf18`**](opcodes/lpf18.md)`(asig, xfco, xres, xdist [, iskip])`<br>


`asig = `[**`moogladder`**](opcodes/moogladder.md)`(ain, kcf, kres[, istor])`<br>
`asig = moogladder(ain, acf, kres[, istor])`<br>
`asig = moogladder(ain, kcf, ares[, istor])`<br>
`asig = moogladder(ain, acf, ares[, istor])`<br>


`asig = `[**`moogladder2`**](opcodes/moogladder2.md)`(ain, kcf, kres[, istor])`<br>
`asig = moogladder2(ain, acf, kres[, istor])`<br>
`asig = moogladder2(ain, kcf, ares[, istor])`<br>
`asig = moogladder2(ain, acf, ares[, istor])`<br>


`ares = `[**`moogvcf`**](opcodes/moogvcf.md)`(asig, xfco, xres [,iscale, iskip])`<br>


`ares = `[**`moogvcf2`**](opcodes/moogvcf2.md)`(asig, xfco, xres [,iscale, iskip])`<br>


`asig = `[**`mvchpf`**](opcodes/mvchpf.md)`(ain, xcf[, istor])`<br>


`asig = `[**`mvclpf1`**](opcodes/mvclpf1.md)`(ain, xcf, xres[,istor])`<br>


`asig = `[**`mvclpf2`**](opcodes/mvclpf2.md)`(ain, xcf, xres[, istor])`<br>


`asig = `[**`mvclpf3`**](opcodes/mvclpf3.md)`(ain, xcf, xres[, istor])`<br>


`asig1, asig2, asig3, asig4 = `[**`mvclpf4`**](opcodes/mvclpf4.md)`(ain, xcf, xres[, istor])`<br>


`sig4:a, sig2:a  = `[**`otafilter`**](opcodes/otafilter.md)`(in:a, cf:{a,k}, res:{a,k}, drive:k[, stor:i])`<br>


`ares = `[**`reson`**](opcodes/reson.md)`(asig, xcf, xbw [, iscl] [, iskip])`<br>


`ares = `[**`resonr`**](opcodes/resonr.md)`(asig, xcf, xbw [, iscl] [, iskip])`<br>


`ares = `[**`resonx`**](opcodes/resonx.md)`(asig, xcf, xbw [, inumlayer] [, iscl] [, iskip])`<br>


`ares = `[**`resony`**](opcodes/resony.md)`(asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip])`<br>


`ares = `[**`resonz`**](opcodes/resonz.md)`(asig, xcf, xbw [, iscl] [, iskip])`<br>


`ares = `[**`rezzy`**](opcodes/rezzy.md)`(asig, xfco, xres [, imode, iskip])`<br>


`asig = `[**`skf`**](opcodes/skf.md)`(asig, xcf, xK[, ihp, istor])`<br>


`asig = `[**`spf`**](opcodes/spf.md)`(alp,ahp,abp, xcf, xR[, istor])`<br>


`ahp, alp, abp, abr = `[**`statevar`**](opcodes/statevar.md)`(ain, xcf, xq [, iosamps, istor])`<br>


`alow, ahigh, aband = `[**`svfilter`**](opcodes/svfilter.md)`(asig, kcf, kq [, iscl] [, iskip])`<br>


`ahp,alp,abp,abr = `[**`svn`**](opcodes/svn.md)`(asig, xcf, xQ, kdrive[, ifn,inm,imx, istor])`<br>


`ares = `[**`tbvcf`**](opcodes/tbvcf.md)`(asig, xfco, xres, kdist, kasym [, iskip])`<br>


`asig = `[**`vclpf`**](opcodes/vclpf.md)`(ain, xcf, xres[, istor])`<br>


`ares = `[**`vlowres`**](opcodes/vlowres.md)`(asig, kfco, kres, iord, ksep)`<br>


### Signal Modifiers:Standard Filters:Control
`kres = `[**`aresonk`**](opcodes/aresonk.md)`(ksig, kcf, kbw [, iscl] [, iskip])`<br>


`kres = `[**`atonek`**](opcodes/atonek.md)`(ksig, khp [, iskip])`<br>


`aout = `[**`lag`**](opcodes/lag.md)`(ain, k[**`lag`**](opcodes/lag.md)time [, initialvalue])`<br>
`kout = lag(kin, klagtime [, initialvalue])`<br>


`aout = `[**`lagud`**](opcodes/lagud.md)`(ain, klagup, klagdown [, initialvalue])`<br>
`kout = lagud(kin, klagup, klagdown [, initialvalue])`<br>


`kres = `[**`lineto`**](opcodes/lineto.md)`(ksig, ktime)`<br>


`kres = `[**`port`**](opcodes/port.md)`(ksig, ihtim [, isig])`<br>


`kres = `[**`portk`**](opcodes/portk.md)`(ksig, khtim [, isig])`<br>


`kres = `[**`resonk`**](opcodes/resonk.md)`(ksig, kcf, kbw [, iscl] [, iskip])`<br>


`kres = `[**`resonxk`**](opcodes/resonxk.md)`(ksig, kcf, kbw[, inumlayer, iscl, istor])`<br>


`kres = `[**`tlineto`**](opcodes/tlineto.md)`(ksig, ktime, ktrig)`<br>


`kres = `[**`tonek`**](opcodes/tonek.md)`(ksig, khp [, iskip])`<br>


`aout = `[**`trighold`**](opcodes/trighold.md)`(ain, kdur)`<br>
`kout = trighold(kin, kdur)`<br>


### Signal Modifiers:Specialized Filters
`ares = `[**`dcblock`**](opcodes/dcblock.md)`(ain [, igain])`<br>


`ares = `[**`dcblock2`**](opcodes/dcblock2.md)`(ain [, iorder] [, iskip])`<br>


`asig = `[**`eqfil`**](opcodes/eqfil.md)`(ain, kcf, kbw, kgain[, istor])`<br>


`ares = `[**`exciter`**](opcodes/exciter.md)`(asig, kfreq, kceil, kharmonics, kblend)`<br>


`ares = `[**`filter2`**](opcodes/filter2.md)`(asig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN)`<br>
`kres = filter2(ksig, ibcoefs, iacoefs, ib0, ib1, ..., ibM, ia1, ia2, ..., iaN)`<br>


`am, af = `[**`fmanal`**](opcodes/fmanal.md)`(are, aim)`<br>


`asig = `[**`fofilter`**](opcodes/fofilter.md)`(ain, xcf, xris, xdec[, istor])`<br>


`aout = `[**`gtf`**](opcodes/gtf.md)`(ain, kfreq, idecay[, iorder, iphase])`<br>


`c:a, s:a = `[**`hilbert`**](opcodes/hilbert.md)`(sig:a)`<br>
`csig:Complex[] = hilbert(sig:a)`<br>


`c:a, s:a = `[**`hilbert2`**](opcodes/hilbert2.md)`(sig:a, fftsize:a, hopsize:i)`<br>
`csig:Complex[] = hilbert2(sig:a, fftsize:a, hopsize:i)    `<br>


`aout = `[**`mvmfilter`**](opcodes/mvmfilter.md)`(ain, xfreq, xTau [, iskip])`<br>


`ares = `[**`nlfilt`**](opcodes/nlfilt.md)`(ain, ka, kb, kd, kC, kL)`<br>


`ares = `[**`nlfilt2`**](opcodes/nlfilt2.md)`(ain, ka, kb, kd, kC, kL)`<br>


`ares = `[**`pareq`**](opcodes/pareq.md)`(asig, kc, kv, kq [, imode] [, iskip])`<br>


`ar = `[**`rbjeq`**](opcodes/rbjeq.md)`(asig, kfco, klvl, kQ, kS[, imode])`<br>


`ares = `[**`zfilter2`**](opcodes/zfilter2.md)`(asig, kdamp, kfreq, iM, iN, ib0, ib1, ..., ibM, ia1,ia2, ..., iaN)`<br>


### Signal Modifiers:Waveguides
`ares = `[**`wguide1`**](opcodes/wguide1.md)`(asig, xfreq, kcutoff, kfeedback)`<br>


`ares = `[**`wguide2`**](opcodes/wguide2.md)`(asig, xfreq1, xfreq2, kcutoff1, kcutoff2, kfeedback1, kfeedback2)`<br>


### Signal Modifiers:Waveshaping
`aout = `[**`chebyshevpoly`**](opcodes/chebyshevpoly.md)`(ain, k0 [, k1 [, k2 [...]]])`<br>


`aout = `[**`pdclip`**](opcodes/pdclip.md)`(ain, kWidth, kCenter [, ibipolar [, ifullscale]])`<br>


`aout = `[**`pdhalf`**](opcodes/pdhalf.md)`(ain, kShapeAmount [, ibipolar [, ifullscale]])`<br>


`aout = `[**`pdhalfy`**](opcodes/pdhalfy.md)`(ain, kShapeAmount [, ibipolar [, ifullscale]])`<br>


`aout = `[**`powershape`**](opcodes/powershape.md)`(ain, kShapeAmount [, ifullscale])`<br>


### Signal Modifiers:Phase Shaping
`avp = `[**`vps`**](opcodes/vps.md)`(aph,kd,kv)`<br>


### Signal Modifiers:Comparators and Accumulators
`aout = `[**`cmp`**](opcodes/cmp.md)`(a1, S_operator, a2)`<br>
`aout = cmp(a1, S_operator, kb)`<br>
`kOut[] = cmp(kA[], S_operator, kb)`<br>
`kOut[] = cmp(kA[], S_operator, kB[])`<br>
`kOut[] = cmp(k1, S_operator1, kIn[], S_operator2, k2)`<br>


`a`[**`max`**](opcodes/max.md)` = [**`max`**](opcodes/max.md)(ain1, ain2 [, ain3] [, ain4] [...])`<br>
`kmax = max(kin1, kin2 [, kin3] [, kin4] [...])`<br>
`imax = max(iin1, iin2 [, iin3] [, iin4] [...])`<br>


`knumkout = `[**`max_k`**](opcodes/max_k.md)`(asig, ktrig, itype)`<br>


`amax = `[**`maxabs`**](opcodes/maxabs.md)`(ain1, ain2 [, ain3] [, ain4] [...])`<br>
`kmax = maxabs(kin1, kin2 [, kin3] [, kin4] [...])`<br>


[**`maxabsaccum`**](opcodes/maxabsaccum.md)`(aAccumulator, aInput)`<br>


[**`maxaccum`**](opcodes/maxaccum.md)`(aAccumulator, aInput)`<br>


`a`[**`min`**](opcodes/min.md)` = [**`min`**](opcodes/min.md)(ain1, ain2 [, ain3] [, ain4] [...])`<br>
`kmin = min(kin1, kin2 [, kin3] [, kin4] [...])`<br>
`imin = min(iin1, iin2 [, iin3] [, iin4] [...])`<br>


`amin = `[**`minabs`**](opcodes/minabs.md)`(ain1, ain2 [, ain3] [, ain4] [...])`<br>
`kmin = minabs(kin1, kin2 [, kin3] [, kin4] [...])`<br>


[**`minabsaccum`**](opcodes/minabsaccum.md)`(aAccumulator, aInput)`<br>


[**`minaccum`**](opcodes/minaccum.md)`(aAccumulator, aInput)`<br>


### Instrument Control:Clock Control
[**`clockoff`**](opcodes/clockoff.md)`(inum)`<br>


[**`clockon`**](opcodes/clockon.md)`(inum)`<br>


### Instrument Control:Conditional Values
`(a `[**`!=`**](opcodes/notequal.md)` b ? v1 : v2)`<br>


`(a `[**`>`**](opcodes/greaterthan.md)`  b ? v1 : v2)`<br>


`(a `[**`>=`**](opcodes/greaterequal.md)` b ? v1 : v2)`<br>


`(a `[**`<`**](opcodes/lessthan.md)`  b ? v1 : v2)`<br>


`(a `[**`<=`**](opcodes/lessequal.md)` b ? v1 : v2)`<br>


`(a `[**`==`**](opcodes/equals.md)` b ? v1 : v2)`<br>


### Instrument Control:Compilation
`ires = `[**`compilecsd`**](opcodes/compilecsd.md)`(Sfilename)`<br>


`ires = `[**`compileorc`**](opcodes/compileorc.md)`(Sfilename)`<br>


`ires = `[**`compilestr`**](opcodes/compilestr.md)`(Sorch)`<br>


`ires = `[**`evalstr`**](opcodes/evalstr.md)`(Scode)`<br>
`kres = evalstr(Scode, ktrig)`<br>


[**`return`**](opcodes/return.md)`(ival)`<br>


### Instrument Control:Duration Control
[**`ihold`**](opcodes/ihold.md)`()`<br>


[**`turnoff`**](opcodes/turnoff.md)`()`<br>
`turnoff(inst)`<br>
`turnoff(knst)`<br>


[**`turnoff2`**](opcodes/turnoff2.md)`(kinsno, kmode, krelease)`<br>
`turnoff2_i(insno, imode, irelease)`<br>


[**`turnoff3`**](opcodes/turnoff3.md)`(kinsno)`<br>


[**`turnon`**](opcodes/turnon.md)`(insnum [, itime])`<br>


### Instrument Control:Invocation
[**`event`**](opcodes/event.md)`("scorechar", kinsnum, kdelay, kdur, [, kp4] [, kp5] [, ...])`<br>
`event("scorechar", "insname", kdelay, kdur, [, kp4] [, kp5] [, ...])`<br>


[**`event_i`**](opcodes/event_i.md)`("scorechar", iinsnum, idelay, idur, [, ip4] [, ip5] [, ...])`<br>
`event_i("scorechar", "insname", idelay, idur, [, ip4] [, ip5] [, ...])`<br>


[**`mute`**](opcodes/mute.md)`(insnum [, iswitch])`<br>
`mute("insname" [, iswitch])`<br>


`iHandle = `[**`nstance`**](opcodes/nstance.md)`(insnum, iwhen, idur [, ip4] [, ip5] [...])`<br>
`iHandle = nstance("insname", iwhen, idur [, ip4] [, ip5] [...])`<br>


[**`readscore`**](opcodes/readscore.md)`(Sin)`<br>


[**`remove`**](opcodes/remove.md)`(insnum)`<br>


[**`schedkwhen`**](opcodes/schedkwhen.md)`(ktrigger, kmintim, kmaxnum, kinsnum, kwhen, kdur )`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...])`<br>
`schedkwhen(ktrigger, kmintim, kmaxnum, "insname", kwhen, kdur \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...])`<br>


[**`schedkwhennamed`**](opcodes/schedkwhennamed.md)`(ktrigger, kmintim, kmaxnum, "name", kwhen, kdur \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ip4] [, ip5] [...])`<br>


[**`schedule`**](opcodes/schedule.md)`(insnum, iwhen, idur [, ip4] [, ip5] [...])`<br>
`schedule("insname", iwhen, idur [, ip4] [, ip5] [...])`<br>
`schedule(iPar[])`<br>


[**`schedulek`**](opcodes/schedulek.md)`(knsnum, kwhen, kdur [, kp4] [, kp5] [...])`<br>
`schedulek("insname", kwhen, kdur [, kp4] [, kp5] [...])`<br>
`schedulek(kPar[])`<br>


[**`schedwhen`**](opcodes/schedwhen.md)`(ktrigger, kinsnum, kwhen, kdur [, ip4] [, ip5] [...])`<br>
`schedwhen(ktrigger, "insname", kwhen, kdur [, ip4] [, ip5] [...])`<br>


[**`scoreline`**](opcodes/scoreline.md)`(Sin, ktrig)`<br>


[**`scoreline_i`**](opcodes/scoreline_i.md)`(Sin)`<br>


### Instrument Control:Program Flow Control
[**`break`**](opcodes/break.md)<br>


[**`cggoto`**](opcodes/cggoto.md)`(condition, label)`<br>


[**`cigoto`**](opcodes/cigoto.md)`(condition, label)`<br>


[**`ckgoto`**](opcodes/ckgoto.md)`(condition, label)`<br>


[**`cngoto`**](opcodes/cngoto.md)`(condition, label)`<br>


[**`continue`**](opcodes/continue.md)<br>


[**`else`**](opcodes/else.md)<br>


[**`elseif`**](opcodes/elseif.md)` xa R xb then`<br>


[**`endif`**](opcodes/endif.md)<br>


[**`for`**](opcodes/for.md)` var in array-expr do`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`...`<br>
`od`<br>
`for var, index in array-expr do`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`...`<br>
`od`<br>


[**`goto`**](opcodes/goto.md)`(label)`<br>


[**`if`**](opcodes/if.md)` ia R ib igoto label`<br>
`if ka R kb kgoto label`<br>
`if xa R xb goto label`<br>
`if xa R xb then`<br>


[**`igoto`**](opcodes/igoto.md)`(label)`<br>


[**`kgoto`**](opcodes/kgoto.md)`(label)`<br>


[**`loop_ge`**](opcodes/loop_ge.md)`(indx, idecr, imin, label)`<br>
`loop_ge(kndx, kdecr, kmin, label)`<br>


[**`loop_gt`**](opcodes/loop_gt.md)`(indx, idecr, imin, label)`<br>
`loop_gt(kndx, kdecr, kmin, label)`<br>


[**`loop_le`**](opcodes/loop_le.md)`(indx, incr, imax, label)`<br>
`loop_le(kndx, kncr, kmax, label)`<br>


[**`loop_lt`**](opcodes/loop_lt.md)`(indx, incr, imax, label)`<br>
`loop_lt(kndx, kncr, kmax, label)`<br>


[**`switch`**](opcodes/switch.md)` expr`<br>
`case case-const`<br>
`...`<br>
`case case-const`<br>
`...`<br>
`default`<br>
`...`<br>
`endsw`<br>


[**`tigoto`**](opcodes/tigoto.md)`(label)`<br>


[**`timout`**](opcodes/timout.md)`(istrt, idur, label)`<br>


[**`until`**](opcodes/until.md)` condition do`<br>
`... od`<br>


[**`while`**](opcodes/while.md)` condition do`<br>
`... od`<br>


### Instrument Control:Realtime Performance Control
`ir = `[**`active`**](opcodes/active.md)`(insnum [,iopt [,inorel]])`<br>
`ir = active(Sinsname [,iopt [,inorel]])`<br>
`kres = active(kinsnum [,iopt [,inorel]])`<br>


`ktot[,kcpu1, kcpu2,...] = `[**`cpumeter`**](opcodes/cpumeter.md)`(ifreq)`<br>


[**`cpuprc`**](opcodes/cpuprc.md)`(insnum, ipercent)`<br>
`cpuprc(Sinsname, ipercent)`<br>


[**`exitnow`**](opcodes/exitnow.md)`([ivalue])`<br>


[**`maxalloc`**](opcodes/maxalloc.md)`(insnum, icount)`<br>
`maxalloc(Sinsname, icount)`<br>


`err:k = `[**`perf`**](opcodes/perf.md)`(ins:Instr[, p4:k, ...])`<br>
`[var:*,... =] perf(opc:Opcode[,arg1:*,...])`<br>


[**`prealloc`**](opcodes/prealloc.md)`(insnum, icount)`<br>
`prealloc("insname", icount)`<br>


[**`setp`**](opcodes/setp.md)`(ins:Instr,num:k,val:k)`<br>


### Instrument Control:Initialization and Reinitialization
`ares `[**`+=`**](opcodes/plusbecomes.md)` xarg`<br>
`ires += iarg`<br>
`kres += karg`<br>
`table [ kval] += karg`<br>


`ares `[**`=`**](opcodes/assign.md)` xarg`<br>
`ires = iarg`<br>
`kres = karg`<br>
`ires, ... = iarg, ...`<br>
`kres, ... = karg, ...`<br>
`table [ kval] = karg`<br>


`var:InstrDef = `[**`create`**](opcodes/create.md)`(code:S)`<br>
`var:Instr = create(instr:InstrDef)`<br>
`var:Opcode = create(opc:OpcodeDef[,overload:i]`<br>
`var:Opcode[] = create(opc:OpcodeDef,len:i[,overload:i])`<br>


`var:{a,k,i,S,OpcodeDef}[,...] = `[**`init`**](opcodes/init.md)`(arg:{i,S}[,...])`<br>
`var{i[],k[],a[]} = init(size1:i[,size2:i,...])`<br>
`err:i = init(inst:Instr[,p4:i,...])`<br>
`[var:*,... =] init(op:Opcode[,arg1:*,...])`<br>


`insno = `[**`nstrnum`**](opcodes/nstrnum.md)`("name")`<br>


`Sname = `[**`nstrstr`**](opcodes/nstrstr.md)`(insno)`<br>
`Sname = nstrstr(knsno)`<br>


[**`opcodeinfo`**](opcodes/opcodeinfo.md)`(opc:OpcodeDef)`<br>
`opcodeinfo(obj:Opcode)`<br>


[**`p`**](opcodes/p.md)`(x)`<br>


`ivar1, ... = `[**`passign`**](opcodes/passign.md)`([istart][, iend])`<br>
`iarray = passign([istart][, iend])`<br>
`karray = passign([istart][, iend])`<br>


[**`pset`**](opcodes/pset.md)`(icon1 [, icon2] [...])`<br>


[**`reinit`**](opcodes/reinit.md)`(label)`<br>


[**`rigoto`**](opcodes/rigoto.md)`(label)`<br>


[**`rireturn`**](opcodes/rireturn.md)`()`<br>


`ir = `[**`tival`**](opcodes/tival.md)`()`<br>


### Instrument Control:Sensing and Control
`kres = `[**`button`**](opcodes/button.md)`(knum)`<br>


`ktrig = `[**`changed`**](opcodes/changed.md)`(kvar1 [, kvar2,..., kvarN])`<br>


`ktrig = `[**`changed2`**](opcodes/changed2.md)`(kvar1 [, kvar2,..., kvarN])`<br>
`ktrig = changed2(karr[])`<br>
`ktrig = changed2(aarr[])`<br>


`kres = `[**`checkbox`**](opcodes/checkbox.md)`(knum)`<br>


`icnt = `[**`cntCreate`**](opcodes/cntcreate.md)`([imax, imin, inc])`<br>


`kval = `[**`cntCycles`**](opcodes/cntcycles.md)`(icnt)`<br>


`kval = `[**`cntDelete`**](opcodes/cntDelete.md)`(icnt)`<br>


`ival = `[**`cntDelete_i`**](opcodes/cntDelete_i.md)`(icnt)`<br>


`kval = `[**`cntRead`**](opcodes/cntread.md)`(icnt)`<br>


[**`cntReset`**](opcodes/cntreset.md)`(icnt)`<br>


`kmax, kmin, kinc = `[**`cntState`**](opcodes/cntstate.md)`(icnt)`<br>


`kres = `[**`control`**](opcodes/control.md)`(knum)`<br>


`kval = `[**`count`**](opcodes/count.md)`(icnt)`<br>


`ival = `[**`count_i`**](opcodes/count_i.md)`(icnt)`<br>


`ares = `[**`follow`**](opcodes/follow.md)`(asig, idt)`<br>


`ares = `[**`follow2`**](opcodes/follow2.md)`(asig, katt, krel)`<br>


`Svalue = `[**`getcfg`**](opcodes/getcfg.md)`(iopt)`<br>


`kres = `[**`joystick`**](opcodes/joystick.md)`(kdevice, ktab)`<br>


`ktrig  = `[**`metro`**](opcodes/metro.md)`( kfreq [, initphase])`<br>


`ktrig  = `[**`metro2`**](opcodes/metro2.md)`( kfreq, kswing [, iamp, initphase])`<br>


`ktrig  = `[**`metrobpm`**](opcodes/metrobpm.md)`( kfreq [, initphase] [, kgate])`<br>


`status:i,chan:i,data1:i,data2:i,time:i = `[**`midifilein`**](opcodes/midifilein.md)`(index:i,[id:i])`<br>
`status:k, chan:k, data1:k, data2:k, time:k = midifilein(index:k,[id:k])`<br>


` len:i =  `[**`midifilelen`**](opcodes/midifilelen.md)`([id:i])`<br>


` `[**`midifilemute`**](opcodes/midifilemute.md)`([id:i])`<br>


&nbsp;&nbsp;&nbsp;&nbsp;`id:i = midfileopen(name:S[,port:i])`<br>


` `[**`midifilepause`**](opcodes/midifilepause.md)`([id:i])`<br>


` `[**`midifileplay`**](opcodes/midifileplay.md)`([id:i])`<br>


` pos:i = `[**`midifilepos`**](opcodes/midifilepos.md)`([id:i])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`pos:k = midifilepos([id:i])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`midifilepos(pos:i[,id:i])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`midifilepos(pos:k[,id:i])`<br>


` `[**`midifilerewind`**](opcodes/midifilerewind.md)`([id:i])`<br>


` `[**`midifiletempo`**](opcodes/midifiletempo.md)`(tempo:i[,id:i])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`midifiletempo(tempo:k[,id:i])`<br>


` num:i =  `[**`midifilevents`**](opcodes/midifilevents.md)`([id:i])`<br>


`itempo = `[**`miditempo`**](opcodes/miditempo.md)`([id:i])`<br>
`ktempo = miditempo([id:i])`<br>


`icount = `[**`pcount`**](opcodes/pcount.md)`()`<br>


`kres = `[**`peak`**](opcodes/peak.md)`(asig)`<br>
`kres = peak(ksig)`<br>


`ivalue = `[**`pindex`**](opcodes/pindex.md)`(ipfieldIndex)`<br>


`koct, kamp = `[**`pitch`**](opcodes/pitch.md)`(asig, iupdte, ilo, ihi, idbthresh [, ifrqs] [, iconf] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, istrt] [, iocts] [, iq] [, inptls] [, irolloff] [, iskip])`<br>


`kcps, krms = `[**`pitchamdf`**](opcodes/pitchamdf.md)`(asig, imincps, imaxcps [, icps] [, imedi] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idowns] [, iexcps] [, irmsmedi])`<br>


`acps, alock = `[**`plltrack`**](opcodes/plltrack.md)`(asig, kd [, kloopf, kloopq, klf, khf, kthresh])`<br>


`kcps, kamp = `[**`ptrack`**](opcodes/ptrack.md)`(asig, ihopsize[,ipeaks])`<br>


`ival = `[**`readscratch`**](opcodes/readscratch.md)`([index])`<br>


[**`rewindscore`**](opcodes/rewindscore.md)`()`<br>


`kres = `[**`rms`**](opcodes/rms.md)`(asig [, ihp] [, iskip])`<br>




`kres [, kkeydown] = `[**`sensekey`**](opcodes/sensekey.md)`()`<br>


`ktrig_out = `[**`seqtime`**](opcodes/seqtime.md)`(ktime_unit, kstart, kloop, kinitndx, kfn_times)`<br>


`ktrig_out = `[**`seqtime2`**](opcodes/seqtime2.md)`(ktrig_in, ktime_unit, kstart, kloop, kinitndx, kfn_times)`<br>


`kres = `[**`sequ`**](opcodes/sequencer.md)`(irhythm[], iinstr[], idata[], kbpm, klen [, kmode] [, kstep] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kreset] [, kverbose])`<br>
`kres = sequ(irhythm[], iinstr[], idata[][], kbpm, klen [, kmode] [, kstep] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, kreset] [, kverbose])`<br>


[**`setctrl`**](opcodes/setctrl.md)`(inum, ival, itype)`<br>


[**`setscorepos`**](opcodes/setscorepos.md)`(ipos)`<br>


[**`splitrig`**](opcodes/splitrig.md)`(ktrig, kndx, imaxtics, ifn, kout1 [,kout2,...,koutN])`<br>


`ktemp = `[**`tempest`**](opcodes/tempest.md)`(kin, iprd, imindur, imemdur, ihp, ithresh, ihtim, ixfdbak, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`istartempo, ifn [, idisprd] [, itweek])`<br>


[**`tempo`**](opcodes/tempo.md)`(k[**`tempo`**](opcodes/tempo.md), istar[**`tempo`**](opcodes/tempo.md))`<br>


`kres = `[**`tempoval`**](opcodes/tempoval.md)`()`<br>


`ktrig = `[**`timedseq`**](opcodes/timedseq.md)`(ktimpnt, ifn, kp1 [,kp2, kp3, ...,kpN])`<br>


`kout = `[**`trigger`**](opcodes/trigger.md)`(ksig, kthreshold, kmode)`<br>


[**`trigseq`**](opcodes/trigseq.md)`(ktrig_in, kstart, kloop, kinitndx, kfn_values, kout1 [, kout2] [...])`<br>


`ares = `[**`vactrol`**](opcodes/vactrol.md)`(asig [iup, idown])`<br>


[**`writescratch`**](opcodes/writescratch.md)`(ival [index])`<br>


`kx, ky = `[**`xyin`**](opcodes/xyin.md)`(iprd, ixmin, ixmax, iymin, iymax [, ixinit] [, iyinit])`<br>


### Instrument Control:Stacks
`xval1, [xval2, ... , xval31] = `[**`pop`**](opcodes/pop.md)`()`<br>
`ival1, [ival2, ... , ival31] = pop()`<br>


`fsig = `[**`pop_f`**](opcodes/pop_f.md)`()`<br>


[**`push`**](opcodes/push.md)`(xval1, [xval2, ... , xval31])`<br>
`push(ival1, [ival2, ... , ival31])`<br>


[**`push_f`**](opcodes/push_f.md)`(fsig)`<br>


[**`stack`**](opcodes/stack.md)`(iStackSize)`<br>


### Instrument Control:Subinstrument Control
`a1, [...] [, a8] = `[**`subinstr`**](opcodes/subinstr.md)`(instrnum [, p4] [, p5] [...])`<br>
`a1, [...] [, a8] = subinstr("insname" [, p4] [, p5] [...])`<br>


[**`subinstrinit`**](opcodes/subinstrinit.md)`(instrnum [, p4] [, p5] [...])`<br>
`subinstrinit("insname" [, p4] [, p5] [...])`<br>


### Instrument Control:Time Reading
`ir[, inano] = `[**`date`**](opcodes/date.md)`()`<br>
`kr[, knano] = date()`<br>


`Sir = `[**`dates`**](opcodes/dates.md)`([ itime])`<br>


`ires = `[**`elapsedcycles`**](opcodes/elapsedcycles.md)`()`<br>
`kres = elapsedcycles()`<br>


`ires = `[**`elapsedtime`**](opcodes/elapsedtime.md)`()`<br>
`kres = elapsedtime()`<br>


`kres = `[**`eventcycles`**](opcodes/eventcycles.md)`()`<br>


`kres = `[**`eventtime`**](opcodes/eventtime.md)`()`<br>


`ir = `[**`readclock`**](opcodes/readclock.md)`(inum)`<br>


`ires = `[**`rtclock`**](opcodes/rtclock.md)`()`<br>
`kres = rtclock()`<br>


`kres = `[**`timeinstk`**](opcodes/timeinstk.md)`()`<br>


`kres = `[**`timeinsts`**](opcodes/timeinsts.md)`()`<br>


`ires = `[**`timek`**](opcodes/timek.md)`()`<br>
`kres = timek()`<br>


`ires = `[**`times`**](opcodes/times.md)`()`<br>
`kres = times()`<br>


### Serial I/O
`kval = `[**`arduinoRead`**](opcodes/arduinoRead.md)`(iPort, iStream [, iSmooth])`<br>


`kval = `[**`arduinoReadF`**](opcodes/arduinoReadF.md)`(iPort, iStream1, iStream2, iStream3)`<br>


`iPort = `[**`arduinoStart`**](opcodes/arduinoStart.md)`(SPortName [, ibaudRate])`<br>


[**`arduinoStop`**](opcodes/arduinoStop.md)`(iPort)`<br>


`iPort = `[**`serialBegin`**](opcodes/serialBegin.md)`(SPortName [, ibaudRate])`<br>


[**`serialEnd`**](opcodes/serialEnd.md)`(iPort)`<br>


[**`serialFlush`**](opcodes/serialFlush.md)`(iPort)`<br>


[**`serialPrint`**](opcodes/serialPrint.md)`(iPort)`<br>


`kByte = `[**`serialRead`**](opcodes/serialRead.md)`(iPort)`<br>


[**`serialWrite`**](opcodes/serialWrite.md)`(iPort, iByte)`<br>
`serialWrite(iPort, kByte)`<br>
`serialWrite(iPort, SBytes)`<br>


[**`serialWrite_i`**](opcodes/serialWrite_i.md)`(iPort, iByte)`<br>
`serialWrite_i(iPort, SBytes)`<br>


### Table Control
[**`ftfree`**](opcodes/ftfree.md)`(ifno, iwhen)`<br>


`gir = `[**`ftgen`**](opcodes/ftgen.md)`(ifn, itime, isize, igen, iarga [, iargb ] [...])`<br>
`gir = ftgen(ifn, itime, isize, igen, iarray)`<br>


`ifno = `[**`ftgentmp`**](opcodes/ftgentmp.md)`(ip1, ip2dummy, isize, igen, iarga, iargb, ...)`<br>


`Sdst = `[**`getftargs`**](opcodes/getftargs.md)`(iftno, ktrig)`<br>


[**`sndload`**](opcodes/sndload.md)`(Sfname[, ifmt[, ichns[, isr[, ibas[, iamp[, istrt [, ilpmod[, ilps \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ilpe]]]]]]]]])`<br>


### Table Control:Table Queries
[**`ftchnls`**](opcodes/ftchnls.md)`(x) (init-rate args only)`<br>


[**`ftcps`**](opcodes/ftcps.md)`(x) (init-rate args only)`<br>


`iexists = `[**`ftexists`**](opcodes/ftexists.md)`(ifn)`<br>
`kexists = ftexists(kfn / ifn)`<br>


[**`ftlen`**](opcodes/ftlen.md)`(x) (init-rate args only)`<br>


[**`ftlptim`**](opcodes/ftlptim.md)`(x) (init-rate args only)`<br>


[**`ftsr`**](opcodes/ftsr.md)`(x) (init-rate args only)`<br>


`karray = `[**`genarray_i`**](opcodes/genarray_i.md)`(istart, iend [,inc])`<br>


`ir = `[**`lenarray`**](opcodes/lenarray.md)`(karray[, iwhich])`<br>
`kr = lenarray(karray[, iwhich])`<br>


`karray = `[**`maparray`**](opcodes/maparray.md)`(kinarray, String)`<br>
`karray = maparray_i(kinarray, String)`<br>


[**`nsamp`**](opcodes/nsamp.md)`(x) (init-rate args only)`<br>


`karray = `[**`slicearray`**](opcodes/slicearray.md)`(kinarray, istart, iend [,istride])`<br>


`ires = `[**`tableng`**](opcodes/tableng.md)`(ifn)`<br>
`kres = tableng(kfn)`<br>


`kr = `[**`tabsum`**](opcodes/tabsum.md)`(ifn[[, kmin] [, kmax]])`<br>


### Table Control:Dynamic Selection
`ares = `[**`tableikt`**](opcodes/tableikt.md)`(xndx, kfn [, ixmode] [, ixoff] [, iwrap])`<br>
`kres = tableikt(kndx, kfn [, ixmode] [, ixoff] [, iwrap])`<br>


`ares = `[**`tablekt`**](opcodes/tablekt.md)`(xndx, kfn [, ixmode] [, ixoff] [, iwrap])`<br>
`kres = tablekt(kndx, kfn [, ixmode] [, ixoff] [, iwrap])`<br>


`ares = `[**`tablexkt`**](opcodes/tablexkt.md)`(xndx, kfn, kwarp, iwsize [, ixmode] [, ixoff] [, iwrap])`<br>


### Table Control:Read/Write Operations
`ians = `[**`ftaudio`**](opcodes/ftaudio.md)`(ifn, "filename", iformat[, ibeg, iend])`<br>
`kans = ftaudio(ktrig, kfn, "filename", kformat [, isync, kbeg, kend])`<br>


[**`ftload`**](opcodes/ftload.md)`(Sfilename, iflag, ifn1 [, ifn2] [...])`<br>


[**`ftloadk`**](opcodes/ftloadk.md)`(Sfilename, ktrig, iflag, ifn1 [, ifn2] [...])`<br>


[**`ftprint`**](opcodes/ftprint.md)`(ifn [, ktrig, kstart, kend, kstep, inumcols ])`<br>


`iNumberOfFile = `[**`ftsamplebank`**](opcodes/ftsamplebank.md)`(SDirectory, iFirstTableNumber, iSkipTime, iFormat, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iChannel,)`<br>
`kNumberOfFile = ftsamplebank(SDirectory, kFirstTableNumber, kTrigger, kSkipTime, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kFormat, kChannel,)`<br>


[**`ftsave`**](opcodes/ftsave.md)`("filename", iflag, ifn1 [, ifn2] [...])`<br>


[**`ftsavek`**](opcodes/ftsavek.md)`("filename", ktrig, iflag, ifn1 [, ifn2] [...])`<br>


[**`ftset`**](opcodes/ftset.md)`(ktablenum, kvalue [, kstart=0, kend=0, kstep=1 ])`<br>
`ftset(itablenum, ivalue [, istart=0, iend=0, istep=1 ])`<br>


[**`ftslice`**](opcodes/ftslice.md)`(ifnsource, ifndest [, kstart, kend, kstep ])`<br>
`ftslice(kfnsource, kfndest [, kstart, kend, kstep ])`<br>


[**`ftslicei`**](opcodes/ftslicei.md)`(ifnsource, ifndest [, istart, iend, istep ])`<br>


[**`tablecopy`**](opcodes/tablecopy.md)`(kdft, ksft)`<br>


`knumpassed = `[**`tablefilter`**](opcodes/tablefilter.md)`(kouttable, kintatble, kmode, kparam)`<br>


`inumpassed = `[**`tablefilteri`**](opcodes/tablefilteri.md)`(iouttable, iintatble, imode, iparam)`<br>


[**`tablegpw`**](opcodes/tablegpw.md)`(kfn)`<br>


[**`tableicopy`**](opcodes/tableicopy.md)`(idft, isft)`<br>


[**`tableigpw`**](opcodes/tableigpw.md)`(ifn)`<br>


[**`tableimix`**](opcodes/tableimix.md)`(idft, idoff, ilen, is1ft, is1off, is1g, is2ft, is2off, is2g)`<br>


[**`tablemix`**](opcodes/tablemix.md)`(kdft, kdoff, klen, ks1ft, ks1off, ks1g, ks2ft, ks2off, ks2g)`<br>


`ares = `[**`tablera`**](opcodes/tablera.md)`(kfn, kstart, koff)`<br>


[**`tablew`**](opcodes/tablew.md)`(asig, andx, ifn [, ixmode] [, ixoff] [, iwgmode])`<br>
`tablew(isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode])`<br>
`tablew(ksig, kndx, ifn [, ixmode] [, ixoff] [, iwgmode])`<br>


`kstart = `[**`tablewa`**](opcodes/tablewa.md)`(kfn, asig, koff)`<br>


[**`tablewkt`**](opcodes/tablewkt.md)`(asig, andx, kfn [, ixmode] [, ixoff] [, iwgmode])`<br>
`tablewkt(ksig, kndx, kfn [, ixmode] [, ixoff] [, iwgmode])`<br>


`kout = `[**`tabmorph`**](opcodes/tabmorph.md)`(kindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ...,ifnN])`<br>


`aout = `[**`tabmorpha`**](opcodes/tabmorpha.md)`(aindex, aweightpoint, atabnum1, atabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ... ifnN])`<br>


`aout = `[**`tabmorphak`**](opcodes/tabmorphak.md)`(aindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ... ifnN])`<br>


`kout = `[**`tabmorphi`**](opcodes/tabmorphi.md)`(kindex, kweightpoint, ktabnum1, ktabnum2, ifn1, ifn2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifn3, ifn4, ..., ifnN])`<br>


[**`tabplay`**](opcodes/tabplay.md)`(ktrig, knumtics, kfn, kout1 [,kout2,..., koutN])`<br>


[**`tabrec`**](opcodes/tabrec.md)`(ktrig_start, ktrig_stop, knumtics, kfn, kin1 [,kin2,...,kinN])`<br>


### FLTK:Other
[**`vphaseseg`**](opcodes/vphaseseg.md)`(kphase, ioutab, ielems, itab1,idist1,itab2 \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,idist2,itab3, ... ,idistN-1,itabN])`<br>


### Mathematical Operations:Arithmetic and Logic Operations
[**`!`**](opcodes/opnot.md)` a  (logical NOT; not audio-rate)`<br>


`a `[**`&`**](opcodes/opbitand.md)` b  (bitwise AND)`<br>


`a `[**`&&`**](opcodes/opand.md)` b  (logical AND; not audio-rate)`<br>


`a * b  (no rate restriction)`<br>


`a `[**`^`**](opcodes/raises.md)` b  (b not audio-rate)`<br>


`a `[**`>>`**](opcodes/opbitshr.md)` b  (bitshift left)`<br>


`a `[**`<<`**](opcodes/opbitshl.md)` b  (bitshift left)`<br>


`a `[**`%`**](opcodes/modulus.md)` b  (no rate restriction)`<br>


`a `[**`/`**](opcodes/divides.md)` b  (no rate restriction)`<br>


`a `[**`|`**](opcodes/opbitor.md)` b  (bitwise OR)`<br>


`a `[**`||`**](opcodes/opor.md)` b  (logical OR; not audio-rate)`<br>


[**`+`**](opcodes/adds.md)`a  (no rate restriction)`<br>
`a + b  (no rate restriction)`<br>


[**`-`**](opcodes/subtracts.md)`a  (no rate restriction)`<br>
`a - b  (no rate restriction)`<br>


`a `[**`#`**](opcodes/opnonequiv.md)` b  (bitwise NON EQUIVALENCE)`<br>


[**`~`**](opcodes/opbitnot.md)` a  (bitwise NOT)`<br>


### Mathematical Operations:Arrays
`ires[] = `[**`cbrt`**](opcodes/cbrt.md)`(iarg)`<br>
`kres[] = cbrt(karg)`<br>


`ires[] = `[**`fmax`**](opcodes/fmax.md)`(iarg1[], iarg2[])`<br>
`kres[] = fmax(karg1[], karg2[])`<br>
`ires[] = fmax(iarg1[], iarg2)`<br>
`kres[] = fmax(karg[], karg2)`<br>


`ires[] = `[**`fmin`**](opcodes/fmin.md)`(iarg1[], iarg2[])`<br>
`kres[] = fmin(karg1[], karg2[])`<br>
`ires[] = fmin(iarg1[], iarg2)`<br>
`kres[] = fmin(karg[], karg2)`<br>


`ires[] = `[**`fmod`**](opcodes/fmod.md)`(iarg1[], iarg2[])`<br>
`kres[] = fmod(karg1[], karg2[])`<br>
`ires[] = fmod(iarg1[], iarg2)`<br>
`kres[] = fmod(karg[], karg2)`<br>


`ires[] = `[**`hypot`**](opcodes/hypot.md)`(iarg1[], iarg2[])`<br>
`kres[] = hypot(karg1[], karg2[])`<br>


`ires[] = `[**`limit1`**](opcodes/limit1.md)`(iarg)`<br>
`kres[] = limit1(karg)`<br>


### Mathematical Operations:Comparators and Accumulators
[**`clear`**](opcodes/clear.md)`(avar1 [, avar2] [, avar3] [...])`<br>
`clear(avar[])`<br>


[**`vincr`**](opcodes/vincr.md)`(accum, aincr)`<br>


### Mathematical Operations:Mathematical Functions
[**`abs`**](opcodes/abs.md)`(var:{i,k,a}) `<br>
`abs(var:{k[],i[]})`<br>
`abs(var:Complex)`<br>
`abs(var:Complex[])`<br>


[**`arg`**](opcodes/arg.md)`(var:Complex)`<br>
`arg(var:Complex[])`<br>


[**`ceil`**](opcodes/ceil.md)`(x) (init-, control-, or audio-rate arg allowed)`<br>
`ceil(k/i[]) (k- or i-arrays )`<br>


[**`conj`**](opcodes/conj.md)`(var:Complex)`<br>
`conj(var:Complex[])`<br>


`complex(var:Complex)`<br>
`complex(var:Complex[])`<br>
[**`co`**](opcodes/complex.md)`mplex(arg1:k, arg2:k[,isPolar:i])`<br>
`complex(real:k[], imag:k[])`<br>
`complex(real:a, imag:a)`<br>


[**`exp`**](opcodes/exp.md)`({a,k,i,Complex})`<br>
`exp({k[],i[],Complex[]})`<br>


[**`floor`**](opcodes/floor.md)`(x) (init-, control-, or audio-rate arg allowed)`<br>
`floor(k/i[]) (k- or i-arrays )`<br>


[**`frac`**](opcodes/frac.md)`(x) (init-rate or control-rate args; also works at audio rate in Csound5)`<br>
`frac(k/i[]) (k- or i-arrays )`<br>


[**`imag`**](opcodes/imag.md)`(var:Complex)`<br>
`imag(var:Complex[])`<br>


[**`int`**](opcodes/int.md)`(x)  (init-rate or control-rate; also works at audio rate in Csound5)`<br>


[**`log`**](opcodes/log.md)`({a,k,i,Complex}) `<br>
`log({k[],i[],Complex[]}) `<br>
`kout[] log kin[], ibas`<br>


[**`log10`**](opcodes/log10.md)`(x) (no rate restriction)`<br>
`log10(k/i[]) (k- or i-arrays )`<br>


[**`log2`**](opcodes/log2.md)`(x) (no rate restriction)`<br>
`log2(k/i[]) (k- or i-arrays )`<br>


[**`logbtwo`**](opcodes/logbtwo.md)`(x)  (init-rate or control-rate args only)`<br>


[**`polar`**](opcodes/polar.md)`(var:Complex)`<br>
`polar(var:Complex[])`<br>


[**`powoftwo`**](opcodes/powoftwo.md)`(x)  (init-rate or control-rate args only)`<br>


[**`qinf`**](opcodes/qinf.md)`(x) (no rate restriction)`<br>


[**`qnan`**](opcodes/qnan.md)`(x) (no rate restriction)`<br>


[**`real`**](opcodes/real.md)`(var:Complex)`<br>
`real(var:Complex[])`<br>


[**`round`**](opcodes/round.md)`(x)      (init-, control-, or audio-rate arg allowed)`<br>
`round(k/i[])  (k- or i-arrays )`<br>


[**`sqrt`**](opcodes/sqrt.md)`(x)      (no rate restriction)`<br>
`sqrt(k/i[])  (k- or i-arrays )`<br>


### Mathematical Operations:Trigonometric Functions
[**`cos`**](opcodes/cos.md)`(x)     (no rate restriction)`<br>
`cos(k/i[]) (k- or i-arrays )`<br>


[**`cosh`**](opcodes/cosh.md)`(x)     (no rate restriction)`<br>
`cosh(k/i[]) (k- or i-arrays )`<br>


[**`cosinv`**](opcodes/cosinv.md)`(x)     (no rate restriction)`<br>
`cosinv(k/i[]) (k- or i-arrays )`<br>


[**`signum`**](opcodes/signum.md)`(x) (no rate restriction)`<br>


[**`sin`**](opcodes/sin.md)`(x)     (no rate restriction)`<br>
`sin(k/i[]) (k- or i-arrays )`<br>


[**`sinh`**](opcodes/sinh.md)`(x)     (no rate restriction)`<br>
`sinh(k/i[]) (k- or i-arrays )`<br>


[**`sininv`**](opcodes/sininv.md)`(x)     (no rate restriction)`<br>
`sininv(k/i[]) (k- or i-arrays)`<br>


[**`tan`**](opcodes/tan.md)`(x)     (no rate restriction)`<br>
`tan(k/i[]) (k- or i-arrays )`<br>


[**`tanh`**](opcodes/tanh.md)`(x)     (no rate restriction)`<br>
`tanh(k/i[]) (k- or i-arrays )`<br>


[**`taninv`**](opcodes/taninv.md)`(x)     (no rate restriction)`<br>
`taninv(k/i[]) (k- or i-arrays )`<br>


### Mathematical Operations:Amplitude Functions
[**`ampdb`**](opcodes/ampdb.md)`(x)  (no rate restriction)`<br>


[**`ampdbfs`**](opcodes/ampdbfs.md)`(x)  (no rate restriction)`<br>


[**`db`**](opcodes/db.md)`(x)`<br>


[**`dbamp`**](opcodes/dbamp.md)`(x)  (init-rate or control-rate args only)`<br>


[**`dbfsamp`**](opcodes/dbfsamp.md)`(x)  (init-rate or control-rate args only)`<br>


### Mathematical Operations:Random Functions
[**`birnd`**](opcodes/birnd.md)`(x) (init- or control-rate only)`<br>


[**`rnd`**](opcodes/rnd.md)`(x) (init- or control-rate only)`<br>


### Mathematical Operations:Opcode Equivalents of Functions
`ares `[**`divz`**](opcodes/divz.md)` xa, xb, ksubst`<br>
`ires divz ia, ib, isubst`<br>
`kres divz ka, kb, ksubst`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`... divz(ka, kb, ksubst)... (no rate restriction)`<br>


`ares = `[**`mac`**](opcodes/mac.md)`(ksig1, asig1 [, ksig2] [, asig2] [, ksig3] [, asig3] [...])`<br>


`ares = `[**`maca`**](opcodes/maca.md)`(asig1 , asig2 [, asig3] [, asig4] [, asig5] [...])`<br>


`aout = `[**`polynomial`**](opcodes/polynomial.md)`(ain, k0 [, k1 [, k2 [...]]])`<br>


`ares = `[**`pow`**](opcodes/pow.md)`(aarg, k= [**`pow`**](opcodes/pow.md)([, inorm])`<br>
`ires = pow(iarg, i= pow([, inorm])`<br>
`kres = pow(karg, k= pow([, inorm])`<br>
`ires[] = pow(iarg[], ipow[])`<br>
`kres[] = pow(karg[], kpow[])`<br>
`ires[] = pow(iarg[], ipow)`<br>
`kres[] = pow(karg[], kpow)`<br>


`ares = `[**`product`**](opcodes/product.md)`(asig1, asig2 [, asig3] [...])`<br>


`ares = `[**`sum`**](opcodes/sum.md)`(asig1 [, asig2] [, asig3] [...])`<br>
`kres = sum(karr)`<br>
`ires = sum(iarr)`<br>


`ares `[**`taninv2`**](opcodes/taninv2.md)` ay, ax`<br>
`ires taninv2 iy, ix`<br>
`kres taninv2 ky, kx`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`... taninv2(ky, kx)... (no rate restriction)`<br>


### Pitch Converters:Functions
[**`cent`**](opcodes/cent.md)`(x)`<br>


[**`cpsmidinn`**](opcodes/cpsmidinn.md)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`cpsoct`**](opcodes/cpsoct.md)`(oct)  (no rate restriction)`<br>


[**`cpspch`**](opcodes/cpspch.md)`(pch)  (init- or control-rate args only)`<br>


`imidi = `[**`ftom`**](opcodes/ftom.md)`(ifreq [,irnd])`<br>
`kmidi = ftom(kfreq [,irnd])`<br>
`imidis[] = ftom(ifreqs[] [,irnd])`<br>
`kmidis[] = ftom(kfreqs[] [,irnd])`<br>


`ifreq = `[**`mtof`**](opcodes/mtof.md)`(imidi)`<br>
`kfreq = mtof(kmidi)`<br>
`ifreqs[] = mtof(imidis[])`<br>
`kfreqs[] = mtof(kmidis[])`<br>


`Snote = `[**`mton`**](opcodes/mton.md)`(kmidi)`<br>
`Snote = mton(imidi)`<br>


`kfreq = `[**`ntof`**](opcodes/ntof.md)`(Snote)`<br>
`ifreq = ntof(Snote)`<br>


`kmidi = `[**`ntom`**](opcodes/ntom.md)`(Snote)`<br>
`imidi = ntom(Snote)`<br>


[**`octave`**](opcodes/octave.md)`(x)`<br>


[**`octcps`**](opcodes/octcps.md)`(cps)  (init- or control-rate args only)`<br>


[**`octmidinn`**](opcodes/octmidinn.md)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`octpch`**](opcodes/octpch.md)`(pch)  (init- or control-rate args only)`<br>


[**`pchmidinn`**](opcodes/pchmidinn.md)`(MidiNoteNumber)  (init- or control-rate args only)`<br>


[**`pchoct`**](opcodes/pchoct.md)`(oct)  (init- or control-rate args only)`<br>


`imidi = `[**`pchtom`**](opcodes/pchtom.md)`(ipch)`<br>
`kmidi = pchtom(kpch)`<br>


[**`semitone`**](opcodes/semitone.md)`(x)`<br>


### Pitch Converters:Tuning Opcodes
`icps = `[**`cps2pch`**](opcodes/cps2pch.md)`(ipch, iequal)`<br>


`kcps = `[**`cpstun`**](opcodes/cpstun.md)`(ktrig, kindex, kfn)`<br>


`icps = `[**`cpstuni`**](opcodes/cpstuni.md)`(index, ifn)`<br>


`icps = `[**`cpsxpch`**](opcodes/cpsxpch.md)`(ipch, iequal, irepeat, ibase)`<br>


### Real-time MIDI:Input
`kaft = `[**`aftouch`**](opcodes/aftouch.md)`([imin] [, imax])`<br>


`ival = `[**`chanctrl`**](opcodes/chanctrl.md)`(ichnl, ictlno [, ilow] [, ihigh])`<br>
`kval = chanctrl(ichnl, ictlno [, ilow] [, ihigh])`<br>


`idest = `[**`ctrl14`**](opcodes/ctrl14.md)`(ichan, ictlno1, ictlno2, imin, imax [, ifn])`<br>
`kdest = ctrl14(ichan, ictlno1, ictlno2, kmin, kmax [, ifn])`<br>


`idest = `[**`ctrl21`**](opcodes/ctrl21.md)`(ichan, ictlno1, ictlno2, ictlno3, imin, imax [, ifn])`<br>
`kdest = ctrl21(ichan, ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn])`<br>


`idest = `[**`ctrl7`**](opcodes/ctrl7.md)`(ichan, ictlno, imin, imax [, ifn])`<br>
`kdest = ctrl7(ichan, ictlno, kmin, kmax [, ifn])`<br>
`adest = ctrl7(ichan, ictlno, kmin, kmax [, ifn] [, icutoff])`<br>


[**`ctrlinit`**](opcodes/ctrlinit.md)`(ichnl, ictlno1, ival1 [, ictlno2] [, ival2] [, ictlno3] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ival3] [,...ival32])`<br>


`kpreset = `[**`ctrlpreset`**](opcodes/ctrlpreset.md)`(ktag, kchnl, kctlno1, [kctlno2] [, kctlno3] ...)`<br>


[**`ctrlprint`**](opcodes/ctrlprint.md)`(kcont[][, Sfile])`<br>


[**`ctrlprintpresets`**](opcodes/ctrlprintpresets.md)`([Sfilenam])`<br>


`kconnt[] = `[**`ctrlsave`**](opcodes/ctrlsave.md)`(ichnl, ictlno1, [ictlno2] [, ictlno3] ...)`<br>


[**`ctrlselect`**](opcodes/ctrlselect.md)`(kpre)`<br>


[**`initc14`**](opcodes/initc14.md)`(ichan, ictlno1, ictlno2, ivalue)`<br>


[**`initc21`**](opcodes/initc21.md)`(ichan, ictlno1, ictlno2, ictlno3, ivalue)`<br>


[**`initc7`**](opcodes/initc7.md)`(ichan, ictlno, ivalue)`<br>


[**`massign`**](opcodes/massign.md)`(ichnl, insnum[, ireset])`<br>
`massign(ichnl, "insname"[, ireset])`<br>


`idest = `[**`midic14`**](opcodes/midic14.md)`(ictlno1, ictlno2, imin, imax [, ifn])`<br>
`kdest = midic14(ictlno1, ictlno2, kmin, kmax [, ifn])`<br>


`idest = `[**`midic21`**](opcodes/midic21.md)`(ictlno1, ictlno2, ictlno3, imin, imax [, ifn])`<br>
`kdest = midic21(ictlno1, ictlno2, ictlno3, kmin, kmax [, ifn])`<br>


`idest = `[**`midic7`**](opcodes/midic7.md)`(ictlno, imin, imax [, ifn])`<br>
`kdest = midic7(ictlno, kmin, kmax [, ifn])`<br>


`ival = `[**`midictrl`**](opcodes/midictrl.md)`(inum [, imin] [, imax])`<br>
`kval = midictrl(inum [, imin] [, imax])`<br>


`ival = `[**`notnum`**](opcodes/notnum.md)`()`<br>


`ibend = `[**`pchbend`**](opcodes/pchbend.md)`([imin] [, imax])`<br>
`kbend = pchbend([imin] [, imax])`<br>


[**`pgmassign`**](opcodes/pgmassign.md)`(ipgm, inst[, ichn])`<br>
`pgmassign(ipgm, "insname"[, ichn])`<br>


`ires = `[**`polyaft`**](opcodes/polyaft.md)`(inote [, ilow] [, ihigh])`<br>
`kres = polyaft(inote [, ilow] [, ihigh])`<br>


`ival = `[**`veloc`**](opcodes/veloc.md)`([ilow] [, ihigh])`<br>


### Real-time MIDI:Output
[**`nrpn`**](opcodes/nrpn.md)`(kchan, kparmnum, kparmvalue)`<br>


[**`outiat`**](opcodes/outiat.md)`(ichn, ivalue, imin, imax)`<br>


[**`outic`**](opcodes/outic.md)`(ichn, inum, ivalue, imin, imax)`<br>


[**`outic14`**](opcodes/outic14.md)`(ichn, imsb, ilsb, ivalue, imin, imax)`<br>


[**`outipat`**](opcodes/outipat.md)`(ichn, inotenum, ivalue, imin, imax)`<br>


[**`outipb`**](opcodes/outipb.md)`(ichn, ivalue, imin, imax)`<br>


[**`outipc`**](opcodes/outipc.md)`(ichn, iprog, imin, imax)`<br>


[**`outkat`**](opcodes/outkat.md)`(kchn, kvalue, kmin, kmax)`<br>


[**`outkc`**](opcodes/outkc.md)`(kchn, knum, kvalue, kmin, kmax)`<br>


[**`outkc14`**](opcodes/outkc14.md)`(kchn, kmsb, klsb, kvalue, kmin, kmax)`<br>


[**`outkpat`**](opcodes/outkpat.md)`(kchn, knotenum, kvalue, kmin, kmax)`<br>


[**`outkpb`**](opcodes/outkpb.md)`(kchn, kvalue, kmin, kmax)`<br>


[**`outkpc`**](opcodes/outkpc.md)`(kchn, kprog, kmin, kmax)`<br>


### Real-time MIDI:Converters
`iamp = `[**`ampmidi`**](opcodes/ampmidi.md)`(iscal [, ifn])`<br>


`igain = `[**`ampmidicurve`**](opcodes/ampmidicurve.md)`(ivelocity, idynamicrange, iexponent)`<br>
`kgain = ampmidicurve(kvelocity, kdynamicrange, kexponent)`<br>


`iamplitude = `[**`ampmidid`**](opcodes/ampmidid.md)`(ivelocity, idecibels)`<br>
`kamplitude = ampmidid(kvelocity, idecibels)`<br>


`icps = `[**`cpsmidi`**](opcodes/cpsmidi.md)`()`<br>


`icps = `[**`cpsmidib`**](opcodes/cpsmidib.md)`([irange])`<br>
`kcps = cpsmidib([irange])`<br>


`icps = `[**`cpstmid`**](opcodes/cpstmid.md)`(ifn)`<br>


`ioct = `[**`octmidi`**](opcodes/octmidi.md)`()`<br>


`ioct = `[**`octmidib`**](opcodes/octmidib.md)`([irange])`<br>
`koct = octmidib([irange])`<br>


`ipch = `[**`pchmidi`**](opcodes/pchmidi.md)`()`<br>


`ipch = `[**`pchmidib`**](opcodes/pchmidib.md)`([irange])`<br>
`kpch = pchmidib([irange])`<br>


### Real-time MIDI:Generic I/O
`kstatus, kchan, kdata1, kdata2 = `[**`midiin`**](opcodes/midiin.md)`()`<br>


[**`midiout`**](opcodes/midiout.md)`(kstatus, kchan, kdata1, kdata2)`<br>


[**`midiout_i`**](opcodes/midiout_i.md)`(istatus, ichan, idata1, idata2)`<br>


### Real-time MIDI:Event Extenders
`kflag = `[**`lastcycle`**](opcodes/lastcycle.md)`()`<br>


`kflag = `[**`release`**](opcodes/release.md)`()`<br>


[**`xtratim`**](opcodes/xtratim.md)`(iextradur)`<br>


### Real-time MIDI:Note Output
`kMidiNoteNum, kTrigger = `[**`midiarp`**](opcodes/midiarp.md)`(kRate[, kMode])`<br>


[**`midion`**](opcodes/midion.md)`(kchn, knum, kvel)`<br>


[**`midion2`**](opcodes/midion2.md)`(kchn, knum, kvel, ktrig)`<br>


[**`moscil`**](opcodes/moscil.md)`(kchn, knum, kvel, kdur, kpause)`<br>


[**`noteoff`**](opcodes/noteoff.md)`(ichn, inum, ivel)`<br>


[**`noteon`**](opcodes/noteon.md)`(ichn, inum, ivel)`<br>


[**`noteondur`**](opcodes/noteondur.md)`(ichn, inum, ivel, idur)`<br>


[**`noteondur2`**](opcodes/noteondur2.md)`(ichn, inum, ivel, idur)`<br>


### Real-time MIDI:MIDI/Score Interoperability
[**`midichannelaftertouch`**](opcodes/midichannelaftertouch.md)`(xchannelaftertouch [, ilow] [, ihigh])`<br>


`ichn = `[**`midichn`**](opcodes/midichn.md)`()`<br>


[**`midicontrolchange`**](opcodes/midicontrolchange.md)`(xcontroller, xcontrollervalue [, ilow] [, ihigh])`<br>


[**`mididefault`**](opcodes/mididefault.md)`(xdefault, xvalue)`<br>


[**`midinoteoff`**](opcodes/midinoteoff.md)`(xkey, xvelocity)`<br>


[**`midinoteoncps`**](opcodes/midinoteoncps.md)`(xcps, xvelocity)`<br>


[**`midinoteonkey`**](opcodes/midinoteonkey.md)`(xkey, xvelocity)`<br>


[**`midinoteonoct`**](opcodes/midinoteonoct.md)`(xoct, xvelocity)`<br>


[**`midinoteonpch`**](opcodes/midinoteonpch.md)`(xpch, xvelocity)`<br>


[**`midipitchbend`**](opcodes/midipitchbend.md)`(xpitchbend [, ilow] [, ihigh])`<br>


[**`midipolyaftertouch`**](opcodes/midipolyaftertouch.md)`(xpolyaftertouch, xkey [, ilow] [, ihigh])`<br>


[**`midiprogramchange`**](opcodes/midiprogramchange.md)`(xprogram)`<br>


### Real-time MIDI:System Realtime
[**`mclock`**](opcodes/mclock.md)`(ifreq)`<br>


[**`mrtmsg`**](opcodes/mrtmsg.md)`(imsgtype)`<br>


### Real-time MIDI:Slider Banks
`i1, ..., i16 = `[**`s16b14`**](opcodes/s16b14.md)`(ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb16, ictlno_lsb16, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin16, imax16, initvalue16, ifn16)`<br>
`k1, ..., k16 = s16b14(ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb16, ictlno_lsb16, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin16, imax16, initvalue16, ifn16)`<br>


`i1, ..., i32 = `[**`s32b14`**](opcodes/s32b14.md)`(ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb32, ictlno_lsb32, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin32, imax32, initvalue32, ifn32)`<br>
`k1, ..., k32 = s32b14(ichan, ictlno_msb1, ictlno_lsb1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`initvalue1, ifn1, ..., ictlno_msb32, ictlno_lsb32, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imin32, imax32, initvalue32, ifn32)`<br>


`i1, ..., i16 = `[**`slider16`**](opcodes/slider16.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16)`<br>
`k1, ..., k16 = slider16(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16)`<br>


`k1, ..., k16 = `[**`slider16f`**](opcodes/slider16f.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum16, imin16, imax16, init16, ifn16, icutoff16)`<br>


`kflag = `[**`slider16table`**](opcodes/slider16table.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16)`<br>


`kflag = `[**`slider16tablef`**](opcodes/slider16tablef.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum16, imin16, imax16, init16, ifn16, icutoff16)`<br>


`i1, ..., i32 = `[**`slider32`**](opcodes/slider32.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32)`<br>
`k1, ..., k32 = slider32(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32)`<br>


`k1, ..., k32 = `[**`slider32f`**](opcodes/slider32f.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum32, imin32, imax32, init32, ifn32, icutoff32)`<br>


`kflag = `[**`slider32table`**](opcodes/slider32table.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imax1, init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32)`<br>


`kflag = `[**`slider32tablef`**](opcodes/slider32tablef.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum32, imin32, imax32, init32, ifn32, icutoff32)`<br>


`i1, ..., i64 = `[**`slider64`**](opcodes/slider64.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64)`<br>
`k1, ..., k64 = slider64(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64)`<br>


`k1, ..., k64 = `[**`slider64f`**](opcodes/slider64f.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum64, imin64, imax64, init64, ifn64, icutoff64)`<br>


`kflag = `[**`slider64table`**](opcodes/slider64table.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`imax1, init1, ifn1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64)`<br>


`kflag = `[**`slider64tablef`**](opcodes/slider64tablef.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum64, imin64, imax64, init64, ifn64, icutoff64)`<br>


`i1, ..., i8 = `[**`slider8`**](opcodes/slider8.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8)`<br>
`k1, ..., k8 = slider8(ichan, ictlnum1, imin1, imax1, init1, ifn1, ..., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8)`<br>


`k1, ..., k8 = `[**`slider8f`**](opcodes/slider8f.md)`(ichan, ictlnum1, imin1, imax1, init1, ifn1, icutoff1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`..., ictlnum8, imin8, imax8, init8, ifn8, icutoff8)`<br>


`kflag = `[**`slider8table`**](opcodes/slider8table.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, ..., ictlnum8, imin8, imax8, init8, ifn8)`<br>


`kflag = `[**`slider8tablef`**](opcodes/slider8tablef.md)`(ichan, ioutTable, ioffset, ictlnum1, imin1, imax1, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init1, ifn1, icutoff1, ...., \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ictlnum8, imin8, imax8, init8, ifn8, icutoff8)`<br>


`k1, k2, ...., k16 = `[**`sliderKawai`**](opcodes/sliderkawai.md)`(imin1, imax1, init1, ifn1, imin2, imax2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`init2, ifn2, ..., imin16, imax16, init16, ifn16)`<br>


### MIDI files:MIDI input and Initialization
`   type:i = `[**`eventtype`**](opcodes/eventtype.md)`()`<br>


`status:k = `[**`midifilestatus`**](opcodes/midifilestatus.md)`([id:k])`<br>


### Signal Flow Graph Opcodes
[**`alwayson`**](opcodes/alwayson.md)`(Tinstrument [, p4, ..., pn])`<br>


[**`connect`**](opcodes/connect.md)`(Tsource1, Soutlet1, Tsink1, Sinlet1)`<br>


`ifno = `[**`ftgenonce`**](opcodes/ftgenonce.md)`(ip1, ip2dummy, isize, igen, iarga, iargb, ...)`<br>


`asignal = `[**`inleta`**](opcodes/inleta.md)`(Sname)`<br>


`fsignal = `[**`inletf`**](opcodes/inletf.md)`(Sname)`<br>


`ksignal = `[**`inletk`**](opcodes/inletk.md)`(Sname)`<br>


`ksignal = `[**`inletkid`**](opcodes/inletkid.md)`(Sname, SinstanceID)`<br>


`array = `[**`inletv`**](opcodes/inletv.md)`(Sname)`<br>


[**`outleta`**](opcodes/outleta.md)`(Sname, asignal)`<br>


[**`outletf`**](opcodes/outletf.md)`(Sname, fsignal)`<br>


[**`outletk`**](opcodes/outletk.md)`(Sname, ksignal)`<br>


[**`outletkid`**](opcodes/outletkid.md)`(Sname, SinstanceID, ksignal)`<br>


[**`outletv`**](opcodes/outletv.md)`(Sname, array)`<br>


### Spectral Processing:STFT
`ares = `[**`pvadd`**](opcodes/pvadd.md)`(ktimpnt, kfmod, ifilcod, ifn, ibins [, ibinoffset] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ibinincr] [, iextractmode] [, ifreqlim] [, igatefn])`<br>


[**`pvbufread`**](opcodes/pvbufread.md)`(ktimpnt, ifile)`<br>


`ares = `[**`pvcross`**](opcodes/pvcross.md)`(ktimpnt, kfmod, ifile, kampscale1, kampscale2 [, ispecwp])`<br>


`ares = `[**`pvinterp`**](opcodes/pvinterp.md)`(ktimpnt, kfmod, ifile, kfreqscale1, kfreqscale2, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`kampscale1, kampscale2, kfreqinterp, kampinterp)`<br>


`ares = `[**`pvoc`**](opcodes/pvoc.md)`(ktimpnt, kfmod, ifilcod [, ispecwp] [, iextractmode] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ifreqlim] [, igatefn])`<br>


`kfreq, kamp = `[**`pvread`**](opcodes/pvread.md)`(ktimpnt, ifile, ibin)`<br>


[**`tableseg`**](opcodes/tableseg.md)`(ifn1, idur1, ifn2 [, idur2] [, ifn3] [...])`<br>


[**`tablexseg`**](opcodes/tablexseg.md)`(ifn1, idur1, ifn2 [, idur2] [, ifn3] [...])`<br>


`ares = `[**`vpvoc`**](opcodes/vpvoc.md)`(ktimpnt, kfmod, ifile [, ispecwp] [, ifn])`<br>


### Spectral Processing:LPC
`ares = `[**`allpole`**](opcodes/allpole.md)`(asig, kCoef[])`<br>


`kPar[] = `[**`apoleparams`**](opcodes/apoleparams.md)`(kCoef[])`<br>


`kCoef[], krms, kerr, kcps = `[**`lpcanal`**](opcodes/lpcanal.md)`(asrc, kflg, kprd, isiz, iord [, iwin])`<br>
`kCoef[], krms, kerr, kcps = lpcanal(koff, kflg, ifn, isiz, iord [, iwin])`<br>
`iCoef[], irms, ierr, icps = lpcanal(ioff, iflg, ifn, isiz, iord [, iwin])`<br>


`ares = `[**`lpcfilter`**](opcodes/lpcfilter.md)`(asig, asrc, kflg, kprd, isiz, iord [, iwin])`<br>
`ares = lpcfilter(asig, koff, kflg, ifn, isiz, iord [, iwin])`<br>


`ares = `[**`lpfreson`**](opcodes/lpfreson.md)`(asig, kfrqratio)`<br>


[**`lpinterp`**](opcodes/lpinterp.md)`(islot1, islot2, kmix)`<br>


`krmsr, krmso, kerr, kcps = `[**`lpread`**](opcodes/lpread.md)`(ktimpnt, ifilcod [, inpoles] [, ifrmrate])`<br>


`ares = `[**`lpreson`**](opcodes/lpreson.md)`(asig)`<br>


[**`lpslot`**](opcodes/lpslot.md)`(islot)`<br>


`kCoef[], krms, kerr = `[**`pvscfs`**](opcodes/pvscfs.md)`(fsig, iord [, imod])`<br>


`fsig = `[**`pvslpc`**](opcodes/pvslpc.md)`(asrc, idftsiz, ihop, iord [, iwin])`<br>


`asig = `[**`resonbnk`**](opcodes/resonbnk.md)`(ain, kPar[], kmin, kmax, iper [, imode, iscal, iskip])`<br>


### Spectral Processing:Non-Standard
`wsig = `[**`specaddm`**](opcodes/specaddm.md)`(wsig1, wsig2 [, imul2])`<br>


`wsig = `[**`specdiff`**](opcodes/specdiff.md)`(wsigin)`<br>


[**`specdisp`**](opcodes/specdisp.md)`(wsig, iprd [, iwtflg])`<br>


`wsig = `[**`specfilt`**](opcodes/specfilt.md)`(wsigin, ifhtim)`<br>


`wsig = `[**`spechist`**](opcodes/spechist.md)`(wsigin)`<br>


`koct, kamp = `[**`specptrk`**](opcodes/specptrk.md)`(wsig, kvar, ilo, ihi, istr, idbthresh, inptls, irolloff \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iodd] [, iconfs] [, interp] [, ifprd] [, iwtflg])`<br>


`wsig = `[**`specscal`**](opcodes/specscal.md)`(wsigin, ifscale, ifthresh)`<br>


`ksum = `[**`specsum`**](opcodes/specsum.md)`(wsig [, interp])`<br>


`wsig = `[**`spectrum`**](opcodes/spectrum.md)`(xsig, iprd, iocts, ifrqa [, iq] [, ihann] [, idbout] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, idsprd] [, idsinrs])`<br>


### Spectral Processing:Streaming
`fsig = `[**`binit`**](opcodes/binit.md)`(fin, isize)`<br>


[**`part2txt`**](opcodes/part2txt.md)`(SFile, ftrks)`<br>


`ftrks = `[**`partials`**](opcodes/partials.md)`(ffr, fphs, kthresh, kminpts, kmaxgap, imaxtracks)`<br>


`kframe = `[**`pvs2array`**](opcodes/pvs2array.md)`(kvar[], fsig)`<br>
`kframe = pvs2array(kmags[], kfreqs[], fsig)`<br>


`kframe = `[**`pvs2tab`**](opcodes/pvs2tab.md)`(tvar|kvar[], fsig)`<br>
`kframe = pvs2tab(kmags[], kfreqs[], fsig)`<br>


`ares = `[**`pvsadsyn`**](opcodes/pvsadsyn.md)`(fsrc, inoscs, kfmod [, ibinoffset] [, ibinincr] [, iinit])`<br>


`fsig = `[**`pvsanal`**](opcodes/pvsanal.md)`(ain, ifftsize, ioverlap, iwinsize, iwintype [, iformat] [, iinit])`<br>


`fsig = `[**`pvsarp`**](opcodes/pvsarp.md)`(fsigin, kbin, kdepth, kgain)`<br>


`fsig = `[**`pvsbandp`**](opcodes/pvsbandp.md)`(fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype])`<br>


`fsig = `[**`pvsbandr`**](opcodes/pvsbandr.md)`(fsigin, xlowcut, xlowfull, xhighfull, xhighcut [, ktype])`<br>


`kbnd = `[**`pvsbandwidth`**](opcodes/pvsbandwidth.md)`(fsig)`<br>


`kamp, kfr = `[**`pvsbin`**](opcodes/pvsbin.md)`(fsig, kbin)`<br>


`fsig = `[**`pvsblur`**](opcodes/pvsblur.md)`(fsigin, kblurtime, imaxdel)`<br>


`ihandle, ktime  = `[**`pvsbuffer`**](opcodes/pvsbuffer.md)`(fsig, ilen)`<br>


`fsig = `[**`pvsbufread`**](opcodes/pvsbufread.md)`(ktime, khandle [, ilo, ihi, iclear])`<br>


`fsig = `[**`pvsbufread2`**](opcodes/pvsbufread2.md)`(ktime, khandle, ift1, ift2)`<br>


`fsig = `[**`pvscale`**](opcodes/pvscale.md)`(fsigin, kscal [, kkeepform, kgain, kcoefs])`<br>


`kcent = `[**`pvscent`**](opcodes/pvscent.md)`(fsig)`<br>
`acent = pvscent(fsig)`<br>


`keps[] = `[**`pvsceps`**](opcodes/pvsceps.md)`(fsig[, icoefs])`<br>


`fsig = `[**`pvscross`**](opcodes/pvscross.md)`(fsrc, fdest, kamp1, kamp2)`<br>


`fsig = `[**`pvsdemix`**](opcodes/pvsdemix.md)`(fleft, fright, kpos, kwidth, ipoints)`<br>


`fsig = `[**`pvsdiskin`**](opcodes/pvsdiskin.md)`(SFname, ktscal, kgain [, ioffset, ichan])`<br>


[**`pvsdisp`**](opcodes/pvsdisp.md)`(fsig [, ibins, iwtflg])`<br>


`fsig = `[**`pvsfilter`**](opcodes/pvsfilter.md)`(fsigin, fsigfil, kdepth [, igain])`<br>


`fsig = `[**`pvsfread`**](opcodes/pvsfread.md)`(ktimpt, ifn [, ichan])`<br>


`fsig = `[**`pvsfreeze`**](opcodes/pvsfreeze.md)`(fsigin, kfreeza, kfreezf)`<br>


`fsig = `[**`pvsfromarray`**](opcodes/pvsfromarray.md)`(karr[] [,ihopsize, iwinsize, iwintype])`<br>
`fsig = pvsfromarray(kmags[], kfreqs[] [,ihopsize, iwinsize, iwintype])`<br>


[**`pvsftr`**](opcodes/pvsftr.md)`(fsrc, ifna [, ifnf])`<br>


`kflag = `[**`pvsftw`**](opcodes/pvsftw.md)`(fsrc, ifna [, ifnf])`<br>


[**`pvsfwrite`**](opcodes/pvsfwrite.md)`(fsig, ifile)`<br>


`fsig = `[**`pvsgain`**](opcodes/pvsgain.md)`(fsigin, kgain)`<br>


`fsig = `[**`pvshift`**](opcodes/pvshift.md)`(fsigin, kshift, klowest [, kkeepform, igain, kcoefs])`<br>


`ffr, fphs = `[**`pvsifd`**](opcodes/pvsifd.md)`(ain, ifftsize, ihopsize, iwintype [,iscal])`<br>


`fsig = `[**`pvsin`**](opcodes/pvsin.md)`(kchan [, isize, iolap, iwinsize, iwintype, iformat])`<br>


`ioverlap, inumbins, iwinsize, iformat = `[**`pvsinfo`**](opcodes/pvsinfo.md)`(fsrc)`<br>


`fsig = `[**`pvsinit`**](opcodes/pvsinit.md)`(isize [, iolap, iwinsize, iwintype, iformat])`<br>


`fsig = `[**`pvsmaska`**](opcodes/pvsmaska.md)`(fsrc, ifn, kdepth)`<br>


`fsig = `[**`pvsmix`**](opcodes/pvsmix.md)`(fsigin1, fsigin2)`<br>


`fsig = `[**`pvsmooth`**](opcodes/pvsmooth.md)`(fsigin, kacf, kfcf)`<br>


`fsig = `[**`pvsmorph`**](opcodes/pvsmorph.md)`(fsig1, fsig2, kampint, kfrqint)`<br>


`fsig = `[**`pvsosc`**](opcodes/pvsosc.md)`(kamp, kfreq, ktype, isize [,ioverlap] [, iwinsize] [, iwintype] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iformat])`<br>


[**`pvsout`**](opcodes/pvsout.md)`(fsig, kchan)`<br>


`kfr, kamp = `[**`pvspitch`**](opcodes/pvspitch.md)`(fsig, kthresh)`<br>


`fsig = `[**`pvstanal`**](opcodes/pvstanal.md)`(ktimescal, kamp, kpitch, ktab, [kdetect, kwrap, ioffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ifftsize, ihop, idbthresh])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`)`<br>


`fsig = `[**`pvstencil`**](opcodes/pvstencil.md)`(fsigin, kgain, klevel, iftable)`<br>


`fsig = `[**`pvstrace`**](opcodes/pvstrace.md)`(fsigin, kn)`<br>
`fsig, kBins[] = pvstrace(fsigin, kn [, isort, imin, imax])`<br>


`fsig = `[**`pvsvoc`**](opcodes/pvsvoc.md)`(famp, fexc, kdepth, kgain [, kcoefs])`<br>


`fsig = `[**`pvswarp`**](opcodes/pvswarp.md)`(fsigin, kscal, kshift [, klowest, kmeth, kgain, kcoefs])`<br>


`ares = `[**`pvsynth`**](opcodes/pvsynth.md)`(fsrc, [iinit])`<br>


`asig = `[**`resyn`**](opcodes/resyn.md)`(fin, kscal, kpitch, kmaxtracks, ifn)`<br>


`asig = `[**`sinsyn`**](opcodes/sinsyn.md)`(fin, kscal, kmaxtracks, ifn)`<br>


`fsig = `[**`tab2pvs`**](opcodes/tab2pvs.md)`(tvar|karr[] [, ihopsize, iwinsize, iwintype])`<br>
`fsig = tab2pvs(kmags[], kfreqs[] [, ihopsize, iwinsize, iwintype])`<br>


`ffr,fphs = `[**`tabifd`**](opcodes/tabifd.md)`(ktimpt, kamp, kpitch, ifftsize, ihopsize, iwintype,ifn)`<br>


`asig = `[**`tradsyn`**](opcodes/tradsyn.md)`(fin, kscal, kpitch, kmaxtracks, ifn)`<br>


`fsig = `[**`trcross`**](opcodes/trcross.md)`(fin1, fin2, ksearch, kdepth [, kmode])`<br>


`fsig = `[**`trfilter`**](opcodes/trfilter.md)`(fin, kamnt, ifn)`<br>


`fsig, kfr, kamp = `[**`trhighest`**](opcodes/trhighest.md)`(fin1, kscal)`<br>


`fsig, kfr, kamp = `[**`trlowest`**](opcodes/trlowest.md)`(fin1, kscal)`<br>


`fsig = `[**`trmix`**](opcodes/trmix.md)`(fin1, fin2)`<br>


`fsig = `[**`trscale`**](opcodes/trscale.md)`(fin, kpitch [, kgain])`<br>


`fsig = `[**`trshift`**](opcodes/trshift.md)`(fin, kpshift [, kgain])`<br>


`fsiglow, fsighi = `[**`trsplit`**](opcodes/trsplit.md)`(fin, ksplit [, kgainlow, kgainhigh])`<br>


### Spectral Processing:ATS
`ar = `[**`ATSadd`**](opcodes/ATSadd.md)`(ktimepnt, kfmod, iatsfile, ifn, ipartials [, ipartialoffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ipartialincr, igatefn])`<br>


`ar = `[**`ATSaddnz`**](opcodes/ATSaddnz.md)`(ktimepnt, iatsfile, ibands [, ibandoffset, ibandincr])`<br>


[**`ATSbufread`**](opcodes/ATSbufread.md)`(ktimepnt, kfmod, iatsfile, ipartials [, ipartialoffset, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`ipartialincr])`<br>


`ar = `[**`ATScross`**](opcodes/ATScross.md)`(ktimepnt, kfmod, iatsfile, ifn, kmylev, kbuflev, ipartials \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipartialoffset, ipartialincr])`<br>


`idata = `[**`ATSinfo`**](opcodes/ATSinfo.md)`(iatsfile, ilocation)`<br>


`kamp = `[**`ATSinterpread`**](opcodes/ATSinterpread.md)`(kfreq)`<br>


`kfrq, kamp = `[**`ATSpartialtap`**](opcodes/ATSpartialtap.md)`(ipartialnum)`<br>


`kfreq, kamp = `[**`ATSread`**](opcodes/ATSread.md)`(ktimepnt, iatsfile, ipartial)`<br>


`kenergy = `[**`ATSreadnz`**](opcodes/ATSreadnz.md)`(ktimepnt, iatsfile, iband)`<br>


`ar = `[**`ATSsinnoi`**](opcodes/ATSsinnoi.md)`(ktimepnt, ksinlev, knzlev, kfmod, iatsfile, ipartials \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, ipartialoffset, ipartialincr])`<br>


### Spectral Processing:Other
`kcent = `[**`centroid`**](opcodes/centroid.md)`(asig, ktrig, ifftsize)`<br>


`asig [,asig2] = `[**`filescal`**](opcodes/filescal.md)`(ktimescal, kamp, kpitch, Sfile, klock \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[,ifftsize, idecim, ithresh])`<br>


`asig = `[**`mincer`**](opcodes/mincer.md)`(atimpt, kamp, kpitch, ktab, klock [ ,ifftsize, idecim])`<br>


`asig, asig2, ktime = `[**`mp3scal`**](opcodes/mp3scal.md)`(Sfile, ktimescal, kpitch, kamp \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, iskip, ifftsize, idecim, ilock])`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`)`<br>


`asig = `[**`paulstretch`**](opcodes/paulstretch.md)`(istretch, iwindowsize, ift)`<br>


`asig = `[**`temposcal`**](opcodes/temposcal.md)`(ktimescal, kamp, kpitch, ktab, klock [,ifftsize, idecim, ithresh])`<br>


### Strings:Definition
`Sdst = `[**`strfromurl`**](opcodes/strfromurl.md)`(StringURL)`<br>


`Sdst = `[**`strget`**](opcodes/strget.md)`(indx)`<br>


[**`strset`**](opcodes/strset.md)`(iarg, istring)`<br>


### Strings:Manipulation
[**`puts`**](opcodes/puts.md)`(Sstr, ktrig [, inonl])`<br>


`Sdst = `[**`sprintf`**](opcodes/sprintf.md)`(Sfmt, xarg1[, xarg2[, ... ]])`<br>


`Sdst = `[**`sprintfk`**](opcodes/sprintfk.md)`(Sfmt, xarg1[, xarg2[, ... ]])`<br>


`Sdst = `[**`strcat`**](opcodes/strcat.md)`(Ssrc1, Ssrc2)`<br>


`Sdst = `[**`strcatk`**](opcodes/strcatk.md)`(Ssrc1, Ssrc2)`<br>


`ires = `[**`strcmp`**](opcodes/strcmp.md)`(S1, S2)`<br>


`kres = `[**`strcmpk`**](opcodes/strcmpk.md)`(S1, S2)`<br>


`Sdst = `[**`strcpy`**](opcodes/strcpy.md)`(Ssrc)`<br>
`Sdst = Ssrc`<br>


`Sdst = `[**`strcpyk`**](opcodes/strcpyk.md)`(Ssrc)`<br>


`ipos = `[**`strindex`**](opcodes/strindex.md)`(S1, S2)`<br>


`kpos = `[**`strindexk`**](opcodes/strindexk.md)`(S1, S2)`<br>


`ilen = `[**`strlen`**](opcodes/strlen.md)`(Sstr)`<br>


`klen = `[**`strlenk`**](opcodes/strlenk.md)`(Sstr)`<br>


`ipos = `[**`strrindex`**](opcodes/strrindex.md)`(S1, S2)`<br>


`kpos = `[**`strrindexk`**](opcodes/strrindexk.md)`(S1, S2)`<br>


`Sout = `[**`strstrip`**](opcodes/strstrip.md)`(Sin [, Smode])`<br>


`Sdst = `[**`strsub`**](opcodes/strsub.md)`(Ssrc [, istart[, iend]])`<br>


`Sdst = `[**`strsubk`**](opcodes/strsubk.md)`(Ssrc, kstart, kend)`<br>


### Strings:Conversion
`ichr = `[**`strchar`**](opcodes/strchar.md)`(Sstr [, ipos])`<br>


`kchr = `[**`strchark`**](opcodes/strchark.md)`(Sstr [, kpos])`<br>


`Sdst = `[**`strlower`**](opcodes/strlower.md)`(Ssrc)`<br>


`Sdst = `[**`strlowerk`**](opcodes/strlowerk.md)`(Ssrc)`<br>


`ir = `[**`strtod`**](opcodes/strtod.md)`(Sstr)`<br>
`ir = strtod(indx)`<br>


`kr = `[**`strtodk`**](opcodes/strtodk.md)`(Sstr)`<br>
`kr = strtodk(kndx)`<br>


`ir = `[**`strtol`**](opcodes/strtol.md)`(Sstr)`<br>
`ir = strtol(indx)`<br>


`kr = `[**`strtolk`**](opcodes/strtolk.md)`(Sstr)`<br>
`kr = strtolk(kndx)`<br>


`Sdst = `[**`strupper`**](opcodes/strupper.md)`(Ssrc)`<br>


`Sdst = `[**`strupperk`**](opcodes/strupperk.md)`(Ssrc)`<br>


### Vectorial:Tables
[**`vtaba`**](opcodes/vtaba.md)`(andx, ifn, aout1 [, aout2, aout3, .... , aoutN ])`<br>


[**`vtabi`**](opcodes/vtabi.md)`(indx, ifn, iout1 [, iout2, iout3, .... , ioutN ])`<br>


[**`vtabk`**](opcodes/vtabk.md)`(kndx, ifn, kout1 [, kout2, kout3, .... , koutN ])`<br>


[**`vtable1k`**](opcodes/vtable1k.md)`(kfn, kout1 [, kout2, kout3, .... , koutN ])`<br>


[**`vtablea`**](opcodes/vtablea.md)`(andx, kfn, kinterp, ixmode, aout1 [, aout2, aout3, .... , aoutN ])`<br>


[**`vtablei`**](opcodes/vtablei.md)`(indx, ifn, interp, ixmode, iout1 [, iout2, iout3, .... , ioutN ])`<br>


[**`vtablek`**](opcodes/vtablek.md)`(kndx, kfn, kinterp, ixmode, kout1 [, kout2, kout3, .... , koutN ])`<br>


[**`vtablewa`**](opcodes/vtablewa.md)`(andx, kfn, ixmode, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ])`<br>


[**`vtablewi`**](opcodes/vtablewi.md)`(indx, ifn, ixmode, inarg1 [, inarg2, inarg3 , .... , inargN ])`<br>


[**`vtablewk`**](opcodes/vtablewk.md)`(kndx, kfn, ixmode, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ])`<br>


[**`vtabwa`**](opcodes/vtabwa.md)`(andx, ifn, ainarg1 [, ainarg2, ainarg3 , .... , ainargN ])`<br>


[**`vtabwi`**](opcodes/vtabwi.md)`(indx, ifn, inarg1 [, inarg2, inarg3 , .... , inargN ])`<br>


[**`vtabwk`**](opcodes/vtabwk.md)`(kndx, ifn, kinarg1 [, kinarg2, kinarg3 , .... , kinargN ])`<br>


### Vectorial:Scalar operations
[**`vadd`**](opcodes/vadd.md)`(ifn, kval, kelements [, kdstoffset] [, kverbose])`<br>


[**`vadd_i`**](opcodes/vadd_i.md)`(ifn, ival, ielements [, idstoffset])`<br>


[**`vexp`**](opcodes/vexp.md)`(ifn, kval, kelements [, kdstoffset] [, kverbose])`<br>


[**`vexp_i`**](opcodes/vexp_i.md)`(ifn, ival, ielements [, idstoffset])`<br>


[**`vmult`**](opcodes/vmult.md)`(ifn, kval, kelements [, kdstoffset] [, kverbose])`<br>


[**`vmult_i`**](opcodes/vmult_i.md)`(ifn, ival, ielements [, idstoffset])`<br>


[**`vpow`**](opcodes/vpow.md)`(ifn, kval, kelements [, kdstoffset] [, kverbose])`<br>


[**`vpow_i`**](opcodes/vpow_i.md)`(ifn, ival, ielements [, idstoffset])`<br>


### Vectorial:Vectorial operations
[**`vaddv`**](opcodes/vaddv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vaddv_i`**](opcodes/vaddv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


[**`vcopy`**](opcodes/vcopy.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [, kverbose])`<br>


[**`vcopy_i`**](opcodes/vcopy_i.md)`(ifn1, ifn2, ielements [,idstoffset, isrcoffset])`<br>


[**`vdivv`**](opcodes/vdivv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vdivv_i`**](opcodes/vdivv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


[**`vexpv`**](opcodes/vexpv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vexpv_i`**](opcodes/vexpv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


[**`vmap`**](opcodes/vmap.md)`(ifn1, ifn2, ielements [,idstoffset, isrcoffset])`<br>


[**`vmultv`**](opcodes/vmultv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vmultv_i`**](opcodes/vmultv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


[**`vpowv`**](opcodes/vpowv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vpowv_i`**](opcodes/vpowv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


[**`vsubv`**](opcodes/vsubv.md)`(ifn1, ifn2, kelements [, kdstoffset] [, ksrcoffset] [,kverbose])`<br>


[**`vsubv_i`**](opcodes/vsubv_i.md)`(ifn1, ifn2, ielements [, idstoffset] [, isrcoffset])`<br>


### Vectorial:Envelopes
[**`vexpseg`**](opcodes/vexpseg.md)`(ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]])`<br>


[**`vlinseg`**](opcodes/vlinseg.md)`(ifnout, ielements, ifn1, idur1, ifn2 [, idur2, ifn3 [...]])`<br>


### Vectorial:Limiting and Wrapping
[**`vlimit`**](opcodes/vlimit.md)`(ifn, kmin, kmax, ielements)`<br>


[**`vmirror`**](opcodes/vmirror.md)`(ifn, kmin, kmax, ielements)`<br>


[**`vwrap`**](opcodes/vwrap.md)`(ifn, kmin, kmax, ielements)`<br>


### Vectorial:Delay Paths
`kout = `[**`vdelayk`**](opcodes/vdelayk.md)`(ksig, kdel, imaxdel [, iskip, imode])`<br>


[**`vecdelay`**](opcodes/vecdelay.md)`(ifn, ifnIn, ifnDel, ielements, imaxdel [, iskip])`<br>


[**`vport`**](opcodes/vport.md)`(ifn, khtime, ielements [, ifnInit])`<br>


### Vectorial:Random
[**`vrandh`**](opcodes/vrandh.md)`(ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, isize] [, ioffset])`<br>


[**`vrandi`**](opcodes/vrandi.md)`(ifn,  krange, kcps, ielements [, idstoffset] [, iseed] \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`[, isize] [, ioffset])`<br>


### Vectorial:Cellular Automata
[**`cell`**](opcodes/cell.md)`(ktrig, kreinit, ioutFunc, initStateFunc, iRuleFunc, ielements)`<br>


[**`vcella`**](opcodes/vcella.md)`(ktrig, kreinit, ioutFunc, initStateFunc, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`iRuleFunc, ielements, irulelen [, iradius])`<br>


### Zak Patch System
[**`zacl`**](opcodes/zacl.md)`(kfirst [, klast])`<br>


[**`zakinit`**](opcodes/zakinit.md)`(isizea, isizek)`<br>


`ares = `[**`zamod`**](opcodes/zamod.md)`(asig, k[**`zamod`**](opcodes/zamod.md))`<br>


`ares = `[**`zar`**](opcodes/zar.md)`(kndx)`<br>


`ares = `[**`zarg`**](opcodes/zarg.md)`(kndx, kgain)`<br>


[**`zaw`**](opcodes/zaw.md)`(asig, kndx)`<br>


[**`zawm`**](opcodes/zawm.md)`(asig, kndx [, imix])`<br>


`ir = `[**`zir`**](opcodes/zir.md)`(indx)`<br>


[**`ziw`**](opcodes/ziw.md)`(isig, indx)`<br>


[**`ziwm`**](opcodes/ziwm.md)`(isig, indx [, imix])`<br>


[**`zkcl`**](opcodes/zkcl.md)`(kfirst, klast)`<br>


`kres = `[**`zkmod`**](opcodes/zkmod.md)`(ksig, k[**`zkmod`**](opcodes/zkmod.md))`<br>


`kres = `[**`zkr`**](opcodes/zkr.md)`(kndx)`<br>


[**`zkw`**](opcodes/zkw.md)`(kval, kndx)`<br>


[**`zkwm`**](opcodes/zkwm.md)`(ksig, kndx [, imix])`<br>


### OSC
[**`OSCbundle`**](opcodes/OSCbundle.md)`(kwhen, ihost, iport, Sdest[], Stype[], kArgs[][] [, isize])`<br>


`kans = `[**`OSCcount`**](opcodes/OSCcount.md)`()`<br>


`ihandle = `[**`OSCinit`**](opcodes/OSCinit.md)`(iport)`<br>


`ihandle = `[**`OSCinitM`**](opcodes/OSCinitM.md)`(Sgroup, iport)`<br>


`kans = `[**`OSClisten`**](opcodes/OSClisten.md)`(ihandle, idest, itype [, xdata1, xdata2, ...])`<br>
`kans, kdata[] = OSClisten(ihandle, idest, itype)`<br>
`kans, ... = OSClisten(idest, itype)`<br>


`Smess[], klen = `[**`OSCraw`**](opcodes/OSCraw.md)`(iport)`<br>


[**`OSCsend`**](opcodes/OSCsend.md)`(kwhen, ihost, iport, idestination [, itype , xdata1, xdata2, ...])`<br>


### Network
[**`remoteport`**](opcodes/remoteport.md)`(iportnum)`<br>


`asig = `[**`sockrecv`**](opcodes/sockrecv.md)`(iport, ilength)`<br>
`ksig = sockrecv(iport, ilength)`<br>
`asigl, asigr = sockrecvs(iport, ilength)`<br>
`String = sockrecv(iport, ilength)`<br>
`asig [,kstate] = strecv(Sipaddr, iport)`<br>


[**`socksend`**](opcodes/socksend.md)`(asig, Sipaddr, iport, ilength)`<br>
`socksend(ksig, Sipaddr, iport, ilength)`<br>
`socksends(asigl, asigr, Sipaddr, iport, ilength)`<br>
`stsend(asig, Sipaddr, iport)`<br>


### Remote Opcodes
[**`insglobal`**](opcodes/insglobal.md)`(isource, instrnum [,instrnum...])`<br>


[**`insremot`**](opcodes/insremot.md)`(idestination, isource, instrnum [, instrnum...])`<br>


[**`midglobal`**](opcodes/midglobal.md)`(isource, instrnum [, instrnum...])`<br>


[**`midremot`**](opcodes/midremot.md)`(idestination, isource, instrnum [, instrnum...])`<br>


### Mixer Opcodes
[**`MixerClear`**](opcodes/mixerclear.md)`()`<br>


`kgain = `[**`MixerGetLevel`**](opcodes/mixergetlevel.md)`(isend, ibuss)`<br>


`asignal = `[**`MixerReceive`**](opcodes/mixerreceive.md)`(ibuss, ichannel)`<br>


[**`MixerSend`**](opcodes/mixersend.md)`(asignal, isend, ibuss, ichannel)`<br>


[**`MixerSetLevel`**](opcodes/mixersetlevel.md)`(isend, ibuss, kgain)`<br>


[**`MixerSetLevel_i`**](opcodes/mixersetlevel_i.md)`(isend, ibuss, igain)`<br>


### Array Opcodes
[**`array`**](opcodes/array.md)`(arg:a)`<br>
`array(arg1:k, arg2:k, ...)`<br>
`array(arg1:i, arg2:i, ...)`<br>


[**`copya2ftab`**](opcodes/copya2ftab.md)`(kArray[], ktab [, koffset])`<br>
`copya2ftab(iArray[], itab [, ioffset])`<br>


[**`copyf2array`**](opcodes/copyf2array.md)`(tab, kftbl)`<br>


`kout1[], kout2[] = `[**`deinterleave`**](opcodes/deinterleave.md)`(kin[])`<br>


`karray[] = `[**`fillarray`**](opcodes/fillarray.md)`(ival1, ival2,.....ivaln)`<br>
`karray = fillarray(ival1, ival2,.....ivaln)`<br>
`karray = fillarray(kval1, kval2,.....kvaln)`<br>


`karray = `[**`genarray`**](opcodes/genarray.md)`(kstart, kens [, inc])`<br>
`iarray = genarray(istart, iens [, inc])`<br>


`i/kout[] = `[**`getcol`**](opcodes/getcol.md)`(i/kin[], i/kcol)`<br>


`i/kout[] = `[**`getrow`**](opcodes/getrow.md)`(i/kin[], i/krow)`<br>


`kout[] = `[**`interleave`**](opcodes/interleave.md)`(kin1[], kin2[])`<br>


`kmax [,kindx] = `[**`maxarray`**](opcodes/maxarray.md)`(karray)`<br>


`kmin [,kindx] = `[**`minarray`**](opcodes/minarray.md)`(karray)`<br>


[**`printarray`**](opcodes/printarray.md)`(ixs[] [, Smft, Slabel ])`<br>
`printarray(kxs[] [, ktrig, Sfmt, Slabel ])`<br>


`kres/ires = `[**`product`**](opcodes/productarray.md)`(karr[]/iarr[])  (k- or i-arrays )`<br>


[**`reshapearray`**](opcodes/reshapearray.md)`(array[], isize0 [, isize1 ])`<br>


[**`scalearray`**](opcodes/scalearray.md)`(tarray, kmin, kmax[, kleft, kright])`<br>


`i/kout[] = `[**`setcol`**](opcodes/setcol.md)`(i/kin[], i/kcol)`<br>


`i/kout[] = `[**`setrow`**](opcodes/setrow.md)`(i/kin[], i/krow)`<br>


`kout[] = `[**`shiftin`**](opcodes/shiftin.md)`(asig)`<br>


`asig = `[**`shiftout`**](opcodes/shiftout.md)`(kIn[] [, ioff])`<br>


`ksum = `[**`sumarray`**](opcodes/sumarray.md)`(karray)`<br>


`kout[] = `[**`tab2array`**](opcodes/tab2array.md)`(ifn [, kstart, kend, kstep ])`<br>
`iout[] = tab2array(ifn [, istart, iend, istep ])`<br>


[**`trim`**](opcodes/trim.md)`_i(iarray, ilen)`<br>
`trim(xarray, klen)`<br>


### Array Operations: Fast Fourier Transform
`out:k[] = `[**`fft`**](opcodes/fft.md)`(in:k[])`<br>
`in:Complex[] = fft(in:Complex[][,inverse:i])`<br>
`in:Complex[] = fft(in:k[]);`<br>
`out:k[] = fft(in:Complex[]);`<br>


`kout[] = `[**`fftinv`**](opcodes/ifft.md)`(kin[])`<br>


`out:k[] = `[**`rfft`**](opcodes/rfft.md)`(in:k[])`<br>
`out:Complex[] = rfft(in:k[])    `<br>


`out:k[] = `[**`rifft`**](opcodes/rifft.md)`(in:k[])`<br>
`out:k[] = rifft(in:Complex[])    `<br>


`kout[] = `[**`unwrap`**](opcodes/unwrap.md)`(kin[])`<br>


`kout[] = `[**`window`**](opcodes/window.md)`(kin[] [, koff, itype])`<br>


### Array Operations: complex numbers
`kout[] = `[**`c2r`**](opcodes/c2r.md)`(kin[])`<br>


`kout[] = `[**`cmplxprod`**](opcodes/cmplxprod.md)`(kin1[], kin2[])`<br>


`kout[] = `[**`mags`**](opcodes/mags.md)`(kin[])`<br>


`kout[] = `[**`phs`**](opcodes/phs.md)`(kin[])`<br>


`kout[] = `[**`pol2rect`**](opcodes/pol2rect.md)`(kin[])`<br>
`kout[] = pol2rect(kmags[], kphs[])`<br>


`kout[] = `[**`r2c`**](opcodes/r2c.md)`(kin[])`<br>


`kout[] = `[**`rect2pol`**](opcodes/rect2pol.md)`(kin[])`<br>


### Array Operations: dot product
`kres/ires = `[**`dot`**](opcodes/dot.md)`(karr1[]/iarr1[], karr2[]/iarr2[])   (k- or i-arrays)`<br>


### Array Operations: sorting
`k/i[] = `[**`sorta`**](opcodes/sorta.md)`(k/i[])  (k- or i-arrays )`<br>


`k/i[] = `[**`sortd`**](opcodes/sortd.md)`(k/i[])  (k- or i-arrays )`<br>


### Array Operations: Cepstrum
`keps[] = `[**`ceps`**](opcodes/ceps.md)`(kmags[] [, icoefs])`<br>


`kenv = `[**`cepsinv`**](opcodes/cepsinv.md)`(keps[])`<br>


### Array Operations: Autocorrelation
`kout[] = `[**`autocorr`**](opcodes/autocorr.md)`(kin[])`<br>


### Array Operations: Discrete Cosine Transform
`kout[] = `[**`dct`**](opcodes/dct.md)`(kin[])`<br>
`iout[] = dct(iin[])`<br>


`kout[] = `[**`dctinv`**](opcodes/dctinv.md)`(kin[])`<br>
`iout[] = dctinv(iin[])`<br>


### Array Operations: Mel scale filterbank
`kout[] = `[**`mfb`**](opcodes/mfb.md)`(kin[], klow, khigh, ibands)`<br>


### Deprecated
[**`tableiw`**](opcodes/tableiw.md)`(isig, indx, ifn [, ixmode] [, ixoff] [, iwgmode])`<br>


### Miscellaneous
`SFiles[] = `[**`directory`**](opcodes/directory.md)`(SDirectory [, SExtention])`<br>


`kout[] = `[**`framebuffer`**](opcodes/framebuffer.md)`(ain, isize)`<br>
`aout = framebuffer(kin, isize)`<br>


[**`modmatrix`**](opcodes/modmatrix.md)`(iresfn, isrcmodfn, isrcparmfn, imodscale, inum_mod, \`<br>
&nbsp;&nbsp;&nbsp;&nbsp;`inum_parm, kupdate)`<br>


`idacc, iadcc = `[**`nchnls_hw`**](opcodes/nchnls_hw.md)`()`<br>


`aout = `[**`olabuffer`**](opcodes/olabuffer.md)`(kin, ioverlap)`<br>


`Sres = `[**`pwd`**](opcodes/pwd.md)`()`<br>


`aout = `[**`select`**](opcodes/select.md)`(a1, a2, aless, aequal, amore)`<br>


`ires = `[**`system`**](opcodes/system.md)`_i(itrig, Scmd, [inowait])`<br>
`kres = system(ktrig, Scmd, [knowait])`<br>


[**`tableshuffle`**](opcodes/tableshuffle.md)`(ktablenum)`<br>
`tableshufflei itablenum)`<br>


### Utilities
`kmom, kint, kshort = `[**`lufs`**](opcodes/lufs.md)`(kreset, ain1 [, ain2])`<br>


