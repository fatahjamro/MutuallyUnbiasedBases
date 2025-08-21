#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot
#import "@preview/quill:0.7.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/physica:0.9.5": *


#show: thmrules.with(qed-symbol: $square$)

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeeeee")).with(numbering: none)

#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em)).with(numbering: none)

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
]
#proof[ ...
 
]

#theorem([Horodecki @horodecki2022FiveOpenProblems])[
  There is a set of at least three mutually unbiased bases in the Hilbert space $CC^(d)$ for $d >= 2$.
]
#proof[
 Suppose we take $d = 2$, according to the theorem, no more than three mutually unbiased bases exist in $CC^2$ Hilbert space. Let's first identify the set of the three mutually unbiased bases, then show that any other basis can not be unbiased with all three of them.
 $ U = {U_0, U_1, U_2} $

 *Step 1: Defining the first basis (The computational basis)*


 Lets begin with a familiar orthonormal basis, the computational basis. We label this $U_0$: $ U_0 = {ket(0), ket(1) } $
 This basis corresponds to the eigenbasis of the Puali-Z operator.

 *Step 2: Defining a second mutually unbiased basis*

 A second basis, $U_1$, is mutually unbiased with $U_0$ if the squared inner product between any state from $U_1$ and any state from $U_0$ is equal to $1/d = 1/2$. A good candidate is the Hadamard basis, which corresponds to the eigenbasis of the Pauli-X operator: 
 $ U_1 = {ket(+), ket(-)} $ where $ket(+) = 1/sqrt(2)(ket(0) + ket(1))$ and $ket(-) = 1/sqrt(2)(ket(0)-ket(1))$.

 Let's verify the unbiased condition:

 $
  abs(braket(0,+))^2 = abs(braket(0,1/sqrt(2)(ket(0) + ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
  abs(braket(0,-))^2 = abs(braket(0,1/sqrt(2)(ket(0) - ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
  abs(braket(1,+))^2 = abs(braket(1,1/sqrt(2)(ket(0) + ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
  abs(braket(1,-))^2 = abs(braket(1,1/sqrt(2)(ket(0) - ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\

 $

 Since the condition holds for all pairs $U_0$ and $U_1$ are mutually unbiased.

*Step 3: Defining a third mutually unbiased basis*

Now, we seek third basis $U_2$ that is unbiased with both $U_0$ and $U_1$. The eigenbasis of the Pauli-Y operator works perfectly.
$ U_2 = {ket(+i), ket(-i)} $

where $ket(+i) = 1/sqrt(2)(ket(0) + i ket(1))$ and $ket(-i) = 1/sqrt(2)(ket(0) - i ket(1))$.
We can verify $U_2$ basis, the pairwise inner product with $U_0$ and $U_1$ that must equal to $1/2$.

$
abs(braket(0,+i))^2 = abs(braket(,1/sqrt(2)(ket(0) + i ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
abs(braket(0,-i))^2 = abs(braket(0,1/sqrt(2)(ket(0) - i ket(1))))^2 = abs(1/sqrt(2))^2 = 1/2\
abs(braket(1,+i))^2 = abs(braket(1,1/sqrt(2)(ket(0) + i ket(1))))^2 = abs(i/sqrt(2))^2 = 1/2\
abs(braket(1,-i))^2 = abs(braket(1,1/sqrt(2)(ket(0) - i ket(1))))^2 = abs(-i/sqrt(2))^2 = 1/2\
$ 
Unbiased condition satisfied $U_2$ and $U_0$, now lets repeat for $U_2$ and $U_1$

$
abs(braket(+,+i))^2 = abs(braket(1/sqrt(2)(ket(0) + ket(1)),1/sqrt(2)(ket(0) + i ket(1))))^2 = abs((1+i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\

abs(braket(+,-i))^2 = abs(braket(1/sqrt(2)(ket(0) + ket(1)),1/sqrt(2)(ket(0) - i ket(1))))^2 = abs((1-i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\

abs(braket(-,+i))^2 = abs(braket(1/sqrt(2)(ket(0) - ket(1)),1/sqrt(2)(ket(0) + i ket(1))))^2 = abs((1-i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\

abs(braket(-,-i))^2 = abs(braket(1/sqrt(2)(ket(0) - ket(1)),1/sqrt(2)(ket(0) - i ket(1))))^2 = abs((1+i)/2)^2 = (abs(1)^2 + abs(1)^2)/2^2 = 1/2\
$

Thus, we have found three mutually unbiased bases for $d = 2$

*Step 4: Proving a fourth mutually unbiased basis is impossible*

Now we show that it's impossible to construct a fourth basis, $U_3$, that is unbiased with $U_0$, $U_1$, and $U_2$.

For any new basis to be unbiased with $U_0$, its states must be of the form:
$ ket(psi) = 1/ sqrt(2)(ket(0) + e^(i phi) ket(1)) $
Where $phi$ is some real phase.

For this state to also be unbiased with $U_1$, we must have $ abs(braket(+, phi))^2 = 1/2 $

$ 
abs(1/2(bra(0) +bra(1))(ket(0)+e^(i phi) ket(1)))^2 = 1/2\
abs((1+e^(i phi))/2)^2 =1/2 #h(4mm) forall #h(4mm) e^(i phi) = cos(phi) +i sin(phi)\ 
abs((1+cos(phi) +i sin(phi)))^2 = 2\
(1+cos(phi))^2 + (sin(phi))^2 = 2\
1 + 2 cos(phi) + cos^2(phi) + sin^2(phi) = 2\
1+1 +2 cos(phi) = 2\
cos(phi) = 0\

$
This means the phase angle $phi$ must be either $pi/2, (3pi)/2 text("(or its equivalent," -pi/2))$.

Finally, for the state to also be unbiased with $U_2$, we check the condition for $phi= pi/2 => ket(psi) = ket(0)+i ket(1)$, So,

$
abs(braket(+i, psi))^2 = abs(1/2(bra(0) - i bra(1))(ket(0)+ i ket(1)))^2  = abs((1 - i^2)/2)^2 = abs(2/2)^2 = 1
$

Since its not equal to $1/2$, the state $psi$ for phase $phi = pi/2$ is not unbiased with $U_2$, the same logic applies to $phi = (3pi)/2$

The only possible candidates for for new mutually unbiased bases were the eigenbases of Pauli-X, and Pauli -Y operators, which we already proved. Therefore, no 4th basis for d=2 can exist. 


== Mutually unbiased bases for $d = 3$

We can construct mutually unbiased bases for $d = 3$ with various well established methods, such as:

=== Weyl-Heisenberg (or generalized Pauli operator): 
It is the standard technique for prime dimensions. It uses the shift and phase operators $X$ and $Z$, along with their products $X Z^a$ for 
$a=0,1,…,d-1$, to generate eigenbases that are mutually unbiased. This method scales well with prime $d$ and is algebraically elegant.

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

$ B_0 = [
  (1, 0, 0),
  (0, 1, 0),
  (0, 0, 1)
]
$

*Fourier basis  $B_1$  (columns of F)*
$ B_1 = 1/sqrt(3) * [
  (1, 1, 1),
  (1, omega, omega^2),
  (1, omega^2, omega)
] $

* Quadratic-phase Fourier  $ B_2 = diag(1, omega, omega) times B_1$ *

$ B_2 = 1/sqrt(3) * [
  (1, 1, 1),
  (omega, omega^2, 1),
  (omega, 1, omega^2)
] $

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

]