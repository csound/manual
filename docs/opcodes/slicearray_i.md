<!--
id:slicearray_i
category:Table Control:Table Queries
-->
# slicearray_i
Copies selected array elements at initialization only.

This is the older spelling of [slicearrayi](slicearrayi.md). See that page for the supported types, bounds and shared example. Use `slicearrayi` in new Csound 7 code.

## Syntax

=== "Modern"
    ``` csound-orc
    iout[] = slicearray_i(iin[], istart, iend [, istride])
    kout[] = slicearray_i(kin[], istart, iend [, istride])
    Sout[] = slicearray_i(Sin[], istart, iend [, istride])
    ```

=== "Classic"
    ``` csound-orc
    iout[] slicearray_i iin[], istart, iend [, istride]
    kout[] slicearray_i kin[], istart, iend [, istride]
    Sout[] slicearray_i Sin[], istart, iend [, istride]
    ```
