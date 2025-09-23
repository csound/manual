<!--
id:UtilityAtsa
category:Utilities
-->
# atsa
ATS analysis on a soundfile for use with the Csound [ATS Resynthesis](../spectral/ATS.md) opcodes.

## Syntax
```
csound -U atsa [flags] infilename outfilename
```

### Initialization

The following flags can be set for atsa (The default values are stated in parenthesis):

-b start (0.000000 seconds)<br>
-e duration (0.000000 seconds or end)<br>
-l lowest frequency (20.000000 Hertz)<br>
-H highest frequency (20000.000000 Hertz)<br>
-d frequency deviation (0.100000 of partial freq.)<br>
-c window cycles (4 cycles)<br>
-w window type (type: 1) (Options: 0=BLACKMAN, 1=BLACKMAN_H, 2=HAMMING, 3=VONHANN)<br>
-h hop size (0.250000 of window size)<br>
-m lowest magnitude (-60.000000)<br>
-t track length (3 frames)<br>
-s min. segment length (3 frames)<br>
-g min. gap length (3 frames)<br>
-T SMR threshold (30.000000 dB SPL)<br>
-S min. segment SMR (60.000000 dB SPL)<br>
-P last peak contribution (0.000000 of last peak's parameters)<br>
-M SMR contribution (0.500000)<br>
-F File Type (type: 4) (Options: 1=amp.and freq. only, 2=amp.,freq. and phase, 3=amp., req. and residual, 4=amp.,freq.,phase, and residual)<br>

### Parameters

ATS analysis was devised by Juan Pampin. For complete information on ATS visit: [https://ccrma.stanford.edu/~juan/ATS_manual.html](https://ccrma.stanford.edu/~juan/ATS_manual.html)



1. Start (secs.): the starting time of the analysis in seconds.

2. Duration (secs.): the duration time of the analysis in seconds. A zero means the whole duration of the input sound file.

3. Lowest Frequency (Hz.): this parameter will partially determine the size of the Analysis Window to be used. To compute the size of the Analysis Window, the period of the Lowest Frequency in samples (SR / LF) is multiplied by the number of cycles of it the user wants to fit in the Analysis Window (see parameter 6). This value is rounded to the next power of two to determine the size of the FFT for the analysis. The remaining samples are zero-padded. If the signal is a single, harmonic sound, then the value of the Lowest Frequency should be its fundamental frequency or a sub-harmonic of it. If it is not harmonic, then its lowest significant frequency component may be a good starting value.

4. Highest Frequency (Hz.): highest frequency to be taken into account for Peak Detection. Once it is determined that no relevant information is found beyond a certain frequency, the analysis may be faster and more accurate setting the Highest Frequency parameter to that value.

5. Frequency Deviation (Ratio): frequency deviation allowed for each peak in the Peak Continuation Algorithm, as a ratio of the frequency involved. For instance, considering a peak at 440 Hz and a Deviation of .1 will produce that the Peak Continuation Algorithm will only try to find candidates for its continuation between 396 and 484 Hz (10% above and below the frequency of the peak). A small value is likely to produce more trajectories whilst a large value will reduce them, but at the cost of rendering information difficult to be further processed.

6. Number of Cycles of Lowest Frequency to fit in Analysis Window: this will also partially determine the size of the Fourier Analysis Window to be used. See Parameter 3. For single harmonic signals, it is supposed to be more than one (typically 4).

7. Hop Size (Ratio): size of the gap between one Analysis Window and the next expressed as a ratio of the Window Size. For instance, a Hop Size value of .25 will "jump" by 512 samples (Windows will overlap for a 75% of their size). This parameter will also determine the size of the analysis frames obtained. Signals that change their spectra very fast (such as Speech sounds) may need a high frame rate in order to properly track their changes.

8. Amplitude Threshold (dB): the highest amplitude value to be taken into account for Peak Detection.

9. Window Type: the shape of the smoothing function to be used for the Fourier Analysis. There are four choices available at present: Blackman, Blackman-Harris, Von Hann, and Hanning. Precise specifications about them are easily found on D.S.P. bibliography.

10. Track Length (Frames): The Peak Continuation Algorithm will "look-back" by Length frames in order to do its job better, preventing frequency trajectories from curving too much and loosing stability. However, a large value for this parameter will slow down the analysis significantly.

11. Minimal Segment Length (Frames): once the analysis is done, the spectral data can be further "cleaned" up during post-processing. Trajectories shorter than this value are suppressed if their average SMR is below Minimal Segment SMR (see parameters 16 and 14). This might help to avoid non-relevant sudden changes while keeping a high frame rate, reducing also the number of intermittent sinusoids during synthesis.

12. Minimal Gap Length (Frames): as parameter 11, this one is also used to clean up the data during post-processing. In this case, gaps (zero amplitude values, i.e. theoretical "silence") longer than Length frames are filled up with amplitude/frequency values obtained by linear interpolation of the adjacent active frames. This parameter prevents sudden interruptions of stable trajectories while keeping a high frame rate.

13. SMR Threshold (dB SPL): also a post-processing parameter, the SMR Threshold is used to eliminate partials with low averages.

14. Minimal Segment SMR (dB SPL): this parameter is used in combination with parameter 11. Short segments with SMR average below this value will be removed during post-processing.

15. Last Peak Contribution (0 to 1): as explained in Parameter 10, the Peak Continuation Algorithm "looks-back" several number of frames to do its job better. This parameter will help to weight the contribution of the first precedent peak over the others. A zero value means that all precedent peaks (to the size of Parameter 10) are equally taken in account.

16. SMR Contribution (0 to 1): In addition to the proximity in frequency of the peaks, the ATS Peak Continuation Algorithm may use psycho-acoustic information (the Signal-to-Mask-Ratio, or SMR) to improve the perceptual results. This parameter indicates how much the SMR information is used during tracking. For instance, a value of .5 makes the Peak Continuation Algorithm to use a 50% of SMR information and a 50% of Frequency Proximity information to decide which is the best candidate to continue a sinusoidal track.

> :memo: **Note**
>
> The soundfile file to analyze must be mono. Otherwise atsa will not work.

## Examples

The following command:

```
atsa -b0.1 -e1 -l100 -H10000 -w2 audiofile.wav audiofile.ats
```

Generates the ATS analysis file 'audiofile.ats' from the original 'audiofile.wav' file. It begins analysis from second 0.1 of the file and the analysis is performed for 1 second thereafter. The lowest frequency stored is 100 Hz and the highest is 10kHz. A Hamming window is used for each analysis frame.

=== "Modern"
    Here is an example of the atsa utility. It uses the file [atsa-modern.csd](../examples/atsa-modern.csd).
    ``` csound-csd title="Example of the atsa utility." linenums="1"
    --8<-- "examples/atsa-modern.csd"
    ```

=== "Classic"
    Here is an example of the atsa utility. It uses the file [atsa.csd](../examples/atsa.csd).
    ``` csound-csd title="Example of the atsa utility." linenums="1"
    --8<-- "examples/atsa.csd"
    ```
