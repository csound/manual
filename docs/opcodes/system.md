<!--
id:system
category:Miscellaneous
-->
# system
Call an external program via the system call.

Plugin opcode in system_call.

_system_ and _system_i_ call any external command understood by the operating system, similarly to the C function `system()`. _system_i_ runs at i-time only, while _system_ runs both at initialization and performance time.

## Syntax
=== "Modern"
    ``` csound-orc
    ires = system_i(itrig, Scmd, [inowait])
    kres = system(ktrig, Scmd, [knowait])
    ```

=== "Classic"
    ``` csound-orc
    ires system_i itrig, Scmd, [inowait]
    kres system ktrig, Scmd, [knowait]
    ```

### Initialization

_Scmd_ -- command string

_itrig_ -- if greater than zero the opcode executes the command; otherwise it is an null operation.

### Performance

_ktrig_ -- if greater than zero and different from the value on the previous control cycle the opcode executes the command.  Initially this previous value is taken as zero.

_inowait,knowait_ -- if given an non zero the command is run in the background and the command does not wait for the result. (default = 0)

_ires, kres_ -- the return code of the command in wait mode and if the command is run.In other cases returns zero.

More than one system command (a script) can be executed with a single _system_ opcode by using double braces strings {{ }}.

> :memo: **Note**
>
> This opcode is very system dependant, so should be used with extreme care (or not used) if platform neutrality is desired.

## Examples

Here is an example of the system_i opcode. It uses the file [system.csd](../examples/system.csd).

``` csound-csd title="Example of the system opcode." linenums="1"
--8<-- "examples/system.csd"
```

## See also

[Miscellaneous opcodes](../miscopcodes.md)

## Credits

Author: John ffitch<br>
2007<br>

New in version 5.06
