#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot
#import "@preview/quill:0.7.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.5": *


#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeeeee"))

#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))

#let example = thmplain("example", "Example").with(numbering: none)

#let proof = thmproof("proof", "Proof")


= Mutually Unbiased Bases

#definition([Mutually Unbiased Bases])[
  Two bases $cal(U) = {ket(u_i)}_(i=0)^(d-1)$ and $cal(V) = {ket(v_j)}_(j=0)^(d-1)$ of the Hilbert space $CC^d$ are called mutually unbiased when:
  $ abs(braket(u_i, v_j))^2 = 1 / d $
]

#definition([Set of Mutually Unbiased Bases])[
  A set of $n$ bases $S = {U_i}_(i=0)^(n-1)$ is called a set of mutually unbiased bases when for each pair of bases $(U_i, U_j)$ in $S$, $U_i$ and $U_j$ are mutually unbiased bases.
]


#theorem([Horodecki @horodecki2022FiveOpenProblems])[
  There are no more than $d+1$ mutually unbiased bases in the Hilbert space $CC^(d)$.
] <mub-max-d-plus-1>
#proof[ ...

]


// IAN: What if you don't use computational, Pauli-X, and Pauli-Y?
#theorem([Horodecki @horodecki2022FiveOpenProblems])[
  There is a set of three, but not four, mutually unbiased bases in the Hilbert space $CC^(d)$ for $d >= 2$.
]
#proof[
  Suppose we take $d = 2$.
  Then, according to @mub-max-d-plus-1, no more than three mutually unbiased bases exist in $cal(H)_2$ (= $CC^2$), the Hilbert space of dimension two.
  First we identify a set $U$ of the three mutually unbiased bases $U_0$, $U_1$, and $U_2$ so that:
  $ U = {U_0, U_1, U_2} $
  Then we will show that any other basis can not be unbiased with all three of them.

  *Step 1: Defining the first basis (The computational basis)*

  Our first basis, $U_0$, will be the orthonormal computational basis:
  $ U_0 = {ket(0), ket(1) } $
  This basis corresponds to the eigenbasis of the Pauli-$Z$ operator.

  *Step 2: Defining a second mutually unbiased basis*

  Our second basis must be mutually orthogonal to $U_0$:
  $ abs(braket(u_i^0, u_j^1))^2 = 1/d = 1/2 $
  for all $u_i in U_0$ and $u_j in U_1$.

  It is commonly known @nielsen2010QuantumComputationQuantum that the eigenbases of the Pauli operators are mutually unbiased.
  So, a good candidate is the Hadamard basis, which corresponds to the eigenbasis of the Pauli-X operator:
  $ U_1 = {ket(+), ket(-)} $ where $ket(+) = 1/sqrt(2)(ket(0) + ket(1))$ and $ket(-) = 1/sqrt(2)(ket(0)-ket(1))$.

  The bases $U_0$ and $U_1$ are then mutually unbiased:

  $
    abs(braket(0, +))^2 = abs(braket(0, 1/sqrt(2)(ket(0) + ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
    abs(braket(0, -))^2 = abs(braket(0, 1/sqrt(2)(ket(0) - ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
    abs(braket(1, +))^2 = abs(braket(1, 1/sqrt(2)(ket(0) + ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
    abs(braket(1, -))^2 = abs(braket(1, 1/sqrt(2)(ket(0) - ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
  $

  Since the condition holds for all pairs from $U_0$ and $U_1$, they are mutually unbiased.

  *Step 3: Defining a third mutually unbiased basis*

  Now, we seek a third basis $U_2$ that is unbiased with both $U_0$ and $U_1$.
  Again, the eigenbasis of the Pauli-Y operator works.
  $ U_2 = {ket(+i), ket(-i)} $

  where $ket(+i) = 1/sqrt(2)(ket(0) + i ket(1))$ and $ket(-i) = 1/sqrt(2)(ket(0) - i ket(1))$.
  Then $U_2$ is mutually unbiased with $U_0$:
  $
    abs(braket(0, +i))^2 = abs(braket(, 1/sqrt(2)(ket(0) + i ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
    abs(braket(0, -i))^2 = abs(braket(0, 1/sqrt(2)(ket(0) - i ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
    abs(braket(1, +i))^2 = abs(braket(1, 1/sqrt(2)(ket(0) + i ket(1))))^2 = abs(i/sqrt(2))^2 = 1/2\
    abs(braket(1, -i))^2 = abs(braket(1, 1/sqrt(2)(ket(0) - i ket(1))))^2 = abs(-i/sqrt(2))^2 = 1/2\
  $

  Likewise, $U_2$ is mutually unbiased with $U_1$:

  $
    abs(braket(+, +i))^2 = abs(braket(1/sqrt(2)(ket(0) + ket(1)), 1/sqrt(2)(ket(0) + i ket(1))))^2 = abs((1+i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\
    abs(braket(+, -i))^2 = abs(braket(1/sqrt(2)(ket(0) + ket(1)), 1/sqrt(2)(ket(0) - i ket(1))))^2 = abs((1-i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\
    abs(braket(-, +i))^2 = abs(braket(1/sqrt(2)(ket(0) - ket(1)), 1/sqrt(2)(ket(0) + i ket(1))))^2 = abs((1-i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\
    abs(braket(-, -i))^2 = abs(braket(1/sqrt(2)(ket(0) - ket(1)), 1/sqrt(2)(ket(0) - i ket(1))))^2 = abs((1+i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\
  $

  Thus, we have found three mutually unbiased bases for $d = 2$

  *Step 4: Proving a fourth mutually unbiased basis is impossible*

  Now we show that it's impossible to construct a fourth basis, $U_3$, that is unbiased with $U_0$, $U_1$, and $U_2$.

  For any new basis to be unbiased with $U_0$, its states must be of the form:
  // IAN: Explain why this is the case. Derive the below formula.
  $ ket(psi) = 1/ sqrt(2)(ket(0) + e^(i phi) ket(1)) $
  where $0 <= phi < 2 pi$ is a real number.
  // IAN: explain what you mean by a real phase.

  For this state to also be unbiased with $U_1$, we must have $ abs(braket(+, psi))^2 = 1/2 #h(4mm) forall #h(2mm) ket(psi) in U_2 $

  We can then derive the following equation:

  $
    & abs(braket(+, psi))^2 = 1/2 \
    & => abs(1/2(bra(0) +bra(1))(ket(0)+e^(i phi) ket(1)))^2 = 1/2 \
    & => abs((1+e^(i phi))/2)^2 =1/2 \
    & => 1 / 2^2 abs((1+e^(i phi)))^2 =1/2 \
    & => abs((1+e^(i phi)))^2 = 2 \
    & => abs((1+cos(phi) +i sin(phi)))^2 = 2 \
    & => (1+cos(phi))^2 + (sin(phi))^2 = 2 \
    & => 1 + 2 cos(phi) + cos^2(phi) + sin^2(phi) = 2 \
    & => 1 + 2 cos(phi) + 1 = 2 \
    & => cos(phi) = 0
  $

  Therefore any element $ket(psi)$ in $U_3$ must be of the form:

  $
    ket(psi) = 1 / sqrt(2) (ket(0) + e^(i phi) ket(1))
    = 1 / sqrt(2) (ket(0) + e^(i pi/2) ket(1)) text("or") 1 / sqrt(2) (ket(0) + e^(i (3pi)/2) ket(1)) \
  $


  // IAN:
  // Note that at this point, we cant even form a basis U_2 with two orthogonal states.
  // $
  //   abs(r e^(i phi))^2 = r e^(i phi) r e^(-i phi) = r^2 e^(i phi - i phi) = r^2 e^0 = r^2 \
  //   abs(a+b i)^2 = (a + b i)(a - b i) = a^2 + a b i - a b i - b^2 i^2 = a^2 + b^2 \
  // $

  // This means the phase angle $phi$ must be either $pi/2, (3pi)/2 text("(or its equivalent," -pi/2))$.

  Finally, for the state to also be unbiased with $U_2$.
  Checking the condition for $phi= pi /2$ we get:

  $
    ket(psi) = ket(0) + i ket(1) = ket(+i)
  $
  $
    => abs(braket(+i, psi))^2 & = abs(1/2(bra(0) - i bra(1))(ket(0)+ i ket(1)))^2 \
                              & = abs((1 - i^2)/2)^2 = 1
  $

  For a mutually unbiased basis, this should equal $1 / 2$.
  Therefore, $ket(psi)$ cannot be an element of $U_2$.

  Likewise:
  $
    ket(psi) = ket(0) - i ket(1) = ket(-i)
  $
  $
    => abs(braket(+i, psi))^2 & = abs(1/2(bra(0) - i bra(1))(ket(0) - i ket(1)))^2 \
                              & = abs((1 + i^2)/2)^2 = 1
  $

  Therefore, no 4th basis for d=2 can exist.
]

  === Mutually unbiased bases for $d = 3$

  We can construct mutually unbiased bases for $d = 3$ with various well established methods, such as:

  === Weyl-Heisenberg (or generalized Pauli operator):
  It is the standard technique for prime dimensions. It uses the shift and phase operators $X$ and $Z$, along with their products $X Z^a$ for
  $a=0,1,…,d-1$, to generate eigenbases that are mutually unbiased. This method scales well with prime $d$ and is algebraically elegant.

  #let omega = $omega$

  Generalized Pauli (Weyl) operators on $C^3$
  $ omega = e^(2 pi i / 3) $
  $
    X = [
      (0, 1, 0),
      (0, 0, 1),
      (1, 0, 0),
    ]
  $

  $
    Z = [
      (1, 0, 0),
      (0, omega, 0),
      (0, 0, omega^2),
    ]
  $

  // The 4 MUBs are the eigenbases of  Z,  X,  XZ,  XZ^2.
  // 1) Z-eigenbasis (computational)  B_Z
  $
    B_Z = [
    (1,0,0),
    (0,1,0),
    (0,0,1),
  $

  // 2) X-eigenbasis  B_X
  $
    B_X = 1/sqrt(3) * [
      (1, 1, 1),
      (1, omega, omega^2),
      (1, omega^2, omega),
    ]
  $

  // 3) (XZ)-eigenbasis  B_{XZ}
  $
    B_{X Z} = 1/sqrt(3) * [
      (1, 1, 1),
      (1, omega, omega^2),
      (omega, 1, omega^2),
    ]
  $

  // 4) (XZ^2)-eigenbasis  B_{XZ^2}
  $
    B_{X Z^2} = 1/sqrt(3) * [
      (1, 1, 1),
      (1, omega, omega^2),
      (omega^2, omega, 1),
    ]
  $

  === Finite field (Galois Field) method:
  It is another powerful approach, particularly useful for both prime and prime power dimensions. This method uses structure from finite fields $F_d$, which exist for prime $d$. It defines MUB vectors using field-theoretic constructions involving quadratic and linear phase terms. This method is highly generalizable and connects quantum information with abstract algebra.

  === Geometric approach:
  It is based on finite projective planes and complex Hadamard matrices, provides a combinatorial and geometric perspective. MUBs correspond to lines in projective geometry over finite fields. While this method is mathematically rich and generalizable, it is often more suitable for larger or composite dimensions.

  === Fourier matrix and its diagonal phase-shifted versions:
  Starting with the Discrete Fourier Transform (DFT) matrix $F$, one can multiply it by diagonal matrices of the form $D_a = {diag}(1, omega^a, omega^(2a)$ to generate additional MUBs. This is particularly convenient for small dimensions like $d = 3$, though less structured for general cases.

  The *Fourier matrix* and simple phase shifts.
  For $d = 3$, the Discrete Fourier Transform (DFT) matrix is

  $
    F = 1/sqrt(3) * [
      (1, 1, 1),
      (1, omega, omega^2),
      (1, omega^2, omega)
    ]
  $

  where $omega = e^(2 pi i / 3)$ is a primitive third root of unity.
  The columns of $F$ form one unbiased basis.

  To generate more bases, we multiply $F$ by diagonal matrices of the form

  $D_a = diag(1, omega^a, omega^(2a)), quad a = 1, 2.$

  The sets of vectors from $F, F D_1,$ and $F D_2$ give the remaining mutually unbiased bases, together with the standard computational basis.

  This approach is straightforward for small prime dimensions like $d = 3$.

  *Computational basis  $B_0$*

  $
    B_0 = [
      (1, 0, 0),
      (0, 1, 0),
      (0, 0, 1)
    ]
  $

  *Fourier basis  $B_1$  (columns of F)*
  $
    B_1 = 1/sqrt(3) * [
      (1, 1, 1),
      (1, omega, omega^2),
      (1, omega^2, omega)
    ]
  $

  * Quadratic-phase Fourier  $B_2 = diag(1, omega, omega) times B_1$ *

  $
    B_2 = 1/sqrt(3) * [
      (1, 1, 1),
      (omega, omega^2, 1),
      (omega, 1, omega^2)
    ]
  $

  * Quadratic-phase Fourier*  $B_3 = diag(1, omega^2, omega^2) times B_1$

  $
    B_3 = 1/sqrt(3) * [
      (1, 1, 1),
      (omega^2, 1, omega),
      (omega^2, omega, 1)
    ]
  $

  === Brute-force numerical or symbolic approach

  It is possible to use a brute-force numerical or symbolic approach, solving the orthonormality and unbiasedness conditions directly. While this method offers hands-on intuition and is useful for validation, it becomes computationally impractical as the dimension increases.

  === Construction of Mutually Unbiased Bases in $d=4$ via the Two-Qubit Pauli/Stabilizer Method

  For a Hilbert space of dimension $d$, at most $d+1$ mutually unbiased bases (MUBs) can exist; this maximum is achieved for prime powers. Since $4 = 2^2$, we can construct five MUBs in $C^4$.

  Let the single-qubit Pauli operators be

  $X = [[0, 1], [1, 0]], \
  Y = [[0, -i], [i, 0]], \
  Z = [[1, 0], [0, -1]].$

  The computational basis for two qubits ordered as:
  $ket(00),ket(01),ket(10), ket(11)$.

  === Commuting partition used
  One convenient disjoint partition of the 15 non-identity Paulis into five maximal commuting sets is:
  $
    S_1 = { Z times.circle I, I times.circle Z, Z times.circle Z }\
    S_2 = { X times.circle I, I times.circle X, X times.circle X }\
    S_3 = { Y times.circle I, I times.circle Y, Y times.circle Y }\
    S_4 = { X times.circle Y, Y times.circle Z, Z times.circle X }\
    S_5 = { X times.circle Z, Z times.circle Y, Y times.circle X }\
  $


= Proof that at least three MUBs exist in any dimensions.

#theorem([At least three mutually unbiased bases exist @WOOTTERS1989optimalStateMUB @ivanovic1981geometricaldescriptionquantal @Zyczkowski2017Geometryofquantumstates])[
  For any dimension $d >= 2$, there exist three pairwise mutually unbiased bases (MUBs) in Hilbert space $CC^(d)$.
]
#proof[\
  *Road-map for proof:*\
  1. Constructing 3 MUBs for all powers of $2$, $d=2^a$ using Pauli eigenbases ${X, Y, Z}$ on $a$ qubits.
  2. Constructing 3 MUBs for all odd dimensions $d = m$ using Weyl operators  and a quadratic Gauss-sum argument
  - (Weyl operators are generalized Pauli matrices $X, Z$)
  - (A Gauss sum is a finite sum of roots of unity).
  3. Using a tensor-product lemma to combine the odd and even parts will give new 3 pairwise MUBs for any $d = 2^a m$ where $m$ is odd.

Everything here in point 1 and 2 is in MUBs literature separately, we just need to combine them using the tensor-product lemma in point 3.  

  *Step 1: Power of $2$, $d = 2^a$ (Even dimensions)*

For a single qubit ($d=2$), the eigenbases of $Z$, $X$, and $Y$ are pairwise MUB.

For $a$ qubits ($d=2^a$), take product bases
$
  cal(B)_z ^((a)) = "eigenbases of " Z^(times.circle a), quad
  cal(B)_x ^((a)) = "eigenbases of " X^(times.circle a), quad
  cal(B)_y ^((a)) = "eigenbases of " Y^(times.circle a) 
$

If $ket(Phi)$ and $ket(psi)$ are single qubit vectors from different Pauli eigenbases, $abs(braket(Phi, psi))^2 = 1\/sqrt(2)$ and for tensor products across $a$ qubits, the inner products factorize, so the magnitude becomes $(1\/sqrt(2))^a = 1 \/sqrt(2^a)$. Thus these three bases MUB in $2^a$.

*Step 2: three MUBs from Odd dimensions, $d = m$ from $ {Z, X, X Z}$*

General Pauli operators (Weyl operators) on $CC^d$, We fix computational $Z$ - basis ${ket(0), ket(1), ..., ket(d-1)}$ with $braket(j,l)=delta_(j,l)$ (Kronecker delta) and $omega = e^(2 pi i \/ d)$.

$ Z ket(j) = omega^j ket(j) quad X ket(j) = ket((j+1) mod d) $

Two immediate facts:
1. $Z$ is diagonal in the computational basis.
2. $X$ is cyclic shift operator (unitary, $X^d = I$), and $ X Z = omega Z X$.

*Phase operator $Z$*
 
Its matrix form is $Z = diag{omega^0, omega^1, ..., omega^{d-1}}$

Suppose $d=3$, then
$ Z = 
  mat(
      1, 0, 0;
      0, omega, 0;
      0, 0, omega^2)$

*Shift operator $X$*

suppose $d=3$, then $X ket(0) = ket(1)$, $X ket(1) = ket(2)$, $X ket(2) = ket(0)$.
  
$ X = 
  mat(
      0, 0, 1;
      1, 0, 0;
      0, 1, 0)$
For convenience the X matrix is often written as
  $ X = 
  mat(
      0, 1, 0;
      0, 0, 1;
      1, 0, 0)$


=== $Z$ and $X$ are mutually Unbiased:

Fourier Vectors (i.e. $X$-eigenbasis)
$
  ket(x_k) = 1/sqrt(d) sum_(j=0)^(d-1) omega^(l k) ket(l)
$

Compute $braket(j,x_k)$ 
$
  braket(j,x_k) = bra(j)1/sqrt(d) sum_(l=0)^(d-1) omega^(l k) ket(l) = 1/sqrt(d) sum_(l=0)^(d-1) omega^(j k)braket(j,l).
$
use orthonormality $braket(j,l) = delta_(j,l)$ to pick out $l=j$ term:
$
  braket(j,x_k) = 1/sqrt(d) omega^(j k)= 1/sqrt(d).
$
because $abs(omega^(j k)) = 1$, its magnitude squared is
$  abs(braket(j,x_k))^2 = 1/d.
$ 
the kronecker delta makes every term zero except when $j=l$, and the remaining term has unit modulus.

Similarly, it also works for reverse overlap: 
$braket(x_k',j) = (braket(j,x_k'))^* = 1/sqrt(d) omega^(-j k)$. same magnitude $1\/sqrt(d)$.

*In terms of Matrices:*
The $d times d $ Fourier matrix $F$ columns are the $X$-eigenbasis, with entries $F_(j,k) = 1/sqrt(d) omega^(j k)$. The vector $ket(x_k)$ is just the $k$-th column of $F$, so $braket(j,x_k)$ is the $(j,k)$ entry of $1/sqrt(d) omega^(j k)$.

Suppose $d=3$, then
$ket(x_0)= 1/sqrt(3) vec(1, 1, 1)$, $ket(x_1)= 1/sqrt(3) vec(1, omega, omega^2)$, $ket(x_2)= 1/sqrt(3) vec(1, omega^2, omega)$.

then e.g. $braket(2,x_1)$ is the third component of $ket(x_1)$, which is $braket(2,x_1) = 1/sqrt(3) omega^2.1$, whose magnitude is $1\/sqrt(3) quad forall omega^2 = 1$.

Hence $Z$ and $X$ are mutually unbiased.

*Third basis by diagonalizing $X Z$ (odd $d$)*

For the third basis, we use eigenvectors of $X Z$ and one convenient eigenbasis is formed by quadratic chirps.

The trick is a quadratic phase ("Chirp"):
$ 
  ket(u_k ^((r))) = 1/sqrt(d) sum_(l=0)^(d-1) omega^(r l^2 + k l) ket(l), quad quad k = 0, 1, ..., d-1
$

Since $d$ is odd, 2 has a multiplicative inverse modulo $d$. Choose
$r in {0, 1, dots, d-1}$ such that $2 r equiv 1 mod(d)$.
Equivalently, $r equiv 1 / 2 mod(d)$.

Quick examples:

$d=3: r =(3+1)\/2=2 text(.) quad text("Check") 2 dot 2 = 4 equiv 1 (mod 3)$

$d=5: r =(5+1)\/2=3 text(.) quad text("Check") 2 dot 3 = 6 equiv 1 (mod 5)$

$d=7: r =(7+1)\/2=4 text(.) quad text("Check") 2 dot 4 = 8 equiv 1 (mod 7)$

These will be eigenvectors of $X Z$. Compute $X Z ket(l) = Z ket(l+1) = omega^(l+1) ket(l+1)$, then

$
  X Z ket(u_k) &= 1/sqrt(d) sum_(l=0)^(d-1) omega^(r l^2 + k l) Z ket(l+1) \
               &= 1/sqrt(d) sum_(l=0)^(d-1) omega^(r l^2 + k l) omega^(l+1) ket(l+1) \
               &= 1/sqrt(d) sum_(m=0)^(d-1) omega^(r (m-1)^2 + k (m-1)) omega^m ket(m) quad quad forall l = m - 1 ,\
               &= 1/sqrt(d) sum_(m=0)^(d-1) omega^(r m^2 - 2 r m + r + k m - k) omega^m ket(m) \
               &= 1/sqrt(d) sum_(m=0)^(d-1) omega^(r m^2 + (k - 2 r + 1)m + (r - k)) ket(m) 
$
Because $2 r equiv 1 mod(d)$, the coefficient of $m$ simplifies:  $ -2 r + k + 1 equiv k (mod d)$.

Hence 
$
  X Z ket(u_k) = omega^(r - k) 1/sqrt(d) sum_m omega^(r m^2+k m) ket(m) = omega^(r - k) ket(u_k). quad forall quad m -> l.
$

so $ket(u_k)$ is an eigenvector of $X Z $. Vectors ${ket(u_k)}_(k=0)^{d-1}$ form the eigenbasis.

*Unbiasedness of $Z$ - basis and $X Z$ - basis:*

$ braket(j,u_k) = 1/sqrt(d) omega^(r +j^2 + k j) quad => quad  abs(braket(j,u_k)) = 1/sqrt(d) omega^(-j k) quad quad forall omega^(-j k) = 1 $

*Unbiasedness of $X$ - basis and $X Z$ - basis:*

$X$ - bases are $ket(x_k') = 1/sqrt(d) sum_(l=0)^(d-1) omega^(l k') ket(l)$
 
$X Z$ - bases are  $ket(u_k) = 1/sqrt(d) sum_(l=0)^(d-1) omega^(r l^2 + k l) ket(l)$

$ 
  braket(x_k',u_k) = braket((ket(1/sqrt(d) sum_(l=0)^(d-1) omega^(l k') ket(l))), 1/sqrt(d) sum_(l=0)^(d-1) omega^(r l^2 + k l) ket(l))
$

$ 
braket(x_k',u_k) = 1/sqrt(d) 1/sqrt(d) sum_(l=0)^(d-1) omega^((l k') + (r l^2 + k l))
$


$ 
braket(x_k',u_k) = 1/d sum_(l=0)^(d-1) omega^(r l^2 + (k - k') l)
$

Simplifying the power of $omega$ using completing the square technique:
$ r l^2 + (k -k')l = r (l + (k - k')/(2r))^2 - (k - k')^2/(4r) $

so

$
  braket(x_k',u_k) = omega^(-(k - k')^2/(4r)) / d sum_(j=0)^(d-1) omega^(r (l + (k - k')/(2r))^2) = omega^(-(k - k')^2/(4r)) / d sum_(j=0)^(d-1) G(r;d)
$

where $G(r;d) = sum_(j=0)^(d-1) omega^(r j^2)$ is a quadratic Gauss sum. For odd $d$, with gcd(r,d)=1, $ abs(G(r;d)) = sqrt(d) $

Therefore $ abs(braket(x_k',u_k)) = (abs(G(r;d))/d)= 1/sqrt(d) $

This proves that $X Z$-eigenbasis unbiased with the $X$-eigenbasis.
Putting it all together, for odd $d$, the three bases $Z$-eigenbasis, $X$-eigenbasis, and $X Z$-eigenbasis are pairwise mutually unbiased.

*Step 3: Tensor-product lemma to combine even and odd parts $=>$ any $d 2^a m$ (with $m$ odd*)

Lemma (Tensor-product MUB):

If ${A}_(i=0) ^r$ are MUBs in dimension $d_1$ and ${B}_(i=0)^r$ are MUBs in dimension $d_2$, then ${A_(i) times.circle B_(i)}_(i=0)^r$ are MUBs in dimension $d_1 d_2$.

*Proof of lemma:*
Pick unit vectors $ a in A_i, a' in A_j$ and  $ b in B_i, b' in B_j$.
Then
$
  braket(a times.circle b, a' times.circle b') = braket(a,a') braket(b,b') = 1/sqrt(d_1) dot 1/sqrt(d_2) = 1/sqrt(d_1 d_2) quad forall i != j
$

Now we can write any dimension $d$ as $d = 2^a m$ (with $m$ odd).

- Using step 1, to get three MUBs ${A_1, A_2, A_3}$ in $2^a.$
- Using step 2, to get three MUBs ${B_1, B_2, B_3}$ in $m$.
- Applying the tensor-product lemma, we get three MUBs ${A_i times.circle B_i}_(i=1)^3$ in $d = 2^a m$.

]

== Proof for $d+1$ Mutually Unbiased Bases exist for any dimension $d$ (when $d$ is Prime $p$ or Power of Prime $p^n$).

Here We try to prove that there exist complete set  ($d+1$) mutually unbiased bases in any dimension $d$ when $d$ is a prime or a power of a prime. 

For other dimensions (e.g. $6, 10, 12, ... $), a full set of MUBs is not known, the problem is still open.

We start with the case when $d$ is a prime $p$: 

#theorem([Complete set of MUBs for prime dimensions $p$ @WOOTTERS1989optimalStateMUB])[
  For any prime dimension $d = p$, there exist at most $d+1$ pairwise mutually unbiased bases (MUBs) in Hilbert space $CC^(d)$ or $CC^p$.]

We want $p+1$ orthonormal bases of $CC^p$ such that any two different bases are mutually unbiased (every cross-overlap has magnitude $1/sqrt(p)$).

We will get them as:

One standard (computational) basis, and $p$ “quadratic chirp” bases, one for each parameter $r∈{0,1,…,p-1}$, together they become $p+1$ MUBs.

#proof[
  *Step 1: The standard (computational) basis*

  The standard basis is the eigenbasis of the $Z$ operator:
  $
    cal(B)_z = {ket(0), ket(1), ..., ket(p-1)}
  $
  where $Z ket(j) = omega^j ket(j)$ and $omega = e^(2 pi i / p)$ is a primitive $p$-th root of unity.

  *Step 2: The quadratic chirp bases*

  For each $r in {0, 1, ..., p-1}$, define a basis
  $
    cal(B)_r = {ket(u_k ^((r)))}_(k=0)^(p-1)
  $
  where vectors are given by
  $
    ket(u_k ^((r))) = 1/sqrt(p) sum_(l=0)^(p-1) omega^(r l^2 + k l) ket(l)
  $

- $r=0$ gives the Fourier basis (no $l^2$ term, just $omega^(k l)$).

- $r=1,2,…,p-1$ give the quadratic-phase (“chirp”) bases.

  These are the eigenbases of the operators $X Z^r$, where $X$ is the cyclic shift operator defined by $X ket(j) = ket((j+1) mod p)$.

  *Step 3: Proving mutual unbiasedness*

   We need to show that each $cal(B)_r$ basis is orthonormal basis. 
  
  For fixed $r$, lets compute
  $ braket(u_k ^((r)), u_(k') ^((r))) = 1/sqrt(p) sum_(l=0)^(p-1) omega^(r l^2 + k l) 1/sqrt(p) sum_(m=0)^(p-1) omega^(-r m^2 - k' m) braket(l,m) $
  The $omega^(r l^2)$ factor cancels inside the inner product because it appears with its complex conjugate and using orthonormality $braket(l,m) = delta_(l,m)$, (Kronecker delta), we get: 
  $ braket(u_k ^((r)), u_(k') ^((r))) = 1/p
  sum_(l=0)^(p-1) omega^(r l^2 + k l - r l^2 - k' l) = 1/p sum_(l=0)^(p-1) omega^((k - k') l)
  $

  If $k = k'$, this is $1/p sum_(l=0)^(p-1) 1 = 1/p (p)= 1$. 
  
  If $k != k'$, this is a geometric series with ratio $omega^(k - k') != 1$, so the sum is zero. Thus, each $cal(B)_r$ is an orthonormal basis with $p$ vectors.

  *Each  $cal(B)_r$ is mutually unbiased with the standard basis $cal(B)_z$*

  *Unbiasedness between $cal(B)_z$ and $cal(B)_r$:*

  Compute the overlap:
  $
    braket(j, u_k ^((r))) = bra(j) (1/sqrt(p) sum_(l=0)^(p-1) omega^(r l^2 + k l) ket(l)) = 1/sqrt(p) omega^(r j^2 + k j)
  $
  The magnitude squared is:
  $
    abs(braket(j, u_k ^((r))))^2 = (1/sqrt(p))^2 abs(omega^(r j^2 + k j))^2 = 1/p
  $
  since $abs(omega^(text("anything"))) = 1$. Thus, $cal(B)_z$ and $cal(B)_r$ are mutually unbiased.

  *Any two different quadratic chirp bases $cal(B)_r$ and $cal(B)_r'$ (for $r != r'$) are mutually unbiased.*

  For $r != r'$, compute the overlap:
  $
    braket(u_k ^((r)), u_(k') ^((r'))) &= 1/sqrt(p) sum_(l=0)^(p-1) omega^(r l^2 + k l) 1/sqrt(p) sum_(l=0)^(p-1) omega^(-r' l^2 - k' l) braket(l,l)\
    &=1/p sum_(l=0)^(p-1) omega^((r - r') l^2 + (k - k') l)\
    & = 1/p (sqrt(p)) = 1/sqrt(p)
$
This is a quadratic Gauss sum with nonzero quadratic coefficient $(r - r')$ (since $r != r'$) and $p$ prime. Such Gauss sums have magnitude $sqrt(p)$ as per classical number theory.
Thus, $cal(B)_r$ and $cal(B)_r'$ are mutually unbiased because absolute square of their inner product becomes $1/p$.

*Example ($p = 5$)*

For $p = 5$, we have $5 + 1 = 6$ MUBs:

1. The standard basis $ cal(B)_z = {ket(0), ket(1), ket(2), ket(3), ket(4)} $

2. The Fourier basis $cal(B)_(r= 0) = {ket(u_k ^(0})}_{k=0}^{4}$

$ &= {1/sqrt(5) sum_(l=0)^(4) omega^(0 l^2 + k l) ket(l)} = {1/sqrt(5) sum_(l=0)^(4) omega^(k l) ket(l)} \
&= {1/sqrt(5) vec(1, 1, 1, 1, 1), 1/sqrt(5) vec(1, omega, omega^2, omega^3, omega^4), 1/sqrt(5) vec(1, omega^2, omega^4, omega, omega^3), 1/sqrt(5) vec(1, omega^3, omega, omega^4, omega^2), 1/sqrt(5) vec(1, omega^4, omega^3, omega^2, omega)} $

where $omega = e^(2 pi i \/ 5)$ is a primitive fifth root of unity, $r$ show the basis, $k$ is column vector and $l$ is the component of the vector $k$.

3. The quadratic chirp bases $cal(B)_1, cal(B)_2, cal(B)_3, cal(B)_4$

$ cal(B)_1 = {ket(u_k ^(1)})}_{k=0}^{4} = {1/sqrt(5) sum_(l=0)^(4) omega^(1 l^2 + k l) ket(l)} \ $

$ { 1 / sqrt(5) vec(1, omega, omega^4, omega^4, omega),
1 / sqrt(5) vec(1, omega^2, omega, omega^2, 1),
1 / sqrt(5) vec(1, omega^3, omega^3, 1, omega^4),
1 / sqrt(5) vec(1, omega^4, 1, omega^3, omega^3),
1 / sqrt(5) vec(1, 1, omega^2, omega, omega^2)} $

$ cal(B)_2 = {ket(u_k ^(2)})}_{k=0}^{4} = {1/sqrt(5) sum_(l=0)^(4) omega^(2 l^2 + k l) ket(l)} \
= {1/sqrt(5) vec(1, omega^2, omega^3, omega^3, omega^2), 
1/sqrt(5) vec(1, omega^3, 1, omega, omega), 
1/sqrt(5) vec(1, omega^4, omega^2, omega^4, 1), 
1/sqrt(5) vec(1, 1,omega^4, omega^2, omega^4), 
1/sqrt(5) vec(1, omega, omega, 1, omega^3)} $

$ cal(B)_3 = {ket(u_k ^(3)})}_{k=0}^{4} = {1/sqrt(5) sum_(l=0)^(4) omega^(3 l^2 + k l) ket(l)} \
= {1/sqrt(5) vec(1, omega^3, omega^2, omega^2, omega^3), 
1/sqrt(5) vec(1, omega^4, omega^4, 1, omega^2), 
1/sqrt(5) vec(1, 1, omega, omega^3, omega), 
1/sqrt(5) vec(1, omega, omega^3, omega, 1), 
1/sqrt(5) vec(1, omega^2, 1, omega^4, omega^4)} $

$ cal(B)_4 = {ket(u_k ^(4)})}_{k=0}^{4} = {1/sqrt(5) sum_(l=0)^(4) omega^(4 l^2 + k l) ket(l)} \
= {1/sqrt(5) vec(1, omega^4, omega, omega, omega^4), 
1/sqrt(5) vec(1, 1, omega^3, omega^4, omega^3), 
1/sqrt(5) vec(1, omega, 1, omega^2, omega^2), 
1/sqrt(5) vec(1, omega^2, omega^2, 1, omega), 
1/sqrt(5) vec(1, omega^3, omega^4, omega^3, 1)} $ 

Now we there are no more that $p+1$ MUBs in dimension $p$ (prime). Let suppose there is a 7th basis $cal(B)_x$ which we create randomly, such that it is orthonormal then verify if that is mutually unbiased with the previous 6 bases.

The basis $cal(B)_X$ is given by the set of five vectors ${ket(v_k)}_{k=0}^4$, where $omega = e^(2pi i / 5) $.
$ cal(B)_X = {ket(v_k)}_{k=0}^4 $
$ ket(v_0) = 1/sqrt(5) (1, omega, omega^3, omega^2, omega^4) $
$ ket(v_1) = 1/sqrt(5) (1, omega^2, omega, omega^4, omega^3) $
$ ket(v_2) = 1/sqrt(5) (1, omega^3, omega^4, omega, omega^2) $
$ ket(v_3) = 1/sqrt(5) (1, omega^4, omega^2, omega^3, omega) $
$ ket(v_4) = 1/sqrt(5) (1, 1, 1, 1, 1) $

We can check that $cal(B)_X$ is orthonormal, but it is mutually unbiased with the standard basis $cal(B)_z$ only, but not with the other 5 bases. For example, check with Fourier basis $cal(B)_0, k = 1$ :

$ ket(v_0) = 1/sqrt(5) (1, omega, omega^3, omega^2, omega^4) $

$ ket(u_1 ^(0)) = 1/sqrt(5) (1, omega, omega^2, omega^3, omega^4) $

$ braket(v_0, u_1 ^(0)) = 1/5 (1 + omega^(-1) omega^1 + omega^(-3) omega^2 + omega^(-2) omega^3 + omega^(-4) omega^4)\ 
= 1/5 (1 + 1 + omega^(-1) + omega^1 + 1)\
= 1/5 (3 + omega^(-1) + omega^1)$

Taking the absolute square of the inner product:
$ abs(braket(v_0, u_1 ^(0)))^2 = abs(1/5(3 + omega^(-1) + omega^1))^2 $

Recall that $omega = e^(2 pi i / 5) = cos(2 pi / 5) + i sin(2 pi / 5)$ and $omega^(-1) = cos(2 pi / 5) - i sin(2 pi / 5)$, so

$ omega^(-1) + omega^1 = 2 cos(2 pi / 5) $
$ abs(1/5(3 + 2 cos(2 pi / 5)))^2 = 1/25 (3 + ( sqrt(5)-1)/2)^2\ = 1/25 ( (5 + sqrt(5))/2)^2\
= 0.7236... > 1/5 = 0.2 $
overlap is greater than $1/5$, so these two bases are not mutually unbiased. 

Thus, we have shown that for prime dimension $p$, there exist exactly $p+1$ mutually unbiased bases, and no more.
]
