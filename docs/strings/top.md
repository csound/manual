# **Strings**

String variables are variables with a name starting with S or gS (for a local or global string variable, respectively). These variables can be used as input argument to any opcode that expects a quoted string constant, and can be manipulated at initialization or performance time with the opcodes listed below.

It is also possible to use string p-fields. The string p-field can be used by many orchestra opcodes directly, or it can be copied to a string variable first:

``` csound-orc
a1    diskin2 p5, 1
```

``` csound-orc
Sname strget  p5
a1    diskin2 Sname, 1
```

Strings within Csound can be expressed using traditional double quotes ("  "), and also using {{ }}. The second method is useful to allow ';' and '$' characters within the string without having to used ASCII codes.

> :memo: **Note**
>
>String variables and related opcodes are not available in Csound versions older than 5.00.

Strings can also be linked to a number using [strset](../opcodes/strset.md) and [strget](../opcodes/strget.md).

Csound 5 also has improvements in parsing string constants. It is possible to specify a multi-line string by enclosing it within {{ and }} instead of the usual double quote characters, and the following escape sequences are automatically converted:

* `\a` alert bell
* `\b` backspace
* `\n` new line
* `\r` carriage return
* `\t` tab
* `\\` a single '\' character
* `\nnn` the character of which the ASCII code (in octal) is nnn

> :memo: **Note**
>
> If the user does not want an escaped sequence to be automatically converted, she has to escape it with an additional '\' character so that Csound knows it does not have to interpret the escaped sequence. For example the string `"Not escaped\nline return"` will be converted to
    ```
        "Not escaped
         line return"
    ```
>
> before being used, while the string `"Escaped\\nline return"` will be converted to
    ```
        "Escaped\nline return"
    ```
> before being used.
    
It can be useful together with the [system](../opcodes/system.md) opcode:

``` csound-orc
instr 1
 ; csound5 lets you make a string with line returns inside double brackets
    system {{     ps
            date
            cd ~/Desktop
            pwd
            ls -l
            whois csounds.com
        }}
endin
```

And the *python opcodes* (in py from the plugins repository), among others:

``` csound-orc
pyruni {{
import random

pool = [(1 + i/10.0) ** 1.2 for i in range(100)]

def get_number_from_pool(n, p):
    if random.random() < p:
        i = int(random.random() * len(pool))
        pool[i] = n
    return random.choice(pool)
}}
```
