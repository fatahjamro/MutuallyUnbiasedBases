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

  == Mutually unbiased bases for $d = 3$

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

  == Construction of Mutually Unbiased Bases in $d=4$ via the Two-Qubit Pauli/Stabilizer Method

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

If $ket(Phi)$ and $ket(psi)$ are single qubit vectors from different Pauli eigenbases, $abs(braket(Phi, psi))^2 = 1\/sqrt(2)$ and for tensor products across $a$ qubits, the inner products factorize, so the magnitude becomes $(1\/sqrt(2))^a = 1 \/sqrt(2^a)$. Thus these three bases MUB in $2^a$

]
