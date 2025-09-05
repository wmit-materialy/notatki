---
title: "EGA: Notatki z przedmiotu Elementy Geometrii Analitycznej"
date: 2023-10-25 – 2024-01-17
toc: true
toc-own-page: true
titlepage: true
lang: pl
---

# Przedmowa {-}

To są notatki z przedmiotu Elementy Geometrii Analitycznej prowadzonego na
kierunku IAD w 2023/2024 roku przez dr Magdalenę Sobczak-Kneć. Treści obejmują 6
wykładów.

Notatki znajdują się w **domenie publicznej** na warunkach licencji CC0 1.0
Universal[^license-link]. Kod źródłowy można znaleźć w repozytorium na GitHub
<https://github.com/wmit-materialy/notatki>

[^license-link]: <https://creativecommons.org/publicdomain/zero/1.0/deed.pl>

```{=latex}
\newpage
```

2023-10-25

# Iloczyn mieszany

Iloczyn mieszany
: Iloczynem mieszanym trójki wektorów $\vec{a}, \vec{v}, \vec{w}$ nazywamy
  **liczbę** określoną w następujący sposób
  $$
    \left(  \vec{u} \vec{v} \vec{w} \right) =
    (\vec{u} \times \vec{v} ) \circ \vec{w}
  $$

: Dla wektorów w $\mathbb{R}^3 \quad
  \begin{aligned}
     &\vec{u} =[u_{1}, u_{2}, u_{3}],\\&
     \vec{v} =[v_{1}, v_{2}, v_{3}],\\&
     \vec{w} =[w_{1}, w_{2}, w_{3}]
   \end{aligned}$ zachodzi równość
  $$
  (\vec{u} \vec{v} \vec{w}) =
  \begin{vmatrix}
    u_{1} & u_{2} & u_{3} \\
    v_{1} & v_{2} & v_{3} \\
    w_{1} & w_{2} & w_{3} \\
  \end{vmatrix}
  $$

Własności iloczynu mieszanego wynikają bezpośrednio z własności iloczynów
wektorowego i skalarnego

::: {.caution title="" ref=""}

Z definicji wynika, że długość iloczynu wektorowego wektorów $\vec{u}$ i
$\vec{v}$ jest równa polu równoległoboku rozpiętego przez wektory $\vec{u}$,
$\vec{v}$.

Z kolei liczba $\left| (\vec{u} \vec{v} \vec{w} ) \right|$ jest równa objętości
równoległościanu rozpiętego na tych wektorach.

Liczba ${1 \over 6} \left| (\vec{u} \vec{v} \vec{w} ) \right|$ jest równa
objętości czworościanu rozpiętego przez wektory $\vec{u}, \vec{v}, \vec{w}$

:::

::: {.theorem title="" ref=""}

Wektory $\vec{u} ,\vec{v} ,\vec{w}$ są współpłaszczyznowe wtedy i tylko wtedy,
gdy ich iloczyn $(\vec{u}\vec{v}\vec{w}) = 0$

:::

::: {.example title="" ref=""}

Dane są trzy wierzchołki czworościanu $A(4, 0, -2), B(6, -2, 2), C(4, -4, 6)$.
Wyznacz czwarty wierzchołek $D$ wiedząc, że leży on na osi $oy$, a objętość
czworościanu jest równa $40$.

$$D \in OY \iff D(0, y, 0)$$

$$V = 40$$

$$V = \frac{1}{6}\left| (\overrightarrow{AB}\overrightarrow{AC}\overrightarrow{AD}) \right|$$

$$\overrightarrow{AB} = [2, -2, 4]$$

$$\overrightarrow{AC} = [0, -4, 8]$$

$$\overrightarrow{AD} = [-4, y, 2]$$

$$
\begin{aligned}
	\left| (\overrightarrow{AB}, \overrightarrow{AC}, \overrightarrow{AD}) \right|
	 & = \begin{vmatrix}
		     2  & -2 & 4 \\
		     0  & -4 & 8 \\
		     -4 & y  & 2 \\
	     \end{vmatrix}
	= 2 \cdot \begin{vmatrix}
		          -4 & 8 \\ y & 2
	          \end{vmatrix} +
	2 \cdot \begin{vmatrix}
		        0 & 8 \\ -4 & 2
	        \end{vmatrix} +
	2 \cdot \begin{vmatrix}
		        0 & -4 \\ -4 & y
	        \end{vmatrix}                \\
	 & = 2(-8 -8y) + 2(0 + 32) + 4(0 - 16)
	= -16 -16y + 64 - 64
	= -16 -16y
\end{aligned}
$$

$$
\left(V = \frac{1}{6}\left| -16 -16y \right|\right)
\land \left( V = 40 \right)
\implies \frac{1}{6}\left| -16 - 16y \right| = 40
$$

$$\left| 16 + 16y \right| = 240$$
$$16 + 16y = 240 \lor 16 + 16y=-240$$
$$y = 14 \lor y = -16$$
$$D_1(0, 14, 0)$$
$$D_2(0, -16, 0)$$

:::

---

$$
  \frac{1}{6}(\vec{u} \vec{v} \vec{w} )
= \frac{1}{3} \cdot \frac{3}{2} (\vec{u} \times \vec{v} ) \cdot h
$$

$$h = {(\vec{u} \vec{v} \vec{w}) \over \left| \vec{u} \times \vec{v} \right| }$$

Równoległościan

$$ V = P_p \cdot h $$
$$ V = \left| \vec{u} \times \vec{v} \right| \cdot h $$

z drugiej strony

$$ V = \left| (\vec{u} \vec{v} \vec{w} ) \right| $$
$$h = {\left| (\vec{u} \vec{v} \vec{w} ) \right| \over \vec{u}\times\vec{v} }$$

# Prosta i płaszczyzna w $\mathbb{R}^3$

Prosta w $\mathbb{R}^3$
: o wektorze kierunkowym
  $\vec{v} \neq \vec{0}$ przechodzącą przez punkt $A$ nazywamy zbiór
  $p = \{X \in \mathbb{R}^3: X = A + t\cdot \vec{v}, t \in \mathbb{R}\}$

: Prostą przechodzącą przez dwa punkty $A, B$ różne od siebie rozumieć będziemy
  jako prostą o wektorze kierunkowym $\overrightarrow{AB}$ i przechodzącą przez
  punkt $A$

Równanie parametryczne
: Jeżeli punkt $A$ ma współrzędne $A(a_{1},a_{2},a_{3})$, zaś wektor $\vec{v}$ ma
  współrzędne $\vec{v} =[v_{1}, v_{2}, v_{3}]$, to równanie prostej $p$ możemy
  zapisać w postaci
  $$
  p
  \begin{cases}
    x_1 = a_1 + tv_1 \\
    x_2 = a_2 + tv_2 \\
    x_3 = a_3 + tv_3
  \end{cases} t \in \mathbb{R}
  .
  $$
  W ten sposób otrzymaliśmy równanie prostej $p,$ które nazywamy równaniem
  parametrycznym

Równanie kierunkowe
: Z równań parametrycznych prostej można formalnie wyliczyć parametr $t$ i
  porównując ze sobą otrzymać:
  $$
  \frac{x_1 - a_1}{v_1}
  = \frac{x_2 - a_2}{v_2}
  = \frac{x_3 - a_3}{v_3}
  = t
  .
  $$
  Równanie powyższe określamy jako równanie kierunkowe prostej $p$.

::: {.caution title="" ref=""}

Dla prostej w $\mathbb{R}^3$ [nie istnieje]{.underline} równanie
ogólne(np jak dla prostej w $\mathbb{R}^2$: $y = kx + b$)

:::

## Przykład

::: {.example title="" ref=""}

znaleźć równania prostej przechodzącej przez punkt $A(0, 0, -2)$ i prostopadłej
do wektorów $\vec{a} = [0, 1, -5]$ i $\vec{b} = [-2, 3, 0]$

Wektor kierunkowy $\vec{v}$ możemy przyjąć wektor $\vec{a} \times \vec{b}$

$$
\begin{aligned}
	\vec{a} \times \vec{b}
	= \begin{vmatrix}
		  \vec{i} & \vec{j} & \vec{k} \\
		  0       & 1       & -5      \\
		  -2      & 3       & 0
	  \end{vmatrix}
	= \text{rachunek wyniku}
	= 15 \vec{i}  + 10 \vec{j}  + 2 \vec{k}
\end{aligned}
.
$$

$$
p
\begin{cases}
	 x_1 = 15t   \\
	 x_{2}=10t   \\
	 x_3=-2 + 2t
\end{cases} t \in \mathbb{R}.
.
$$

Równanie kierunkowe

$$\frac{x_1}{15} = \frac{x_2}{10} = {x_3 + 2\over 2}$$

:::

::: {.caution title="" ref=""}
Jeżeli wektor kierunkowy ma wśród współrzędnych zero np.
$\vec{v} = [v_{1}, v_{2}, 0]$, $A(a_1, a_2, a_3)$, to równanie kierunkowe ma
postać
$$
  \frac{x_{1}-a_{1}}{v_{1}}
  = \frac{x_{2} - a_{2}}{v_{2}}
  = \frac{x_{3}-a_{3}}{0}.
$$
Zaś parametryczne ma postać
$$
  p
  \begin{cases}
     x_{1}=v_{1}t+a_{1} \\
     x_{2}=v_{2}t+a_{2} \\
     x_{3}=a_{3}
  \end{cases} \quad t \in \mathbb{R}.
$$

:::

## Płaszczyzna w $\mathbb{R}^3$

Płaszczyzna w $\mathbb{R}^3$
: Ustalmy w $\mathbb{R}^3$ punkt A i dwa wektory $\vec{u}, \vec{v}$ liniowo
  niezależne. Płaszczyznę $\pi w \mathbb{R}^3$ przechodzącą przez punkt $A$ i
  rozpiętą przez niewspółliniowe wektory $\vec{u}, \vec{v}$ nazywamy zbiór
  $$
    \pi = \{X \in \mathbb{R}^3: X = A + t\cdot \vec{u} +s\cdot \vec{v}; t ,s\in \mathbb{R}\}
  $$

: Płaszczyzną wyznaczoną przez trzy niewspółliniowe punkty $A, B, C$ rozumieć
  będziemy jako płaszczyznę rozpiętą przez wektor
  $\overrightarrow{AB}, \overrightarrow{AC}$
  $$
    X = A + t \vec{u} + s \vec{v}, \qquad t, s \in \mathbb{R}.
  $$

Równanie parametryczne
: Zapiszemy we współrzędnych $X(x_{1}, x_{2}, x_{3})$, $A(a_{1}, a_{2}, a_{3})$,
  $\vec{u} = [u_{1}, u_{2}, u_{3}]$, $\vec{v} = [v_{1}, v_{2}, v_{3}]$:
  $$
  \pi =
  \begin{cases}
    x_{1}=a_1 + t u_1 + s v_{1} \\
    x_{2}=a_2 + t u_2 + s v_{2} \\
    x_{3}=a_3 + t u_3 + s v_{3}
  \end{cases} t, s \in \mathbb{R}
  .
  $$
  Otrzymaliśmy równanie parametryczne płaszczyzny

Kolejnym z równań płaszczyzny jest tzw. równanie wyznacznikowe w $\mathbb{R}^3$

Równanie wyznacznikowe
: Zauważmy, że płaszczyznę w $\mathbb{R}^3$ przechodzącą przez punkt $A$ i
  rozpiętą przez niewspółliniowe wektory $\vec{u}, \vec{v}$ możemy opisać
  warunkiem
  $$
    (\overrightarrow{AX}, \vec{u} ,\vec{v} ) = 0.
  $$
  zapisując we współrzędnych
  $$
    \begin{vmatrix}
      x_1 - a_1 & x_2 - a_2 & x_3 - a_3 \\
      u_1       & u_2       & u_3       \\
      v_1       & v_2       & u_3
    \end{vmatrix} =
    0.
  $$
  Rozwijając względem pierwszego wiersza mamy:

  $$
    \begin{aligned}
      \begin{vmatrix}
        x_1 - a_1 & x_2 - a_2 & x_3 - a_3 \\
        u_1       & u_2       & u_3       \\
        v_1       & v_2       & u_3
      \end{vmatrix} & =
      (x_1 - a_1)
      \underbrace{
        \begin{vmatrix}
          u_2 & u_3 \\
          v_2 & v_3
        \end{vmatrix}}_A +
      (x_2 - a_2)
      \underbrace{
        \begin{vmatrix}
          u_1 & u_3 \\
          v_1 & v_3
        \end{vmatrix}}_B +
      (x_3 - a_3)
      \underbrace{
        \begin{vmatrix}
          u_1 & u_2 \\
          v_1 & v_2
        \end{vmatrix}}_C\\ \\
    \end{aligned}.
  $$
  $$
    D =
    a_1\begin{vmatrix}
      u_2 & u_3 \\
      v_2 & v_3
    \end{vmatrix} +
    a_2\begin{vmatrix}
      u_1 & u_3 \\
      v_1 & v_3
    \end{vmatrix} +
    \begin{vmatrix}
      u_1 & u_2 \\
      v_1 & v_2
    \end{vmatrix}.
  $$

Równanie ogólne
: Porządkując otrzymujemy równanie postaci $Ax_{1} + Bx_{2} + Cx_{3} + D = 0$,
  które nazywamy równaniem ogólnym płaszczyzny w $\mathbb{R}^3$

Wektor normalny płaszczyzn
: Zauważmy, że współrzędne $A, B, C$ są w równaniu ogólnym współrzędnymi wektora
  $\vec{n} = \vec{u} \times \vec{v}$ prostopadłego do płaszczyzny $\pi$. Wektor
  ten nazywamy wektorem normalnym płaszczyzny $\pi$

---

2023-11-08

## Równanie odcinkowe

Równanie normalne płaszczyzny $\pi$ odcinającej na osiach $ox, oy, oz$ układu
współrzędnych odcinki zorientowane $a, b, c \neq 0$ ma postać

$$
  \frac{x}{a} + \frac{y}{b} + \frac{z}{c} = 1
$$

::: {.example title="" ref=""}

Znaleźć równanie płaszczyzny przechodzącej przez środek odcinka
$\overrightarrow{AB}$, gdzie $A(3, 2, -1)$ i $B(5, 0, 7)$ i prostopadłej do tego
odcinka

$$
\pi \perp \overrightarrow{AB}
$$

$$
\overrightarrow{AB}=[2, -2, 8]
$$

$$
S: \begin{cases}
x_S &= \frac{x_A+x_B}{2} = 4\\
y_S &= \frac{y_A+y_B}{2} = 1\\
z_S &= \frac{z_A+z_B}{2} = 3
\end{cases} \text{ – punkt przecięcia płaszczyzny prostą}
$$

Równanie Ogólne

$$
\begin{aligned}
&\pi.\ \ 2(x-4) - 2(y-1) + 8(z-3) = 0\\
&x-4-y+1-4z-12 = 0\\
&\pi.\ \ x - y + 4z - 15 = 0
\end{aligned}
$$

Równanie odcinkowe

$$
\begin{aligned}
x - y + 4z - 15 = 0\\
x - y + 4z = 15\\
\frac{x}{15} + \frac{y}{-15} + \frac{z}{\frac{15}{4}} =1
\end{aligned}
$$

:::

::: {.example title="" ref=""}

Napisać równanie płaszczyzny przechodzącej przez punkt $(0,0,0)$ oraz
równoległej do wektorów $\vec{u} = [1, 2, 3]$ i $\vec{v} = [0, -1, 2]$

Równanie parametryczne płaszczyzny

$$
  \pi :
  \begin{cases}
  x = 0 + 1\cdot t + 0\cdot s\\
  y = 0 + 2\cdot t + -1\cdot s\\
  z = 0 + 3\cdot t + 2\cdot s
  \end{cases} s, t \in \mathbb{R}
$$

$$
  \pi :
  \begin{cases}
  x = t\\
  y = 2\cdot t + -1\cdot s\\
  z = 3\cdot t + 2\cdot s
  \end{cases} s, t \in \mathbb{R}
$$

Znajdziemy wektor normalny $\vec{n}: \vec{n} \perp \pi$.
Ponieważ $(\vec{u} \parallel \pi) \land (\vec{v} \parallel \pi)$, to
$(\vec{n} \perp  \vec{u}) \land (\vec{n} \perp \vec{v})$

$$
  \vec{n} =\vec{u} \times \vec{v} =
  \begin{vmatrix}
  \vec{i} & \vec{j} & \vec{k} \\
  1 & 2 & 3\\
  0 & -1 & 2
  \end{vmatrix} =
  \text{...obliczenia...} =
  7 \vec{i} -2 \vec{j} -\vec{k}
$$

$$
  \vec{n} =[7, -2, -1]
$$

$$
  \pi : 7x - 2y -z = 0
$$

:::

---

## Pęk płaszczyzn

Pęk płaszczyzn równoległych
: w $\mathbb{R}^3$ nazywamy zbiór wszystkich płaszczyzn równoległych do danej
  płaszczyzny

Pękiem płaszczyzn przecinających się wzdłuż krawędzi $p$
: nazywamy zbiór wszystkich płaszczyzn zawierających prostą $p$

Jeżeli
$\displaystyle
\begin{aligned}
  \pi_1: A_1x+A_2y + A_3z + A_4=0\\
  \pi_1: B_1x+B_2y + B_3z + B_4=0
\end{aligned}$
są płaszczyznami przecinającymi się, to
$$
  p:
  \begin{cases}
    \pi_1: A_1x+A_2y + A_3z + A_4=0\\
    \pi_1: B_1x+B_2y + B_3z + B_4=0
  \end{cases}
$$

przedstawia równanie krawędziowe prostej $p$, będącej częścią wspólną $\pi_1$ i
$\pi_2$

::: {.example title="" ref=""}

Znaleźć równanie płaszczyzny przechodzącej przez punkt $A(2, -1, 1)$ i
prostopadłej do prostej
$$
  \begin{cases}
    x - 2y + z - 3 = 0\\
    x + y - z + 2
  \end{cases}\qquad
  \begin{aligned}
    \vec{n}_1 = [1, -2, 1]\\
    \vec{n}_2 = [1, 1, -1]
  \end{aligned}
$$

$$
 \vec{n}_1 \perp p \land \vec{n}_2 \perp p
$$

Wektor kierunkowy prostej $p$ jest prostopadły do $\vec{n}_1$ i $\vec{n}_2$

$$
\vec{v} = \vec{n}_1 \times \vec{n}_2 =
\begin{vmatrix}
	\vec{i} & \vec{j} & \vec{k} \\
	1       & -2      & 1       \\
	1       & 1       & -1
\end{vmatrix} = \text{...obliczenia...} =
\vec{i} + 2 \vec{j} + 3 \vec{k}
$$

$$
 \vec{v} =[1, 2, 3]
$$

Niech $y = 0$

$$
\begin{aligned}
	+\underline{\begin{cases}
			            x + 2 = 3 \\
			            x-2=-2
		            \end{cases}}           \\
	2x = 1 \Rightarrow x = \frac{1}{2} \\
	2z = 5                             \\
	z = \frac{5}{2}
\end{aligned}
$$

Równanie parametryczne prostej $p$

$$
\begin{cases}
x = \frac{1}{2} + t\\
y = 2t\\
z = \frac{5}{2} + 3t
\end{cases},\;\;\; t \in \mathbb{R}
$$

Szukana płaszczyzna $\perp p$

$$
 \vec{n}_\pi = v_p \perp \pi
$$

$$
\begin{aligned}
\pi: &(x-2) +2(y+1) + 3(z-1) = 0\\
&\underline{x + 2y + 3z -3 = 0}
\end{aligned}
$$

:::

::: {.example title="" ref=""}

Obliczyć odległość punktów $P_0(3, 4, 2)$ od prostej

$$
l:
\begin{cases}
x = -2+t\\
y=1+t\\
z=3-3t
\end{cases}\ \ \ t\in \mathbb{R}
$$

$$
 \left| \overrightarrow{PP_0} \right| = d
$$

Napiszemy równanie płaszczyzny $\pi$ takiej, że

$$
 P_0 \in \pi \land \pi \perp l
$$

$$
\vec{v}_l = [1, 1, -3] = \vec{n}_\pi
$$

$$
 \pi :
\begin{aligned}
&(x-3) + (y - 4) + (z - 2) = 0\\
&x + y -3z - 1 = 0
\end{aligned}
$$

Punkt $P$ będący rzutem punktu $P_0$ na prostą $l$ jest punktem wspólnym
płaszczyzny $\pi$ i prostej $l$ (punkt przebicia płaszczyzny prostej l)

$$
\begin{aligned}
&-2 + t + 1 + t - 3(3-3t) - 1 = 0\\
&t = 1
\end{aligned}
$$

$$
P(-1, 2, 0)
$$

$$
  d(P_0, l) = \left| PP_0 \right| =
  \sqrt{(3+1)^2 + (4-2)^2 + (2-0)^2} =
  \sqrt{16 4 + 4} =
  \sqrt{24} =
  2\sqrt{6}
$$

:::

# Przekształcenia afiniczne w przestrzeni Euklidesowej

Niech $X$ będzie zbiorem $f: X \to X$ nazwiemy przekształceniem jeżeli funkcja
ta jest iniekcją (funkcją różnowartościową) i jest surjekcją, to znaczy jest
bijekcją

Rozważmy następujące odwzorowanie przestrzeni euklidesowej $f: E^n \to E^n$
w siebie.
Jeżeli odwzorowanie $f_* : TE^n \to TE^n$ (zbiór wektorów swobodnych określonych
na przestrzeni $E^n$)

$$
 [\overrightarrow{XY}] \to [\overrightarrow{f(X)f(Y)}]
$$

jest określone poprawnie w tym sensie, że nie zależy od wyboru reprezentanta
$\overrightarrow{XY}$ wektora swobodnego $[\overrightarrow{XY}]$ to nazywamy je
odwzorowaniem indukowanym odwzorowania $f$. Gdy $f_*$ jest automorfizmem
przestrzeni wektorowej $TE^n$, to $f$ nazywamy przekształceniem afinicznym
przestrzeni euklidesowej $E^n$

---

2023-11-22

## Odwzorowanie liniowe

Rozważmy dwie przestrzenie wektorowe $V, W$.

Odwzorowanie liniowe
: Odwzorowaniem liniowym $A : V \to W$ nazwiemy odwzorowanie, które spełnia
  warunki:

  1. addytywność

     $$
       \bigwedge_{v_1, v_2 \in V} A(v_1 + v_2) = A(v_1) + A(v_2)
     $$
  2. jednorodność
     $$
       \bigwedge_{\lambda \in \mathbb{R}}
       \bigwedge_{v \in V}
       A(\lambda \cdot v) = \lambda \cdot A(v)
     $$

Izomorfizm liniowy
: Izomorfizmem liniowym nazywamy odwzorowanie liniowe $A : V \to W$, które jest
  bijekcją

Automorfizm liniowy
: Automorfizmem liniowym nazywamy izomorfizm liniowy $A : V \to V$.
  Innymi słowy taki izomorfizm liniowy $A : V \to W$, że $V = W$

## Zapis odwzorowania liniowego we współrzędnych wektorowych

Ustawny w przestrzeniach wektorowych $V, W$ bazy odpowiednio
$V \{\overline{a}_1, \overline{a}_2, \overline{a}_3, \ldots, \overline{a}_n \}$ i
$W \{\overline{b}_1, \overline{b}_2, \overline{b}_3, \ldots, \overline{b}_n \}$

$\overline{v}=v_{1}\overline{a_{1}} + v_{2}\overline{a_{2}} + \ldots + v_{n}\overline{a_{n}}$

$$
\begin{aligned}
A(\overline{v}) &=
A(v_{1} \overline{a}_1 + v_{2} \overline{a}_2 + \ldots + v_{n} \overline{a}_n)  \\&\overset{\text{addytywność}}{=}
A(v_{1}\overline{a_1}) + A(v_{2}\overline{a_2}) + \ldots + A(v_{2}\overline{a_2})  \\&\overset{\text{jednorodność}}{=}
v_1 A(\overline{a_{1}}) + v_2 A(\overline{a_{2}}) + \ldots + v_n A(\overline{a_{n}})
\end{aligned}
$$

Każde odwzorowanie liniowe jest jednoznacznie określone przez podanie jego
wartości na wektorach pewnej bazy przestrzeni wektorowej $V$, tzn $A(\overline{a_1}), \ldots, A(\overline{a_n})$

Każdy z tych wektorów jako wektor przestrzeni $W$ da się zapisać przy użyciu
bazy $B(\overline{a_1}), \ldots, B(\overline{a_n})$

$$
\begin{aligned}
&A(\overline{a_1}) =
a_{11} \overline{b}_1 + a_{12}\overline{b}_2 + \ldots + a_{1n} \overline{b_{n}}\\
&A(\overline{a_2}) =
a_{21} \overline{b}_1 + a_{22}\overline{b}_2 + \ldots + a_{2n} \overline{b_{n}}\\
&\vdots\\
&A(\overline{a_n}) =
a_{n1} \overline{b}_1 + a_{n2}\overline{b}_2 + \ldots + a_{nn} \overline{b_{n}}\\
\end{aligned}
$$

$$
\begin{bmatrix}
a_{11} & a_{12} & \ldots & a_{1n}\\
a_{21} & a_{22} & \ldots & a_{2n}\\
\vdots & \vdots & \ddots & \vdots\\
a_{n1} & a_{n2} & \ldots & a_{nn}\\
\end{bmatrix}
$$

## Warunek na automorfizmem

Odwzorowanie $A$ jest automorfizmem, jeżeli wyznacznik macierzy odwzorowania
jest różny od zera.

Można podać macierzy zapis odwzorowania liniowego
$$
  A(\overline{v}) =
  \begin{bmatrix}
    w_{1} \\w_{2}\\ \vdots\\w_n
  \end{bmatrix} =
  \begin{bmatrix}
    a_{11} & a_{12} & \ldots & a_{1n} \\
    a_{21} & a_{22} & \ldots & a_{2n} \\
    \vdots & \vdots & \ddots & \vdots \\
    a_{n1} & a_{n2} & \ldots & a_{nn} \\
  \end{bmatrix} \cdot
  \begin{bmatrix}
    v_{1} \\v_{2}\\ \vdots\\v_n
  \end{bmatrix}
$$

gdzie

$$
	A(\overline{v}) = \overline{w} = \begin{bmatrix}
		w_{1} \\w_{2}\\ \vdots\\w_n
	\end{bmatrix}\qquad\qquad
	\overline{v} = \begin{bmatrix}
		v_{1} \\v_{2}\\ \vdots\\v_n
	\end{bmatrix}
$$

## Odwzorowanie indukowane

Na podstawie definicji przekształcenia afinicznego odwzorowanie indukowane $f_*$
tego przekształcenia jest określone wzorem:

$$
  f_*([\overline{AB}]) = [\overline{f(A)f(B)}]
$$

## Postać ogólna przekształcenia afinicznego

W przestrzeni euklidesowej n-wymiarowej $E^n$ ustalmy dwa punkty $O, X \in E^n$.
Wtedy dla przekształcenia afinicznego $f : E^n \to E^n$ mamy
$f_*(\overrightarrow{OX}) = [f(O)f(X)]$

Wykorzystując afinicznej sumy (punktu i wektora) powyższą równość możemy zapisać
w postaci
$$
  f(X) = f(O) + f_*(\overline{OX})
$$

Otrzymany zapis nazywamy postacią ogólną przekształcenia afinicznego

## Odwzorowanie w $E^3$ i $E^2$

Pokażemy że każde przekształcenie afiniczne można zapisać przy użyciu
współrzędnych afinicznych przestrzeni Euklidesowej

Ustalmy w $E^3$ afiniczny układ współrzędnych $\{0, \overline{v}_{1}, \overline{v}_{2}, \overline{v}_{3}\}$

Zapiszemy odwzorowanie indukowane $f_*$:

$$
  \begin{cases}
    w_{1} = a_{11}\overline v_{1} + a_{12}\overline v_{2} + a_{13}\overline v_{3}\\
    w_{2} = a_{21}\overline v_{1} + a_{22}\overline v_{2} + a_{23}\overline v_{3}\\
    w_{3} = a_{31}\overline v_{1} + a_{32}\overline v_{2} + a_{33}\overline v_{3}
  \end{cases}
$$

Ponieważ $f_*$ jest automorfizmem, to

$$
  \begin{vmatrix}
    a_{11} & a_{12} & a_{13}\\
    a_{21} & a_{22} & a_{23}\\
    a_{31} & a_{32} & a_{33}
  \end{vmatrix} \neq 0
$$

Stąd otrzymujemy zapis przekształcenia afinicznego

$$
  f(X) = f(O) + f_*(\overline{OX})
$$

w postaci następującej:

$$
  f(X) = Y
$$

$$
\left\{
\begin{aligned}
y_1 = a_1 + a_{11}\overline x_1 + a_{12}\overline x_2 + a_{13}\overline x_3\\
y_2 = a_2 + a_{21}\overline x_1 + a_{22}\overline x_2 + a_{23}\overline x_3\\
y_3 = a_3 + a_{31}\overline x_1 + a_{32}\overline x_2 + a_{33}\overline x_3
\end{aligned}
\right.
$$

Jeżeli rozpatrujemy przestrzeń $E^2$, to odwzorowanie afiniczne jest postaci

$$
\left\{
\begin{aligned}
y_1 = a_1 + a_{11}\overline x_1 + a_{12}\overline x_2\\
y_2 = a_2 + a_{21}\overline x_1 + a_{22}\overline x_2\\
\end{aligned}
\right.
$$

::: {.example title="" ref=""}

Pokazać, że $f : E^2 \to E^2$ dane wzorem:

$$
f:
\left\{
\begin{aligned}
y_1 = a_1 + a_{11}x_1 + a_{12}x_2\\
y_2 = a_2 + a_{21}x_1 + a_{22}x_2\\
\end{aligned}
\right.
$$

przeprowadza prostą $p: \left\{\begin{aligned} x_1 = p_1 + tv_1\\ x_2 = p_2 + tv_2 \end{aligned}\right.$
w zbiór, który jest prostą

$$
\begin{aligned}
f(p):
& \begin{cases}
y_1 = a_1 + a_{11}(p_1 + tv_1) + a_{12}(p_2 + tv_2)\\
y_2 = a_2 + a_{21}(p_1 + tv_1) + a_{22}(p_2 + tv_2)\\
\end{cases}
\\&\iff
\begin{cases}
y_1 = a_1 + a_{11}\cdot p_1 + a_{11}\cdot tv_1 + a_{12}\cdot p_2 + a_{12}\cdot tv_2\\
y_2 = a_2 + a_{21}\cdot p_1 + a_{21}\cdot tv_1 + a_{22}\cdot p_2 + a_{22}\cdot tv_2
\end{cases}
\\&\iff
\begin{cases}
y_1 = a_1 + a_{11}\cdot p_1 + a_{12}\cdot p_2 + t(a_{11}v_{1}+a_{12}v_{2})\\
y_2 = a_1 + a_{21}\cdot p_1 + a_{22}\cdot p_2 + t(a_{21}v_{1}+a_{22}v_{2})
\end{cases}
\end{aligned}
$$

$f(p)$ przechodzi przez punkt
$\begin{aligned}
&(a_1 + a_{11}\cdot p_1 + a_{12}\cdot p_{2}\\
&, a_1 + a_{21}\cdot p_1 + a_{22}\cdot p_{2})
\end{aligned}$

$$
\vec{w} = [a_{11}v_{1}+a_{12}v_{2}, a_{21}v_{1} + a_{22}v_{2}]
$$

:::

## Własności przekształceń afinicznych

I.    Przekształcenia afiniczne przeprowadzają proste w proste, a płaszczyzny w
      płaszczyzny.

II.   Przekształcenie afiniczne zachowuje równoległość prostych i płaszczyzn.

III.  Przekształcenie afiniczne zachowuje zachowuje stosunek podziału pary
      punktów(lub wektora), tzn.
      $$
        \lambda _{AB}(C) = \lambda _{f(A)f(B)}(f(C))
      $$
      W szczególności środek odcinka $AB$ przechodzi w środek odcinka $f(A)f(B)$


IV.   Przekształcenie afiniczne jest bijekcją.

V.    Przekształcenie odwrotne do przekształcenia afinicznego jest
      przekształceniem afinicznym przy czym:
      $$
        (f^{-1})_* = (f_*)^{-1}
      $$

VI.   Jednością w grupach przekształceń afinicznych jest przekształcenie
      identycznościowe $I : E^n \to E^n$, takie, że
      $I(X) = I(O) + I_*(\overline{OX}) = X$

VII.  Złożenie przekształceń afinicznych jest przekształceniem afinicznym, przy
      czym
      $$
        (f\circ g)_* = (f_*\circ g_*)
      $$

VIII. Składanie przekształceń afinicznym jest działaniem łącznym, tzn:
      $$
        (f \circ g) \circ h = f \circ (g \circ h)
      $$

IX.   Jeżeli w $E^2$ dane są trzy punkty $A, B, C$ niewspółliniowe oraz trzy
      punkty $D, E, F$ niewspółliniowe, to istnieje dokładnie jedno odwzorowanie
      afiniczne $f: E^2 \to E^2$, takie, że
      $\begin{aligned}
      f(A) = D\\
      f(B) = E\\
      f(C) = F
      \end{aligned}$

      $$
      \left\{
      \begin{aligned}
      y_1 = a_1 + a_{11}x_1 + a_{12}x_2\\
      y_2 = a_1 + a_{21}x_1 + a_{22}x_2
      \end{aligned}
      \right.
      $$

      w $E^3$ jeżeli dane są dwa układy punktów $\{A_1, A_{2}, A_{3}, A_{4}\}$ i
      $\{B_1, B_{2}, B_{3}, B_{4}\}$ niewspółliniowe, to istnieje dokładnie jedno
      odwzorowanie afiniczne $f: E^3 \to E^3$, takie, że $f(A_1) = B_1, f(A_2) = B_2,
      f(A_3) = B_3, f(A_4) = B_4$

---

2023-12-13

## Twierdzenie

::: {.theorem title="" ref=""}

Przekształcenia afiniczne $f : E^2 \to E^2$ postaci

$$
	f:
	\begin{cases}
		y_1 = a_{11}x_1 + a_{12}x_2 + a_1 \\
		y_1 = a_{21}x_1 + a_{22}x_2 + a_2
	\end{cases}
$$

Zmieniają pole równoległoboków w skali

$$
	k =
	\underbrace{\begin{Vmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{Vmatrix}}
	_\text{wartość bezwzględna z wyznacznika}
$$

:::

::: {.theorem title="" ref=""}

Przekształcenia afiniczne $f : E^3 \to E^3$ postaci
$$
	f:
	\begin{cases}
		y_1 = a_{11}x_1 + a_{12}x_2 + a_{13}x_2 + a_1 \\
		y_1 = a_{21}x_1 + a_{22}x_2 + a_{23}x_2 + a_2 \\
		y_1 = a_{31}x_1 + a_{32}x_2 + a_{33}x_2 + a_3
	\end{cases}
$$

zmienia objętość równoległościanu (ewentualnie czworościanu) w skali

$$
k = \begin{Vmatrix}
a_{11} & a_{12} & a_{13}\\
a_{21} & a_{22} & a_{23}\\
a_{31} & a_{32} & a_{33}\\
\end{Vmatrix}
$$

:::

## Zmiana orientacji

Mówimy, że przekształcenie afiniczne $f$ zachowuje orientację jeżeli jego
przekształcenie indukowane $f_*$ przeprowadza każdą bazę w bazę zgodnie
orientowaną, natomiast $f$ zmienia orientację jeżeli $f_*$ przeprowadza każdą
bazę w bazę zorientowaną przeciwnie.

Można udowodnić, że $[a_{ij}]$ jest macierzą odwzorowania afinicznego, to

1. $f$ zachowuje orientację gdy $\det [a_{ij}] > 0$
2. $f$ zmienia orientację gdy $\det [a_{ij}] < 0$

## Przykłady przekształceń afinicznych

::: {.example title="" ref=""}
Tożsamość w $E^2$

$$
	f:
	\begin{cases}
		y_1 = x_1 \\
		y_2 = x_2
	\end{cases} \iff
	\underbrace{\begin{bmatrix}
			1 & 0 \\ 0 & 1
		\end{bmatrix}}_\text{macierz jednostkowa}
	\cdot
	\begin{bmatrix} x_1 \\ x_2 \end{bmatrix} =
	\begin{bmatrix} y_1 \\ y_2 \end{bmatrix}
$$
:::

::: {.example title="" ref=""}
Translacja o wektor $\vec{v}= [v_1, v_2]$ w $E^2$
$$
	f:
	\begin{cases}
		y_1 = x_1 + v_1 \\
		y_2 = x_2 + v_2 \\
	\end{cases}
$$
:::

::: {.example title="" ref=""}
Symetria względem prostej w $E^2$ lub względem punktu w $E^3$ jest
przekształceniem afinicznym
:::

::: {.example title="" ref=""}
Jednokładność w skali $k$ względem punktu $O$ który jest początkiem afinicznego
układu współrzędnych jest przekształceniem afinicznym
:::

::: {.example title="" ref=""}
Obrót w $E^2$ dookoła punktu $O$ o kąt $\alpha$ jest odwzorowaniem afinicznym
:::

## Izometrie przestrzeni Euklidesowej punktowej

Niech $(E^n, TE^n, \circ, \to)$ będzie przestrzenią euklidesową punktową, gdzie

$$
\begin{array}{r|l}
E^n                                    & \text{zbiór punktów $(n = 2 \lor n = 3)$}\\
TE^n                                   & \text{przestrzeń wektorowa $(n = 2 \lor n = 3)$ wektorów swobodnych}\\
\to : E^n \times E^n \to TE^n          & \text{odwzorowanie punktów}\\
\circ : TE^n \times TE^n \to \mathbb R & \text{iloczyn skalarny}
\end{array}
$$

## Odległość euklidesowa

Jeżeli $X, Y \in E^2 (X, Y \in E^3)$ są punktami oraz
$\vec{u}= Y - X = \overrightarrow{XY}$ wtedy odległość euklidesowa punktów
$X, Y$ jest liczbą oznaczaną $d_E(X, Y) = |\overrightarrow{XY}| = \vec{u}$

Jeżeli $X(x_1, x_2), Y(y_1, y_2)$ lub odpowiednio
$X(x_1, x_2, x_3), Y(y_1, y_2, y_3)$ to

$d_E(X, Y) = \sqrt{(y_1 - x_1)^2 + (y_2 - x_2)^2}$ lub
$d_E(X, Y) = \sqrt{(y_1 - x_1)^2 + (y_2 - x_2)^2 + (y_3 - x_3)^2}$

## Izometria

Izometrią przestrzeni euklidesowej $E^2$ lub $E^3$ nazywamy przekształcenie
afiniczne $f : E^2 \to E^2$ lub $f : E^3 \to E^3$ zachowujące odległości między
punktami, tzn.

$$
  d_E(X, Y) = d_E(f(X), f(Y))
$$

::: {.theorem title="" ref=""}

Następujące warunki opisujące izometrię są sobie równoważne

$$
\begin{aligned}
1\quad & \bigwedge_{X,Y \in E^n} d_E(X, Y) = d_E(f(A), f(B))\\
2\quad & \bigwedge_{\vec{v}\in TE^n} |\vec{v}| = |f_*(\vec{v})|\\
3\quad & \bigwedge_{\vec{u}, \vec{v} \in TE^n} (\vec{u} \circ \vec{v}) = (f(\vec{u})
\circ f(\vec{v}))
\end{aligned}
$$

:::

::: {.proof title="" ref=""}

Niech $X, Y \in E^n$ i $\vec{v} = \overrightarrow{XY}$.

Udowodnimy $(1) \iff (2)$

$$
  |\vec{v}| = |\overrightarrow{XY}| = d_E(X, Y)
$$

$$
	\begin{aligned}
		|f_*(\vec{v})| =
		|f_*(\overrightarrow{XY})| =
		|\overrightarrow{f(Y) - f(X)}| =
		d_E(f(X), f(Y))
	\end{aligned}
$$

udowodnimy $(2) \iff (3)$

I.  Najpierw pokażemy, że $(3) \Rightarrow (2)$

    Jest oczywiste wystarczy zauważyć, że
    $|\vec{v}| = \sqrt{\vec{v}\circ\vec{v}} \overset{3}{=}
    \sqrt{f_*(\vec{v}) \circ f_*(\vec{v})} = |f_*(\vec{v})|$

II. Pokażemy, że $2 \Rightarrow 3$

    Aby udowodnić tą implikację, wykorzystamy wzór wyrażający iloczyn skalarny tylko
    przy pomocy długości wektora, tzn.

    $$
      \vec{u} \circ \vec{v} =
      {1 \over 2}
      \left[|\vec{u}|^2 + |\vec{v}|^2 - |\vec{u}-\vec{v}|^2\right]
    $$

    $$
      \begin{aligned}
        \vec{u}\circ\vec{v} & =
        {1 \over 2}
        \left[|\vec{u}|^2 + |\vec{v}|^2 - |\vec{u}-\vec{v}|^2\right]                           \\&=
        {1 \over 2}
        \left[|f_* (\vec{u})|^2 + |f_* (\vec{v})|^2 - |f_* (\vec{u}) - f_* (\vec{v})|^2\right] \\&=
        f_*(\vec{u}) \circ f_*(\vec{v})                                                        \\&\text{CND}
      \end{aligned}
    $$

:::

## Zapis izometrii we współrzędnych ortonormalnych

Skoro izometria jest odwzorowaniem afinicznym, to można ją zapisać w postaci

$$
y_i = \sum_{j = 1}^{n} a_{ij}x_j + a_i\qquad\qquad i=1, 2 \lor i = 1, 2, 3
$$

$$
E^2 : \begin{cases}
y_1 = a_{11}x_1 + a_{12}x_2 + a_1\\
y_2 = a_{21}x_1 + a_{22}x_2 + a_2
\end{cases}
$$

$$
E^3 : \begin{cases}
y_1 = a_{11}x_1 + a_{12}x_2 + a_{13}x_3 + a_1\\
y_2 = a_{21}x_1 + a_{22}x_2 + a_{23}x_3 + a_2\\
y_3 = a_{31}x_1 + a_{32}x_2 + a_{33}x_3 + a_3\\
\end{cases}
$$

Musimy dołożyć warunki określające izometrię:

$$
  (\vec{u}\circ\vec{v}) = f_*(\vec{u}) \circ f_*(\vec{v})
$$

Niech $\vec{u} = [u_1, u_2]$ i wektor $\vec{v} = [v_1, v_2]$ wtedy

$$
  f_*(\vec{u}) = f_*([u_1, u_2]) = (a_{11}u_1 + a_{12}u_2, a_{21}u_1 + a_{22}u_2)
$$

$$
  f_*(\vec{v}) = f_*([v_1, v_2]) = (a_{11}v_1 + a_{12}v_2, a_{21}v_1 + a_{22}v_2)
$$

Warunek określający izometrię przyjmie postać

$$
\begin{aligned}
  (*)\vec{u}\circ\vec{v} &= u_1v_1 + u_2v_2 = f_*(\vec{u}) \circ f_*(\vec{v}) \\&=
(a_{11}u_1 + a_{12}u_2)\cdot
(a_{11}v_1 + a_{12}v_2)+
(a_{21}u_1 + a_{22}u_2)\cdot
(a_{21}v_1 + a_{22}v_2)
\end{aligned}
$$

Przekształcając prawą stronę powyższej równości otrzymujemy

$$
\begin{aligned}
&a_{11}^2u_1v_1 +
a_{12} a_{11}\cdot u_2 v_1 +
a_{11}\cdot a_{12}u_1 v_2 +
a_{12}^2u_2v_2 \\&+
%
a_{21}^2u_1v_1 +
a_{22}a_{21}u_2 v_1 +
a_{21}a_{22}u_1 v_1 +
a_{22}^2u_2v_2 \\&=
(a_{11}^2 + a_{21}^2)u_1v_1 + (a_{12}^2 + a_{22}^2)u_2v_2 \\&+
(a_{12}\cdot a_{11} + a_{22}a_{21})u_2v_1 +
(a_{11}a_12 + a_{21}a_{22})v_1v_2
\end{aligned}
$$

Uwzględniając równość $(*)$ otrzymujemy układ równań:

$$
(*): \begin{cases}
a_{11}^2 + a_{21}^2 = 1\\
a_{12}^2 + a_{22}^2 = 1\\
a_{12}a_{11} + a_{22}a_{21} = 0\\
a_{11}a_12 + a_{21}a_{22} = 0
\end{cases}
$$

Dla macierzy $A = \begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22}\end{bmatrix}$
powyższy układ możemy zapisać w postaci $A^t \cdot A = I$

$$
  A^T \cdot A =
\begin{bmatrix} a_{11} & a_{21} \\ a_{12} & a_{22} \end{bmatrix} \cdot
\begin{bmatrix} a_{11} & a_{12} \\ a_{21} & a_{22} \end{bmatrix} =
\begin{bmatrix}
a_{11}^2 + a_{21}^2 = 1 &
a_{12}^2 + a_{22}^2 = 1\\
a_{12}\cdot a_{11} + a_{22}a_{21} = 0 &
a_{11}a_12 + a_{21}a_{22} = 0
\end{bmatrix} =
\begin{bmatrix} 1 & 0\\ 0 & 1 \end{bmatrix}
$$

Macierz spełniającą ten warunek nazywamy macierzą ortogonalną

Warunki z układu $(*)$ są niezależne i rozwiązanie tych równań można zapisać w
postaci

1. $a_{11} = \cos \alpha, a_{21} = \sin \alpha, \quad \alpha \in (0, 2\pi)$
1. $a_{21} = \cos \beta, a_{22} = \sin \beta, \quad \beta \in (0, 2\pi)$

Wtedy ostatni warunek przyjmuje postać:

$$
  \cos \alpha \cdot \sin \beta +
\sin \alpha \cdot \cos \beta = 0 \iff \sin (\alpha+\beta) = 0
$$

$$
  \alpha + \beta = k\pi, k \in \mathbb{Z}
$$

$$
  \alpha+\beta=0, \quad\alpha+\beta = \pi, \quad\alpha+\beta=2\pi, \quad\alpha+\beta = 3\pi
$$

czyli

$$
  \alpha = \pi - \beta, \quad \alpha = 2\pi-\beta
$$

---

2024-01-17


# Krzywa stożkowa

## Definicje

Wartość własna macierzy
: Wartości własne obliczamy jako $\lambda$ ze wzoru
  $$
    \det (M - \lambda I) = 0
  $$
  gdzie $M$ – macierz dla której wyznaczamy wartości własne,
  $I$ – macierz jednostkowa

::: {.theorem title="" ref=""}
Wartości własne $\lambda_1, \lambda_2$ małej macierzy stożkowej $M$ zawsze są
rzeczywiste i nie zależą od wyboru ortonormalnego układu współrzędnych w którym
zapisano równanie stożkowej
:::

Sład macierzy
: Śladem (ang. [trace](https://en.wikipedia.org/wiki/Trace_(linear_algebra)))
  $\operatorname{tr} A$ macierzy kwadratowej $A$ nazywamy sumę elementów na
  głównej przekątnej
  $$
    \operatorname{tr} A \overset{\text{def}}{=}
    \sum_{i=1}^n a_{ii} =
    a_{11} + a_{22} + \dots + a_{nn}
  $$

## Postaci krzywej stożkowej

Postać ogólna krzywej stożkowej

$$
  Ax^2 + By^2 + Cxy + Dx + Ey + F = 0
$$

Zapisując w postaci macierzowej

$$
\begin{bmatrix}x & y & 1\end{bmatrix}
\begin{bmatrix}
	A   & C/2 & D/2 \\
	C/2 & B   & E/2 \\
	D/2 & E/2 & F
\end{bmatrix}
\begin{bmatrix}x\\y\\1\end{bmatrix} = 0
$$

$$
\tilde{A} = \underbrace{\begin{bmatrix}
	A   & C/2 & D/2 \\
	C/2 & B   & E/2 \\
	D/2 & E/2 & F
\end{bmatrix}}_\text{macierz duża}
\qquad
A = \underbrace{\begin{bmatrix}
	A   & C/2 \\
	C/2 & B   \\
\end{bmatrix}}_\text{macierz mała}
$$

## Obliczenie współczynników równania kanonicznego krzywej drugiego stopnia

Aby obliczyć współczynniki równania kanonicznego należy wykonać następujące
kroki:

1. określić typ stożkowej (obliczamy wyznaczniki $\det \tilde{A}, \det A$ i
   patrzymy do tabeli niżej)
2. obliczyć wartości własne $\lambda_1, \lambda_2$ małej macierzy stożkowej $A$
   - Gdy jedna z tych wartości się zeruje, to zawsze ją oznaczamy $\lambda_1$.
   - Gdy istnieją wartości ujemne, to jedną z nich zawsze oznaczamy $\lambda_2$
3. obliczyć współczynniki
   $$
     c_{11} = |\lambda_1|\qquad
     c_{22} = |\lambda_2| \neq 0\qquad
     c_{33} = \left| \det \tilde{A} \over \lambda_1\cdot \lambda_2 \right| \neq 0\qquad
     c_{13} = \sqrt{\left| \det \tilde{A} \over \lambda_2 \right|}\qquad
   $$

$$
\begin{array}{|l||l|l|l|l|}
\hline
\text{Równanie kanoniczne} &
\text{Rząd macierzy $\tilde{A}$} &
\det \tilde{A} &
\det A &
\text{Typ stożkowej}\\
\hline \hline
%
c_{11}x^2 + c_{22}y^2 - c_{33} = 0 &
3 & \neq 0 & > 0 &
\text{elipsa \quad$\operatorname{tr} A \cdot \det \tilde{A} < 0$}\\
%
c_{11}x^2 + c_{22}y^2 + c_{33} = 0 &
3 & \neq 0 & > 0 &
\text{elipsa urojona \quad$\operatorname{tr} A \cdot \det \tilde{A} > 0$}\\
%
c_{11}x^2 - c_{22}y^2 - c_{33} = 0 &
3 & \neq 0 & < 0 &
\text{hiperbola}\\
%
c_{22} y^2 - 2 c_{13}x = 0 &
3 & \neq 0 & = 0 &
\text{parabola}\\
\hline
%
c_{11} x^2 - c_{22}y^2 = 0 &
2 & = 0 & < 0 &
\text{para prostych przecinających się rzeczywistych}\\
%
c_{11} x^2 + c_{22}y^2 = 0 &
2 & = 0 & > 0 &
\text{para prostych przecinających się urojonych}\\
%
c_{22} y^2 - c_{33} = 0&
2 & = 0 & = 0 &
\text{para prostych równoległych rzeczywistych}\\
%
c_{22} y^2 + c_{33} = 0&
2 & = 0 & = 0 &
\text{para prostych równoległych rzeczywistych}\\
\hline
%
c_{22}y^2 = 0&
1 & = 0 & = 0 &
\text{prosta urojona}\\
\hline
\end{array}
$$

Krzywa jest niezdegenorowana, gdy $\operatorname{rz.} \tilde{A} = 3$
