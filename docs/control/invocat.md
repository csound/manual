# **Instrument Invocation**

The opcodes one can use to create score events from within a orchestra are:

* [event](../../opcodes/event)
* [event_i](../../opcodes/event_i)
* [nstance](../../opcodes/nstance)
* [readscore](../../opcodes/readscore)
* [scoreline_i](../../opcodes/scoreline_i)
* [scoreline](../../opcodes/scoreline)
* [schedule](../../opcodes/schedule)
* [schedulek](../../opcodes/schedulek)
* [schedwhen](../../opcodes/schedwhen)
* [schedkwhen](../../opcodes/schedkwhen)
* [schedkwhennamed](../../opcodes/schedkwhennamed)

The [mute](../../opcodes/mute) opcode can be used to mute/unmute instruments during a performance.

Instruments definitions can be removed using the [remove](../../opcodes/remove) opcode.

These opcodes will compile one or more instruments at init time:

* [compilecsd](../../opcodes/compilecsd)
* [compileorc](../../opcodes/compileorc)
* [compilestr](../../opcodes/compilestr)
