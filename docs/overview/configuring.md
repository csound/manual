# Configuring

Once you have either unpacked a binary distribution, or built Csound from sources, you will need to configure Csound so that it will run properly on your system. Installers usually perform these steps for you automatically.

On all platforms, make sure the directory or directories containing Csound's plugin libraries are in an `OPCODE7DIR` or `OPCODE7DIR64` environment variable depending on the precision of the compiled binary.

The Python opcodes currently require Python 3.x, which can be downloaded from [www.python.org](http://www.python.org) if it is not already on your system. You can check if it is available by typing 'python' on a command prompt or DOS window.

### Windows

On Windows, make sure the directory or directories (normally the `C:\Program Files\Csound` directory) containing the Csound executables directory are in your `PATH` variable, or else copy all the executable files to your Windows system32 directory. Depending on your installation method, you might also need to set the `OPCODE7DIR` and `OPCODE7DIR64` environment variables. Assuming that Csound is installed to the default location of `C:\Program Files\Csound` you can use (otherwise set the paths accordingly):

```
set OPCODE7DIR=C:\Program Files\Csound\plugins
set OPCODE7DIR64=C:\Program Files\Csound\plugins64
set PATH=%PATH%;C:\Program Files\Csound\bin
```

### Unix and Linux

On Unix and Linux, either install the Csound program in one of the system bin directories, typically `/usr/local/bin`, and the Csound and plugin shared libraries in places like `/usr/local/lib/csound/plugins` or `/usr/local/lib/csound/plugins64` and make sure that `OPCODE7DIR` and `OPCODE7DIR64` environment variable are set correctly. 