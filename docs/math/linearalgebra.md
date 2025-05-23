<!--
id:linearalgebraopcodes
category:
-->
# Linear Algebra Opcodes
Scalar, vector, and matrix arithmetic on real and complex values.

Plugin opcodes in linear_algebra. These opcodes are part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

These opcodes implement many linear algebra operations, from scalar, vector, and matrix arithmetic up to and including QR based eigenvalue decompositions. The opcodes are designed for digital signal processing, and of course other mathematical operations, in the Csound orchestra language.

The numerical implementation uses the gmm++ library
from [getfem.org/gmm/index.html](https://getfem.org/gmm/index.html).

> :warning: **Warning**
>
> For applications with f-sig variables, array arithmetic must be performed only when the f-sig is "current," because f-rate is some fraction of k-rate; currency can be determined with the la_k_current_f opcode.
>
> For applications using assignments between real vectors and a-rate variables, array arithmetic must be performed only when the vectors are "current", because the size of the vector may be some integral multiple of ksmps; currency can be determined by means of the la_k_current_vr opcode.

| Mathematical Type | Code | Corresponding Csound Type or Types |
|---|---|---|
| real scalar  | r | i-rate or k-rate variable |
| complex scalar | c | pair of i-rate or k-rate variables, e.g. "kr, ki" |
| real vector | vr | i-rate variable holding address of array |
| real vector | a | a-rate variable |
| real vector | t | function table number |
| complex vector | vc | i-rate variable holding address of array |
| complex vector | f | fsig variable |
| real matrix | mr | i-rate variable holding address of array |
| complex matrix | mc | i-rate variable holding address of array |

All arrays are 0-based; the first index iterates rows to give columns, the second index iterates columns to give elements.

All arrays are general and dense; banded, Hermitian, symmetric and sparse routines are not implemented.

An array can be of type code vr, vc, mr, or mc and is stored in an i-rate object. In orchestra code, an array is passed as a MYFLT i-rate variable that contains the address of the array object, which is actually stored in the allocator opcode instance. Although array variables are i-rate, of course their values and even shapes may change at i-rate or k-rate.

All operands must be pre-allocated; except for the creation opcodes, no opcode ever allocates any arrays. This is true even if the array appears on the left-hand side of an opcode! However, some operations may reshape arrays to hold results.

Arrays are automatically deallocated when their instrument is deallocated.

Not only for more efficient performance, but also to make it easier to remember opcode names, the performance rate, output value types, operation names, and input value types are deterministically encoded into the opcode name:

1. "la" for "linear algebra opcode family".
2. "i" or "k" for performance rate.
3. Type code(s) (see above table) for output value(s), but only if the type is not implicit from the input values.
4. Operation name: common mathematical name (preferred) or abbreviation.
5. Type code(s) for input values, if not implicit.

For additional details, see the gmm++ documentation at
[http://download.gna.org/getfem/doc/gmmuser.pdf](http://download.gna.org/getfem/doc/gmmuser.pdf).

## Syntax

### Array Creation
``` csound-orc
ivr                         la_i_vr_create        irows
```

Create a real vector with irows rows.

``` csound-orc
ivc                         la_i_vc_create        irows
```

Create a complex vector with irows rows.

``` csound-orc
imr                         la_i_mr_create        irows, icolumns  [, odiagonal]
```

Create a real matrix with irows rows and icolumns columns, with an optional value on the diagonal.

``` csound-orc
imc                         la_i_mc_create        irows, icolumns  [, odiagonal_r, odiagonal_i]
```

Create a complex matrix with irows rows and icolumns columns, with an optional complex value on the diagonal.

### Array Introspection
``` csound-orc
irows                       la_i_size_vr          ivr
```

Return the number of rows in real vector ivr.

``` csound-orc
irows                       la_i_size_vc          ivc
```

Return the number of rows in complex vector ivc.

``` csound-orc
irows, icolumns             la_i_size_mr          imr
```

Return the number of rows and columns in real matrix imr.

``` csound-orc
irows, icolumns             la_i_size_mc          imc
```

Return the number of rows and columns in complex matrix imc.

``` csound-orc
kfiscurrent                 la_k_current_f        fsig
```

Return 1 if fsig is current, that is, if the value of fsig will change on the next kperiod.

``` csound-orc
kvriscurrent                la_k_current_vr       ivr
```

Return 1 if the real vector ivr is current, that is, if Csound's current audio sample frame stands at index 0 of the vector.

``` csound-orc
la_i_print_vr         ivr
```

Print the value of real vector ivr.

``` csound-orc
la_i_print_vc         ivc
```

Print the value of complex vector ivc.

``` csound-orc
la_i_print_mr         imr
```

Print the value of real matrix imr.

``` csound-orc
la_i_print_mc         imc
```

Print the value of complex matrix imc.

### Array Assignment and Conversion
``` csound-orc
ivr                         la_i_assign_vr        ivr
```

Assign the value of the real vector on the right-hand side to the real vector on the left-hand side, at i-rate.

``` csound-orc
ivr                         la_k_assign_vr        ivr
```

Assign the value of the real vector on the right-hand side to the real vector on the left-hand side, at k-rate.

``` csound-orc
ivc                         la_i_assign_vc        ivc
ivc                         la_k_assign_vc        ivr
imr                         la_i_assign_mr        imr
imr                         la_k_assign_mr        imr
imc                         la_i_assign_mc        imc
imc                         la_k_assign_mc        imr
```

> :warning: **Warning**
>
> Assignments to vectors from tables or fsigs may resize the vectors.
>
> Assignments to vectors from a-rate variables, or to a-rate variables from vectors, will be performed incrementally, one chunk of ksmps elements per kperiod. Therefore, array arithmetic on such vectors should only be performed when the vectors are current, as determined by the la_k_currrent_vr opcode.

``` csound-orc
ivr                         la_k_assign_a         asig
ivr                         la_i_assign_t         itablenumber
ivr                         la_k_assign_t         itablenumber
ivc                         la_k_assign_f         fsig
asig                        la_k_a_assign         ivr
itablenum                   la_i_t_assign         ivr
itablenum                   la_k_t_assign         ivr
fsig                        la_k_f_assign         ivc
```

### Fill Arrays with Random Elements
``` csound-orc
ivr                         la_i_random_vr        [ifill_fraction]
ivr                         la_k_random_vr        [kfill_fraction]
ivc                         la_i_random_vc        [ifill_fraction]
ivc                         la_k_random_vc        [kfill_fraction]
imr                         la_i_random_mr        [ifill_fraction]
imr                         la_k_random_mr        [kfill_fraction]
imc                         la_i_random_mc        [ifill_fraction]
imc                         la_k_random_mc        [kfill_fraction]
```

### Array Element Access
``` csound-orc
ivr                         la_i_vr_set           irow, ivalue
kvr                         la_k_vr_set           krow, kvalue
ivc                         la_i_vc_set           irow, ivalue_r, ivalue_i
kvc                         la_k_vc_set           krow, kvalue_r, kvalue_i
imr                         la_i mr_set           irow, icolumn, ivalue
kmr                         la_k mr_set           krow, kcolumn, ivalue
imc                         la_i_mc_set           irow, icolumn, ivalue_r, ivalue_i
kmc                         la_k_mc_set           krow, kcolumn, kvalue_r, kvalue_i
ivalue                      la_i_get_vr           ivr, irow
kvalue                      la_k_get_vr           ivr, krow
ivalue_r, ivalue_i          la_i_get_vc           ivc, irow
kvalue_r, kvalue_i          la_k_get_vc           ivc, krow
ivalue                      la_i_get_mr           imr, irow, icolumn
kvalue                      la_k_get_mr           imr, krow, kcolumn
ivalue_r, ivalue_i          la_i_get_mc           imc, irow, icolumn
kvalue_r, kvalue_i          la_k_get_mc           imc, krow, kcolumn
```

### Single Array Operations
``` csound-orc
imr                         la_i_transpose_mr     imr
imr                         la_k_transpose_mr     imr
imc                         la_i_transpose_mc     imc
imc                         la_k_transpose_mc     imc
ivr                         la_i_conjugate_vr     ivr
ivr                         la_k_conjugate_vr     ivr
ivc                         la_i_conjugate_vc     ivc
ivc                         la_k_conjugate_vc     ivc
imr                         la_i_conjugate_mr     imr
imr                         la_k_conjugate_mr     imr
imc                         la_i_conjugate_mc     imc
imc                         la_k_conjugate_mc     imc
```

### Scalar Operations
``` csound-orc
ir                          la_i_norm1_vr         ivr
kr                          la_k_norm1_vr         ivc
ir                          la_i_norm1_vc         ivc
kr                          la_k_norm1_vc         ivc
ir                          la_i_norm1_mr         imr
kr                          la_k_norm1_mr         imr
ir                          la_i_norm1_mc         imc
kr                          la_k_norm1_mc         imc
ir                          la_i_norm_euclid_vr   ivr
kr                          la_k_norm_euclid_vr   ivr
ir                          la_i_norm_euclid_vc   ivc
kr                          la_k_norm_euclid_vc   ivc
ir                          la_i_norm_euclid_mr   mvr
kr                          la_k_norm_euclid_mr   mvr
ir                          la_i_norm_euclid_mc   mvc
kr                          la_k_norm_euclid_mc   mvc
ir                          la_i_distance_vr      ivr
kr                          la_k_distance_vr      ivr
ir                          la_i_distance_vc      ivc
kr                          la_k_distance_vc      ivc
ir                          la_i_norm_max         imr
kr                          la_k_norm_max         imc
ir                          la_i_norm_max         imr
kr                          la_k_norm_max         imc
ir                          la_i_norm_inf_vr      ivr
kr                          la_k_norm_inf_vr      ivr
ir                          la_i_norm_inf_vc      ivc
kr                          la_k_norm_inf_vc      ivc
ir                          la_i_norm_inf_mr      imr
kr                          la_k_norm_inf_mr      imr
ir                          la_i_norm_inf_mc      imc
kr                          la_k_norm_inf_mc      imc
ir                          la_i_trace_mr         imr
kr                          la_k_trace_mr         imr
ir, ii                      la_i_trace_mc         imc
kr, ki                      la_k_trace_mc         imc
ir                          la_i_lu_det           imr
kr                          la_k_lu_det           imr
ir                          la_i_lu_det           imc
kr                          la_k_lu_det           imc
```

### Elementwise Array-Array Operations
``` csound-orc
ivr                         la_i_add_vr           ivr_a, ivr_b
ivc                         la_k_add_vc           ivc_a, ivc_b
imr                         la_i_add_mr           imr_a, imr_b
imc                         la_k_add_mc           imc_a, imc_b
ivr                         la_i_subtract_vr      ivr_a, ivr_b
ivc                         la_k_subtract_vc      ivc_a, ivc_b
imr                         la_i_subtract_mr      imr_a, imr_b
imc                         la_k_subtract_mc      imc_a, imc_b
ivr                         la_i_multiply_vr      ivr_a, ivr_b
ivc                         la_k_multiply_vc      ivc_a, ivc_b
imr                         la_i_multiply_mr      imr_a, imr_b
imc                         la_k_multiply_mc      imc_a, imc_b
ivr                         la_i_divide_vr        ivr_a, ivr_b
ivc                         la_k_divide_vc        ivc_a, ivc_b
imr                         la_i_divide_mr        imr_a, imr_b
imc                         la_k_divide_mc        imc_a, imc_b
```

### Inner Products
``` csound-orc
ir                          la_i_dot_vr           ivr_a, ivr_b
kr                          la_k_dot_vr           ivr_a, ivr_b
ir, ii                      la_i_dot_vc           ivc_a, ivc_b
kr, ki                      la_k_dot_vc           ivc_a, ivc_b
imr                         la_i_dot_mr           imr_a, imr_b
imr                         la_k_dot_mr           imr_a, imr_b
imc                         la_i_dot_mc           imc_a, imc_b
imc                         la_k_dot_mc           imc_a, imc_b
ivr                         la_i_dot_mr_vr        imr_a, ivr_b
ivr                         la_k_dot_mr_vr        imr_a, ivr_b
ivc                         la_i_dot_mc_vc        imc_a, ivc_b
ivc                         la_k_dot_mc_vc        imc_a, ivc_b
```

### Matrix Inversion
``` csound-orc
imr, icondition             la_i_invert_mr        imr
imr, kcondition             la_k_invert_mr        imr
imc, icondition             la_i_invert_mc        imc
imc, kcondition             la_k_invert_mc        imc
```

### Matrix Decompositions and Solvers
``` csound-orc
ivr                         la_i_upper_solve_mr   imr [, j_1_diagonal]
ivr                         la_k_upper_solve_mr   imr [, j_1_diagonal]
ivc                         la_i_upper_solve_mc   imc [, j_1_diagonal]
ivc                         la_k_upper_solve_mc   imc [, j_1_diagonal]
ivr                         la_i_lower_solve_mr   imr [, j_1_diagonal]
ivr                         la_k_lower_solve_mr   imr [, j_1_diagonal]
ivc                         la_i_lower_solve_mc   imc [, j_1_diagonal]
ivc                         la_k_lower_solve_mc   imc [, j_1_diagonal]
imr, ivr_pivot, isize       la_i_lu_factor_mr     imr
imr, ivr_pivot, ksize       la_k_lu_factor_mr     imr
imc, ivr_pivot, isize       la_i_lu_factor_mc     imc
imc, ivr_pivot, ksize       la_k_lu_factor_mc     imc
ivr_x                       la_i_lu_solve_mr      imr, ivr_b
ivr_x                       la_k_lu_solve_mr      imr, ivr_b
ivc_x                       la_i_lu_solve_mc      imc, ivc_b
ivc_x                       la_k_lu_solve_mc      imc, ivc_b
imr_q, imr_r                la_i_qr_factor_mr     imr
imr_q, imr_r                la_k_qr_factor_mr     imr
imc_q, imc_r                la_i_qr_factor_mc     imc
imc_q, imc_r                la_k_qr_factor_mc     imc
ivr_eig_vals                la_i_qr_eigen_mr      imr, i_tolerance
ivr_eig_vals                la_k_qr_eigen_mr      imr, k_tolerance
ivr_eig_vals                la_i_qr_eigen_mc      imc, i_tolerance
ivr_eig_vals                la_k_qr_eigen_mc      imc, k_tolerance
```

> :warning: **Warning**
>
> Matrix must be Hermitian in order to compute eigenvectors.

``` csound-orc
ivr_eig_vals, imr_eig_vecs  la_i_qr_sym_eigen_mr  imr, i_tolerance
ivr_eig_vals, imr_eig_vecs  la_k_qr_sym_eigen_mr  imr, k_tolerance
ivc_eig_vals, imc_eig_vecs  la_i_qr_sym_eigen_mc  imc, i_tolerance
ivc_eig_vals, imc_eig_vecs  la_k_qr_sym_eigen_mc  imc, k_tolerance
```

## See also

For other information on the Linear Algebra Opcodes, see the [Csound Journal.](https://csoundjournal.com/issue22/linearAlgebra.html)

## Credits

Michael Gogins

New in Csound version 5.09
