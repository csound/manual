# *************************************************************************
# Module: Makefile
# Purpose: Generates different versions of the Csound manual.
# Note: Modified from the Makefile example in the DocBook-Install-HOWTO.
#       You may need to change program names and paths to get this to work
#       on your system.
# *************************************************************************
BASENAME=Csound
VERSION=6.17.0

# export PATH=$PATH:/home/andres/bin/fop-0.20.5/
# export JAVA_HOME=/usr/lib/jvm/java-6-sun/

# Output Directories
HTML_DIR=html
HTML_ONE_DIR=singleHTML
HTMLHELP_DIR=htmlhelp
MANPAGES_DIR=manpages

# Stylesheets
ifneq "$(wildcard /usr/share/xml/docbook/stylesheet/nwalsh/*/docbook.xsl)" ""
 XSL_BASE_PATH=/usr/share/xml/docbook/stylesheet/nwalsh/
else ifneq "$(wildcard /usr/share/xml/docbook/stylesheet/nwalsh/*/*/docbook.xsl)" ""
# some distros version the docbook stylesheets
 text__=$(patsubst %manpages/docbook.xsl,%, $(wildcard /usr/share/xml/docbook/stylesheet/nwalsh/*/manpages/docbook.xsl))
 # We want the newest version
 XSL_BASE_PATH=$(word $(words $(text__)), $(sort $(text__)))
else
endif
XSL_HTML=xsl/customXHTMLchunk.xsl
XSL_HTML_ONECHUNK=xsl/customXHTMLOneChunk.xsl
XSL_PRINT=xsl/customPDF.xsl
XSL_HTMLHELP=xsl/customHTMLHelp.xsl
# Manpages don't need custom anything
XSL_MANPAGES=$(XSL_BASE_PATH)/manpages/docbook.xsl

COMMAND = command/desc.xml command/flags.xml command/preproc.xml \
	command/top.xml command/unifile.xml command/environment.xml \
	command/flagscategory.xml

CONTROL = control/clockctl.xml control/conditional.xml control/durctl.xml \
	control/fltkappearance.xml control/fltkcontainers.xml \
	control/fltkgeneral.xml control/fltkintro.xml control/fltkother.xml \
	control/fltkvaluators.xml control/invocat.xml \
	control/pgmctl.xml control/realtime.xml \
	control/reinitn.xml control/sensing.xml control/subinstr.xml \
	control/timeread.xml control/top.xml

XMLS = cscore/advancd.xml cscore/compile.xml \
	cscore/events.xml cscore/main.xml cscore/top.xml \
	math/amp.xml math/artlogic.xml math/linearalgebra.xml \
	math/mathfunc.xml math/opeqfunc.xml math/rndfunc.xml \
	math/top.xml math/trig.xml pitch/funcs.xml \
	pitch/top.xml pitch/tuning.xml \
	preface/copy.xml preface/preface.xml preface/top.xml \
	spectral/nonstand.xml spectral/realtime.xml spectral/top.xml \
	table/queries.xml table/readwrit.xml table/select.xml \
	table/top.xml zak/top.xml

MIDI = midi/convert.xml midi/extender.xml \
	midi/generic.xml midi/onoff.xml midi/output.xml \
	midi/realtime.xml midi/sliderbk.xml midi/top.xml \
	midi/input.xml midi/interop.xml midi/virtual.xml

MISC = 	misc/amp.xml misc/csound64.xml misc/formants.xml misc/glossary.xml \
	misc/pitch.xml misc/quickref.xml misc/sf2.xml misc/top.xml \
	misc/windows.xml misc/modalfreq.xml misc/examples.xml \
	csbeats/example.xml csbeats/syntax.xml csbeats/top.xml deprecated/top.xml \
	experimental/top.xml imageopcodes/top.xml


OPCODES = opcodes/0dbfs.xml	opcodes/ATSadd.xml	opcodes/ATSaddnz.xml \
	opcodes/ATSbufread.xml	opcodes/ATScross.xml	opcodes/ATSinfo.xml \
	opcodes/ATSinterpread.xml  opcodes/ATSpartialtap.xml opcodes/ATSread.xml \
	opcodes/ATSreadnz.xml	opcodes/ATSsinnoi.xml opcodes/JackoAudioIn.xml \
	opcodes/JackoAudioInConnect.xml	opcodes/JackoAudioOut.xml \
	opcodes/JackoAudioOutConnect.xml	opcodes/JackoFreewheel.xml \
	opcodes/JackoInfo.xml	opcodes/JackoInit.xml \
	opcodes/JackoMidiInConnect.xml	opcodes/JackoMidiOut.xml \
	opcodes/JackoMidiOutConnect.xml	opcodes/JackoNoteOut.xml \
	opcodes/JackoOn.xml	opcodes/JackoTransport.xml \
	opcodes/OSCinit.xml	opcodes/OSClisten.xml	opcodes/OSCsend.xml \
	opcodes/STKBandedWG.xml \
	opcodes/STKBeeThree.xml	opcodes/STKBlowBotl.xml	opcodes/STKBlowHole.xml \
	opcodes/STKBowed.xml	opcodes/STKBrass.xml	opcodes/STKClarinet.xml \
	opcodes/STKDrummer.xml	opcodes/STKFMVoices.xml	opcodes/STKFlute.xml \
	opcodes/STKHevyMetl.xml	opcodes/STKMandolin.xml	opcodes/STKModalBar.xml \
	opcodes/STKMoog.xml	opcodes/STKPercFlut.xml	opcodes/STKPlucked.xml \
	opcodes/STKResonate.xml	opcodes/STKRhodey.xml	opcodes/STKSaxofony.xml \
	opcodes/STKShakers.xml	opcodes/STKSimple.xml	opcodes/STKSitar.xml \
	opcodes/STKStifKarp.xml	opcodes/STKTubeBell.xml	opcodes/STKVoicForm.xml \
	opcodes/STKWhistle.xml	opcodes/STKWurley.xml	opcodes/abetarand.xml \
	opcodes/abexprnd.xml	opcodes/abs.xml	opcodes/acauchy.xml \
	opcodes/active.xml	opcodes/adds.xml	opcodes/adsr.xml \
	opcodes/adsyn.xml	opcodes/adsynt.xml	opcodes/adsynt2.xml \
	opcodes/aexprand.xml	opcodes/aftouch.xml	opcodes/agauss.xml \
	opcodes/agogobel.xml	opcodes/alinrand.xml	opcodes/alpass.xml \
	opcodes/alwayson.xml	opcodes/ampdb.xml	opcodes/ampdbfs.xml \
	opcodes/ampmidi.xml	opcodes/ampmidid.xml	opcodes/apcauchy.xml \
	opcodes/apoisson.xml	opcodes/apow.xml	opcodes/areson.xml \
	opcodes/aresonk.xml	opcodes/array.xml	opcodes/assign.xml \
	opcodes/atone.xml	opcodes/atonek.xml	opcodes/atonex.xml \
	opcodes/atrirand.xml	opcodes/aunirand.xml	opcodes/aweibull.xml \
	opcodes/babo.xml	opcodes/balance.xml	opcodes/bamboo.xml \
	opcodes/barmodel.xml	opcodes/bbcutm.xml	opcodes/bbcuts.xml \
	opcodes/betarand.xml	opcodes/bexprnd.xml	opcodes/bformdec.xml \
	opcodes/bformdec1.xml	opcodes/bformenc.xml	opcodes/bformenc1.xml \
	opcodes/binit.xml	opcodes/biquad.xml	opcodes/biquada.xml \
	opcodes/birnd.xml	opcodes/bqrez.xml	opcodes/butbp.xml \
	opcodes/butbr.xml	opcodes/buthp.xml	opcodes/butlp.xml \
	opcodes/butterbp.xml	opcodes/butterbr.xml	opcodes/butterhp.xml \
	opcodes/butterlp.xml	opcodes/button.xml	opcodes/buzz.xml \
	opcodes/c2r.xml	opcodes/cabasa.xml	opcodes/cauchy.xml \
	opcodes/cauchyi.xml	opcodes/ceil.xml	opcodes/cell.xml \
	opcodes/cent.xml	opcodes/centroid.xml	opcodes/ceps.xml \
	opcodes/cepsinv.xml	opcodes/cggoto.xml	opcodes/chanctrl.xml \
	opcodes/changed.xml	opcodes/changed2.xml	opcodes/chani.xml \
	opcodes/chano.xml	opcodes/chebyshevpoly.xml opcodes/checkbox.xml \
	opcodes/chn.xml		opcodes/chnclear.xml	opcodes/chnexport.xml \
	opcodes/chnget.xml	opcodes/chnmix.xml	opcodes/chnparams.xml \
	opcodes/chnset.xml	opcodes/chuap.xml	opcodes/cigoto.xml \
	opcodes/ckgoto.xml	opcodes/clear.xml	opcodes/clfilt.xml \
	opcodes/clip.xml	opcodes/clock.xml	opcodes/clockoff.xml \
	opcodes/clockon.xml	opcodes/cmplxprod.xml	opcodes/cngoto.xml \
	opcodes/comb.xml	opcodes/combinv.xml	opcodes/compilecsd.xml \
	opcodes/compileorc.xml	opcodes/compilestr.xml	opcodes/compress.xml \
	opcodes/compress2.xml	opcodes/connect.xml	opcodes/control.xml \
	opcodes/convle.xml	opcodes/convolve.xml	opcodes/copya2ftab.xml \
	opcodes/copyf2array.xml	opcodes/cos.xml	opcodes/cosh.xml \
	opcodes/cosinv.xml	opcodes/cosseg.xml	opcodes/cossegb.xml \
	opcodes/cossegr.xml	opcodes/cps2pch.xml	opcodes/cpsmidi.xml \
	opcodes/cpsmidib.xml	opcodes/cpsmidinn.xml	opcodes/cpsoct.xml \
	opcodes/cpspch.xml	opcodes/cpstmid.xml	opcodes/cpstun.xml \
	opcodes/cpstuni.xml	opcodes/cpsxpch.xml	opcodes/cpumeter.xml \
	opcodes/cpuprc.xml	opcodes/cross2.xml	opcodes/crossfm.xml \
	opcodes/crunch.xml	opcodes/ctrl14.xml	opcodes/ctrl21.xml \
	opcodes/ctrl7.xml	opcodes/ctrlinit.xml	opcodes/cudanal.xml \
	opcodes/cudasliding.xml	opcodes/cudasynth.xml	opcodes/cuserrnd.xml \
	opcodes/dam.xml	opcodes/date.xml	opcodes/dates.xml \
	opcodes/db.xml	opcodes/dbamp.xml	opcodes/dbfsamp.xml \
	opcodes/dcblock.xml	opcodes/dcblock2.xml	opcodes/dconv.xml \
	opcodes/dct.xml		opcodes/dctinv.xml \
	opcodes/define.xml	opcodes/delay.xml	opcodes/delay1.xml \
	opcodes/delayk.xml	opcodes/delayr.xml	opcodes/delayw.xml \
	opcodes/deltap.xml	opcodes/deltap3.xml	opcodes/deltapi.xml \
	opcodes/deltapn.xml	opcodes/deltapx.xml	opcodes/deltapxw.xml \
	opcodes/denorm.xml	opcodes/diff.xml	\
	opcodes/diode_ladder.xml opcodes/directory.xml \
	opcodes/diskgrain.xml	opcodes/diskin.xml	opcodes/diskin2.xml \
	opcodes/dispfft.xml	opcodes/display.xml	opcodes/distort.xml \
	opcodes/distort1.xml	opcodes/divides.xml	opcodes/divz.xml \
	opcodes/dollar.xml	opcodes/doppler.xml	opcodes/downsamp.xml \
	opcodes/dripwater.xml	opcodes/dssiactivate.xml \
	opcodes/dssiaudio.xml	opcodes/dssictls.xml	opcodes/dssiinit.xml \
	opcodes/dssilist.xml	opcodes/dumpk.xml	opcodes/dumpk2.xml \
	opcodes/dumpk3.xml	opcodes/dumpk4.xml	opcodes/duserrnd.xml \
	opcodes/dust.xml	opcodes/dust2.xml	opcodes/else.xml \
	opcodes/elseif.xml	opcodes/endif.xml	opcodes/endin.xml \
	opcodes/endop.xml	opcodes/envlpx.xml	opcodes/envlpxr.xml \
	opcodes/ephasor.xml	opcodes/eqfil.xml	opcodes/equals.xml \
	opcodes/evalstr.xml	opcodes/event.xml	opcodes/event_i.xml \
	opcodes/exciter.xml	opcodes/exitnow.xml	opcodes/exp.xml \
	opcodes/expcurve.xml	opcodes/expon.xml	opcodes/exprand.xml \
	opcodes/exprandi.xml	opcodes/expseg.xml	opcodes/expsega.xml \
	opcodes/expsegb.xml	opcodes/expsegba.xml	opcodes/expsegr.xml \
	opcodes/fareylen.xml	opcodes/fareyleni.xml	opcodes/faustaudio.xml \
	opcodes/faustcompile.xml opcodes/faustctl.xml	opcodes/faustgen.xml \
	opcodes/fft.xml	opcodes/ficlose.xml	opcodes/filebit.xml \
	opcodes/filelen.xml	opcodes/filenchnls.xml	opcodes/filepeak.xml \
	opcodes/filescal.xml	opcodes/filesr.xml	opcodes/filevalid.xml \
	opcodes/fillarray.xml	opcodes/filter2.xml	opcodes/fin.xml \
	opcodes/fini.xml	opcodes/fink.xml	opcodes/fiopen.xml \
	opcodes/flanger.xml	opcodes/flashtxt.xml	opcodes/flbox.xml \
	opcodes/flbutbank.xml	opcodes/flbutton.xml	opcodes/flclosebutton.xml \
	opcodes/flcolor.xml	opcodes/flcolor2.xml	opcodes/flcount.xml \
	opcodes/flexecbutton.xml opcodes/flgetsnap.xml	opcodes/flgroup.xml \
	opcodes/flgroup_end.xml	opcodes/flgroupend.xml	opcodes/flhide.xml \
	opcodes/flhvsbox.xml	opcodes/flhvsboxsetvalue.xml	opcodes/fljoy.xml \
	opcodes/flkeyin.xml	opcodes/flknob.xml	opcodes/fllabel.xml \
	opcodes/flloadsnap.xml	opcodes/flmouse.xml	opcodes/flooper.xml \
	opcodes/flooper2.xml	opcodes/floor.xml	opcodes/flpack.xml \
	opcodes/flpack_end.xml	opcodes/flpackend.xml	opcodes/flpanel.xml \
	opcodes/flpanel_end.xml	opcodes/flpanelend.xml	opcodes/flprintk.xml \
	opcodes/flprintk2.xml	opcodes/flroller.xml	opcodes/flrun.xml \
	opcodes/flsavesnap.xml	opcodes/flscroll.xml	opcodes/flscroll_end.xml \
	opcodes/flscrollend.xml	opcodes/flsetalign.xml	opcodes/flsetbox.xml \
	opcodes/flsetcolor.xml	opcodes/flsetcolor2.xml	opcodes/flsetfont.xml \
	opcodes/flsetposition.xml	opcodes/flsetsize.xml \
	opcodes/flsetsnap.xml	opcodes/flsetsnapgroup.xml \
	opcodes/flsettext.xml opcodes/flsettextcolor.xml \
	opcodes/flsettextsize.xml	opcodes/flsettexttype.xml \
	opcodes/flsetval.xml	opcodes/flsetvali.xml \
	opcodes/flshow.xml	opcodes/flslidbnk.xml	opcodes/flslidbnk2.xml \
	opcodes/flslidbnk2set.xml	opcodes/flslidbnk2setk.xml \
	opcodes/flslidbnkgethandle.xml	opcodes/flslidbnkset.xml \
	opcodes/flslidbnksetk.xml	opcodes/flslider.xml	opcodes/fltabs.xml \
	opcodes/fltabs_end.xml	opcodes/fltabsend.xml	opcodes/fltext.xml \
	opcodes/fluidAllOut.xml	opcodes/fluidCCi.xml	opcodes/fluidCCk.xml \
	opcodes/fluidControl.xml	opcodes/fluidEngine.xml \
	opcodes/fluidLoad.xml	opcodes/fluidNote.xml	opcodes/fluidOut.xml \
	opcodes/fluidProgramSelect.xml	opcodes/fluidSetInterpMethod.xml \
	opcodes/flupdate.xml	opcodes/flvalue.xml	opcodes/flvkeybd.xml \
	opcodes/flvslidbnk.xml	opcodes/flvslidbnk2.xml	opcodes/flxyin.xml \
	opcodes/fmb3.xml	opcodes/fmbell.xml	opcodes/fmmetal.xml \
	opcodes/fmpercfl.xml	opcodes/fmrhode.xml	opcodes/fmvoice.xml \
	opcodes/fmwurlie.xml	opcodes/fof.xml	opcodes/fof2.xml \
	opcodes/fofilter.xml	opcodes/fog.xml	opcodes/fold.xml \
	opcodes/follow.xml	opcodes/follow2.xml	opcodes/foscil.xml \
	opcodes/foscili.xml	opcodes/fout.xml	opcodes/fouti.xml \
	opcodes/foutir.xml	opcodes/foutk.xml	opcodes/fprintks.xml \
	opcodes/fprints.xml	opcodes/frac.xml	opcodes/fractalnoise.xml \
	opcodes/framebuffer.xml	opcodes/freeverb.xml	opcodes/ftchnls.xml \
	opcodes/ftconv.xml	opcodes/ftcps.xml	opcodes/ftfree.xml \
	opcodes/ftgen.xml	opcodes/ftgenonce.xml	opcodes/ftgentmp.xml \
	opcodes/ftlen.xml	opcodes/ftload.xml	opcodes/ftloadk.xml \
	opcodes/ftlptim.xml	opcodes/ftmorf.xml	opcodes/ftsamplebank.xml \
	opcodes/ftsave.xml	opcodes/ftsavek.xml	opcodes/ftsr.xml \
	opcodes/gain.xml	opcodes/gainslider.xml	opcodes/gauss.xml \
	opcodes/gaussi.xml	opcodes/gausstrig.xml	opcodes/gbuzz.xml \
	opcodes/genarray.xml	opcodes/genarray_i.xml	opcodes/gendy.xml \
	opcodes/gendyc.xml	opcodes/gendyx.xml	opcodes/getcfg.xml \
	opcodes/getcol.xml	opcodes/getrow.xml	opcodes/getseed.xml \
	opcodes/gogobel.xml	opcodes/goto.xml	opcodes/grain.xml \
	opcodes/grain2.xml	opcodes/grain3.xml	opcodes/granule.xml \
	opcodes/greaterequal.xml	opcodes/greaterthan.xml	opcodes/guiro.xml \
	opcodes/harmon.xml	opcodes/harmon234.xml	opcodes/hdf5read.xml \
	opcodes/hdf5write.xml	opcodes/hilbert.xml	opcodes/hrtfearly.xml \
	opcodes/hrtfer.xml	opcodes/hrtfmove.xml	opcodes/hrtfmove2.xml \
	opcodes/hrtfreverb.xml	opcodes/hrtfstat.xml	opcodes/hsboscil.xml \
	opcodes/hvs1.xml	opcodes/hvs2.xml	opcodes/hvs3.xml \
	opcodes/ibetarand.xml	opcodes/ibexprnd.xml	opcodes/icauchy.xml \
	opcodes/ictrl14.xml	opcodes/ictrl21.xml	opcodes/ictrl7.xml \
	opcodes/iexprand.xml	opcodes/if.xml	opcodes/ifdef.xml \
	opcodes/ifft.xml	opcodes/ifndef.xml	opcodes/igauss.xml \
	opcodes/igoto.xml	opcodes/ihold.xml	opcodes/ilinrand.xml \
	opcodes/imagecreate.xml	opcodes/imagefree.xml	opcodes/imagegetpixel.xml \
	opcodes/imageload.xml	opcodes/imagesave.xml	opcodes/imagesetpixel.xml \
	opcodes/imagesize.xml	opcodes/imidic14.xml	opcodes/imidic21.xml \
	opcodes/imidic7.xml	opcodes/in.xml	opcodes/in32.xml \
	opcodes/inch.xml	opcodes/include.xml	opcodes/inh.xml \
	opcodes/init.xml	opcodes/initc14.xml	opcodes/initc21.xml \
	opcodes/initc7.xml	opcodes/inleta.xml	opcodes/inletf.xml \
	opcodes/inletk.xml	opcodes/inletkid.xml	opcodes/ino.xml \
	opcodes/inq.xml	opcodes/inrg.xml	opcodes/ins.xml \
	opcodes/insglobal.xml	opcodes/insremot.xml	opcodes/instimek.xml \
	opcodes/instimes.xml	opcodes/instr.xml	opcodes/int.xml \
	opcodes/integ.xml	opcodes/interp.xml	opcodes/invalue.xml \
	opcodes/inx.xml	opcodes/inz.xml	opcodes/ioff.xml \
	opcodes/ion.xml	opcodes/iondur.xml	opcodes/iondur2.xml \
	opcodes/ioutat.xml	opcodes/ioutc.xml	opcodes/ioutc14.xml \
	opcodes/ioutpat.xml	opcodes/ioutpb.xml	opcodes/ioutpc.xml \
	opcodes/ipcauchy.xml	opcodes/ipoisson.xml	opcodes/ipow.xml \
	opcodes/is16b14.xml	opcodes/is32b14.xml	opcodes/islider16.xml \
	opcodes/islider32.xml	opcodes/islider64.xml	opcodes/islider8.xml \
	opcodes/itablecopy.xml	opcodes/itablegpw.xml	opcodes/itablemix.xml \
	opcodes/itablew.xml	opcodes/itrirand.xml	opcodes/iunirand.xml \
	opcodes/iweibull.xml	opcodes/jacktransport.xml	opcodes/jitter.xml \
	opcodes/jitter2.xml	opcodes/joystick.xml	opcodes/jspline.xml \
	opcodes/kbetarand.xml	opcodes/kbexprnd.xml	opcodes/kcauchy.xml \
	opcodes/k35_hpf.xml opcodes/k35_lpf.xml \
	opcodes/kdump.xml	opcodes/kdump2.xml	opcodes/kdump3.xml \
	opcodes/kdump4.xml	opcodes/kexprand.xml	opcodes/kfilter2.xml \
	opcodes/kgauss.xml	opcodes/kgoto.xml	opcodes/klinrand.xml \
	opcodes/kon.xml	opcodes/koutat.xml	opcodes/koutc.xml \
	opcodes/koutc14.xml	opcodes/koutpat.xml	opcodes/koutpb.xml \
	opcodes/koutpc.xml	opcodes/kpcauchy.xml	opcodes/kpoisson.xml \
	opcodes/kpow.xml	opcodes/kr.xml	opcodes/kread.xml \
	opcodes/kread2.xml	opcodes/kread3.xml	opcodes/kread4.xml \
	opcodes/ksmps.xml	opcodes/ktableseg.xml	opcodes/ktrirand.xml \
	opcodes/kunirand.xml	opcodes/kweibull.xml	\
	opcodes/lastcycle.xml \
	opcodes/lenarray.xml \
	opcodes/lessequal.xml	opcodes/lessthan.xml	opcodes/lfo.xml \
	opcodes/limit.xml	opcodes/line.xml	opcodes/linen.xml \
	opcodes/linenr.xml	opcodes/lineto.xml	opcodes/linrand.xml \
	opcodes/linseg.xml	opcodes/linsegb.xml	opcodes/linsegr.xml \
	opcodes/locsend.xml	opcodes/locsig.xml	opcodes/log.xml \
	opcodes/log10.xml	opcodes/log2.xml	opcodes/logbtwo.xml \
	opcodes/logcurve.xml	opcodes/loop_ge.xml	opcodes/loop_gt.xml \
	opcodes/loop_le.xml	opcodes/loop_lt.xml	opcodes/loopseg.xml \
	opcodes/loopsegp.xml	opcodes/looptseg.xml	opcodes/loopxseg.xml \
	opcodes/lorenz.xml	opcodes/loscil.xml	opcodes/loscil3.xml \
	opcodes/loscilx.xml	opcodes/lowpass2.xml	opcodes/lowres.xml \
	opcodes/lowresx.xml	opcodes/lpf18.xml	opcodes/lpfreson.xml \
	opcodes/lphasor.xml	opcodes/lpinterp.xml	opcodes/lposcil.xml \
	opcodes/lposcil3.xml	opcodes/lposcila.xml	opcodes/lposcilsa.xml \
	opcodes/lposcilsa2.xml	opcodes/lpread.xml	opcodes/lpreson.xml \
	opcodes/lpshold.xml	opcodes/lpsholdp.xml	opcodes/lpslot.xml \
	opcodes/mac.xml	opcodes/maca.xml	opcodes/madsr.xml \
	opcodes/mags.xml	opcodes/mandel.xml	opcodes/mandol.xml \
	opcodes/maparray.xml	opcodes/marimba.xml	opcodes/massign.xml \
	opcodes/max.xml	opcodes/max_k.xml	opcodes/maxabs.xml \
	opcodes/maxabsaccum.xml	opcodes/maxaccum.xml	opcodes/maxalloc.xml \
	opcodes/maxarray.xml	opcodes/mclock.xml	opcodes/mdelay.xml \
	opcodes/median.xml	opcodes/mediank.xml	opcodes/metro.xml \
	opcodes/midglobal.xml	opcodes/midic14.xml	opcodes/midic21.xml \
	opcodes/midic7.xml	opcodes/midichannelaftertouch.xml \
	opcodes/midichn.xml	opcodes/midicontrolchange.xml \
	opcodes/midictrl.xml \
	opcodes/mididefault.xml	opcodes/midifilestatus.xml	opcodes/midiin.xml \
	opcodes/midinoteoff.xml	opcodes/midinoteoncps.xml \
	opcodes/midinoteonkey.xml	opcodes/midinoteonoct.xml \
	opcodes/midinoteonpch.xml \
	opcodes/midion.xml	opcodes/midion2.xml	opcodes/midiout.xml \
	opcodes/midipitchbend.xml	opcodes/midipolyaftertouch.xml	\
	opcodes/midiprogramchange.xml	opcodes/miditempo.xml \
	opcodes/midremot.xml \
	opcodes/min.xml	opcodes/minabs.xml	opcodes/minabsaccum.xml \
	opcodes/minaccum.xml	opcodes/minarray.xml	opcodes/mincer.xml \
	opcodes/mirror.xml	opcodes/mixerclear.xml	opcodes/mixergetlevel.xml \
	 opcodes/mixerreceive.xml	opcodes/mixersend.xml \
	opcodes/mixersetlevel.xml	opcodes/mixersetlevel_i.xml \
	opcodes/mode.xml \
	opcodes/modmatrix.xml	opcodes/modulus.xml	opcodes/monitor.xml \
	opcodes/moog.xml	opcodes/moogladder.xml	opcodes/moogladder2.xml \
	opcodes/moogvcf.xml	opcodes/moogvcf2.xml	opcodes/moscil.xml \
	opcodes/mp3in.xml	opcodes/mp3len.xml	opcodes/mp3scal.xml \
	opcodes/mpulse.xml	opcodes/mrtmsg.xml	opcodes/multiplies.xml \
	opcodes/multitap.xml	opcodes/mute.xml	opcodes/mvchpf.xml \
	opcodes/mvclpf1.xml	opcodes/mvclpf2.xml	opcodes/mvclpf3.xml \
	opcodes/mvclpf4.xml	opcodes/mxadsr.xml	opcodes/nchnls.xml \
	opcodes/nchnls_hw.xml	opcodes/nchnls_i.xml	opcodes/nestedap.xml \
	opcodes/nlfilt.xml	opcodes/nlfilt2.xml	opcodes/noise.xml \
	opcodes/noteoff.xml	opcodes/noteon.xml	opcodes/noteondur.xml \
	opcodes/noteondur2.xml	opcodes/notequal.xml	opcodes/notnum.xml \
	opcodes/nreverb.xml	opcodes/nrpn.xml	opcodes/nsamp.xml \
	opcodes/nstance.xml	opcodes/nstrnum.xml	opcodes/ntrpol.xml \
	opcodes/octave.xml	opcodes/octcps.xml	opcodes/octmidi.xml \
	opcodes/octmidib.xml	opcodes/octmidinn.xml	opcodes/octpch.xml \
	opcodes/olabuffer.xml	opcodes/opa.xml	opcodes/opand.xml \
	opcodes/opbitand.xml	opcodes/opbitnot.xml	opcodes/opbitor.xml \
	opcodes/opbitshl.xml	opcodes/opbitshr.xml	opcodes/opcode.xml \
	opcodes/opi.xml		opcodes/opk.xml \
	opcodes/opnonequiv.xml	opcodes/opor.xml	opcodes/ops.xml \
	opcodes/oscbnk.xml	opcodes/oscil.xml	opcodes/oscil1.xml \
	opcodes/oscil1i.xml	opcodes/oscil3.xml	opcodes/oscili.xml \
	opcodes/oscilikt.xml	opcodes/osciliktp.xml	opcodes/oscilikts.xml \
	opcodes/osciln.xml	opcodes/oscils.xml	opcodes/oscilx.xml \
	opcodes/out.xml	opcodes/out32.xml	opcodes/outc.xml \
	opcodes/outch.xml	opcodes/outh.xml	opcodes/outiat.xml \
	opcodes/outic.xml	opcodes/outic14.xml	opcodes/outipat.xml \
	opcodes/outipb.xml	opcodes/outipc.xml	opcodes/outkat.xml \
	opcodes/outkc.xml	opcodes/outkc14.xml	opcodes/outkpat.xml \
	opcodes/outkpb.xml	opcodes/outkpc.xml	opcodes/outleta.xml \
	opcodes/outletf.xml	opcodes/outletk.xml	opcodes/outletkid.xml \
	opcodes/outo.xml	opcodes/outq.xml	opcodes/outq1.xml \
	opcodes/outq2.xml	opcodes/outq3.xml	opcodes/outq4.xml \
	opcodes/outrg.xml	opcodes/outs.xml	opcodes/outs1.xml \
	opcodes/outs2.xml	opcodes/outvalue.xml	opcodes/outx.xml \
	opcodes/outz.xml	opcodes/p.xml	opcodes/p5gconnect.xml \
	opcodes/p5gdata.xml	opcodes/pan.xml	opcodes/pan2.xml \
	opcodes/pareq.xml	opcodes/partials.xml	opcodes/partikkel.xml \
	opcodes/partikkelsync.xml	opcodes/passign.xml \
	opcodes/paulstretch.xml	opcodes/pcauchy.xml \
	opcodes/pchbend.xml	opcodes/pchmidi.xml	opcodes/pchmidib.xml \
	opcodes/pchmidinn.xml	opcodes/pchoct.xml	opcodes/pconvolve.xml \
	opcodes/pcount.xml	opcodes/pdclip.xml	opcodes/pdhalf.xml \
	opcodes/pdhalfy.xml	opcodes/peak.xml	opcodes/peakk.xml \
	opcodes/pgmassign.xml	opcodes/phaser1.xml	opcodes/phaser2.xml \
	opcodes/phasor.xml	opcodes/phasorbnk.xml	opcodes/phs.xml \
	opcodes/pindex.xml	opcodes/pinker.xml	opcodes/pinkish.xml \
	opcodes/pitch.xml	opcodes/pitchamdf.xml	opcodes/planet.xml \
	opcodes/platerev.xml	opcodes/plltrack.xml	opcodes/pluck.xml \
	opcodes/plusbecomes.xml	opcodes/poisson.xml	opcodes/pol2rect.xml \
	opcodes/polyaft.xml	opcodes/polynomial.xml	opcodes/pop.xml \
	opcodes/pop_f.xml	opcodes/port.xml	opcodes/portk.xml \
	opcodes/poscil.xml	opcodes/poscil3.xml	opcodes/pow.xml \
	opcodes/powershape.xml	opcodes/powoftwo.xml	opcodes/prealloc.xml \
	opcodes/prepiano.xml	opcodes/print.xml	opcodes/printf.xml \
	opcodes/printk.xml	opcodes/printk2.xml	opcodes/printks.xml \
	opcodes/printks2.xml	opcodes/prints.xml	opcodes/product.xml \
	opcodes/pset.xml	opcodes/ptable.xml	opcodes/ptable3.xml \
	opcodes/ptablei.xml	opcodes/ptablew.xml	opcodes/ptrack.xml \
	opcodes/push.xml	opcodes/push_f.xml	opcodes/puts.xml \
	opcodes/pvadd.xml	opcodes/pvbufread.xml	opcodes/pvcross.xml \
	opcodes/pvinterp.xml	opcodes/pvoc.xml	opcodes/pvread.xml \
	opcodes/pvs2tab.xml	opcodes/pvsadsyn.xml	opcodes/pvsanal.xml \
	opcodes/pvsarp.xml	opcodes/pvsbandp.xml	opcodes/pvsbandr.xml \
	opcodes/pvsbin.xml	opcodes/pvsblur.xml	opcodes/pvsbuffer.xml \
	opcodes/pvsbufread.xml	opcodes/pvsbufread2.xml	opcodes/pvscale.xml \
	opcodes/pvscent.xml	opcodes/pvsceps.xml	opcodes/pvscross.xml \
	opcodes/pvsdemix.xml	opcodes/pvsdiskin.xml	opcodes/pvsdisp.xml \
	opcodes/pvsfilter.xml	opcodes/pvsfread.xml	opcodes/pvsfreeze.xml \
	opcodes/pvsftr.xml	opcodes/pvsftw.xml	opcodes/pvsfwrite.xml \
	opcodes/pvsgain.xml	opcodes/pvshift.xml	opcodes/pvsifd.xml \
	opcodes/pvsin.xml	opcodes/pvsinfo.xml	opcodes/pvsinit.xml \
	opcodes/pvslock.xml	opcodes/pvsmaska.xml	opcodes/pvsmix.xml \
	opcodes/pvsmooth.xml	opcodes/pvsmorph.xml	opcodes/pvsosc.xml \
	opcodes/pvsout.xml	opcodes/pvspitch.xml	opcodes/pvstanal.xml \
	opcodes/pvstencil.xml	opcodes/pvsvoc.xml	opcodes/pvswarp.xml \
	opcodes/pvsynth.xml	opcodes/pwd.xml	opcodes/pyassign.xml \
	opcodes/pycall.xml	opcodes/pyeval.xml	opcodes/pyexec.xml \
	opcodes/pyinit.xml	opcodes/pyrun.xml	opcodes/qinf.xml \
	opcodes/qnan.xml	opcodes/r2c.xml	opcodes/raises.xml \
	opcodes/rand.xml	opcodes/randh.xml	opcodes/randi.xml \
	opcodes/random.xml	opcodes/randomh.xml	opcodes/randomi.xml \
	opcodes/rbjeq.xml	opcodes/readclock.xml	opcodes/readf.xml \
	opcodes/readfi.xml	opcodes/readk.xml	opcodes/readk2.xml \
	opcodes/readk3.xml	opcodes/readk4.xml	opcodes/readscore.xml \
	opcodes/readscratch.xml	opcodes/rect2pol.xml	opcodes/reinit.xml \
	opcodes/release.xml	opcodes/remoteport.xml	opcodes/remove.xml \
	opcodes/repluck.xml	opcodes/reson.xml	opcodes/resonk.xml \
	opcodes/resonr.xml	opcodes/resonx.xml	opcodes/resonxk.xml \
	opcodes/resony.xml	opcodes/resonz.xml	opcodes/resyn.xml \
	opcodes/return.xml	opcodes/reverb.xml	opcodes/reverb2.xml \
	opcodes/reverbsc.xml	opcodes/rewindscore.xml	opcodes/rezzy.xml \
	opcodes/rfft.xml	opcodes/rifft.xml	opcodes/rigoto.xml \
	opcodes/rireturn.xml	opcodes/rms.xml	opcodes/rnd.xml \
	opcodes/rnd31.xml	opcodes/round.xml	opcodes/rspline.xml \
	opcodes/rtclock.xml	opcodes/s16b14.xml	opcodes/s32b14.xml \
	opcodes/samphold.xml	opcodes/sandpaper.xml	opcodes/scale.xml \
	opcodes/scalearray.xml	opcodes/scanhammer.xml	opcodes/scans.xml \
	opcodes/scantable.xml	opcodes/scanu.xml	opcodes/schedkwhen.xml \
	opcodes/schedkwhennamed.xml	opcodes/schedule.xml \
	opcodes/schedwhen.xml	opcodes/scoreline.xml	opcodes/scoreline_i.xml \
	opcodes/seed.xml	opcodes/sekere.xml	opcodes/semitone.xml \
	opcodes/sense.xml	opcodes/sensekey.xml	opcodes/seqtime.xml \
	opcodes/seqtime2.xml	opcodes/serialBegin.xml	opcodes/serialEnd.xml \
	opcodes/serialFlush.xml	opcodes/serialPrint.xml	opcodes/serialRead.xml \
	opcodes/serialWrite.xml	opcodes/serialWrite_i.xml	opcodes/setcol.xml \
	opcodes/setctrl.xml	opcodes/setksmps.xml	opcodes/setrow.xml \
	opcodes/setscorepos.xml	opcodes/sfilist.xml	opcodes/sfinstr.xml \
	opcodes/sfinstr3.xml	opcodes/sfinstr3m.xml	opcodes/sfinstrm.xml \
	opcodes/sfload.xml	opcodes/sflooper.xml	opcodes/sfpassign.xml \
	opcodes/sfplay.xml	opcodes/sfplay3.xml	opcodes/sfplay3m.xml \
	opcodes/sfplaym.xml	opcodes/sfplist.xml	opcodes/sfpreset.xml \
	opcodes/shaker.xml	opcodes/shiftin.xml	opcodes/shiftout.xml \
	opcodes/signum.xml	opcodes/sin.xml	opcodes/sinh.xml \
	opcodes/sininv.xml	opcodes/sinsyn.xml	opcodes/sleighbells.xml \
	opcodes/slicearray.xml	opcodes/slider16.xml	opcodes/slider16f.xml \
	opcodes/slider16table.xml	opcodes/slider16tablef.xml \
	opcodes/slider32.xml	opcodes/slider32f.xml	opcodes/slider32table.xml \
	opcodes/slider32tablef.xml	opcodes/slider64.xml \
	opcodes/slider64f.xml	opcodes/slider64table.xml \
	opcodes/slider64tablef.xml \
	opcodes/slider8.xml	opcodes/slider8f.xml	opcodes/slider8table.xml \
	opcodes/slider8tablef.xml opcodes/sliderkawai.xml opcodes/sndload.xml \
	opcodes/sndloop.xml	opcodes/sndwarp.xml	opcodes/sndwarpst.xml \
	opcodes/sockrecv.xml	opcodes/socksend.xml	opcodes/soundin.xml \
	opcodes/soundout.xml	opcodes/soundouts.xml	opcodes/space.xml \
	opcodes/spat3d.xml	opcodes/spat3di.xml	opcodes/spat3dt.xml \
	opcodes/spdist.xml	opcodes/specaddm.xml	opcodes/specdiff.xml \
	opcodes/specdisp.xml	opcodes/specfilt.xml	opcodes/spechist.xml \
	opcodes/specptrk.xml	opcodes/specscal.xml	opcodes/specsum.xml \
	opcodes/spectrum.xml	opcodes/splitrig.xml	opcodes/sprintf.xml \
	opcodes/sprintfk.xml	opcodes/spsend.xml	opcodes/sqrt.xml \
	opcodes/sr.xml	opcodes/stack.xml	opcodes/statevar.xml \
	opcodes/stix.xml	opcodes/strcat.xml	opcodes/strcatk.xml \
	opcodes/strchar.xml	opcodes/strchark.xml	opcodes/strcmp.xml \
	opcodes/strcmpk.xml	opcodes/strcpy.xml	opcodes/strcpyk.xml \
	opcodes/streson.xml	opcodes/strfromurl.xml	opcodes/strget.xml \
	opcodes/strindex.xml	opcodes/strindexk.xml	opcodes/strlen.xml \
	opcodes/strlenk.xml	opcodes/strlower.xml	opcodes/strlowerk.xml \
	opcodes/strrindex.xml	opcodes/strrindexk.xml	opcodes/strset.xml \
	opcodes/strstrip.xml \
	opcodes/strsub.xml	opcodes/strsubk.xml	opcodes/strtod.xml \
	opcodes/strtodk.xml	opcodes/strtol.xml	opcodes/strtolk.xml \
	opcodes/strupper.xml	opcodes/strupperk.xml	opcodes/subinstr.xml \
	opcodes/subinstrinit.xml	opcodes/subtracts.xml	opcodes/sum.xml \
	opcodes/sumarray.xml	opcodes/svfilter.xml	opcodes/syncgrain.xml \
	opcodes/syncloop.xml	opcodes/syncphasor.xml	opcodes/system.xml \
	opcodes/tab.xml	opcodes/tab2pvs.xml	opcodes/tabifd.xml \
	opcodes/table.xml	opcodes/table3.xml	opcodes/tablecopy.xml \
	opcodes/tablefilter.xml	opcodes/tablefilteri.xml opcodes/tablegpw.xml \
	opcodes/tablei.xml	opcodes/tableicopy.xml	opcodes/tableigpw.xml \
	opcodes/tableikt.xml	opcodes/tableimix.xml	opcodes/tableiw.xml \
	opcodes/tablekt.xml	opcodes/tablemix.xml	opcodes/tableng.xml \
	opcodes/tablera.xml	opcodes/tableseg.xml	opcodes/tableshuffle.xml \
	opcodes/tablew.xml	opcodes/tablewa.xml	opcodes/tablewkt.xml \
	opcodes/tablexkt.xml	opcodes/tablexseg.xml	opcodes/tabmorph.xml \
	opcodes/tabmorpha.xml	opcodes/tabmorphak.xml	opcodes/tabmorphi.xml \
	opcodes/tabplay.xml	opcodes/tabrec.xml	opcodes/tabsum.xml \
	opcodes/tambourine.xml	opcodes/tan.xml	opcodes/tanh.xml \
	opcodes/taninv.xml	opcodes/taninv2.xml	opcodes/tb.xml \
	opcodes/tbvcf.xml	opcodes/tempest.xml	opcodes/template.xml \
	opcodes/tempo.xml	opcodes/temposcal.xml	opcodes/tempoval.xml \
	opcodes/tigoto.xml	opcodes/timedseq.xml	opcodes/timeinstk.xml \
	opcodes/timeinsts.xml	opcodes/timek.xml	opcodes/times.xml \
	opcodes/timout.xml	opcodes/tival.xml	opcodes/tlineto.xml \
	opcodes/tone.xml	opcodes/tonek.xml	opcodes/tonex.xml \
	opcodes/top.xml	opcodes/topXO.xml	opcodes/tradsyn.xml \
	opcodes/trandom.xml	opcodes/transeg.xml	opcodes/transegb.xml \
	opcodes/transegr.xml	opcodes/trcross.xml	opcodes/trfilter.xml \
	opcodes/trhighest.xml	opcodes/trigger.xml	opcodes/trigseq.xml \
	opcodes/trirand.xml	opcodes/trlowest.xml	opcodes/trmix.xml \
	opcodes/trscale.xml	opcodes/trshift.xml	opcodes/trsplit.xml \
	opcodes/turnoff.xml	opcodes/turnoff2.xml	opcodes/turnon.xml \
	opcodes/undef.xml	opcodes/unirand.xml	opcodes/until.xml \
	opcodes/unwrap.xml	opcodes/upsamp.xml	opcodes/urandom.xml \
	opcodes/urd.xml	opcodes/vactrol.xml	opcodes/vadd.xml \
	opcodes/vadd_i.xml	opcodes/vaddv.xml	opcodes/vaddv_i.xml \
	opcodes/vaget.xml	opcodes/valpass.xml	opcodes/vaset.xml \
	opcodes/vbap.xml	opcodes/vbap16.xml	opcodes/vbap16move.xml \
	opcodes/vbap4.xml	opcodes/vbap4move.xml	opcodes/vbap8.xml \
	opcodes/vbap8move.xml	opcodes/vbapg.xml	opcodes/vbapgmove.xml \
	opcodes/vbaplsinit.xml	opcodes/vbapmove.xml	opcodes/vbapz.xml \
	opcodes/vbapzmove.xml	opcodes/vcella.xml	opcodes/vco.xml \
	opcodes/vco2.xml	opcodes/vco2ft.xml	opcodes/vco2ift.xml \
	opcodes/vco2init.xml	opcodes/vcomb.xml	opcodes/vcopy.xml \
	opcodes/vcopy_i.xml	opcodes/vdelay.xml	opcodes/vdelay3.xml \
	opcodes/vdelayk.xml	opcodes/vdelayx.xml	opcodes/vdelayxq.xml \
	opcodes/vdelayxs.xml	opcodes/vdelayxw.xml	opcodes/vdelayxwq.xml \
	opcodes/vdelayxws.xml	opcodes/vdivv.xml	opcodes/vdivv_i.xml \
	opcodes/vecdelay.xml	opcodes/veloc.xml	opcodes/vexp.xml \
	opcodes/vexp_i.xml	opcodes/vexpseg.xml	opcodes/vexpv.xml \
	opcodes/vexpv_i.xml	opcodes/vibes.xml	opcodes/vibr.xml \
	opcodes/vibrato.xml	opcodes/vincr.xml	opcodes/vlimit.xml \
	opcodes/vlinseg.xml	opcodes/vlowres.xml	opcodes/vmap.xml \
	opcodes/vmirror.xml	opcodes/vmult.xml	opcodes/vmult_i.xml \
	opcodes/vmultv.xml	opcodes/vmultv_i.xml	opcodes/voice.xml \
	opcodes/vosim.xml	opcodes/vphaseseg.xml	opcodes/vport.xml \
	opcodes/vpow.xml	opcodes/vpow_i.xml	opcodes/vpowv.xml \
	opcodes/vpowv_i.xml	opcodes/vpvoc.xml	opcodes/vrandh.xml \
	opcodes/vrandi.xml	opcodes/vsubv.xml	opcodes/vsubv_i.xml \
	opcodes/vtaba.xml	opcodes/vtabi.xml	opcodes/vtabk.xml \
	opcodes/vtable1k.xml	opcodes/vtablea.xml	opcodes/vtablei.xml \
	opcodes/vtablek.xml	opcodes/vtablewa.xml	opcodes/vtablewi.xml \
	opcodes/vtablewk.xml	opcodes/vtabwa.xml	opcodes/vtabwi.xml \
	opcodes/vtabwk.xml	opcodes/vwrap.xml	opcodes/waveset.xml \
	opcodes/websocket.xml	opcodes/weibull.xml	opcodes/wgbow.xml \
	opcodes/wgbowedbar.xml	opcodes/wgbrass.xml	opcodes/wgclar.xml \
	opcodes/wgflute.xml	opcodes/wgpluck.xml	opcodes/wgpluck2.xml \
	opcodes/wguide1.xml	opcodes/wguide2.xml	opcodes/while.xml \
	opcodes/wiiconnect.xml	opcodes/wiidata.xml	opcodes/wiirange.xml \
	opcodes/wiisend.xml	opcodes/window.xml	opcodes/wrap.xml \
	opcodes/writescratch.xml	opcodes/wterrain.xml	opcodes/xadsr.xml \
	opcodes/xin.xml	opcodes/xout.xml	opcodes/xscanmap.xml \
	opcodes/xscans.xml	opcodes/xscansmap.xml	opcodes/xscanu.xml \
	opcodes/xtratim.xml	opcodes/xyin.xml	opcodes/zacl.xml \
	opcodes/zakinit.xml	opcodes/zamod.xml	opcodes/zar.xml \
	opcodes/zarg.xml	opcodes/zaw.xml	opcodes/zawm.xml \
	opcodes/zdf_1pole.xml	 opcodes/zdf_2pole.xml	\
	opcodes/zdf_1pole_mode.xml	 opcodes/zdf_2pole_mode.xml	\
	opcodes/zdf_ladder.xml \
	opcodes/zfilter2.xml	opcodes/zir.xml	opcodes/ziw.xml \
	opcodes/ziwm.xml	opcodes/zkcl.xml	opcodes/zkmod.xml \
	opcodes/zkr.xml	opcodes/zkw.xml	opcodes/zkwm.xml

ORCH =	orch/dirfiles.xml orch/express.xml orch/header.xml orch/macros.xml\
	orch/iblock.xml orch/kvar.xml orch/nomen.xml \
	orch/statemnt.xml orch/top.xml orch/kvar.xml \
	orch/namedInstruments.xml orch/tvars.xml orch/UDO.xml

SCORE =	score/eval.xml score/macros.xml score/mult.xml \
	score/nextp.xml score/preproc.xml score/ramp.xml  \
	score/statemnt.xml score/top.xml scoregens/a.xml \
	scoregens/b.xml scoregens/e.xml scoregens/f.xml \
	score/strings.xml \
	scoregens/gen01.xml scoregens/gen02.xml scoregens/gen03.xml \
	scoregens/gen04.xml scoregens/gen05.xml scoregens/gen06.xml \
	scoregens/gen07.xml scoregens/gen08.xml scoregens/gen09.xml \
	scoregens/gen10.xml scoregens/gen11.xml scoregens/gen12.xml \
	scoregens/gen13.xml scoregens/gen14.xml scoregens/gen15.xml \
	scoregens/gen16.xml scoregens/gen17.xml scoregens/gen18.xml \
	scoregens/gen19.xml scoregens/gen20.xml scoregens/gen21.xml \
	scoregens/gen22.xml scoregens/gen23.xml scoregens/gen24.xml \
	scoregens/gen25.xml scoregens/gen27.xml scoregens/gen28.xml \
	scoregens/gen30.xml scoregens/gen31.xml scoregens/gen32.xml \
	scoregens/gen33.xml scoregens/gen34.xml scoregens/gen40.xml \
	scoregens/gen41.xml scoregens/gen42.xml scoregens/gen43.xml \
	scoregens/gen49.xml scoregens/gen51.xml scoregens/gen52.xml \
	scoregens/genexp.xml scoregens/genfarey.xml scoregens/genpadsynth.xml \
	scoregens/gensone.xml scoregens/gentanh.xml scoregens/genwave.xml \
	scoregens/i.xml \
	scoregens/m.xml scoregens/n.xml scoregens/q.xml \
	scoregens/r.xml scoregens/s.xml scoregens/t.xml \
	scoregens/top.xml scoregens/v.xml scoregens/x.xml \
	scoregens/leftbrace.xml scoregens/rightbrace.xml scoregens/y.xml

OPCODES5 = csound5/acknowledgments.xml	csound5/cs5opcodes.xml \
	csound5/extending.xml \
	csound5/opcodes/fluid.xml csound5/opcodes/Jacko.xml \
	csound5/opcodes/mixer.xml \
	csound5/opcodes/py.xml csound5/opcodes/signalflowgraph.xml \
	csound5/opcodes/top.xml csound5/preface.xml csound5/usersguide.xml \

SIGS = 	siggen/additive.xml siggen/basic.xml siggen/dynamic.xml \
	siggen/fmsynth.xml siggen/granular.xml siggen/lineexp.xml \
	siggen/models.xml siggen/phasors.xml \
	siggen/random.xml siggen/sample.xml siggen/scantop.xml \
	siggen/tableacc.xml siggen/top.xml \
	siggen/waveterr.xml siggen/wavguide.xml sigio/fileio.xml \
	sigio/input.xml sigio/output.xml sigio/pdisplay.xml \
	sigio/queries.xml sigio/top.xml sigmod/ampmod.xml \
	sigmod/conmorph.xml sigmod/delayops.xml \
	sigmod/panspatl.xml sigmod/reverbtn.xml sigmod/sample.xml \
	sigmod/siglimit.xml sigmod/speciale.xml sigmod/speciali.xml \
	sigmod/standard.xml sigmod/top.xml sigmod/wavguide.xml

UTILS = utility/analysis.xml utility/convert.xml utility/cvanal.xml \
	utility/dnoise.xml utility/hetro.xml utility/lpanal.xml \
	utility/pvanal.xml utility/pvlook.xml utility/queries.xml \
	utility/sdif2ad.xml utility/sndinfo.xml utility/srconv.xml \
	utility/top.xml utility/scale.xml utility/makecsd.xml \
	utility/cs.xml utility/mixer.xml utility/extractor.xml \
	utility/atsa.xml utility/csb64enc.xml utility/envext.xml\
	utility/het_export.xml utility/het_import.xml \
	utility/other.xml utility/pv_export.xml	utility/pv_import.xml \
	utility/src_conv.xml

OTHER =         STKopcodes/top.xml \
        control/stacks.xml \
        miscopcodes/top.xml \
        oscnetwork/Network.xml \
        oscnetwork/OSC.xml \
        oscnetwork/Remote.xml \
        oscnetwork/top.xml \
        overview/building.xml \
        overview/configuring.xml \
        overview/design.xml \
        overview/frontends.xml \
        overview/functional.xml \
        overview/introduction.xml \
        overview/links.xml \
        overview/optimizinglatency.xml \
        overview/realtimemac.xml \
        overview/realtimewindows.xml \
        overview/recentdev.xml \
        overview/using.xml \
        overview/usingXO.xml \
        overview/realtimelinux.xml \
        plugin/dssi4cs.xml \
        plugin/top.xml \
        preface/gettingstarted.xml \
        preface/gettingstartedXO.xml \
        preface/history.xml \
        preface/whatsnew.xml \
        siggen/additive.xml \
        siggen/basic.xml \
        siggen/dynamic.xml \
        siggen/fmsynth.xml \
        siggen/granular.xml \
        siggen/hvs.xml \
        siggen/lineexp.xml \
        siggen/models.xml \
        siggen/phasors.xml \
        siggen/random.xml \
        siggen/sample.xml \
        siggen/scantop.xml \
        siggen/tableacc.xml \
        siggen/top.xml \
        siggen/waveterr.xml \
        siggen/wavguide.xml \
        siggen/envelope.xml \
        sigio/fileio.xml \
        sigio/input.xml \
        sigio/output.xml \
        sigio/pdisplay.xml \
        sigio/queries.xml \
        sigio/softbus.xml \
        sigio/top.xml \
        sigmod/ampmod.xml \
        sigmod/compaccum.xml \
        sigmod/conmorph.xml \
        sigmod/delayops.xml \
        sigmod/panspatl.xml \
        sigmod/panspatlXO.xml \
        sigmod/reverbtn.xml \
        sigmod/sample.xml \
        sigmod/siglimit.xml \
        sigmod/speciale.xml \
        sigmod/speciali.xml \
        sigmod/top.xml \
        sigmod/wavguide.xml \
        sigmod/wavshape.xml \
        sigmod/standard.xml \
        spectral/ATS.xml \
        spectral/arrays.xml \
        spectral/lpcresyn.xml \
        spectral/stft.xml \
        spectral/top.xml \
        strings/convert.xml \
        strings/manipulate.xml \
        strings/top.xml \
        vectorial/delay.xml \
        vectorial/envelopeGenerators.xml \
        vectorial/limiting.xml \
        vectorial/scalar.xml \
        vectorial/tables.xml \
        vectorial/top.xml \
        vectorial/vectorial.xml \
        vectorial/vectorialrandom.xml \
        opcodes.xml \
        manual.xml

SRCS =  $(COMMAND) $(CONTROL) $(XMLS) $(MIDI) $(OPCODES) $(ORCH) $(SCORE) \
	$(SIGS) $(UTILS) $(MISC) $(OTHER) examples-xml/stamp

# Build rules.
all: html

$(XSL_HTML) $(XSL_HTMLHELP) $(XSL_PRINT) $(XSL_HTML_ONECHUNK): %: %.in
	[ -d "$(XSL_BASE_PATH)" ] || (  \
	 echo "The XSL_BASE_PATH variable must be set to the XSL stylesheets installation directory" ; \
	 false )
	sed -e 's|@xsl_base_path@|$(XSL_BASE_PATH)|' $@.in > $@

examples-xml/stamp: examples $(wildcard examples/*)
	mkdir -p examples-xml
	python csd2docbook.py
	touch examples-xml/stamp

html: $(XSL_HTML) manual.xml $(SRCS) Makefile
	rm -rf html
	echo "Remember to use the html-dist target for distribution!"
	-mkdir -p ${HTML_DIR}
	xsltproc  --xinclude -o ${HTML_DIR}/ ${XSL_HTML} manual.xml
	cp -R images ${HTML_DIR}/
	cp -R examples ${HTML_DIR}/
	cp copying.txt ${HTML_DIR}/
	cp csound.css ${HTML_DIR}/
	cp syntax-highlighting.css ${HTML_DIR}/
	rm -rf ${HTML_DIR}/images/CVS
	rm -rf ${HTML_DIR}/images/callouts/CVS
	rm -rf ${HTML_DIR}/examples/CVS
	echo "Remember to use the html-dist target for distribution!"

html-dist:
	python quickref.py
	$(MAKE) html
	#python makeframes.py

html-bw: $(XSL_HTML) manual.xml $(SRCS) Makefile
	-mkdir -p ${HTML_DIR}
	xsltproc  --xinclude -o ${HTML_DIR}/ ${XSL_HTML} manual.xml
	cp -R images ${HTML_DIR}/
	cp -R examples ${HTML_DIR}/
	cp copying.txt ${HTML_DIR}/
	cp csound-bw.css ${HTML_DIR}/
	cp syntax-highlighting.css ${HTML_DIR}/
	rm -rf ${HTML_DIR}/images/CVS
	rm -rf ${HTML_DIR}/images/callouts/CVS
	rm -rf ${HTML_DIR}/examples/CVS

html-onechunk: $(XSL_HTML_ONECHUNK) manual.xml $(SRCS) Makefile
	-mkdir -p ${HTML_ONE_DIR}
	xsltproc  --xinclude -o ${HTML_ONE_DIR}/ ${XSL_HTML_ONECHUNK} manual.xml
	cp -R images ${HTML_ONE_DIR}/
	cp -R examples ${HTML_ONE_DIR}/
	cp copying.txt ${HTML_ONE_DIR}/
	cp csound.css ${HTML_ONE_DIR}/
	cp syntax-highlighting.css ${HTML_ONE_DIR}/
	rm -rf ${HTML_ONE_DIR}/images/CVS
	rm -rf ${HTML_ONE_DIR}/images/callouts/CVS
	rm -rf ${HTML_ONE_DIR}/examples/CVS

pdf: $(XSL_PRINT) manual.xml $(SRCS) Makefile
	xsltproc  --xinclude -o $(BASENAME)$(VERSION)_manual.fo ${XSL_PRINT} manual.xml
	fop -fo $(BASENAME)$(VERSION)_manual.fo -pdf $(BASENAME)$(VERSION)_manual.pdf
	rm $(BASENAME)$(VERSION)_manual.fo

pdfA4: $(XSL_PRINT) manual.xml $(SRCS) Makefile
	xsltproc --stringparam paper.type A4  --xinclude \
		-o $(BASENAME)$(VERSION)_manual_A4.fo ${XSL_PRINT} manual.xml
	fop -fo $(BASENAME)$(VERSION)_manual_A4.fo -pdf $(BASENAME)$(VERSION)_manual_A4.pdf
	rm $(BASENAME)$(VERSION)_manual_A4.fo

htmlhelp: ${XSL_HTMLHELP} manual.xml $(SRCS)
	-mkdir -p ${HTMLHELP_DIR}
	xsltproc  --xinclude -o ${HTMLHELP_DIR}/ ${XSL_HTMLHELP} manual.xml
	cp images -R ${HTMLHELP_DIR}/
	cp examples -R ${HTMLHELP_DIR}/
	cp csound.css ${HTMLHELP_DIR}/
	cp syntax-highlighting.css ${HTMLHELP_DIR}/
	rm -rf ${HTMLHELP_DIR}/images/CVS
	rm -rf ${HTMLHELP_DIR}/images/callouts/CVS
	rm -rf ${HTMLHELP_DIR}/examples/CVS
	hhc.exe ${HTMLHELP_DIR}/htmlhelp.hhp
	mv ${HTMLHELP_DIR}/htmlhelp.chm csound_manual.chm

manpages: $(XSL_MANPAGES) manual.xml $(SRCS) Makefile
	-mkdir -p ${MANPAGES_DIR}
	xsltproc  --xinclude -o ${MANPAGES_DIR}/ ${XSL_MANPAGES} manpages.xml

html-clean:
	rm -rf examples-xml
	rm -rf html
	rm -f examples/*.csd~

pdf-clean:
	rm -rf examples-xml
	rm -f *.pdf *.fo

htmlhelp-clean:
	rm -rf examples-xml
	rm -rf *.chm
	rm -rf htmlhelp

manpages-clean:
	rm -rf examples-xml
	rm -rf manpages

clean: html-clean pdf-clean htmlhelp-clean manpages-clean
	rm -f $(XSL_HTML) $(XSL_HTML_ONECHUNK) $(XSL_PRINT) $(XSL_HTMLHELP)

distclean: clean
	rm -f *.gz
	rm -f *.zip

distall: all

# TEST VALIDITY OF XML
test-xml:
	xmllint --valid --xinclude --dtdattr --noent manual.xml

html-package: html-dist
	#tar -czf $(BASENAME)-html-$(VERSION).tar.gz csound-$(VERSION)/manual
	zip -r /tmp/$(BASENAME)$(VERSION)_manual_html.zip html
	mv /tmp/$(BASENAME)$(VERSION)_manual_html.zip ./

html-onechunk-package:
	#tar -czf $(BASENAME)-html-$(VERSION).tar.gz csound-$(VERSION)/manual
	zip -r /tmp/$(BASENAME)$(VERSION)_manual_html_single.zip singleHTML
	mv /tmp/$(BASENAME)$(VERSION)_manual_html_single.zip ./

pdf-package:
	#tar -czf $(BASENAME)-html-$(VERSION).tar.gz csound-$(VERSION)/manual
	zip -r /tmp/$(BASENAME)$(VERSION)_manual_pdf.zip $(BASENAME)$(VERSION)_manual.pdf
	mv /tmp/$(BASENAME)$(VERSION)_manual_pdf.zip ./

pdfA4-package:
	#tar -czf $(BASENAME)-html-$(VERSION).tar.gz csound-$(VERSION)/manual
	zip -r /tmp/$(BASENAME)$(VERSION)_manual_A4_pdf.zip $(BASENAME)$(VERSION)_manual_A4.pdf
	mv /tmp/$(BASENAME)$(VERSION)_manual_A4_pdf.zip ./

htmlhelp-package:
	zip -r /tmp/$(BASENAME)$(VERSION)_manual_winhelp_chm.zip csound_manual.chm
	mv /tmp/$(BASENAME)$(VERSION)_manual_winhelp_chm.zip ./

src-package:
	git clone git://git.code.sf.net/p/csound/manual6-git manual6
	tar -czf manual_src.tgz manual6/

text-package: clean $(TEXT_FILE)
	mkdir -p /tmp/csound-$(VERSION)/manual
	cp $(TEXT_FILE) /tmp/csound-$(VERSION)/manual
	cp *.txt /tmp/csound-$(VERSION)/manual
	cp -a ./examples /tmp/csound-$(VERSION)/manual
	tar -C /tmp -czf /tmp/$(BASENAME)-text-$(VERSION).tar.gz csound-$(VERSION)/manual
	mv /tmp/$(BASENAME)-text-$(VERSION).tar.gz .

docbook-package: clean
	mkdir -p /tmp/csound-$(VERSION)/manual
	cp -a . /tmp/csound-$(VERSION)/manual
	tar -C /tmp -czf /tmp/$(BASENAME)-docbook-$(VERSION).tar.gz csound-$(VERSION)/manual
	mv /tmp/$(BASENAME)-docbook-$(VERSION).tar.gz .

docbook-floppy: clean
	mkdir -p /tmp/csound-$(VERSION)/manual
	cp -a . /tmp/csound-$(VERSION)/manual
	tar -C /tmp -cf /tmp/$(BASENAME)-docbook-$(VERSION).tar csound-$(VERSION)/manual
	bzip2 -9 /tmp/$(BASENAME)-docbook-$(VERSION).tar
	mount /mnt/floppy
	mv /tmp/$(BASENAME)-docbook-$(VERSION).tar.bz2 /mnt/floppy
	umount /mnt/floppy

dist: clean html-dist html-package html-onechunk html-onechunk-package pdf pdf-package pdfA4 pdfA4-package

.PHONY: $(XSL_HTML) $(XSL_HTML_ONECHUNK) $(XSL_PRINT) $(XSL_HTMLHELP)
