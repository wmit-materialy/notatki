---
title: "Archiwum: Notatki z Metod Numerycznych"
lang: pl
toc: true
toc-own-page: true
---

- wyk: Tomasz Krajka konsultacje mechaniczny 733(lub 701) wtorek 18:30-20:00

---

2025-02-25

::: {.caution title="" ref=""}

Warunki zaliczenia labów:

- projekt
- aktywność

Warunki zaliczenia wykładu:

- pierwszy termin pisemny albo ustny
- pozostałe ustne

:::

# Wykład. Reprezentacja liczb w pamięci komputera. Arytmetyka zmiennopozycyjna, błędy obliczeń

Metody numeryczne (_analiza numeryczna_)
: to dział matematyki stosowanej zajmujący się opracowywaniem i badaniem metod
przybliżonego rozwiązywania problemów obliczeniowych.

Najczęściej metody te przyjmują postać algorytmów które pozwalają rozwiązywać
rozważane problemy za pomocą komputera.

## Numeryczna reprezentacja liczb

W pamięci komputera liczby nie są reprezentowane w systemie dziesiętnym.
Najczęściej stosowaną podstawą rozwinięć liczb 2(arytmetyka dwójkowa, binarna).
W niektórych sytuacjach stosowane są również systemy przy podstawie 8 albo 16.

### Reprezentacja liczb całkowitych

Liczby całkowite reprezentowane są w pamięci komputera w sposób stałoprzecinkowy

::: theorem

Dowolną liczbę całkowitą $l$ można przedstawić w postaci jej rozwinięcia
dwójkowego:

$$
  L = s \sum_{i = 0}^{n} e_i \cdot 2^i
$$

gdzie $s \in \{-1, 1\}$ jest znakiem liczby, $e_i \in \{0, 1\}$ są jej cyframi
rozwinięcia dwójkowego oraz $e_n \ne 0$ jeśli $l \ne 0$

:::

W ogólności w systemie liczbowym przy podstawie $p$, dowolną liczbę całkowitą
$l$ można przedstawić w postaci

$$
  l = s \sum_{i = 0}^{n} e_i \cdot p^i
$$

gdzie $s \in \{-1, 1\}$ jest znakiem liczby, $e_i \in \{0, 1, \ldots, p - 1\}$
są jej cyframi rozwinięcia w systemie przy podstawie $p$ oraz $e_n \ne 0$ jeśli
$l \ne 0$

W ten sposób można reprezentować liczby całkowite z przedziału
$l \in [-2^d + 1, 2^d - 1]$. Jeżeli argumenty działań arytmetycznych na liczbach
całkowitych i ich wynik są reprezentowalne, to działania są wykonane dokładnie.
Liczby całkowite w pamięci komputera mogą być w sposób powyższy na dwa sposoby:
w postaci znak-moduł albo w postaci znak-uzupełnienie

### Reprezentacja liczb rzeczywistych

::: theorem

Każdą liczbę rzeczywistą $x$ można zapisać w postaci:

$$
  x = s \cdot 2^c \cdot m
$$

gdzie $s \in \{-1, 1\}$ jest znakiem liczby, $c$ jest liczbą całkowitą zwaną
cechą, a $m \in [\frac{1}{2}, 1)$ jest liczbą rzeczywistą zwaną mantysą.

Mantysa ma postać

$$
  m = \sum_{i = 1}^{\infty} e_{-i} \cdot 2^{-i}
$$

gdzie $e_{-1} = 1$ a dla $i > 1$  $e_{-i} \in \{0, 1\}$. Jeśli $x \ne 0$, to
takie przedstawienie jest jednoznaczne

:::

W praktyce nie da się reprezentować mantysy z nieskończoną dokładnością.
Przeznaczając $t$ bitów na reprezentację mantysy otrzymujemy jej $t$-bitową
reprezentację(oznaczaną $m_t$)

$$
  m_t = \sum_{i = 1}^{t} e_{-i} \cdot 2^{-i} +
  e_{-(t+1)}\cdot 2^{-t}
$$

Następuje tu zatem zaokrąglenie wartości liczbowej mantysy do $t$ bitów. Pojawia
się tu zatem błąd reprezentacji który można oszacować w sposób bezwzględny.

$$
  |m - m_t| \le \frac{1}{2} \cdot 2^{-t}
$$

Reprezentacją liczby rzeczywistej $x$ w pamięci komputera będziemy oznaczać
przez $\operatorname{rd}(x)$ i definiujemy wzorem

$$
  \operatorname{rd}(x) = s \cdot 2^c \cdot m_t
$$

Czyli do reprezentacji liczby rzeczywistej potrzebujemy 3 liczb($s, c, m_t$).

Błąd względny takiej reprezentacji można oszacować następująco:

$$
  \left| \frac{\operatorname{rd}(x) - x}{x} \right| =
  \left| \frac{s\cdot 2^c \cdot m_t - s\cdot 2^c \cdot m}{s\cdot 2^c \cdot m} \right| =
  \frac{|m_t - m|}{m} \le \frac{\frac{1}{2} \cdot 2^{-t}}{\frac{1}{2}} = 2^{-t}
$$

Albo inaczej

$$
  \operatorname{rd}(x) = x(1 + \varepsilon), \quad |\varepsilon| \le 2^{-t}
$$

---

2025-03-04

### Reprezentacja liczb rzeczywistych cd.

::: {.theorem title="" ref=""}

W arytmetyce zmiennopozycyjnej można zatem reprezentować liczby rzeczywiste
$x \ne 0$ z przedziału

$$
  \frac{1}{2} \cdot 2^{C_{\text{min}}} \le |x| < 2^{C_{\text{max}}}
$$

gdzie $C_{\text{min}}$ i $C_{\text{max}}$ są odpowiednio najmniejszą i
największą możliwą do reprezentowania wartością cechy.

:::

W przypadku próby reprezentowania liczby mniejszej niż dolne ograniczenie mamy
do czynienia z niedomiarem – liczba jest reprezentowana za pomocą $0$, a w
przypadku próby reprezentowania liczby większej od górnego ograniczenia z
nadmiarem, następuje przerwanie obliczeń

::: {.example title="" ref=""}

$$
  t = 4 \quad 0,33_{(10)} = 0,010101_{(2)} \cdot 2^{-1}
$$

$$
  m_t = 0,1010_{(2)} + 0,0001_{(2)} = 0,1011_{(2)} \quad
  \operatorname{rd}(x) = 0,1011 \cdot 2^{-1}
$$

$$
  \begin{array}{r|l}
  0,33 &\\
  0,66 & 0\\
  1,32 & 1\\
  0,32 & \\
  0,64 & 0\\
  1,28 & 1\\
  0,28 & \\
  0,56 & 0\\
  1,06 & 1\\
  \end{array}
$$

:::

Działania na reprezentacjach liczb rzeczywistych są wykonywane w arytmetyce
zmiennoprzecinkowej (fl). Niech
$\tilde{a} = \operatorname{rd} (a), \tilde{b} = \operatorname{rd(b)}$, wtedy

$$
  \operatorname{fl} (\tilde{a} \square \tilde{b}) =
  \operatorname{rd} (\tilde{a} \square \tilde{b}) =
  (\tilde{a} \square \tilde{b}) (1 + \varepsilon), \quad |\varepsilon| \le 2^{-t}
$$

gdzie $\square \in \{+, -, *, /\}$.

Każde działanie arytmetyczne w arytmetyce fl wytwarza pewien mały względny błąd
zaokrąglenia rzędu błędu reprezentacji

![Wykres mantys](assets/MN_wyk2_1.png){width=50%}


Przykładowo wykonując działanie "+" na reprezentacjach liczb $a\ge b$,
$\operatorname{rd}(a) = m_a \cdot 2^{C_a}$ oraz
$\operatorname{rd}(b) = m_b \cdot 2^{C_b}$, wówczas mamy

$$
  a + b = 2^{C_a} (m_a + m_b \cdot 2^{-(C_a - C_b)}) =
  2^{C_a} \cdot m_s
$$

gdzie mantysa $m_s$ jest obarczona błędem jej reprezentacji

::: {.example title="" ref=""}

Niech $t = 4$ oraz

$$
  a = \operatorname{rd}(a) = 0,1101\cdot 2^{-1} \quad
  b = \operatorname{rd}(b) = 0,1001 \cdot 2^{1}
$$

$$
  \begin{aligned}
    \operatorname{fl} (a + b) &=
    \operatorname{rd} (0,001101 + 0,1001) \cdot 2^1 \\&=
    \operatorname{rd} (0,110001) \cdot 2^1 \\&=
    0,1100 \cdot 2^1
  \end{aligned}
$$

:::

## Uwarunkowanie zadania

Załóżmy, że naszym zadaniem jest obliczenie wektora wyników z jakiejś
przestrzeni wyników $\overline{w} \in \mathbb{R}_w^C$ dla wektora danych
$\overline{d} \in R_d$

$$
  \overline{w} = \varphi(\overline{d}) \quad
  \overline{d} \in D_0 \subset R_d
$$

gdzie

- $R_d, R_w$ są skończenie wymiarowymi unormonowanymi przestrzeniami
  kartezjańskimi

Np.

$$
  \overline{y} = A \overline{x}, \quad
  \begin{aligned}
    &A \in R^{n\times m}, \\
    &\overline{x} \in R^m = R_d, \\
    &\overline{y} \in R^n = R_w
  \end{aligned}
$$

$$
  s = \sum_{i = 1}^{n} x_i, \quad
  \begin{aligned}
    &s\ne 0,\\
    &\overline{x} \in R^n = R_d\\
    &s \in R = R_w
  \end{aligned}
$$

Zadanie dobrze uwarunkowane
: – Jeśli niewielkie względne zaburzenia danych powodują duże względne zaburzenia
wyników, to zadanie nazywamy źle uwarunkowanym. W przeciwnym razie zadanie jest
dobrze uwarunkowane

::: {.example title="" ref="wskuwar"}

$$
  s = \sum_{i = 1}^{n} x_i, \qquad s \ne 0
$$

Zamiast wartości $x_i$, mamy ich reprezentacje
$\operatorname{rd}(x_i) = x_i(1+\varepsilon_i)$, gdzie
$|\varepsilon_i| \le 2^{-t}, i = 1, 2, \ldots, n$

$$
  \begin{aligned}
  \frac{\tilde{s} - s}{|s|} &=
  \frac{\left| \sum_{i = 1}^{n} x_i(1 + \varepsilon_i) -
               \sum_{i = 1}^{n} x_i \right|}
       {\left| \sum_{i = 1}^{n} x_i \right|} \\&=
  \frac{\left| \sum_{i = 1}^{n} x_i \varepsilon_i \right|}
       {\left| \sum_{i = 1}^{n} x_i \right|} \\&\le
  \frac{\sum_{i = 1}^{n} |x_i \varepsilon_i|}
       {\left| \sum_{i = 1}^{n} x_i \right|} \\&\le
  (\max _{1 \le i \le n} \varepsilon_i) \cdot
  \frac{\sum_{i = 1}^{n} |x_i|}{\left| \sum_{i = 1}^{n} x_i \right|} \\&\le
  2^{-t}\cdot \frac{\sum_{i = 1}^{n} |x_i|}{\left| \sum_{i = 1}^{n} x_i \right|}
  \end{aligned}
$$

Wskaźnik uwarunkowania
: Wielkość $\displaystyle \frac{\sum_{i = 1}^{n} |x_i|}
{\left| \sum_{i = 1}^{n} x_i \right|}$ nazywamy wskaźnikiem uwarunkowania
zadania i oznaczamy $\operatorname{cond} (\overline{x})$. Mówi ona z jakim
czynnikiem błędy reprezentacji danych przeniosły się na błędy wyniku.

Z najlepszą sytuacją mamy do czynienia wtedy, gdy
$\operatorname{cond}(\overline{x}) \approx 1$, wówczas błędy danych przeniosły
się na błędy wyniku bez ich zwielokrotnienia

:::

W przykładzie \ref{ex:wskuwar} $\operatorname{cond} (\overline{x}) = 1$ jeśli
wszystkie wartości $x_i$ są tego samego znaku i zadanie jest wówczas bardzo
dobrze uwarunkowane

::: {.example title="" ref=""}

:::: {.theorem title="Rozwinięcie w szereg Taylora funkcji dwóch zmiennych" ref=""}
$$
  f(x + \Delta x, y + \Delta y) = f(x, y) +
  \frac{\partial f}{\partial x} (x, y) \cdot \Delta x +
  \frac{\partial f}{\partial y} (x, y) \Delta y + \ldots
$$
::::

Dany jest trójmian $x^2 - 2px + q$, gdzie $(p, q) \in D$ oraz
$D = \{(p, q) : p \ne 0 \land q \ne 0 \land
\underbrace{p^2 - q > 0}_{\Delta > 0}\}$

Zbadajmy jak zaburzenie wartości pierwiastków $x_1(p, q)$ i $x_2(p, q)$ zależą
od drobnych zaburzeń współczynników $p$ i $q$. Dla pierwiastka $k \in \{1, 2\}$ i
ustalonych wartości współczynników $p_0$ i $q_0$ mamy zatem

$$
  \begin{aligned}
  \frac{x_k(p_0(1 + \varepsilon_1), q_0(1 + \varepsilon_2)) - x_k(p_0, q_0)}
       {x_k(p_0, q_0)} \approx
  &\frac{x_k(p_0, q_0)}{x_k} \\&+
  \frac{\partial x_k}{\partial p} \Big|_{(p_0, q_0)} \cdot
  \frac{p_0 \varepsilon}{x_k} \\&+
  \frac{\partial x_k}{\partial q} \Big|_{(p_0, q_0)} \cdot
  \frac{q_0 \varepsilon}{x_k} - \frac{x_k(p_0, q_0)}{x_k}
  \end{aligned}
$$


$$
  \begin{aligned}
    &x_1 = \frac{2p + 2\sqrt{p^2 - p}}{2} = p + \sqrt{p^2 - q}\\
    &x_2 = p - \sqrt{p^2 - q}
  \end{aligned}
$$

$$
  \begin{aligned}
  &\frac{\partial x_1}{\partial p} = 1 + \frac{2p}{2\sqrt{p^2 - q}} =
  \frac{p + \sqrt{p^2 - q}}{\sqrt{p^2 - q}} \\
  &\frac{\partial x_2}{\partial p} = 1 - \frac{p}{\sqrt{p^2 - q}} =
  \frac{\sqrt{p^2 - q} - p}{\sqrt{p^2 - q}}
  \end{aligned}
$$

Analogicznie dla pochodnych po $q$

Zatem

$$
  \operatorname{cond}_p^k(p_0, q_0) =
  \frac{\partial x_k}{\partial p}\Big|_{(p_0, q_0)} \cdot \frac{p_0}{x_k} =
  \frac{x_k}{x_k - p_0} \cdot \frac{p_0}{x_k}
$$

oraz

$$
  \operatorname{cond}_q^k(p_0, q_0) = \frac{\partial x_k}{\partial q}
\Big|_{(p_0, q_0)} \cdot \frac{q_0}{x_k} = \frac{-q_0}{2 x_k (x_k - p_0)}
$$

Wstawiając teraz w miejsce $x_k$ wartości pierwiastków
$x_1 = p_0 + \sqrt{p_0^2 - q}$ i $x_2 = p_0 - \sqrt{p_0^2 - q}$ mamy

$$
  \operatorname{cond}_p^1(p_0, q_0) =
  -\operatorname{cond}_p^2(p_0, q_0) =
  \frac{1}{\sqrt{1 - \frac{q_0}{p_0^2}}}
$$

$$
  \operatorname{cond} _q^1(p_0, q_0) =
  \frac{1-\sqrt{1 - \frac{q_0}{p_0^2}}}{2 \sqrt{1 - \frac{q_0}{p_0^2}}}
$$

$$
  \operatorname{cond}_q^2(p_0, q_0) =
  \frac{1 + \sqrt{1 - \frac{q_0}{p_0^2}}}
       {-2 \sqrt{1 - \frac{q_0}{p_0^2}}}
$$

Jak widać dla $\frac{q_0}{p_0^2} \approx 1$ współczynnik rośnie w sposób
nieograniczony i zadanie jest [bardzo]{.smallcaps} źle uwarunkowane.
Jeśli $\frac{q_0}{p_0^2} \ll 1$, to zadanie jest [bardzo]{.smallcaps} dobrze uwarunkowane

:::

---

2025-03-11

## Algorytmy numerycznie poprawne

::: {.example title="" ref=""}

Rozważmy dwa algorytmy wyznaczające wartość $y = a^2 - b^2$

Algorytm A1
: $$
  \begin{aligned}
    z_1 = a - b\\
    z_2 = a + b\\
    y = z_1 \cdot z_2
  \end{aligned}
  $$

Algorytm A2
: $$
  \begin{aligned}
    z_1 = a\cdot a\\
    z_2 = b \cdot b\\
    y = z_1 - z_2
  \end{aligned}
  $$

Przyjmujmy się teraz jak wygląda realizacja tych algorytmów w arytmetyce fl.

Realizacja algorytmu A1

$$
  \begin{aligned}
  \operatorname{fl} (z_1) &= (a - b) (1 + \varepsilon_1), \quad
  |\varepsilon_1| \le 2^{-t}\\
  \operatorname{fl} (z_2) &= (a + b) (1 + \varepsilon_2), \quad
  |\varepsilon_2| \le 2^{-t}\\
  \operatorname{fl} (y) &= \operatorname{fl} (z1) \cdot \operatorname{fl} (z2)
  \cdot (1 + \varepsilon_3) \qquad \left( |\varepsilon_3| < 2^{-t} \right)\\
  & = (a - b) (1 + \varepsilon_1) \cdot
  (a + b)(1 + \varepsilon_2) (1+\varepsilon_3))\\&=
  (a^2 - b^2) (1 + \varepsilon_1) (1 + \varepsilon_2) (1 + \varepsilon_3)\\
  1 + E_1 &= (1 + \varepsilon_1) (1 + \varepsilon_2) (1 + \varepsilon_3)
  \approx 1 + \varepsilon_1 + \varepsilon_2 + \varepsilon_3
  \end{aligned}
$$

Stąd

$$
  |E_1| \le |\varepsilon_1| + |\varepsilon_2| + |\varepsilon_3| \le 3 \cdot 2^{-t}
$$

Realizacja algorytmu A2

$$
  \begin{aligned}
  \operatorname{fl} (z_1) &= a\cdot a \cdot (1 + \eta_1), \quad
  |\eta_1| \le 2^{-t}\\
  \operatorname{fl} (z_2) &= b\cdot b \cdot (1 + \eta_2), \quad
  |\eta_2| \le 2^{-t}\\
  \operatorname{fl} (y) &=
  (\operatorname{fl} (z_1) - \operatorname{fl} (z_2))(1 + \eta_3) \qquad
  \left( |\eta_3| \le 2^{-t} \right)\\
  &= (a^2 (1 + \eta_1) - b^2(1+\eta_2))(1 + \eta_3) \\&=
  (a^2 - b^2 + a^2 \eta_1 - b^2 \eta_2)(1 + \eta_3) \\&=
  (a^2 - b^2)(1 + \frac{a^2 \eta_1 - b^2 \eta_2}{a^2 - b^2})(1 + \eta_3) \\&=
  (a^2 - b^2)(1 + E_2)\\
  1 + E_2 &= (1 + \frac{a^2 \eta_1 - b^2 \eta_2}{a^2 - b^2})(1 + \eta_3) \approx
  1 + \eta_3 + \frac{a^2 \eta_1 - b^2 \eta_2}{a^2 - b^2}\\
  |E_2| &\le |\eta_3| + \frac{a^2 |\eta_1| + b^2 |\eta_2|}{|a^2 - b^2|} \le
  2^{-t} (1 + \frac{a^2 + b^2}{|a^2 - b^2|})
  \end{aligned}
$$

Dla $a^2 \approx b^2$ błąd wyniku w realizacji algorytmem A2 może być bardzo
duży

:::

Numeryczna poprawność
: Algorytm nazywamy numerycznie poprawnym jeśli obliczone w arytmetyce fl
  rozwiązanie jest nieco zaburzonym rozwiązaniem dokładnym dla nieco zaburzonych
  danych.

Dla A1 mamy

$$
  \begin{aligned}
  \operatorname{fl} (y) &=
  (a^2 - b^2) (1 + \varepsilon_1) (1 + \varepsilon_2) (1 \varepsilon_2) \\&=
  ((a \sqrt{(1 + \varepsilon_1) (1 + \varepsilon_2)})^2 -
  (b \sqrt{(1 + \varepsilon_1) (1 + \varepsilon_2)})^2) (1 + \varepsilon_3) \\&=
  ((a (1 + \xi_1))^2 - (b(1 + \xi_1))^2)(1 + \varepsilon_3)\\
  1 + \varepsilon_1 &= \sqrt{(1 + \varepsilon_1) (1 + \varepsilon_2)}\\
  1 + 2\xi_1 + \xi_1 ^2 &= 1 + \varepsilon_1 +
      \varepsilon_2 + \varepsilon_1 \varepsilon_3\\
  2\xi_1 &= \varepsilon_1 + \varepsilon_2, \qquad |\xi_1| \le 2^{-t}
  \end{aligned}
$$

Realizacja algorytmu w arytmetyce fl polega na:

- Zastąpieniu danych ich reprezentacjami w arytmetyce fl
- Wykonaniu działań w arytmetyce fl

::: {.example title="" ref=""}

Wyznaczmy $\displaystyle \sum_{i = 1}^{n} x_i, s \ne 0$. Algorytm ma postać:

$$
  \begin{aligned}
  &s_1 = x_1\\
  &s_2 = s_1 + x_2\\
  &s_n = s_{n-1} + x_n
  \end{aligned}
$$

$$
  \tilde{x}_i = \operatorname{rd} (x_i) = x_i(1 + \alpha_i), \quad
  |\alpha_i| \le 2^{-t}, i \in \{1, 2, \ldots, n\}
$$

$$
  \begin{aligned}
  \operatorname{fl} (s_1) &= \tilde{x}_1\\
  \operatorname{fl} (s_2) &=
  (\operatorname{fl}(s_1) + \tilde{x}_2)(1 + \varepsilon_2) =
  (\tilde{x}_1 + \tilde{x}_2)(1 + \varepsilon_2), \quad
  |\varepsilon_2| \le 2^{-t}\\
  \operatorname{fl} (s_3) &=
  (\operatorname{fl} (s_2) + \tilde{x}_3)(1 + \varepsilon_3) =
  ((\tilde{x}_1 + \tilde{x}_2)(1 + \varepsilon_2) +
  \tilde{x}_3)(1 + \varepsilon_3)) \\&=
  \tilde{x}_1 (1 + \varepsilon_1)(1 + \varepsilon_2)(1 + \varepsilon_3) +
  \tilde{x}_2(1 + \varepsilon_2)(1 + \varepsilon_3) +
  \tilde{x}_3 (1 + \varepsilon_3)
  \end{aligned}
$$

Ogólnie

$$
  \begin{aligned}
  \operatorname{fl} (s_n) &= \sum_{k = 1}^{n} \tilde{x}_k \prod_{i = k}^{n}
  (1 + \varepsilon_i) \\&=
  \sum_{k = 1}^{n} x_k(1 + \varepsilon_k) \prod_{i = k}^{n}
  (1 + \varepsilon_i) \\&=
  \sum_{k = 1}^{n} x_k(1 + E_k)
  \end{aligned}
$$

$$
  1 + E_k = 1 + \alpha_k + \sum_{i = k}^{n} \varepsilon_i
$$

$$
  |E_k| \le \begin{cases}
    n           \cdot 2^{-t}, &k=1\\
    (n - k + 2) \cdot 2^{-t}, &k>1
  \end{cases}
$$

Zatem największym błędem obarczone są początkowe składniki sumy. Algorytm jest
numerycznie poprawny, a najlepszą metodę realizacji tego algorytmu jest
uprzednie posortowanie rosnąco sumowanych elementów według ich wartości
bezwzględnych

:::

# Wykład. Rozwiązanie układu równań liniowych

Niech będzie dany układ równań liniowych

$$
  \begin{cases}
  a_{11}x_1 + a_{12} x_2 + \ldots + a_{1n} x_n = b_1\\
  a_{21}x_1 + a_{22} x_2 + \ldots + a_{2n} x_n = b_2\\
                           \vdots                   \\
  a_{n1}x_1 + a_{n2} x_2 + \ldots + a_{nn} x_n = b_n\\
  \end{cases}
$$

gdzie $a_{ij}, x_i$ oraz $b_i$ dla $1 \le i, j \le n$ są liczbami rzeczywistymi

Ten układ równań można także zapisać w postaci macierzowej

$$
  \begin{bmatrix}%4x4, ty: generic, tr: N
    a_{11} & a_{12} & \cdots & a_{1n}\\
    a_{21} & a_{22} & \cdots & a_{2n}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{n1} & a_{n2} & \cdots & a_{nn}\\
  \end{bmatrix} \cdot
  \begin{bmatrix}%4x1, ty: generic, tr: N
    x_1\\
    x_2\\
    \vdots\\
    x_n\\
  \end{bmatrix} =
  \begin{bmatrix}%4x1, ty: generic, tr: N
    b_1\\
    b_2\\
    \vdots\\
    b_n\\
  \end{bmatrix}
$$

albo w skróconej postaci macierzowej

$$
  Ax = b
$$

gdzie $A \in \mathbb{R}_{n\times n}$ jest macierzą kwadratową rozmiaru $n$, a
$x, b \in \mathbb{R}_{n\times 1}$ są wektorami

::: {.theorem title="" ref=""}

Układ równań $Ax = b$ ma dokładnie 1 rozwiązanie wtw, gdy $\det A \ne 0$, czyli
gdy macierz współczynników układu równań jest nieosobliwa

:::

Algebraicznie, tego typu układy równań rozwiązuje się poprzez przemnożenie obu
stron równania $Ax = b$ przez macierz odwrotną do macierzy $A$, czyli macierz
$A^{-1}$. Jako że $A^{-1} \cdot A = I$, gdzie $I$ jest macierzą jednostkową,
mamy:

$$
\begin{aligned}
Ax &= b &\Big| \cdot A^{-1}\\
A^{-1} A x &= A^{-1}b\\
Ix &= A^{-1}b\\
x &= A^{-1}b\\
\end{aligned}
$$

## Układy równań łatwe do rozwiązania

### Macierz przekątniowa

Macierz $A$ jest macierzą nieosobliwą i przekątniową, czyli $a_{kk} \ne 0$
dla $k \in \{1, 2, \ldots, n\}$ oraz $a_{ij} = 0$ dla $i \ne j$ (macierze
przekątniowe będziemy oznaczali literą $D$)

$$
  \begin{bmatrix}%4x4, ty: diagonal, tr: N
    a_{11} & 0      & \cdots      & 0\\
    0      & a_{22} & \cdots      & 0\\
    \vdots & \vdots & \ddots      & \vdots\\
    0      & 0      & \cdots      & a_{nn}\\
  \end{bmatrix} \begin{bmatrix}%4x1, ty: generic, tr: N
    x_1\\
    x_2\\
    \vdots\\
    x_n\\
  \end{bmatrix} = \begin{bmatrix}%4x1, ty: generic, tr: N
    b_1\\
    b_2\\
    \vdots\\
    b_n\\
  \end{bmatrix}
$$

Rozwiązaniem takiego układu równań będzie wektor postaci

$$
  x = \begin{bmatrix}%4x1, ty: generic, tr: N
    \frac{b_1}{a_{11}}\\
    \frac{b_2}{a_{22}}\\
    \vdots\\
    \frac{b_n}{a_{nn}}\\
  \end{bmatrix}
$$

### Macierz górnie trójkątna

Macierz $A$ jest macierzą nieosobliwą i górnie trójkątną, czyli $a_{kk} \ne 0$,
oraz $a_{ij} = 0$ dla $i > j$ (macierze górnie trójkątne będziemy oznaczali
literą $U$)

$$
  \begin{bmatrix}%4x4, ty: triangular-r, tr: N
    a_{11} & a_{12} & \cdots & a_{1n}\\
    0      & a_{22} & \cdots & a_{2n}\\
    \vdots & \vdots & \ddots & \vdots\\
    0      & 0      & \cdots & a_{nn}\\
  \end{bmatrix} \begin{bmatrix}%4x1, ty: generic, tr: N
    x_1\\
    x_2\\
    \vdots\\
    x_n\\
  \end{bmatrix} = \begin{bmatrix}%4x1, ty: generic, tr: N
    b_1\\
    b_2\\
    \vdots\\
    b_n\\
  \end{bmatrix}
$$

Taki układ równań rozwiązujemy za pomocą tzw. podstawiania wstecz wyrażonego
wzorem

$$
  x_i = \frac{b_i - \sum_{j = i + 1}^{n} a_{ij} x_j}{a_{ii}}, \quad
  1 \le i \le n
$$

Wyznaczanie wektora $x$ rozpoczynamy od ostatniej niewiadomej ($x_n$), i w
kolejnych krokach przechodzimy do poprzednich współrzędnych, aż do wyznaczenia
$x_1$

Przykładowa implementacja w Octave:

```matlab
function x = rozw_l(A, b)
  x = [];
  [h, w] = size(A);
  for i = 1:w
    x(i) = (b(i) - sum(A(i, 1:i-1) .* x(1:i-1))) / A(i, i);
  end
  x = x';
end
```

### Macierz dolnie trójkątna

Macierz $A$ jest macierzą nieosobliwą i dolnie trójkątną, czyli $a_{kk} \ne 0$
oraz $a_{ij} = 0$ dla $i < j$(macierze dolnie trójkątne będziemy oznaczali
literą $L$)

$$
  \begin{bmatrix}%4x4, ty: triangular-l, tr: N
    a_{11} & 0      & \cdots & 0\\
    a_{21} & a_{22} & \cdots & 0\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{n1} & a_{n2} & \cdots & a_{n n}\\
  \end{bmatrix} \begin{bmatrix}%4x1, ty: generic, tr: N
    x_1\\
    x_2\\
    \vdots\\
    x_n\\
  \end{bmatrix} = \begin{bmatrix}%4x1, ty: generic, tr: N
    b_1\\
    b_2\\
    \vdots\\
    b_n\\
  \end{bmatrix}
$$

Taki układ równań rozwiązujemy za pomocą tak zwanego podstawiania w przód,
wyrażonego wzorem

$$
  x_i = \frac{b_i - \sum_{j = 1}^{i - 1} a_{ij} x_j}{a_{ii}} \quad
  1 \le i \le n
$$

Wyznaczanie wektora $x$ rozpoczynamy od pierwszej niewiadomej ($x_1$) i w
kolejnych krokach przechodzimy następnych współrzędnych aż do wyznaczenia
($x_n$)

Przykładowa implementacja w Octave:

```matlab
function x = rozw_u(A, b)
  x = [];
  [h, w] = size(A);
  for i = w:-1:1
    x(i) = (b(i) - sum(A(i, i+1:w) .* x(i+1:w))) / A(i, i);
  end
  x = x';
end
```

---

2025-03-18

### Macierze rozkładalne

Macierz $A$ da się rozłożyć do postaci iloczynu macierzy dolnie trójkątnej i
górnie trójkątnej $A = L \cdot U$

$$
  \begin{bmatrix}%4x4, ty: continued, tr: N
    l_{11} & 0      & \cdots & 0\\
    l_{21} & l_{22} & \cdots & 0\\
    \vdots & \vdots & \ddots & \vdots\\
    l_{n1} & l_{n2} & \cdots & l_{nn}\\
  \end{bmatrix} \cdot
  \begin{bmatrix}%4x4, ty: continued, tr: N
    u_{11} & u_{12} & \cdots & u_{14}\\
    0      & u_{22} & \cdots & u_{24}\\
    \vdots & \vdots & \ddots & \vdots\\
    0      & 0      & \cdots & u_{44}\\
  \end{bmatrix} \cdot
  \begin{bmatrix}%4x1, ty: continued, tr: N
    x_1\\
    x_2\\
    \vdots\\
    x_n\\
  \end{bmatrix} = \begin{bmatrix}%4x1, ty: continued, tr: N
    b_1\\
    b_2\\
    \vdots\\
    b_n\\
  \end{bmatrix}
$$

Wyznaczanie wektora $x$ można podzielić wówczas na dwa etapy:

Oznaczając $Ux = z$, rozwiązujemy najpierw układ równań

$$
  L \cdot z = b
$$

gdzie

- $L$ jest macierzą dolnie trójkątną

Zatem rozwiązania tego układu równań (wyznaczanie wektora $z$) odbywa się
przez zastosowanie podstawiania wprzód (jak w punkcie 3)

Następnie rozwiązujemy układ równań $Ux = z$, gdzie $U$ jest macierzą górną.
Zatem rozwiązanie tego układu równań odbywa się poprzez zastosowanie
podstawiania wstecz (jak w punkcie 2)

Większość dokładnych metod rozwiązywania układów równań liniowych polega na
sprowadzeniu macierzy współczynników układu równań $A$, do jednej z powyższych
postaci (ewentualnie ich iloczynu), a następnie rozwiązanie ich zgodnie z
powyższymi wzorami.

## Rozkłady $A = LU$

Jedną z metod przekształcenia macierzy $A$, jest jej rozkład na iloczyn macierzy
dolnie trójkątnej i górnie trójkątnej $A = LU$. Jeśli rozkład taki istnieje to
nie jest on jednoznaczny, należy z każdej pary liczb znajdujących się na
głównych przekątnych macierzy $L$ i $U$ czyli $l_{ii}, u_{ii}$, nadać dokładnie
jednej z nich dowolną wartość różną od zera.

Rozkład taki opiera się o wzór na mnożenie macierzy

$$
  \begin{bmatrix}%4x4, ty: continued, tr: N
    l_{11} & 0      & \cdots & 0\\
    l_{21} & l_{22} & \cdots & 0\\
    \vdots & \vdots & \ddots & \vdots\\
    l_{n1} & l_{n2} & \cdots & l_{nn}\\
  \end{bmatrix} \cdot \begin{bmatrix}%4x4, ty: continued, tr: N
    u_{11} & u_{12} & \cdots & u_{1n}\\
    0      & u_{22} & \cdots & u_{2n}\\
    \vdots & \vdots & \ddots & \vdots\\
    0      & 0      & \cdots & u_{nn}\\
  \end{bmatrix} = \begin{bmatrix}%4x4, ty: continued, tr: N
    a_{11} & a_{12} & \cdots & a_{1n}\\
    a_{21} & a_{22} & \cdots & a_{2n}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{n1} & a_{n2} & \cdots & a_{nn}\\
  \end{bmatrix}
$$

$$
  a_{ij} = \sum_{s = 1}^{n} l_{is} \cdot u_{sj} =
  \sum_{s = 1}^{\min (i, j)} l_{is} \cdot u_{sj}
$$

Ponieważ $l_{is} = 0$ dla $s > i$ i $u_{sj} = 0$ dla $s > j$, wystarczy
ograniczyć się jedynie do $\min (i, j)$ składników tej sumy, jako że pozostałe
są równe $0$.

Kolejność wyznaczania elementów macierzy $L$ i $U$

$$
  \begin{bmatrix}%4x4, ty: continued, tr: N
    1          & 0          & \cdots & 0 \\
    \downarrow & 2          & \cdots & 0 \\
    \downarrow & \downarrow & \ddots & \vdots \\
    \downarrow & \downarrow & \cdots & n \\
  \end{bmatrix} \cdot \begin{bmatrix}%4x4, ty: continued, tr: N
    1      & \rightarrow & \rightarrow & \rightarrow \\
    0      & 2           & \rightarrow & \rightarrow \\
    \vdots & \vdots      & \ddots      & \vdots \\
    0      & 0           & \cdots      & n \\
  \end{bmatrix}
$$

Metoda ta składa się z $n$ kroków. W $k$-tym kroku metody rozpoczynamy od
wyznaczania elementów na głównej przekątnej $l_{kk}$ i $u_{kk}$. Jeden z tych
elementów ma z góry nadaną wartość, zaś drugi wyznaczamy ze wzoru na element
$a_{kk}$ macierzy wynikowej

$$
  a_{kk} = \sum_{s = 1}^{k - 1} l_{ks} \cdot u_{sk} + l_{kk} \cdot u_{kk}
$$

czyli

$$
  l_{kk} u_{kk} = a_{kk} - \sum_{s = 1}^{k-1} l_{ks}u_{sk}
$$

W dalszym ciągu $k$-tego kroku wyznaczamy resztę elementów $k$-tego
wiersza macierzy $U$, oraz resztę $k$-tej kolumny macierzy $L$, ze wzorów na
elementy $a_{kj}$ i $a_{ik}$:

$$
  a_{kj} = \sum_{s = 1}^{k-1} l_{ks} u_{sj} + l_{kk} \cdot u_{kj}
  \qquad (k + 1 \le j \le n)
$$

czyli

$$
  u_{kj} = \frac{a_{kj} - \sum_{s = 1}^{k-1} l_{ks} u_{sj}}{l_{kk}}
$$

oraz

$$
  a_{ik} = \sum_{s = 1}^{k-1} l_{is} u_{sk} + l_{ik} u_{kk}
  \qquad (k + 1 \le i \le n)
$$

czyli

$$
  l_{ik} = \frac{a_{ik} - \sum_{s = 1}^{k-1} l_{is} u_{sk}}{u_{kk}}
$$

Czynności te powtarzamy dla kolejnych kroków aż do $n$-tego wyznaczając kolejne
wiersze macierzy $U$, oraz kolejne kolumny macierzy

::: {.theorem title="" ref=""}

Jeżeli wszystkie minory główne macierzy kwadratowej $A$ są nieosobliwe, to ma
ona rozkład $A = LU$

:::

Zatem metodę tę możemy stosować wówczas gdy wyznaczniki macierzy $A_k$ postaci

$$
  A_k = \begin{bmatrix}%4x4, ty: continued, tr: N
    a_{11} & a_{12} & \cdots & a_{1k}\\
    a_{21} & a_{22} & \cdots & a_{2k}\\
    \vdots & \vdots & \ddots & \vdots\\
    a_{k1} & a_{k2} & \cdots & a_{kk}\\
  \end{bmatrix}
$$

dla wszystkich $1 \le k \le n$ są różne od zera

W zależności od sposobu w jaki zostaną ustalone elementy spośród par $l_{ii}$ i
$u_{ii}$ mamy różne rozkłady $LU$ macierzy $A$.

- Jeśli $l_{ii} = 1$ dla $1 \le i \le n$, czyli w macierzy dolnie trójkątnej
  elementy na głównej przekątnej mają wartość 1, to taki rozkład nazywamy
  rozkładem Doolittle'a.

- Jeśli $u_{ii} = 1$ dla $1 \le i \le n$, czyli w macierzy górnie trójkątnej
  elementy na głównej przekątnej mają wartość 1, to taki rozkład nazywamy
  rozkładem Croute'a

- Jeśli $l_{ii} = u_{ii} = 1$, to modyfikując nieco algorytm rozkładu $LU$
  możemy uzyskać rozkład $A = LDU$, gdzie macierze $L$ i $U$ mają wartości 1 na
  głównej przekątnej, a macierz $D$ jest macierzą diagonalną

- Jeśli zachodzi $U = L^T$, czyli $u_{ij} = l_{ji}$, dla $i \le i, j \le n$, to
  taki rozkład nazywamy rozkładem Cholesky'ego.

Szczególnym spośród tych rozkładów jest rozkład Cholesky'ego. Wymaga on nieco
mocniejszych założeń o macierzy $A$.

::: {.theorem title="" ref=""}

Jeśli macierz $A$ jest rzeczywista, symetryczna ($A = A^T$) i dodatnio określona
($\displaystyle \bigwedge_{\vec{x} \ne \vec{0}} \vec{x}^T A \vec{x} > 0$), to ma
ona rozkład $A = LL^T$, gdzie $L$ jest macierzą dolnie trójkątną o dodatnich
elementach na głównej przekątnej

:::

W rozkładzie Cholesky'ego postępujemy tak samo jak w zwykłym rozkładzie $LU$,
pamiętając że $u_{ij} = l_{ji}$. Mamy tu zatem

$$
  l_{kk} = \sqrt{a_{kk} - \sum_{s = 1}^{k-1} l_{ks}^2}
$$

oraz

$$
  l_{ik} = \frac{a_{ik} - \sum_{s = 1}^{k-1} l_{is} l_{ks}}{l_{kk}}
$$

::: {.caution title="" ref=""}

Zauważmy, że z pierwszego z powyższych wzorów wynika, że

$$
  a_{kk} = \sum_{s = 1}^{k} l_{ks}^2 \ge l_{kj}^2
$$

dla dowolnego $j \le k$, czyli

$$
  |l_{kj}| \le \sqrt{a_{kk}} \quad 1 \le j \le k
$$

czyli każdy element wiersza macierzy $L$ (odpowiednio kolumny macierzy $L^T$)
może być ograniczony z góry przez pierwiastek z elementu na głównej przekątnej
macierzy $A$ w tym wierszu.

:::

---

2025-03-25

::: {.example title="" ref=""}

> Znajdź rozkłady Doolittle'a i Cholesky'ego macierzy

$$
  A = \begin{bmatrix}%3x3, ty: generic, tr: N
    60 & 30 & 20\\
    30 & 20 & 15\\
    20 & 15 & 12\\
  \end{bmatrix}
$$

Rozkład Doolittle'a

$$
  \begin{aligned}
  & l_{11} = l_{22} = l_{33} = 1 &
  u_{11} = \frac{a_{11}}{l_{11}} = \frac{60}{1} = 60 \\&
  u_{12} = \frac{a_{12}}{l_{11}} = 30 &
  u_{13} = \frac{a_{13}}{l_{11}} \\&
  l_{21} = \frac{a_{21}}{u_{11}} = \frac{30}{60} = \frac{1}{2}&
  l_{31} = \frac{a_{31}}{u_{11}} = \frac{20}{60} = \frac{1}{3}\\&
  u_{22} = \frac{a_{22} - l_{21} u_{12}}{l_{22}} =
           \frac{20 - \frac{1}{2} \cdot 30}{1} = 5 &
  u_{23} = \frac{a_{23} - l_{21} u_{13}}{l_{22}} =
           \frac{15 - \frac{1}{2} \cdot 20}{1} = 5 \\&
  l_{32} = \frac{a_{32} - l_{31} u_{12}}{u_{22}} =
  \frac{15 - \frac{1}{3} \cdot 30}{5} = 1 &
  u_{33} = \frac{a_{33} - l_{31} u_{13} - l_{32} u_{23}}{l_{33}} =
  \frac{12 - \frac{1}{3} \cdot 20 - 15}{1} = \frac{1}{3}
  \end{aligned}
$$

Zatem rozkład Doolittle'a ma postać

$$
  \begin{bmatrix}
    1           & 0 & 0 \\
    \frac{1}{2} & 1 & 0 \\
    \frac{1}{3} & 1 & 1 \\
  \end{bmatrix} \cdot \begin{bmatrix}
    60 & 30 & 20           \\
    0  & 5  & 5            \\
    0  & 0  & \frac{1}{3}  \\
  \end{bmatrix} = \begin{bmatrix}
    60 & 30 & 20 \\
    30 & 20 & 15 \\
    20 & 15 & 12 \\
  \end{bmatrix}
$$

Przykładowa implementacja w Octave

```matlab
function [L, U] = doolittle_dec(A)
  [h, w] = size(A);
  L = eye(h);
  U = zeros(h);
  for i = 1:h
    for j = i:h
      U(i, j) = A(i, j) - dot(L(i, 1:i-1), U(1:i-1, j));
    end
    for j = i+1:h
      L(j, i) = (A(j, i) - dot(L(j, 1:i-1), U(1:i-1, i)))/U(i, i);
    end
  end
end
```

---

Rozkład Cholesky'ego

$$
  \begin{aligned}
  &l_{11} = \sqrt{a_{11}} = \sqrt{60} &
  l_{21} = \frac{a_{21}}{l_{11}} = \frac{30}{\sqrt{60}} = \frac{1}{2} \sqrt{60} \\&
  l_{31} = \frac{a_{31}}{l_{11}} = \frac{20}{\sqrt{60}} = \frac{1}{3} \sqrt{60} &
  l_{22} = \sqrt{a_{22} - l_{21}^2} = \sqrt{20 - 15} = \sqrt{5} \\&
  l_{32} = \frac{a_{32} - l_{31} l_{21}}{l_{22}} = \frac{15 - 10}{\sqrt{5}} = \sqrt{5} &
  l_{33} = \sqrt{a_{33} - l_{31}^2 - l_{32}^2} = \sqrt{12 - \frac{60}{9} - 5} = \frac{\sqrt{3}}{3}
  \end{aligned}
$$

Zatem rozkład Cholesky'ego ma postać

$$
  \begin{bmatrix}
    \sqrt{60}             & 0        & 0 \\
    \frac{\sqrt{60}}{2}   & \sqrt{5} & 0 \\
    \frac{1}{3} \sqrt{60} & \sqrt{5} & \frac{\sqrt{3}}{3}  \\
  \end{bmatrix} \cdot \begin{bmatrix}
    \sqrt{60}  & \frac{\sqrt{60}}{2} & \frac{1}{3} \sqrt{60} \\
    0          & \sqrt{5}            & \sqrt{5} \\
    0          & 0                   & \frac{\sqrt{3}}{3} \\
  \end{bmatrix} = \begin{bmatrix}
    60 & 30 & 20 \\
    30 & 20 & 15 \\
    20 & 15 & 12 \\
  \end{bmatrix}
$$

Przykładowa implementacja w Octave

```matlab
function D = cholesky_dec(A)
  [h, w] = size(A);
  D = zeros(h);
  for i = 1:h
    D(i, i) = sqrt(A(i, i) - sum(D(i, 1:i-1) .^ 2));
    for j = (i + 1):h
      D(j, i) = (A(i, j) - dot(D(i, 1:i-1), D(j, 1:i-1)))/D(i, i);
    end
  end
end
```

:::

## Metoda eliminacji Gaussa

Kolejna metoda przekształcenia macierzy układu równań $A$ to metoda eliminacji
Gaussa. Podobnie jak poprzednia metoda sprowadza ona macierz $A$ do postaci
iloczynu macierzy dolnie trójkątnej i górnie trójkątnej. W podstawowej wersji
metoda ta polega na wyznaczeniu ciągu macierzy $A^{(i)}$, takich że $A^{(1)} = A$
poprzez przekształcenia macierzy będącej poprzednim elementem tego ciągu.
$k$-ty krok tego przekształcenia polega na wykonywaniu działań na wierszach
macierzy które prowadzą do wyzerowania wszystkich elementów w kolumnie $k$,
znajdującej się pod elementem na głównej przekątnej macierzy $A^{(k)}$.
Przekształcenia te mogą być interpretowane jako odejmowanie od siebie równań
układu przemnożonych przez pewne stałe zwane mnożnikami.
Uzyskujemy w ten sposób macierz górnie trójkątną $U = A^{(n)}$, podczas gdy
macierz dolnie trójkątna $L$ zostaje utworzona z tych mnożników.

Elementy macierzy $A^{(k + 1)}$ powstają z elementów macierzy $A^{(k)}$ zgodnie
z poniższym wzorem rekurencyjnym.

$$
  a_{ij}^{(k+1)} = \begin{cases}
  a_{ij}^{(k)}, & i \le k\\
  a_{ij}^{(k)} - \frac{a_{ik}^{(k)}}{a_{kk}^{(k)}} \cdot a_{kj}^{(k)},
  &i \ge k + 1 \land j \ge k + 1\\
  0, &i\ge k + 1 \land j \le k
  \end{cases}
$$

zaś elementy dolnie trójkątnej macierzy $L$ składają się z mnożników
wykorzystanych w tworzeniu ciągu macierzy $A^{(k)}$ i wyrażają się następującym
wzorem

$$
  L_{ik} = \begin{cases}
    \frac{a_{ik}^{(k)}}{a_{kk}(k)}, & i \ge k + 1\\
    1, &i = k\\
    0, & i \le k - 1
  \end{cases}
$$

::: {.theorem title="" ref=""}

Jeśli wszystkie elementy główne $a_{kk}^{(k)}$ obliczone za pomocą powyższych
wzorów są różne od zera, to macierz $A$ ma rozkład $LU$. W szczególności taki
rozkład mają macierze:

1) Dodatnio określone
2) O dominującej głównej przekątnej, tzn.

   $$
     \bigwedge_{1 \le i \le n} |a_{ii}| \ge \sum_{\substack{j = 1\\j\ne i}}^{n} |a_{ij}|
   $$

:::

::: {.example title="" ref=""}

Stosując metodę eliminacji Gaussa rozwiąż układ równań
$Ax = b$ dla

$$
  A = \begin{bmatrix}
    4 & -3 & 1\\
    2 & 2 & -4\\
    1 & -1 & 1\\
  \end{bmatrix} \quad b = \begin{bmatrix} 2\\ 0\\ 1\\ \end{bmatrix}
$$

Mamy $A = A^{(1)}$. W pierwszym kroku zerujemy wyrazy w pierwszej kolumnie
($a_{21}$ i $a_{31}$). Wyznaczamy mnożniki do wyzerowania pierwszej kolumny.
Są to:

$$
  l_{21} \frac{a_{21}}{a_{11}} = \frac{2}{4} = \frac{1}{2} \quad
  l_{31} = \frac{a_{31}}{a_{11}} = \frac{1}{4}
$$

a następnie od drugiego wiersza macierzy $A$ odejmujemy pierwszy pomnożony przez
$l_{21}$ oraz od trzeciego wiersza macierzy $A$ odejmujemy pierwszy pomnożony
przez $l_{31}$. Otrzymujemy macierz $A^{(2)}$

$$
  A^{(2)} = \begin{bmatrix}%3x3, ty: generic, tr: N
    4 & -3           & 1\\
    0 & \frac{7}{2}  & -\frac{9}{2}\\
    0 & -\frac{1}{4} & \frac{3}{4}\\
  \end{bmatrix}
$$

W drugim kroku zerujemy wyraz w drugiej kolumnie $(a_{32}^{(2)})$.

Mnożnik do wyzerowania tego wyrazu jest równy

$$
  l_{32} = \frac{a_{32}^{(2)}}{a_{22}^{(2)}} =
  \frac{-\frac{1}{4}}{\frac{7}{2}} = - \frac{1}{14}
$$

a następnie od trzeciego wiersza macierzy $A^{(2)}$ odejmujemy drugi pomnożony
pomnożony przez $l_{32}$. Otrzymujemy $A^{(3)}$

$$
  A^{(3)} = \begin{bmatrix}%3x3, ty: generic, tr: N
    4 & -3          & 1\\
    0 & \frac{7}{2} & -\frac{9}{2}\\
    0 & 0           & \frac{3}{7}\\
  \end{bmatrix}
$$

czyli

$$
  \begin{bmatrix}
    1           & 0             & 0\\
    \frac{1}{2} & 1             & 0\\
    \frac{1}{4} & -\frac{1}{14} & 1\\
  \end{bmatrix} \cdot \begin{bmatrix}%3x3, ty: triangular-r, tr: N
    4 & -3          & 1\\
    0 & \frac{7}{2} & -\frac{9}{2}\\
    0 & 0           & \frac{3}{7}\\
  \end{bmatrix} = A
$$

Przykładowa implementacja w Octave:

```matlab
function [L, U] = gauss(A)
  [h, w] = size(A);
  L = eye(h);
  for i = 1:h
    L(i+1:h, i) = A(i+1:h, i) / A(i, i);
    for j = i + 1:h
      A(j, :) = A(j, :) - A(i, :) / A(i, i) * A(j, i);
    end
  end
  U = A;
end
```

Pozostaje rozwiązać "łatwy do rozwiązania" układ równań $LUx = b$.

Czyli oznaczając $Ux = z$ rozwiążemy najpierw układ równań $Lz = b$.

Stosujemy podstawianie w przód:

$$
  z = \begin{bmatrix}
    2           \\
    -1          \\
    \frac{3}{7} \\
  \end{bmatrix} \quad
  \begin{aligned}
  &z_1 = b_1 = 2\\
  &z_2 = b_2 - l_{21} z_1 = 0 - \frac{1}{2} \cdot 2 = -1\\
  &z_3 = b_3 - l_{31}z_1 - l_{32} z_2 =
  1 - \frac{1}{4} \cdot 2 + \frac{1}{14} \cdot (-1) = \frac{3}{7}
  \end{aligned}
$$


Pozostaje teraz rozwiązać układ równań $Ux = z$, czyli

$$
\begin{bmatrix}
4 & -3 & 1\\
0 & \frac{7}{2} & -\frac{9}{2}\\
0 & 0 & \frac{3}{7}\\
\end{bmatrix} \cdot \begin{bmatrix}
x_1\\
x_2\\
x_3\\
\end{bmatrix} = \begin{bmatrix}
2\\
-1\\
\frac{3}{7}\\
\end{bmatrix}
$$

Tym razem stosujemy podstawienie wstecz.

$$
  \begin{aligned}
  &x_3 = \frac{z_3}{u_{33}} = \frac{\frac{3}{7}}{\frac{3}{7}} = 1\\
  &x_2 = \frac{z_2 - u_{23} x_3}{u_{22}} =
  \frac{-1 + \frac{9}{2} \cdot 1}{\frac{7}{2}} = 1\\
  &x_1 = \frac{z_1 - u_{12} x_2 - u_{13} x_3}{u_{11}} =
  \frac{2 + 3 \cdot 1 - 1 \cdot 1}{1} = 1
  \end{aligned}
$$

Rozwiązaniem tego układu równań jest wektor

$$
  x = \begin{bmatrix}
    1\\ 1\\ 1\\
  \end{bmatrix}
$$

:::

::: {.caution title="" ref=""}

Czasem łączy się operacje rozkładu macierzy $A$ z rozwiązaniem układu równań
$Lz = b$ poprzez dołączenie do macierzy $A$ wektora $b$ i wykonanie na nim tych
samych operacji co na wierszach macierzy $A$. Uzyskujemy wówczas macierz górnie
trójkątną $U$ oraz przekształcony wektor $b$ którego składowe są równe składowym
wektora $z$.

:::

::: {.example title="" ref=""}

Dla macierzy z poprzedniego przykładu zastosuj ten zmodyfikowany algorytm
metody eliminacji Gaussa

$$
  \begin{bmatrix}%3x4, ty: generic, tr: N
    4 & -3 & 1 & 2\\
    2 & 2 & -4 & 0\\
    1 & -1 & 1 & 1\\
  \end{bmatrix}
  \overset{\substack{w_2 = w_2 - \frac{1}{2}w_1 \\
                     w_3 = w_3 - \frac{1}{4} w_1}}
           {\longrightarrow}
  \begin{bmatrix}%3x4, ty: generic, tr: N
    4 & -3           & 1            & 2\\
    0 & \frac{7}{2}  & -\frac{9}{2} & -1\\
    0 & -\frac{1}{4} & \frac{3}{7}  & \frac{1}{2}\\
  \end{bmatrix}
  \overset{w_3 = w_3 + \frac{1}{14} w_2}{\longrightarrow}
  \begin{bmatrix}%3x4, ty: generic, tr: N
    4 & -3          & 1            & 2\\
    0 & \frac{7}{2} & -\frac{9}{2} & -1\\
    0 & 0           & \frac{3}{7}  & \frac{3}{7}\\
  \end{bmatrix}
$$

Czyli układ równań $Ax = b$ jest równoważny następującemu układowi równań

$$
  \begin{bmatrix}%3x3, ty: generic, tr: N
    4 & -3 & 1\\
    0 & \frac{7}{2} & -\frac{9}{2}\\
    0 & 0 & \frac{3}{7}\\
  \end{bmatrix} \cdot \begin{bmatrix}%3x1, ty: generic, tr: N
    x_1\\
    x_2\\
    x_3\\
  \end{bmatrix} = \begin{bmatrix}%3x1, ty: generic, tr: N
    2\\
    -1\\
    \frac{3}{7}\\
  \end{bmatrix}
$$

który rozwiązujemy tak jak w poprzednim przykładzie stosując podstawianie wstecz

Przykładowa implementacja w Octave:

```matlab
function [U, z] = gauss_comb(A, b)
  [h, w] = size(A);
  A(:, w+1) = b;
  L = eye(h);
  for i = 1:h
    L(i+1:h, i) = A(i+1:h, i) / A(i, i);
    for j = i + 1:h
      A(j, :) = A(j, :) - A(i, :) / A(i, i) * A(j, i);
    end
  end
  U = A(:, 1:w);
  z = A(:, w+1);
end
```

:::

---

2025-04-01

Przy rozwiązywaniu układów równań metodą eliminacji Gaussa mogą pojawić się
pewne problemy. Na przykład, jeśli macierz $A$ ma postać

$$
  \begin{bmatrix}
    0 & 1\\
    1 & 1\\
  \end{bmatrix}
$$

to jako że w pierwszym kroku element główny $a_{11} = 0$, nie można dokończyć
wykonanie tego kroku, ani tym bardziej przejść do kolejnych kroków. Rozważmy też
poniższy przykład:

::: {.example title="" ref=""}
Rozwiąż układ równań

$$
  \begin{bmatrix}
    \varepsilon & 1\\
    1 & 1\\
  \end{bmatrix} \begin{bmatrix}
    x_1\\
    x_2\\
  \end{bmatrix} = \begin{bmatrix}
    1\\
    2\\
  \end{bmatrix}
$$

gdzie $\varepsilon$ jest bardzo małą dodatnią liczbą różną od zera. Mamy wtedy

$$
  \begin{bmatrix}
    \varepsilon & 1 & | & 1\\
    1           & 1 & | & 2\\
  \end{bmatrix} \overset{w_2 = w_2 - \frac{1}{\varepsilon}w_1}{\longrightarrow}
  \begin{bmatrix}
    \varepsilon & 1                       & | & 1\\
    0           & 1-\frac{1}{\varepsilon} & | & 2 - \frac{1}{\varepsilon}\\
  \end{bmatrix}
$$

Zatem

$$
  x_2 = \frac{2 - \frac{1}{\varepsilon}}{1 - \frac{1}{\varepsilon}}
$$

$$
  x_1 = \frac{1 - x_2}{\varepsilon}
$$

Jako że $\varepsilon$ jest bardzo małe, czyli $\frac{1}{\varepsilon}$ jest
bardzo duże w arytmetyce fl

$$
  2-\frac{1}{\varepsilon} \approx
  1-\frac{1}{\varepsilon} \approx
  -\frac{1}{\varepsilon}
$$

czyli $x_2 \approx 1$, zaś $x_1 \approx 0$, podczas gdy dokładnym rozwiązaniem
jest $x_2 = \frac{2\varepsilon-1}{\varepsilon-1} \approx 1$ oraz
$x_1 = \frac{1-\frac{2\varepsilon-1}{\varepsilon-1}}{\varepsilon} =
-\frac{\varepsilon}{\varepsilon(\varepsilon - 1)} = \frac{1}{1-\varepsilon}
\approx 1$

Problemem w tym wypadku jest fakt, że element główny ($a_{11} = \varepsilon$)
jest względnie mały w porównaniu z resztą wartości w tym wierszu

:::

Powyższe problemy prowadzą do modyfikacji podstawowej metody eliminacji Gaussa
do metody eliminacji Gaussa ze skalowanym wyborem wierszy głównych. Polega ona
na zmianie kolejności równań w układzie równań tak, aby element główny w danym
kroku był możliwie największy. Ponieważ wymiana wierszy w macierzy jest z
programistycznego punktu widzenia kosztowna, zwykle w praktycznej realizacji
tego algorytmu przechowuje się w wektorze permutacji $p$ informacje w jakiej
kolejności zostały wybrane główne wierszy podczas eliminacji Gaussa.

## Metoda eliminacji Gaussa ze skalowanym wyborem wierszy głównych

1. Tworzymy wektor permutacji $p = [1, 2, 3, \ldots, n]$.
2. Tworzymy wektor skal
   $s = \{s_i = \max_{1\le j\le n} |a_{ij}| : i = 1, 2, \ldots, n\}$
3. Wykonujemy $n-1$ kroków eliminacji Gaussa (każdy dla eliminacji kolejnej
   kolumny), składających się się z

   (i) Wyboru indeksu kolejnego wiersza głównego, takiego, że
      $$
        \frac{|a_{p_j k}|}{s_{p_j}} \ge \frac{|a_{p_i k}|}{s_{p_i}} \quad
        i = k, k+1, \ldots, n
      $$
      gdzie $k$ jest numerem kroku(albo indeksem eliminowanej kolumny)

   (ii) Aktualizacji wektora permutacji $p_k \leftrightarrow p_j$
   (iii) Wyznaczeniu mnożnika $\frac{a_{p_i k}}{a_{p_k k}}$ do eliminacji
         $p_i$-go wiersza, $i = k+1, k+2, \ldots, n$
   (iv) Eliminacji $p_i$-tego wiersza $i = k+1, k+2, \ldots, n$ wraz z
        odpowiadającym mu wyrazem wolnym $b_{p_i}$

4. Rozwiązujemy otrzymany układ równań z macierzą górnie trójkątną $U$ i
   zmodyfikowanym wektorem $b$(będziemy go oznaczali $b_*$)

Rozwiązanie układu równań $Ux = b_*$ przebiega podobnie jak poprzednio,
pamiętamy jednak, o zmianie kolejności wierszy i elementów wektora $b_*$ zgodnie
z wektorem permutacji $p$.

::: {.example title="" ref=""}

Stosując metodę eliminacji Gaussa ze skalowanym wyborem wierszy głównych rozwiąż
układ równań:

$$
  \begin{bmatrix}
    2 & 3 & -6\\
    1 & -6 & 8\\
    3 & -2 & 1\\
  \end{bmatrix} \cdot
  \begin{bmatrix} x_1\\ x_2\\ x_3\\ \end{bmatrix} =
  \begin{bmatrix} 1\\ 1\\ 1\\ \end{bmatrix}
$$

Początkowo wektor permutacji $p = [1, 2, 3]$, a wektor skal $s = [6, 8, 3]$

Sprawdzamy ilorazy wartości bezwzględnych elementów w pierwszej kolumnie przez
skalę danego wiersza i wybieramy wiersz któremu odpowiada największa z tych
wartości:

$$
  \frac{|a_{p_1 1}|}{s_{p_1}} = \frac{2}{6} = \frac{1}{3} \qquad
  \frac{|a_{p_2 1}|}{s_{p_2}} = \frac{1}{8} \qquad
  \frac{|a_{p_3 1}|}{s_{p_3}} = \frac{3}{3} = 1
$$

Zatem do pierwszego kroku jako wiersz główny wybieramy wiersz 3.

Aktualizujemy wektor permutacji $p = [3, 2, 1]$ i otrzymujemy

$$
  \begin{bmatrix}
    2 & 3 & -6 & | & 1\\
    1 & -6 & 8 & | & 1\\
    3 & -2 & 1 & | & 1\\
  \end{bmatrix}
  \overset{\substack{w_1 = w_1 - \frac{2}{3} w_3\\w_2 = w_2 - \frac{1}{3}w_3}}
        {\longrightarrow }
  \begin{bmatrix}
    0 & \frac{13}{3}  & -\frac{20}{3} & | & \frac{1}{3}\\
    0 & -\frac{16}{3} & \frac{23}{3}  & | & \frac{2}{3}\\
    3 & -2            & 1             & | & 1          \\
  \end{bmatrix}
$$

W kolejnym kroku sprawdzamy ilorazy wartości bezwzględnych elementów w drugiej
kolumnie (wierszy wyznaczonych przez $p_2$ i $p_3$ – czyli wierszy 2 i 1) przez
skalę danego wiersza

$$
  \frac{|a_{p_2 2}|}{s_{p_2}} = \frac{\frac{16}{3}}{8} = \frac{2}{3} \qquad
  \frac{|a_{p_3 2}|}{s_{p_3}} = \frac{\frac{13}{3}}{6} = \frac{13}{18}
$$

Zatem kolejnym wierszem głównym jest wiersz wyznaczony przez $p_3$, czyli wiersz
pierwszy. Aktualizujemy wektor permutacji wymieniając $p_2$ z $p_3$ i
otrzymujemy $p = [3, 1, 2]$ i dostajemy:

$$
  \begin{bmatrix}
    0 & \frac{13}{3}  & -\frac{20}{3} & | & \frac{1}{3}\\
    0 & -\frac{16}{3} & \frac{23}{3}  & | & \frac{2}{3}\\
    3 & -2            & 1             & | & 1          \\
  \end{bmatrix}
  \overset{w_2 = w_2 + \frac{16}{13} w_1}{\longrightarrow}
  \begin{bmatrix}
    0 & \frac{13}{3}  & -\frac{20}{3} & | & \frac{1}{3}   \\
    0 & 0             & -\frac{7}{13} & | & \frac{14}{13} \\
    3 & -2            & 1             & | & 1             \\
  \end{bmatrix}
$$

Czyli macierz $U$ i wektor $b_*$ mają postać

$$
  \begin{bmatrix}
    0 & \frac{13}{3}  & -\frac{20}{3} & \\
    0 & 0             & -\frac{7}{13} & \\
    3 & -2            & 1             & \\
  \end{bmatrix} \quad
  b_* = \begin{bmatrix}
    \frac{1}{3}\\
    \frac{14}{3}\\
    1\\
  \end{bmatrix}
$$

Rozwiązujemy teraz układ równań $Ux = b_*$.

Stosujemy podstawianie wstecz zgodnie z wektorem $p$
(czyli w kolejności równań 2, 1, 3)

Rozwiązaniem są więc:

$$
  \begin{aligned}
  x_3 = \frac{b_{* p_3}}{U_{p_3 3}} =
  \frac{\frac{14}{13}}{-\frac{7}{13}} = -2 \qquad
  x_2 = \frac{b_{*p_2} - u_{p_2 3} \cdot x_3}{u_{p_2 2}} =
  \frac{\frac{1}{3} + \frac{20}{3} \cdot (-2)}{\frac{13}{3}} = -3\\
  x_1 = \frac{b_{* p_1} - u_{p_1 2} x_2 - u_{p_1 3} x_3}{u_{p_1 1}} =
  \frac{1 - (-2) (-3) - 1 (-2)}{3} = -1
  \end{aligned}
$$

Przykładowa implementacja w Octave:

```matlab
function x = gauss_perm(A, b)
  [h, w] = size(A);
  x = zeros(h, 1);

  % Wektor permutacji
  p = 1:h;

  % Wektor skal
  s = max(abs(A'));

  % Tworzymy macierz rozszerzoną
  A(:, h+1) = b;

  for j = 1:h-1
    % Wybór kolejnego wiersza głównego
    [_, i] = max(abs(A(p(j:h), j))' ./ s(p(j:h)));

    % Musimy uwzględnić to, że `i` był wybrany z wektora długości
    % h - j + 1
    i = i + j - 1;

    % Aktualizacja wektora permutacji
    p([j, i]) = p([i, j]);

    % Eliminacja pozostałych wierszy
    for k = j+1:h
      A(p(k), :) = A(p(k), :) - A(p(j), :) * A(p(k), j) / A(p(j), j);
    end
  end

  % Rozwiązanie układu podstawianiem wstecz
  for i = h:-1:1
    x(i) = ( A(p(i), h + 1) -
             dot(A(p(i), i+1:h), x(i+1:h))
           ) / A(p(i), i);
  end
end
```

:::

Można oszacować liczbę działań niezbędnych do przeprowadzenia metody eliminacji
Gaussa ze skalowanym wyborem wierszy głównych. Aby wyznaczyć współczynniki
$\displaystyle\frac{|a_{p_j k}|}{p_j}$ dla każdego spośród $n$ wierszy, niezbędne do wyboru
wierszy głównych, należy wykonać $n$ dzieleń.

W pierwszym korku eliminacji do każdego wiersza należy wyznaczyć mnożnik
$\displaystyle\frac{a_{p_i k}}{a_{p_k k}}$ co wymaga jednego dzielenia, oraz
$n-1$ mnożeń i tyle samo odejmowań. Eliminacja jednego wiersza w pierwszym kroku
wymaga $2 (n - 1) + 1 = 2n - 1$ działań. Przemnażając to przez liczbę wierszy i
dodając operacje niezbędne do wyboru wierszy głównych otrzymujemy liczbę
operacji w pojedynczym kroku metody:

$$
  (2n - 1) \cdot (n - 1) + n = 2n^2 - 3n + 1 + n = 2n^2 - 2n + 1
$$

Ponieważ w każdym kolejnym kroku wykonujemy te same operacje tylko dla
zmniejszonego o 1 rozmiaru macierzy, zatem łączna liczba operacji jest równa

$$
  \sum_{i = 1}^{n} (2i^2 - 2i + 1) =
  2 \cdot \frac{n (n+1) (2n + 1)}{6} - 2 \cdot \frac{n(n+1)}{2} + n =
  \frac{2}{3}n^3 + \frac{n}{3}
$$

::: {.theorem title="" ref=""}

Wszystkie przedstawione algorytmy rozwiązywania układów równań liniowych są
numerycznie poprawne. Wskaźnik uwarunkowania zadania rozwiązywania układu równań
postaci

$$
  Ax = b
$$

zależy od macierzy $A$ i jest równy

$$
  \kappa(A) = \left\Vert A \right\Vert \cdot \left\Vert A^{-1} \right\Vert
$$

:::

---

2025-04-08

## Inne modyfikacje metody eliminacji Gaussa

Powyżej przedstawione algorytmy rozwiązywania układów równań liniowych można
uzupełnić o dodatkowe modyfikacje poprawiające działanie tych algorytmów.
Przykładowymi modyfikacjami są:

### Wstępne wyważanie wierszy

Polega na wstępnym podzieleniu każdego z wierszy (i odpowiadających im wyrazów
wolnych) przez wartość bezwzględną (co do modułu) elementu wiersza
$\displaystyle r_i = \frac{1}{\max_{1 \le j \le n} |a_{ij}|}$.

Prowadzi to do zamiany układu równań
$$
  \sum_{j = 1}^{n} a_{ij} x_j = b_i
  \qquad \text{na układ} \qquad
  \sum_{j = 1}^{n} (r_i a_{ij}) x_j = b_{i} r_{i}
$$

Przykładowa implementacja w Octave:

```matlab
function x = gauss_scaled_rows(A, b)
  [n, m] = size(A);
  r = max(abs(A'));
  A = A ./ r';
  b = b ./ r';
  L = eye(n);
  for k = 1:n-1
    for i = k+1:n
      L(i, k) = A(i, k) / A(k, k);
      A(i, :) = A(i, :) - L(i, k) * A(k, :);
    end
  end
  z = rozw_l(L, b);
  x = rozw_u(A, z);
end
```

### Wstępne wyważanie kolumn

Polega na wstępnym podzieleniu każdej z kolumn przez wartość bezwzględną z
maksymalnego (co do modułu) elementu w kolumnie
$\displaystyle c_{j} = \frac{1}{\max_{1 \le i \le n} |a_{ij}|}$

Prowadzi to do zamiany układu równań
$$
  \sum_{j = 1}^{n} a_{ij} x_j = b_i
  \qquad \text{na układ} \qquad
  \sum_{j = 1}^{n} (c_j a_{ij}) \frac{x_j}{c_j} = b_i
$$

Przyjmując wtedy $y_j = \frac{x_j}{c_j}$ rozwiązujemy ten układ równań
względem wektora $y$ i wyznaczamy $x$ z powyższej zależności

Przykładowa implementacja w Octave:

```matlab
function x = gauss_scaled_cols(A, b)
  [n, m] = size(A);
  r = max(abs(A));
  A = A ./ r;
  L = eye(n);
  for k = 1: n -1
    for i = k+1:n
      L(i, k) = A(i, k) / A(k, k);
      A(i, :) = A(i, :) - L(i, k) * A(k, :);
    end
  end
  z = rozw_l(L, b);
  y = rozw_u(A, z);
  x = y ./ r';
end
```

### Pełny wybór elementów głównych

W kolejnych krokach wybieramy elementy główne nie tylko spośród elementów w
aktualnie zerowanej kolumnie $k$-tej, ale spośród wszystkich pozostałych
$(n-k+1)^2$ elementów. Zastosowanie tej metody wymaga wprowadzenia dodatkowego
wektora permutacji kolumn, ale w praktyce nie działa istotnie lepiej od
algorytmu eliminacji Gaussa ograniczającego się do wyboru wierszy głównych

### Wyważanie lub skalowanie w każdym kroku eliminacji

W każdym kroku działania metody wyznaczamy nowy wektor skal $s$ lub w każdym
kroku dokonujemy wyważanie wierszy albo kolumn.

### Poprawianie iteracyjne końcowego rozwiązania

::: {.example title="" ref=""}

$$
  A_{3\times 3}x = b \qquad
  x = \begin{bmatrix}%3x1, ty: generic, tr: N
    x_1\\
    x_2\\
    x_3\\
  \end{bmatrix}
$$

Dokładne rozwiązanie to:

$$
  \begin{aligned}
  &a_{11}(x_1 + \varepsilon_1) + a_{12}(x_2 + \varepsilon_2) + a_{13}(x_3 + \varepsilon_3) = b_1\\
  &a_{21}(x_1 + \varepsilon_1) + a_{22}(x_2 + \varepsilon_2) + a_{23}(x_3 + \varepsilon_3) = b_2\\
  &a_{31}(x_1 + \varepsilon_1) + a_{32}(x_2 + \varepsilon_2) + a_{33}(x_3 + \varepsilon_3) = b_3
  \end{aligned}
$$

Gdzie

$$
  \varepsilon = \begin{bmatrix}%3x1, ty: generic, tr: N
    \varepsilon_1\\
    \varepsilon_2\\
    \varepsilon_3\\
  \end{bmatrix}
$$

$$
  Ax + A\varepsilon = b \iff A\varepsilon = \underbrace{(b - Ax)}_{b^*}
$$

:::

W metodzie poprawiania iteracyjnego zakładamy iż jako rozwiązanie układu
równań $Ax = b$ otrzymujemy jedynie jego przybliżony wektor rozwiązań
$x^{(0)}$ podczas gdy wartość dokładna wektora rozwiązań $x$ wyraża się
wzorem

$$
  x = x^{(0)} + A^{-1}(b - Ax^{(0)}) = x^{(0)} + e^{(0)}
$$

gdzie różnicę $r^{(0)} = b - Ax^{(0)}$ nazywamy wektorem rezydualnym, a
wektor błędu $e^{(0)}$ możemy wyznaczyć rozwiązując układ równań

$$
  Ae^{(0)} = r^{(0)}
$$

W ten sposób możemy określić kolejne przybliżenia rozwiązań $x^{(i+1)}$ za
pomocą następujących wzorów rekurencyjnych:

$$
  \begin{aligned}
    &r^{(i)} = b - Ax^{(i)}, \\
    &Ae^{(i)} = r^{(i)}, \\
    &x^{(i+1)} = x^{(i)} + e^{(i)}
  \end{aligned}
$$

Uzyskujemy ciąg wektorów przybliżonych rozwiązań tym szybciej zbieżny do
wektora dokładnego $x$ im dokładniej jest rozwiązany zarówno podstawowy układ
równań $Ax^{(i)} = b$ jak i układy równań $Ae^{(i)} = r^{(i)}$.

## Metody iteracyjne rozwiązywania układów równań liniowych

Podane dotychczas metody rozwiązywania układów równań liniowych są metodami
dokładnymi. Po ich zastosowaniu otrzymujemy rozwiązanie które byłoby dokładne
gdyby nie błędy wynikające z przeprowadzania działań w arytmetyce
zmiennopozycyjnej fl, oraz błędy reprezentacji liczb w pamięci komputera. W
metodach iteracyjnych konstruuje się natomiast ciąg wektorów rozwiązań
$x^{(i)}$, w taki sposób, aby ciąg ten był zbieżny do rozwiązania dokładnego
$x$. Zaletą zastosowania metod iteracyjnych jest ich szybkość działania (z
reguły wymagają mniejszej liczby operacji), oraz mniejsze wymagania pamięciowe,
jednakże odbywa się to kosztem mniejszej dokładności uzyskanego rozwiązania.
Przekształcamy w następującej sposób rozwiązujemy układ równań liniowych w
postaci macierzowej

$$
  \begin{aligned}
  &Ax = b \quad &\Big| +Qx - Ax\\
  &Qx = (Q - A) x + b &
  \end{aligned}
$$

gdzie $Q$ jest pewną nieosobliwą macierzą. Otrzymane równanie jest równoważne
wyjściowemu układowi równań i ma ten sam zbiór rozwiązań. Powyższe równanie
można traktować jako wzór rekurencyjny służący do wyznaczania kolejnych
przybliżeń rozwiązania $x$, zapisując je w postaci

$$
  \star \quad Qx^{(k)} = (Q - A) x^{(k-1)} + b
$$

Jeśli ciąg $x^{(k)}$ jest zbieżny do $x$, to spełnia on powyższe równanie o czym
łatwo się przekonać przechodząc w nim do granicy przy $k \to \infty$.

Dobierając różne postaci macierzy $Q$ uzyskujemy różne metody iteracyjne. Aby
dana metoda była wygodna w zastosowaniach macierz $Q$ powinna być dobrana w taki
sposób, aby wyznaczanie kolejnych wartości $x^{(k)}$ było łatwe (aby łatwo było
wyznaczyć macierz $Q^{-1}$) oraz aby wyznaczony w ten sposób ciąg rozwiązań
$x^{(k))}$ był możliwie szybko zbieżny do rozwiązania dokładnego. Mnożąc
lewostronnie równanie $\star$ otrzymujemy:
$$
  \begin{aligned}
  &Q^{-1} Q x^{(k)} = Q^{-1}(Q - A) x^{(k-1)} + Q^{-1}b\\
  &x^{(k)}          = (I - Q^{-1} A) x^{(k-1)} + Q^{-1}b
  \end{aligned}
$$

Jeśli $\left\Vert I - Q^{-1} A \right\Vert < 1$, to $x^{(k)}$ zdefiniowany jak
powyżej jest zbieżny do rozwiązania układu równań $Ax = b$, bez względu na
sposób doboru pierwszego przybliżenia rozwiązania $x^{(0)}$

### Metoda Richardsona

Macierz $Q$ jest w niej macierzą jednostkową $I$, czyli

$$
  x^{(k)} =
  (I - A) x^{(k-1)} + b =
  x^{(k - 1)} + (b - Ax^{(k-1)}) =
  x^{(k-1)} + r^{(k-1)}
$$

gdzie $r^{(k-1)} = b - Ax^{k-1}$ jest wektorem rezydualnym.

Metoda ta jest zbieżna, gdy $\left\Vert I - A \right\Vert < 1$. W metodzie tej w
$k$-tym kroku wyznaczamy wektory $x^{(k)}$ i $r^{(k)}$ za pomocą wzorów

$$
  \begin{aligned}
    r_i^{(k)} = b_i - \sum_{j = 1}^{n} a_{ij} x_j^{(k)}\\
    x_i^{(k)} = x_i^{(k-1)} + r_i^{(k)}
  \end{aligned}
$$

### Metoda Jacobiego

Macierz $Q$ jest w niej macierzą przekątniową, a elementy na jej głównej
przekątnej są równe elementom głównej przekątnej macierzy $A$

W metodzie tej wyznaczamy $i$-tą składową kolejnego przybliżenia rozwiązania z
$i$-tego równania, w który w miejsce pozostałych składowych wstawione zostały
ich wartości z poprzedniego przybliżenia rozwiązania. Wzór służący wyznaczaniu
składowych kolejnych przybliżeń ma zatem postać

$$
  x_i^{(k)} =
  \frac{\displaystyle b_i - \sum_{\substack{j = 1\\ j \ne i}}^{n} a_{ij} x_j}{a_{ii}}
$$

---

2025-04-15

::: {.theorem title="" ref=""}

Jeśli macierz $A$ jest dominująca przekątniowo (tzn. o dominującej głównej
przekątnej), to ciąg $x^{(k)}$ zdefiniowany tak jak w metodzie Jacobiego jest
zbieżny do rozwiązania układu równań $Ax = b$ bez względu na sposób doboru
pierwszego przybliżenia rozwiązania $x^{(0)}$.

:::

::: {.caution title="" ref=""}

Ponieważ w każdym kroku tej metody następuje dzielenie wektora $b$ oraz elementu
macierzy $A$ w $i$-tym wierszu przez element z głównej przekątnej ($a_{ii}$),
dlatego w praktycznym zastosowaniu tej metody wygodnie jest przed przejściem do
kolejnych kroków wyznaczania przybliżenia rozwiązania, podzielić wiersze
macierzy $A$, oraz odpowiadające im składowe wektora $b$ przez odpowiednie
wyrazy $a_{ii}$ z głównej przekątnej macierzy $A$

:::

### Metoda Gaussa-Seidela

Macierz $Q$ jest w niej macierzą dolnie trójkątną, a jej elementy są równe
elementom macierzy $A$ poniżej głównej przekątnej (wraz z tą przekątną), czyli
$a_{ij} \, i \ge j$

Metoda ta działa podobnie jak metoda Jacobiego. W każdym kroku metody wyznaczamy
$i$-tą składową kolejnego przybliżenia rozwiązania z $i$-tego równania w którym
w miejsce składowych o indeksach od $i + 1$ do $n$ wstawione są ich wartości z
poprzedniego przybliżenia rozwiązania, a w miejsce składowych o indeksach od $1$
do $i-1$ wstawione są ich wartości z obecnie wyznaczanego przybliżenia
rozwiązania (w momencie wyznaczania $i$-tej składowej wcześniejsze składowe są
już wyznaczone). Wzór służący wyznaczaniu składowych kolejnych przybliżeń ma
zatem postać:

$$
  x_i^{(k)} = \frac{\displaystyle b_i -
                    \sum_{j = 1}^{i - 1} a_{ij}x_j^{(k)} -
                    \sum_{j = i + 1}^{n} a_{ij}x_j^{(k-1)}}{a_{ii}}
$$

::: {.theorem title="" ref=""}

Jeśli macierz $A$ jest dominująca przekątniowo, to ciąg $x^{(k)}$ zdefiniowany
tak jak w metodzie Gaussa-Seidela, jest zbieżny do rozwiązania układu równań
$Ax = b$, bez względu na sposób doboru pierwszego przybliżenia rozwiązania
$x^{(0)}$.

:::

W metodach iteracyjnych można poprawić ich zbieżność poprzez zastosowanie
dodatkowych technik polegających na ustalaniu wartości nowego przybliżenia
rozwiązania poprzez wykorzystanie także poprzednich rozwiązań:

1) Ekstrapolacja – dla ustalonej wartości parametru $0 \le \gamma \le 1$ w
   $k$-tym kroku wyznaczamy najpierw $k$-tą wartość wektora przybliżeń rozwiązania
   $x^{(k)}$ zgodnie z jedną z podanych metod, a następnie ustalamy ostateczną
   wartość $k$-tego przybliżenia jako
   $$
   x^{(k)} = \gamma x^{(k)} + (1 - \gamma) x^{(k-1)}
   $$

2) Metoda Czebyszewa – dla ustalonych wartości parametru $0 \le \gamma \le 1$ i
   ciągu $0 \le \varrho_{k} \le 1$ dla $k \ge 2$ w $k$-tym kroku wyznaczamy najpierw
   $k$-tą wartość wektora przybliżeń rozwiązań $x^{(k)}$ zgodnie z jedną z
   podanych metod a następnie ustalamy ostateczną wartość $k$-tego przybliżenia
   jako

   $$
     x^{(k)} = \varrho_k (\gamma x^{(k)} + (1 - \gamma) x^{(k-1)}) +
               (1 - \varrho_k)x^{(k-2)}
   $$

Nieco inną grupą metod iteracyjnych są metody gradientowe. W metodach tych
kolejne przybliżenie rozwiązania wyraża się wzorem

$$
  x^{(k)} = x^{(k-1)} + t^{k-1} v^{(k)}
$$

gdzie

- ciąg $v^{(k)}$ jest pewnym ciągiem wektorów kierunkowych
- $t_k$ są pewnymi liczbami rzeczywistymi

::: {.example title="" ref=""}
Przykładem metody gradientowej jest metoda najszybszego spadku. W metodzie rolę
ciągu wektorów $v^{(k)}$ pełni ciąg wektorów rezydualnych a współczynniki $t_k$
wyznaczone są ze wzoru

$$
  t_k = \frac{v^{(k)} \circ v^{(k)}}{v^{(k)} \circ (Av^{(k)})}
$$

gdzie $\circ$ oznacza iloczyn skalarny. Poszczególne ciągi w tej metodzie
wyrażają się zatem wzorami:

$$
  \begin{aligned}
    v_i^{(k)} &= b_i - \sum_{j = 1}^{n} a_{ij} x_j^{(k-1)}\\
    t_k       &= \frac{\sum_{i = 1}^{n} (v_i^{(k)})^2}{\sum_{i = 1}^{n} v_i^{(k)} \cdot (\sum_{j = 1}^{n} a_{ij} v_i^{(k)})}\\
    x_i^{(k)} &= x_i^{(k-1)} + t_k \cdot v_i^{(k)}
  \end{aligned}
$$

Metody gradientowe można stosować jedynie do macierzy rzeczywistych
symetrycznych i dodatnio określonych

:::

::: {.example title="" ref=""}
Wykonaj po 2 kroki iteracyjnych metod Jacobiego i Gaussa-Seidela dla układu
równań

$$
  \begin{bmatrix}%3x3, ty: generic, tr: N
    2 & -1 & 0\\
    1 & 6 & -2\\
    4 & -3 & 8\\
  \end{bmatrix} \begin{bmatrix}%3x1, ty: generic, tr: N
    x_1\\
    x_2\\
    x_3\\
  \end{bmatrix} = \begin{bmatrix}%3x1, ty: generic, tr: N
    2\\
    -4\\
    5\\
  \end{bmatrix}
$$

rozpoczynając od wektora $x^{(0)} = \begin{bmatrix}%3x1, ty: generic, tr: N
  0\\ 0\\ 0\\
\end{bmatrix}$

Wyznaczając z kolejnych równań poszczególne składowe wektora $x^{(k)}$ mamy

| Metoda Jacobiego                                                               | Metoda Gaussa-Seidela                                                         |
| --------------                                                                 | ---------------                                                               |
| $x_1^{(k)} = \frac{2 + x_2^{(k-1)}}{2} = 1 + \frac{x_2^{(k-1)}}{2}$            | $x_1^{(k)} = 1 + \frac{x_2^{(k-1)}}{2}$                                       |
| $x_2^{(k)} = -\frac{1}{6} x_1^{(k-1)} + \frac{1}{3} x_3^{k-1} - \frac{2}{3}$   | $x_2^{(k)} = - \frac{1}{6} x_1^{(k)} + \frac{1}{3} x_3^{(k-1)} - \frac{2}{3}$ |
| $x_3^{(k)} = -\frac{1}{2} x_1^{(k-1)} + \frac{3}{8} x_2^{(k-1)} + \frac{5}{8}$ | $x_3^{(k)} = -\frac{1}{2} x_1^{(k)} + \frac{3}{8}x_2^{(k)} + \frac{5}{8}$

Dla metody Jacobiego mamy zatem:

$$
  \begin{aligned}
  &x_1^{(1)} = 1 \\
  &x_2^{(1)} = -\frac{2}{3} \\
  &x_3^{(1)} = \frac{5}{8} \\
  \end{aligned} \qquad
  x^{(1)} = \begin{bmatrix} 1\\ -\frac{2}{3}\\ \frac{5}{8}\\ \end{bmatrix}
$$

$$
  \begin{aligned}
  &x_1^{(2)} = 1 + \frac{1}{2} \cdot (-\frac{2}{3}) = \frac{2}{3 }\\
  &x_2^{(2)} = -\frac{1}{6} \cdot 1 +
  \frac{1}{3} \cdot \frac{5}{8} - \frac{2}{3} = -\frac{15}{24} \\
  &x_3^{(2)} = -\frac{1}{2}\cdot 1 +
  \frac{3}{8} \cdot (-\frac{2}{3}) + \frac{5}{8} = -\frac{1}{8}
  \end{aligned} \qquad x^{(2)} = \begin{bmatrix}%3x1, ty: generic, tr: N
    \frac{2}{3}\\
    -\frac{15}{24}\\
    -\frac{1}{8}\\
  \end{bmatrix}
$$

Dla metody Gaussa-Seidela:

$$
  \begin{aligned}
    &x_1^{(1)} = 1 - \frac{1}{2} \cdot 0 = 1\\
    &x_2^{(1)} = -\frac{1}{6} \cdot 1 + \frac{1}{3} \cdot 0 -
    \frac{2}{3} = -\frac{5}{6}\\
    &x_3^{(1)} = -\frac{1}{2} \cdot 1 +
    \frac{3}{8} (-\frac{5}{6}) + \frac{5}{8} = -\frac{3}{16}
  \end{aligned} \qquad x^{(1)} =
  \begin{bmatrix} 1\\ -\frac{5}{6}\\ -\frac{3}{16}\\ \end{bmatrix}
$$

$$
  \begin{aligned}
    &x_1^{(2)} = 1 + \frac{1}{2} (-\frac{5}{6}) = \frac{7}{12}\\
    &x_2^{(2)} = -\frac{1}{6} \cdot \frac{7}{12} +
    \frac{1}{3} (-\frac{3}{16}) - \frac{2}{3} = -\frac{119}{144}\\
    &x_3^{(2)} = -\frac{1}{2} \cdot \frac{7}{12} +
    \frac{3}{8} (-\frac{119}{144}) + \frac{5}{8} = \frac{27}{1152}
  \end{aligned} \qquad x^{(2)} = \begin{bmatrix}%3x1, ty: generic, tr: N
    \frac{7}{12}\\ -\frac{119}{144}\\ \frac{27}{1152}\\
  \end{bmatrix}
$$

:::

# Wykład. Rozwiązywanie równań nieliniowych

Niech $g(x)$ i $h(x)$ będą dwoma funkcjami rzeczywistymi zmiennej
$x \in \mathbb{R}$, czyli $g, h : \mathbb{R} \to \mathbb{R}$

Równanie $g(x) = h(x)$ nazywamy nieliniowym jeśli funkcja $f(x) = g(x) - h(x)$
nie jest funkcją liniową. Przynosząc funkcję $h(x)$ na lewą stronę powyższego
równania otrzymujemy równoważne mu równanie postaci

$$
  f(x) = g(x) - h(x) = 0
$$

Zatem aby znaleźć rozwiązanie równania $g(x) = h(x)$ wystarczy odnaleźć miejsce
zerowe funkcji $f(x) = g(x) - h(x)$. Problem rozwiązywania równania, jest zatem
równoważny problemowi znajdowania miejsca zerowego funkcji.

## Metody znajdowania miejsca zerowego

### Metoda bisekcji

Metodę bisekcji można stosować do funkcji ciągłej i takiej, że na końcach
badanego przedziału przyjmuje ona wartości przeciwnych znaków. Dla takiej
funkcji można zastosować własność Darboux.

::: {.theorem title="Własność Darboux" ref=""}

Funkcja ciągła $f$ w przedziale $[a, b]$ przyjmuje w tym przedziale wszystkie
wartości pomiędzy $f(a)$ i $f(b)$. W szczególności jeśli $f(a) \cdot f(b) < 0$,
to w przedziale $(a, b)$ znajduje się miejsce zerowe tej funkcji.

Zatem warunek $f(a)\cdot f(b) < 0$ gwarantuje istnienie wewnątrz przedziału
$[a, b]$ przynajmniej jednego miejsca zerowego

:::
