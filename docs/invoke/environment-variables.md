# Environment variables

 The following environment variables are available:

- SFDIR: Default directory for rendered sound files. Used if no full path is given for output sound files.  
- SSDIR: Default directory for input (source) audio and MIDI files. Used if no full path is given for sound files. May be used in conjunction with SFDIR to set separate input and output directories. Please note that MIDI files as well as audio files are also sought inside SSDIR.  
- SADIR: Default directory for analysis files. Used if no full path is given for analysis files.  
- SFOUTYP: Sets the default output file type. Currently only 'WAV', 'AIFF' and 'IRCAM' are valid. This flag is checked by the csound executable and the utilities and is used if no file output type is specified.  
- INCDIR: Include directory. Specifies the location of files used by #include statements.  
- OPCODE7DIR: Defines the location of csound opcode plugins for the single precision float (32-bit) version.  
- OPCODE7DIR64: Defines the location of csound opcode plugins for the double precision float (64-bit) version.  
- SNAPDIR: Is used by the FLTK widget opcodes when loading and saving snapshots (deprecated).  
- CSOUND7RC: Defines the csound resource (or configuration) file. A full path and filename containing csound flags must be specified. This variable defaults to .csound7rc if not present.  
- CSSTRNGS: In Csound 5.00 and later versions, the localisation of messages is controlled by two environment variables CSSTRNGS and CS_LANG, both of which are optional. CSSTRNGS points to a directory containing .xmg files.  
- CS_LANG: Selects a language for csound messages.  
- RAWWAVE_PATH: Is used by the STK opcodes to find the raw wave files. Only relevant if you are using STK wrapper opcodes like STKBowed or STKBrass.  
- CSNOSTOP: If this environment variable is set to "yes", then any graph displays are closed automatically at the end of performance (meaning that you possibly will not see much of them in the case of a short non-realtime render). Otherwise, you need to click "Quit" in the FLTK display window to exit, allowing for viewing the graphs even after the end of score is reached.  
- MFDIR: Default directory for MIDI files. Used if no full path is given for MIDI files. Please note that MIDI files are sought in SSDIR and SFDIR as well.  
- CS_OMIT_LIBS: Allows defining a list of plugin libraries that should be skipped. Libraries can be separated with commas, and don't require the "lib" prefix.

The only mandatory environment variables are OPCODE7DIR and OPCODE7DIR64. It is very important to set them correctly, otherwise most of the opcodes will not be available. Make sure you set the path correctly depending on the precision of your binary. (Nowadays it will almost always be 64 bit, so OPCODE7DIR64.)

Other environment variables which are not exclusive to Csound but which might be of importance are:

- PATH: The directory containing csound executables should be listed in this variable.  
- LADSPA_PATH and DSSI_PATH: These environment variables are required if you are using the dssi4cs (LADSPA and DSSI host) plug-in opcodes.  
- CSDOCDIR: Specifies the directory where the html help files are located. Though not used by Csound directly, this environment variable can help front-ends and editors (which implement it) to find the csound manual.

Environment variables can be set as options by using the command line flag `--env:NAME=VALUE` or `--env:NAME+=VALUE`, where NAME is the environment variable name, and VALUE is its value. They can also be set in the configuration file *.csound7rc*.

Note that this method of setting environment variables will not work for variables which are parsed before the command line arguments. SADIR, SSDIR, SFDIR, INCDIR, SNAPDIR, RAWWAVE_PATH, CSNOSTOP, SFOUTYP should work, but the following environment variables must be set on the system prior to running csound: OPCODE7DIR, OPCODE7DIR64, CSSTRINGS, and CS_LANG.
