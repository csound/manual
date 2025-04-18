# **Guard Point in Tables**

A guard point is the last position on a function table. If the length is, say 1024, the table will have 1024+1 (1025) points: the extra point is the guard point. 

In any case, for a 1024-point table,  the first point is index 0 and the last 1023; index 1024 is not really used.

The reason for a guard-point is that some opcodes interpolate to obtain a table value, in which case, when the table index is say, 1023.5, we need the value of the 1024 pos in order to interpolate.

There are two ways of filling this point (writing the value that goes in it):

* Default way: by copying the value of the 1st point in the table
* Extended Guard-Point: extending the contour of the table (continuing to calculate the table for one extra point)

In general the first mode is used for wrap-around applications, such as an oscillator (which loops continuously reading the table). The second use is for one-shot readouts, such as envelopes, where the last point needs to be interpolated correctly following the table contour (we are not looping back to the beginning of the table)
