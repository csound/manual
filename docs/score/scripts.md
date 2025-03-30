# Scripts

### Extension of the Score Language: `bin=“…”`
The score can be first interpretted by a binary (application), which produces a usual csound score as a result. This is done by the attribute `bin="..."` in the `<CsScore>` tag.

* If just a binary is specified, this binary is called and two files are passed to it:
    1. A copy of the user written score. This file has the suffix .ext
    2. An empty file which will be read after the interpretation by Csound. This file has the usual score suffix .sco
* If a binary and a script is specified, the binary calls the script and passes the two files to the script.

If you have Python installed on your computer, you should be able to run the following examples. They do actually nothing but print the arguments (= file names).

``` csound-csd title="Calling a binary without a script" linenums="1"
<CsoundSynthesizer>
<CsInstruments>
instr 1
endin
</CsInstruments>
<CsScore bin="python3">
from sys import argv
print("File to read = '%s'" % argv[0])
print("File to write = '%s'" % argv[1])
</CsScore>
</CsoundSynthesizer>
```

When you execute this .csd file in the terminal, your output should include something like this:

```
File to read = '/tmp/csound-idWDwO.ext'
File to write = '/tmp/csound-EdvgYC.sco'
```

And there should be a complaint because the empty .sco file has not been written:

```
cannot open scorefile /tmp/csound-EdvgYC.sco
```

To test calling a binary and a script, first save this file as print.py in the same folder where your .csd examples are:

``` python
from sys import argv
print("Script = '%s'" % argv[0])
print("File to read = '%s'" % argv[1])
print("File to write = '%s'" % argv[2])
```

Then run this csd:

``` csound-csd linenums="1"
<CsoundSynthesizer>
<CsInstruments>
instr 1
endin
</CsInstruments>
<CsScore bin="python3 print.py">
</CsScore>
</CsoundSynthesizer>
```

The output should include these lines:

```
Script = 'print.py'
File to read = '/tmp/csound-jwZ9Uy.ext'
File to write = '/tmp/csound-NbMTfJ.sco'
```

And again a complaint about the invalid score file:

```
cannot open scorefile /tmp/csound-NbMTfJ.sco
```

As an alternative to the classical Csound score, [CsBeats](../../csbeats) is included with Csound. This is a domain specific language tailored to the concepts of beats, rhythm and standard western notation. To use *Csbeat*, specify “csbeats” as the CsScore bin option in a Csound unified score file.

``` csound-csd
<CsScore bin="csbeats">
```

