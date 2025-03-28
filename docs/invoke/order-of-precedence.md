# Order of precedence

 There are five places where options for Csound performance may be set. They are processed in the following order:

1. Csound's own defaults  
2. File defined by the `CSOUND7RC` environment variable, or `.csound7rc` file in the HOME directory  
3. A `.csound7rc` file in the current directory  
4. The `<CsOptions>` tag in a `.csd` file  
5. Passed on the Csound command line

The later options in the list will override any earlier ones. As of version 5.01 of Csound, sample and control rate override flags (-r and -k) specified anywhere override sr, kr, and ksmps defined in the orchestra header.
