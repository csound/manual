# **Instrument Invocation**

The opcodes one can use to create score events from within a orchestra are:

* [event](../opcodes/event.md)
* [event_i](../opcodes/event_i.md)
* [nstance](../opcodes/nstance.md)
* [readscore](../opcodes/readscore.md)
* [scoreline_i](../opcodes/scoreline_i.md)
* [scoreline](../opcodes/scoreline.md)
* [schedule](../opcodes/schedule.md)
* [schedulek](../opcodes/schedulek.md)
* [schedwhen](../opcodes/schedwhen.md)
* [schedkwhen](../opcodes/schedkwhen.md)
* [schedkwhennamed](../opcodes/schedkwhennamed.md)

The [mute](../opcodes/mute.md) opcode can be used to mute/unmute instruments during a performance.

Instruments definitions can be removed using the [remove](../opcodes/remove.md) opcode.

These opcodes will compile one or more instruments at init time:

* [compilecsd](../opcodes/compilecsd.md)
* [compileorc](../opcodes/compileorc.md)
* [compilestr](../opcodes/compilestr.md)
