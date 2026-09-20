# **Instrument Invocation**

The opcodes one can use to create score events from within a orchestra are:

* [event](../opcodes/event.md)
* [eventi](../opcodes/event_i.md)
* [nstance](../opcodes/nstance.md)
* [readscore](../opcodes/readscore.md)
* [scorelinei](../opcodes/scoreline_i.md)
* [scoreline](../opcodes/scoreline.md)
* [schedule](../opcodes/schedule.md)
* [schedulek](../opcodes/schedulek.md)
* [schedwhen](../opcodes/schedwhen.md)
* [schedkwhen](../opcodes/schedkwhen.md)
* [schedkwhennamed](../opcodes/schedkwhennamed.md)

Use [unschedule](../opcodes/unschedule.md) or [unscheduleall](../opcodes/unscheduleall.md) to remove matching queued notes.

The [mute](../opcodes/mute.md) opcode can be used to mute/unmute instruments during a performance.

[play](../opcodes/play.md) starts a Csound 7 instrument instance immediately and returns an `Instr` reference. The [object guide](../orch/instrument-and-opcode-objects.md) covers definitions, instances and their controls.

Use [unschedule](../opcodes/unschedule.md) or [unscheduleall](../opcodes/unscheduleall.md) to remove matching queued notes.

Instrument definitions can be removed using [remove](../opcodes/remove.md) at initialization or [delete](../opcodes/delete.md) at deinitialization, once their notes have finished.

These opcodes will compile one or more instruments at init time:

* [compilecsd](../opcodes/compilecsd.md)
* [compileorc](../opcodes/compileorc.md)
* [compilestr](../opcodes/compilestr.md)
