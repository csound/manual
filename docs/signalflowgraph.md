# **Signal Flow Graph Opcodes**

These opcodes enable the use of signal flow graphs (AKA asynchronous data flow graphs) in Csound orchestras. Signals flow from the outlets of source instruments and are summed in the inlets of sink instruments. Signals may be krate, arate, frate, or arate arrays. Any number of outlets may be connected to any number of inlets. When a new instance of an instrument is instantiated during performance, the declared connections also are automatically instantiated. 

Signal flow graphs simplify the construction of complex mixers, signal processing chains, and the like. They also simplify the re-use of "plug and play" instrument definitions and even entire sub-orchestras, which can simply be #included and then "plugged in" to existing orchestras. 

Note that inlets and outlets are defined in instruments without reference to how they are connected. Connections are defined in the orchestra header. It is this separation that enables plug-in instruments. 

Inlets must be named. Instruments may be named or numbered, but in either case each source instrument must be defined in the orchestra before any of its sinks. Naming instruments makes it easier to connect outlets and inlets in any higher-level orchestra to inlets and outlets in any lower-level #included orchestra. 

The signal flow graph opcodes include:

[outleta](opcodes/outleta.md), for sending an arate signal from any instrument out a named port. [outletk](opcodes/outletk.md), for sending a krate signal from any instrument out a named port. [outletkid](opcodes/outletkid.md), similar to outletk, but receiving a krate signal only from an identified instance of a port. [outletf](opcodes/outletf.md), for sending an frate signal from any instrument out a named port. [outletv](opcodes/outletv.md), for sending an arate array signal from any instrument out a named port. [inleta](opcodes/inleta.md), for receiving an arate signal through a named port. [inletk](opcodes/inletk.md), for receiving a krate signal through a named port. [inletkid](opcodes/inletkid.md), similiar to inletk, but transmitting a signal only between inlet and outlet opcodes. [inletf](opcodes/inletf.md), for receiving an frate signal through a named port. [inletv](opcodes/inletv.md), for receiving an arate array signal through a named port. [connect](opcodes/connect.md), for routing the signal from a named outlet in a source instrument to a named inlet in a sink instrument. [alwayson](opcodes/alwayson.md) for permanently activating an instrument from the orchestra header, without need of a score statement, e.g. for use as an effect processor receiving inputs from a number of sources. [ftgenonce](opcodes/ftgenonce.md) for instantiating function tables from within instrument definitions, without need for f-statements in the score or ftgen opcodes in the orchestra header. 

A typical scenario for the use of these opcodes would be something like this. A set of instruments would be defined, each in its own orchestra file, and each instrument would define inlet ports, outlet ports, and function tables within itself. Such instruments are completely self-contained. Then, a set of effects processors, such as equalizers, reverbs, compressors, and so on, would also be defined, each in its own file. Then, a customized master orchestra would #include the instruments and effects to be used, route the outputs of some instruments into one equalizer and the outputs of other effects into another equalizer, then route the outputs of both equalizers into a reverb, the output of the reverb into a compressor, and the output of the compressor into a stereo output soundfile. 

## Examples

Here is an example of the signal flow graph opcodes. It uses the file [signalflowgraph.csd](examples/signalflowgraph.csd).

``` csound-csd title="Example of the signal flow graph opcodes." linenums="1"
--8<-- "examples/signalflowgraph.csd"
```
