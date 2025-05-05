<!--
id:getcfg
category:Instrument Control:Sensing and Control
-->
# getcfg
Return various configuration settings in Svalue as a string at init time.

## Syntax
=== "Modern"
    ``` csound-orc
    Svalue = getcfg(iopt)
    ```

=== "Classic"
    ``` csound-orc
    Svalue getcfg iopt
    ```

### Initialization

_iopt_
-- The parameter to be returned, can be one of:

*  1: the maximum length of string variables in characters; this is at least the value of the -+max_str_len command line option - 1.

> :memo: **Note**

> In Csound6 there is no maximum string length so the returned value is meaningless

*  2: the input sound file name (-i), or empty if there is no input file
*  3: the output sound file name (-o), or empty if there is no output file
*  4: return "1" if real time audio input or output is being used, and "0" otherwise
*  5: return "1" if running in beat mode (-t command line option), and "0" otherwise
*  6: the host operating system name
*  7: return "1" if a callback function for the chnrecv and chnsend opcodes has been set, and "0" otherwise (which means these opcodes do nothing)

## Examples

Here is an example of the getcfg opcode. It uses the file [getcfg.csd](../examples/getcfg.csd).

``` csound-csd title="Example of the getcfg opcode." linenums="1"
--8<-- "examples/getcfg.csd"
```

The output should include lines like these:

```
------------------------------
Max string len : 255
Input file name (-i) : adc
Output file name (-o) : dac
RTaudio (-odac) : 1
Beat mode (-t)? : 0
Host Op. Sys. : Linux
Callback ? : 0
------------------------------
```

## See also

[Sensing and Control: System](../control/sensing.md)

## Credits

Author: Istvan Varga<br>
2006<br>

New in version 5.02
