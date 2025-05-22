---
title: "Archiwum: Notatki z Ekonometrii"
lang: pl
toc: true
toc-own-page: true
---

- wyk: dr A. Makarewicz-Trześniewska

---

# Wykład (2025-02-26)

## Zmienne objaśniające w liniowym modelu ekonometrycznym

Zmienne objaśniające w liniowym modelu ekonometrycznym po- winny być:

- silnie skorelowane ze zmienną objaśnianą,
- słabo skorelowane między sobą,
- silnie skorelowane z innymi zmiennymi objaśniającymi, które nie weszły do
  modelu (są ich reprezentantami).

## Zmienne Quasi-stałe

Warunkiem wstępnym do tego, aby dana zmienna (np. $X_j$) mogła być uznana za
objaśniającą w modelu, jest jej wystarczające zróżnicowanie. Zmienną
objaśniającą nie może być zmienna, której poszczególne obserwacje nie różnią się
między sobą (lub różnią się w niewielkim stopniu). Nie jest to wtedy już
zmienna, lecz **stała** (lub **quasi-stała**).

### Współczynnik zmienności
Do mierzenia poziomu zróżnicowania najczęściej wykorzystuje się klasyczny
współczynnik zmienności:

$$
  V_j = \frac{s_j}{\overline{x}_j}
$$

gdzie

- $s_j$ – odchylenie standardowe zmiennej $X_j$
- $\overline{x}_j$ – średnia arytmetyczna zmiennej $X_j$ lub oparty na rozstępie

Zwykle obiera się krytyczną wartość współczynnika zmienności $V^*$
(np. $V^* = 0,1$). Zmienne spełniające nierówność

$$
  V_j < V^*
$$

uznaje się za mało zróżnicowane i eliminuje ze zbioru potencjalnych zmiennych
objaśniających.

### Współczynnik zmienności oparty na rozstępie

$$
  W_j = 2 \cdot \frac{\max_i x_{ij} - \min_i x_{ij}}{\max_{i} x_{ij} + \min_{i} x_{ij}}
$$

## Współczynnik korelacji liniowej Pearsona

Współczynnik korelacji liniowej Pearsona $r_{jl}$
: jest miarą liniowej zależności między zmiennymi $X_j$ oraz $X_l$. Jest on
  określony następująco:

  $$
    r_{jl} = \frac{\sum_{i = 1}^{n} (x_{ij} - \overline{x}_j)(x_{il} - \overline{x}_l)}
    {\sqrt{\sum_{i = 1}^{n} (x_{ij} - \overline{x}_j)^2
           \sum_{i = 1}^{n} (x_{il} - \overline{x}_l)^2}}
  $$

Wartość współczynnika korelacji zawiera się w przedziale $[-1, 1]$.

Jego znak wskazuje na kierunek zależności.

![Dodatnia zależność liniowa między zmiennymi](assets/E-wyk1-rys1.png){width=40%}
![Ujemna zależność liniowa między zmiennymi](assets/E-wyk1-rys2.png){width=40%}

### Macierz korelacji

Współczynnik korelacji między $m$ zmiennymi można zapisać w postaci
**macierzy korelacji**

$$
  R = \begin{bmatrix}%4x4, ty: generic, tr: N
    1 & r_{12} & \ldots & r_{1m}\\
    r_{21} & 1 & \ldots & r_{2m}\\
    \vdots & \vdots & \ddots & \vdots\\
    r_{m1}& r_{m2} & \cdots & 1\\
  \end{bmatrix}
$$

gdzie

- $r_{jl}$ – współczynnik korelacji zmiennych $X_j$ i $X_l$.

Własności macierzy korelacji:

1. $-1 \le r_{jl} \le 1$
2. $r_{jj} = 1$
3. $r_{jl} = r_{lj}$

![Funkcyjna zależność liniowa między zmiennymi](assets/E-wyk1-rys3.png){width=50%}

![Słaba zależność liniowa między zmiennymi](assets/E-wyk1-rys4.png){width=50%}

### Badanie istotności korelacji

Badając skorelowanie dwóch zmiennych $X, Y$, możemy podjąć decyzję o istotności
skorelowania, arbitralnie obierając krytyczną wartość współczynnika korelacji
(narzuconej z góry przez badacza). Możemy również uzależnić krytyczną wartość
współczynnika korelacji od warunków próby, jaką dysponujemy.

Sprawdzamy wówczas hipotezę, że zmienne $X, Y$ nie są istotnie skorelowane,
czyli hipotezę $H_0 : R_{xy} = 0$, wobec hipotezy alternatywnej
$H_1 : r_{xy} \ne 0$

Dla wyznaczonego z próby współczynnika korelacji $r_{xy}$ sprawdzianem tej
hipotezy jest wartość statystyki:

$$
  t = \frac{|r_{xy}|}{\sqrt{1 - r_{xy}^2}} \cdot \sqrt{n-2}
$$

Wartość krytyczną $t_{\alpha}$ odczytujemy z tablic rozkładu t-Studenta dla
ustalonego z góry poziomu istotności $\alpha$ i dla $n-2$ stopni swobody.

- Jeżeli $t_{\alpha} < t$, to hipotezę zerową należy odrzucić

  Oznacza to, że wartość $r_{xy}$ istotnie różni się od zera.

- Jeżeli $t_{\alpha} \ge t$, to nie ma podstaw do odrzucenia hipotezy zerowej.

  Otrzymana z próby, różna od zera wartość współczynnika korelacji wynika tylko z
  przypadku.

Jeśli w hipotezie alternatywnej określony jest znak współczynnika korelacji,
czyli $H_1 : r_{xy} < 0$ lub $H_1 : r_{xy > 0}$, to w teście korzystamy z obszaru
lewostronnego lub prawostronnego.

## Dobór zmiennych (metoda analizy współczynników korelacji)

W metodzie ustala się wartość krytyczną współczynnika korelacji. Określa ona
poziom istotności współczynnika korelacji. Wartość na może być zadana przez
badacza albo wyznaczona ze wzoru

$$
  r^* = \sqrt{\frac{t^2}{t^2 + n - 2}}
$$

gdzie

- $t$ jest wartością statystyki odczytaną z tablic testu t-Studenta dla zadanego
  poziomu istotności $\alpha$ oraz dla $n-2$ stopni swobody.

Procedura doboru zmiennych objaśniających jest następująca.

1. Ze zbioru potencjalnych zmiennych objaśniających eliminuje się wszystkie
   zmienne, dla których zachodzi nierówność

   $$
     |r_j| \le r^*
   $$

   są to bowiem zmienne nieistotnie skorelowane ze zmienną objaśnianą.

2. Spośród pozostałych potencjalnych zmiennych jako zmienną objaśniającą wybiera
   się taką zmienną $X_h$, dla której

   $$
     |r_h| = \max_j |r_j|
   $$

   Ponieważ zmienna $X_h$ jest nośnikiem największego zasobu informacji o
   zmiennej objaśnianej

3. Ze zbioru pozostałych potencjalnych zmiennych objaśniających eliminuje się te
   wszystkie zmienne, dla których

   $$
     |r_{hi}| > r^*
   $$

   są to bowiem zmienne zbyt silnie skorelowane ze zmienną objaśniającą $X_h$, a
   więc powielające dostarczone przez nią informacje.

## Dobór zmiennych (metoda pojemności informacji / metoda Hellwiga)

Zakładamy, że nośnikami informacji są wszystkie potencjalne zmienne
objaśniające. Gdy występuje $m$ potencjalnych zmiennych objaśniających, istnieje
$2^m - 1$ możliwych kombinacji zmiennych objaśniających. Dla każdej kombinacji
zmiennych definiuje się tzw. **indywidualną pojemność nośników informacji**:

$$
  h_{kj} = \frac{r_j^2}{ 1 + \sum_{\substack{i \in L_k\\ i \ne j}} |r_{ij}|} =
           \frac{r_j^2}{\sum_{i \in L_k} |r_{ij}|}, \quad (j \in L_k)
$$

gdzie

- $k$ -numer kombinacji ($k = 1, 2, \ldots, 2^m - 1$)
- $L_k$ – zbiór numerów zmiennych w rozpatrywanej kombinacji
- $j$ – numer zmiennej w rozpatrywanej kombinacji
- $r_j$ – współczynnik korelacji potencjalnej zmiennej objaśniającej o numerze
  $j$ ze zmienną objaśnianą (element wektora $R_0$)
- $r_{lj}$ i współczynnik korelacji między $i$-tą i $l$-tą potencjalną zmienną
  objaśniającą (element macierz korelacji $R$)

Wskaźnik $\pmb{h_{kj}}$
: jest miernikiem wielkości informacji wnoszonej przez zmienną $X_j$ o zmiennej
objaśnianej $Y$ w $k$-tej kombinacji.

Po obliczeniu wartości $h_{kj}$ dla zmiennych wyznacza się dla każdej kombinacji
**pojemność integralną** kombinacji nośników informacji. Wielkość tę oblicza się
według wzoru

$$
  H_k = \sum_{j \in L_k} h_{kj}, \quad (k = 1, 2, \ldots, 2^m - 1)
$$

Pojemność integralna
: $k$-tej kombinacji jest więc sumą indywidualnych pojemności nośników
informacji, wchodzących w skład tej kombinacji. Pojemność integralna stanowi
kryterium wyboru odpowiedniej kombinacji zmiennych objaśniających. Wybiera się
tę kombinację, dla której wartość $H_k$ jest największa.

Wskaźniki indywidualny i integralny pojemności informacji są tak skonstruowane,
iż ich wartości mieszczą się w przedziale $[0, 1]$

::: example

W przestrzennej analizie popytu na żywiec wołowy wzięto wstępnie pod uwagę dwie
zmienne objaśniające.

- $X_{1i}$ – przeciętne dochody na jednego mieszkańca w $i$-tym województwie
- $X_{2i}$ – przeciętna cena żywca wołowego w $i$-tym województwie

Na podstawie zebranych danych oszacowano macierz współczynników korelacji między
zmiennymi objaśniającymi $R$ oraz wektor $R_0$ przedstawiający stopień
skorelowania zmiennej objaśnianej ze zmiennymi objaśniającymi

$$
  R = \begin{bmatrix}%2x2, ty: generic, tr: N
    1 & 0,6\\
    0,6 & 1\\
  \end{bmatrix} \quad
  R_0 = \begin{bmatrix}%2x1, ty: generic, tr: N
    0,8\\
    -0,2\\
  \end{bmatrix}
$$

Spośród przedstawionych zmiennych należy dokonać wybór tych które w efekcie
końcowym wyniosą najwięcej informacji o popycie na żywiec wołowy

$$
  m = 2 \quad 2^m - 1 = 3 \quad
  \begin{aligned}
    &K_1 = \{X_1\} \\ &K_2 = \{X_2\} \\ &K_3 = \{X_1, X_2\}
  \end{aligned}
$$

- $h_{11} = \frac{(0,8)^2}{1} = 0,64$ zatem $H_1 = 0,64$
- $h_{22} = \frac{(-0,2)^2}{1} = 0,04$ zatem $H_2 = 0,04$
- $h_{31} = \frac{(0,8)^2}{1 + 0,6} = 0,4$ oraz
  $h_{32} = \frac{(-0,2)^2}{1 + 0,6} = 0,025$

  zatem $H_3 = h_{31} + h_{32} = 0,425$

:::

---

# Wykład (2025-03-05)

::: {.example title="" ref=""}

Dla danych z zad1.jpg wyznacz współczynnik zmienności $W_j$ oraz wyeliminuj
zmiennej quasi-stałe dla $W_j^* = 0,2$

| Rok  | y    | x1    | x2   | x3    | x4   | x5   |
|------|------|-------|------|-------|------|------|
| 1971 | 1.50 | 7.00  | 0.60 | 12.00 | 0.13 | 0.15 |
| 1972 | 1.50 | 7.00  | 1.00 | 12.00 | 0.13 | 0.15 |
| 1973 | 1.60 | 8.00  | 1.00 | 15.00 | 0.13 | 0.16 |
| 1974 | 1.60 | 8.00  | 1.40 | 15.00 | 0.14 | 0.16 |
| 1975 | 2.00 | 8.00  | 1.00 | 16.00 | 0.13 | 0.17 |
| 1976 | 1.60 | 10.00 | 1.00 | 21.00 | 0.13 | 0.16 |
| 1977 | 2.00 | 10.00 | 1.00 | 21.00 | 0.13 | 0.15 |
| 1978 | 2.00 | 12.00 | 1.40 | 21.00 | 0.13 | 0.17 |
| 1979 | 2.00 | 12.00 | 1.40 | 21.00 | 0.13 | 0.17 |
| 1980 | 2.20 | 12.00 | 1.60 | 20.00 | 0.12 | 0.17 |
| 1981 | 2.25 | 14.00 | 1.60 | 20.00 | 0.15 | 0.17 |
| 1982 | 2.35 | 14.00 | 1.60 | 19.00 | 0.21 | 0.17 |
| 1983 | 2.35 | 14.00 | 2.00 | 18.00 | 0.21 | 0.17 |
| 1984 | 2.45 | 16.00 | 2.00 | 20.00 | 0.22 | 0.16 |
| 1985 | 2.50 | 16.00 | 2.00 | 17.00 | 0.22 | 0.16 |
| 1986 | 2.60 | 16.00 | 2.00 | 16.00 | 0.22 | 0.16 |
| 1987 | 2.50 | 16.00 | 2.10 | 16.00 | 0.22 | 0.18 |
| 1988 | 2.55 | 15.00 | 2.10 | 15.00 | 0.21 | 0.19 |
| 1989 | 2.60 | 14.00 | 2.03 | 16.00 | 0.21 | 0.19 |
| 1990 | 2.65 | 12.00 | 1.98 | 17.00 | 0.21 | 0.20 |
| 1991 | 2.70 | 12.00 | 2.00 | 21.00 | 0.21 | 0.24 |
| 1992 | 2.85 | 12.00 | 2.00 | 25.00 | 0.20 | 0.24 |
| 1993 | 2.80 | 12.00 | 1.96 | 21.00 | 0.20 | 0.24 |
| 1994 | 2.95 | 12.00 | 1.95 | 21.00 | 0.20 | 0.25 |
| 1995 | 3.00 | 11.00 | 1.95 | 20.00 | 0.23 | 0.26 |
| 1996 | 3.20 | 12.00 | 1.95 | 20.00 | 0.24 | 0.25 |
| 1997 | 2.97 | 12.00 | 1.93 | 21.00 | 0.24 | 0.24 |
| 1998 | 2.85 | 12.00 | 1.93 | 18.00 | 0.24 | 0.22 |

|       | $X_1$ | $X_2$ | $X_3$ | $X_4$ | $X_5$ |
| ----- | ----- | ----- | ----- | ----- | ----- |
| $W_j$ | 0,783 | 1,111 | 0,703 | 0,667 | 0,537 |
| $V_j$ | 0,225 | 0,267 | 0,167 | 0,239 | 0,193 |

:::

## Dobór zmiennych (metoda grafowa)

Idea tej metody, podobnie jak w metodzie pojemności informacji, opiera się na
wyborze takich zmiennych objaśniających do modelu, które są silnie skorelowane
ze zmienną objaśnianą oraz słabo skorelowane między sobą. Procedura metody
rozpoczyna się od utworzenia wektora korelacji $R_0$ między zmienną objaśnianą a
potencjalnymi zmiennymi objaśniającymi.

W kolejnym etapie sprawdzamy, które elementy macierzy $R$ są tak małe, że możemy
je uznać za zerowe (nieistotnie różne od zera). W tym celu porównujemy
rzeczywiste współczynniki korelacji $r_{ij}$ z macierzy $R$ ze współczynnikiem
krytycznym, który możemy wyznaczyć dwoma sposobami. Współczynnik ten można
obliczyć ze wzoru

$$
  r^* = \sqrt{\frac{t^2}{t^2 + n - 2}}
$$

Drugi sposób jest oparty na regule minimaksowej, takiej, że na podstawie
macierzy $R$ ustalamy

$$
  r^* = \min_i \max_{\substack{j\\ j\ne i}} |r_{ij}|
$$

Jeśli zachodzi warunek $|r_{ij}| \le r^*$, to wszystkie elementy spełniające ten
warunek zastępujemy w macierzy $R$ zerami. Macierz tę oznaczymy $R'$.

W kolejnym etapie na podstawie macierzy $R'$ budujemy graf, w którym
wierzchołkami są potencjalne zmienne objaśniające, a wiązadłami niezerowe
elementy macierzy $R'$. Możemy otrzymać graf spójny lub kilka podgrafów, a także
punkty (zmienne) odosobnione. Z tak powstałych podgrafów do modelu wybieramy
zmienne odosobnione (nie są one bowiem skorelowane z innymi potencjalnymi
zmiennymi objaśniającymi) oraz te zmienne, które mają największą liczbę powiązań
(wiązadeł) z innymi potencjalnymi zmiennymi objaśniającymi. Jeżeli takich
zmiennych jest więcej niż jedna, to wybiera się spośród nich tę, która jest
najsilniej skorelowana ze zmienną objaśnianą.

::: {.example title="" ref=""}

Dla danych z zad1.jpg na poziomie istotności $\alpha = 0,05$ sprawdź istotność
współczynnika korelacji pomiędzy zmienną $X_1$ oraz $X_5$

$$
  r(X_1, X_5) = 0,1 \quad n = 28
$$

$$
  \underbrace{\text{Rozkład T odw}(0,05, 26)}_
  {\text{kwantyl rzędu $1 - \frac{0,05}{2}$ rozkładu $T(26)$}}
  \qquad t_{\alpha} = 2,056
$$

$$
  H_0 : r_{15} = 0 \qquad H_1 : r_{15} \ne 0
$$

$$
  t = \frac{0,1}{\sqrt{1 - 0,1^2}} \cdot \sqrt{26} = 0,512
$$

Ponieważ $t_{\alpha} > t$ to nie mamy podstaw do odrzucenia hipotezy zerowej

:::

## Dobór zmiennych (współczynnik korelacji wielorakiej)

Oznaczmy przez $r_j$ współczynnik korelacji między zmienną objaśnianą $Y$ a
zmienną objaśniającą $X_j$ oraz współczynnik korelacji między zmiennymi
objaśniającymi $X_j$ i $X_l$ przez $r_{jl}$. Współczynniki korelacji między
zmiennymi objaśniającymi tworzą macierz korelacji

$$
	R = \begin{bmatrix}
		1      & r_{12} & \cdots & r_{1m} \\
		r_{21} & 1      & \cdots & r_{21} \\
		\vdots & \vdots & \ddots & \vdots \\
		r_{m1} & r_{m2} & \cdots & 1      \\
	\end{bmatrix}
$$

a współczynniki korelacji między zmienną objaśnianą i zmiennymi objaśniającymi -
wektor korelacji:

$$
	R_0 = \begin{bmatrix}
		r_1    \\
		r_2    \\
		\vdots \\
		r_m    \\
	\end{bmatrix}
$$

Wektor $R_0$ i macierz $R$ są wykorzystywane do budowy tzw. macierzy
rozszerzonej $R^*$:

$$
  R^* =
  \begin{bmatrix}
    1 & R_0^T\\
    R_0 & R\\
  \end{bmatrix} = \begin{bmatrix}%5x5, ty: continued, tr: N
    1      & r_1    & r_2    & \ldots & r_m    \\
		r_1    & 1      & r_{12} & \cdots & r_{1m} \\
		r_2    & r_{21} & 1      & \cdots & r_{21} \\
		\vdots & \vdots & \vdots & \ddots & \vdots \\
		r_m    & r_{m1} & r_{m2} & \cdots & 1      \\
  \end{bmatrix}
$$

Macierze $R$ i $R^*$ są wykorzystywane do budowy współczynnika korelacji
wielorakiej $R_w$. Jest on miarą liniowej zależności między zmienną objaśnianą a
liniową kombinacją zmiennych objaśniających. Przy oznaczeniach podanych
wcześniej współczynnik korelacji wielorakiej jest obliczany ze wzoru

$$
  R_w = \sqrt{1 - \frac{\det R^*}{\det R}}
$$

Współczynnik korelacji wielorakiej przyjmuje wartość z przedziału
$[0, 1]$. Na końcach tego przedziału jego interpretacja jest
następująca:

1. Jeżeli $R_w = 0$, to nie ma zależności liniowej,
2. Jeżeli $R_w = 1$, to między zmienną objaśnianą a liniową kombinacją zmiennych
   objaśniających zachodzi zależność funkcyjna liniowa.

Wartość współczynnika korelacji wielorakiej mogą stanowić podstawę doboru
zmiennych w liniowym modelu ekonometrycznym wtedy, gdy kombinacje zmiennych
objaśniających są jednakowo liczne. Przy dwóch zestawach potencjalnych zmiennych
objaśniających zmienną objaśnianą $Y$ wybiera się ten zestaw, dla którego
współczynnik korelacji wielorakiej przyjmuje wartość większą.

::: {.example title="" ref=""}

<!--

Policzone za pomocą skryptu w Lua:

```lua
#!/usr/bin/env lua

---@param matrix number[][]
---@return number
local function determinant(matrix)
	local size = #matrix

	-- Base case: 1x1 matrix
	if size == 1 then
		return matrix[1][1]
	end

	-- Base case: 2x2 matrix
	if size == 2 then
		return matrix[1][1] * matrix[2][2] - matrix[1][2] * matrix[2][1]
	end

	local det = 0
	for col = 1, size do
		-- Create minor matrix
		local minor = {}
		for i = 2, size do
			local row = {}
			for j = 1, size do
				if j ~= col then
					table.insert(row, matrix[i][j])
				end
			end
			table.insert(minor, row)
		end

		-- Recursive call with cofactor expansion
		det = det + ((col % 2 == 1 and 1 or -1) * matrix[1][col] * determinant(minor))
	end

	return det
end

---@param matrix number[][]
---@return string
local function matrixToLatex(matrix)
	local latex = "\\begin{bmatrix} "
	for _, row in ipairs(matrix) do
		latex = latex .. table.concat(row, " & ") .. "\\\\"
	end
	latex = latex .. " \\end{bmatrix}"
	return latex
end

local R = {
	{ 1, 0.79, 0.26, 0.64, 0.1 },
	{ 0.79, 1, 0.33, 0.86, 0.59 },
	{ 0.26, 0.33, 1, 0.17, 0.51 },
	{ 0.64, 0.86, 0.17, 1, 0.62 },
	{ 0.1, 0.59, 0.51, 0.62, 1 },
}

local R0 = { 0.58, 0.86, 0.48, 0.87, 0.83 }

---@param ixs integer[]
---@return number[][], number[][]
local function mkComb(ixs)
	table.sort(ixs)

	local Rx = {}

	for pos_j, j in ipairs(ixs) do
		table.insert(Rx, {})
		for pos_i, i in ipairs(ixs) do
			Rx[pos_j][pos_i] = R[j][i]
		end
	end

	local Rstar = { { 1 } }

	for pos, val in ipairs(ixs) do
		table.insert(Rstar, {})
		Rstar[1][pos + 1] = R0[val]
		Rstar[pos + 1][1] = R0[val]
	end

	for pos_j, val_j in ipairs(ixs) do
		for pos_i, val_i in ipairs(ixs) do
			Rstar[pos_j + 1][pos_i + 1] = R[val_j][val_i]
		end
	end

	return Rstar, Rx
end

---@param ixs integer[]
---@return string
local function pp(ixs)
	local Rstar, Rx = mkComb(ixs)
	local detRstar = determinant(Rstar)
	local detRx = determinant(Rx)
	local Rw = math.sqrt(1 - detRstar / detRx)
	local res = "| "
	res = res .. "$\\{"
	for _, i in ipairs(ixs) do
		res = res .. string.format("X_%d, ", i)
	end
	res = res .. "\\}$ | "
	res = res .. "$" .. matrixToLatex(Rstar) .. "$ | "
	res = res .. "$" .. matrixToLatex(Rx) .. "$ | "
	res = res .. string.format("%.3f | %.3f | %.3f |", detRstar, detRx, Rw)
	return res
end

function getCombinations(arr, n, start, current, results)
	start = start or 1
	current = current or {}
	results = results or {}

	-- When the current combination reaches the desired size,
	-- make a copy of it and add it to the results table.
	if #current == n then
		local combination = {}
		for i, v in ipairs(current) do
			combination[i] = v
		end
		table.insert(results, combination)
		return results
	end

	-- Iterate over the array starting from 'start'
	for i = start, #arr do
		table.insert(current, arr[i])
		getCombinations(arr, n, i + 1, current, results)
		table.remove(current) -- Backtrack to try the next element
	end

	return results
end

-- Table to store combinations for each size
local allCombinations = {}

-- Iterate over the sizes 2, 3, 4, and 5
for _, n in ipairs({ 2, 3, 4, 5 }) do
	allCombinations[n] = getCombinations({1, 2, 3, 4, 5}, n)
end

local res = ""

for _, combinations in pairs(allCombinations) do
	for _, ixs in ipairs(combinations) do
		res = res .. pp(ixs) .. "\n"
	end
end

print(res)
```
-->

Dla danych z zad1.jpg obliczyć współczynnik korelacji wielorakiej, dla
kombinacji dwuelementowych oraz wybrać zmienne do modelu ekonometrycznego

$$
  R_0 =
  \begin{bmatrix}
    0,58\\
    0,86\\
    0,48\\
    0,87\\
    0,83\\
  \end{bmatrix} \qquad
  R =
  \begin{bmatrix}
    1    & 0,79 & 0,26 & 0,64 & 0,1\\
    0,79 & 1    & 0,33 & 0,86 & 0,59\\
    0,26 & 0,33 & 1    & 0,17 & 0,51\\
    0,64 & 0,86 & 0,17 & 1    & 0,62\\
    0,1  & 0,59 & 0,51 & 0,62 & 1\\
  \end{bmatrix}
$$

| kombinacje     | $R^*$                                                                                 | $R$                                                   | $\det R^*$ | $\det R$ | $R_w$    |
| ------    |                                                                    ----------------- |                                             --------- | --- | --- | --- |
| $\{X_1, X_2\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06\\0,08 & 1 & 0,09\\0,06 & 0,09 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09\\0,09 & 1\\ \end{bmatrix}$ | 0,088 | 0,076 | 0,075 |
| $\{X_1, X_3\}$ | $\begin{bmatrix} 1 & 0,08 & 0,08\\0,08 & 1 & 0,06\\0,08 & 0,06 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06\\0,06 & 1\\ \end{bmatrix}$ | 0,010 | 0,032 | 0,073 |
| $\{X_1, X_4\}$ | $\begin{bmatrix} 1 & 0,08 & 0,07\\0,08 & 1 & 0,04\\0,07 & 0,04 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,04\\0,04 & 1\\ \end{bmatrix}$ | 0,043 | 0,090 | 0,071 |
| $\{X_1, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,03\\0,08 & 1 & 0,0\\0,03 & 0,0 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,0\\0,0 & 1\\ \end{bmatrix}$ | 0,061 | 0,090 | 0,069 |
| $\{X_2, X_3\}$ | $\begin{bmatrix} 1 & 0,06 & 0,08\\0,06 & 1 & 0,03\\0,08 & 0,03 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,03\\0,03 & 1\\ \end{bmatrix}$ | 0,094 | 0,091 | 0,085 |
| $\{X_2, X_4\}$ | $\begin{bmatrix} 1 & 0,06 & 0,07\\0,06 & 1 & 0,06\\0,07 & 0,06 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06\\0,06 & 1\\ \end{bmatrix}$ | 0,051 | 0,060 | 0,097 |
| $\{X_2, X_5\}$ | $\begin{bmatrix} 1 & 0,06 & 0,03\\0,06 & 1 & 0,09\\0,03 & 0,09 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09\\0,09 & 1\\ \end{bmatrix}$ | 0,066 | 0,052 | 0,048 |
| $\{X_3, X_4\}$ | $\begin{bmatrix} 1 & 0,08 & 0,07\\0,08 & 1 & 0,07\\0,07 & 0,07 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,07\\0,07 & 1\\ \end{bmatrix}$ | 0,026 | 0,071 | 0,033 |
| $\{X_3, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,03\\0,08 & 1 & 0,01\\0,03 & 0,01 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,01\\0,01 & 1\\ \end{bmatrix}$ | 0,027 | 0,040 | 0,033 |
| $\{X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,07 & 0,03\\0,07 & 1 & 0,02\\0,03 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,02\\0,02 & 1\\ \end{bmatrix}$ | 0,065 | 0,016 | 0,046 |
<!-- | $\{X_1, X_2, X_3\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,08\\0,08 & 1 & 0,09 & 0,06\\0,06 & 0,09 & 1 & 0,03\\0,08 & 0,06 & 0,03 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,06\\0,09 & 1 & 0,03\\0,06 & 0,03 & 1\\ \end{bmatrix}$ | 0,064 | 0,035 | 0,099 | -->
<!-- | $\{X_1, X_2, X_4\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,07\\0,08 & 1 & 0,09 & 0,04\\0,06 & 0,09 & 1 & 0,06\\0,07 & 0,04 & 0,06 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,04\\0,09 & 1 & 0,06\\0,04 & 0,06 & 1\\ \end{bmatrix}$ | 0,017 | 0,096 | 0,007 | -->
<!-- | $\{X_1, X_2, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,03\\0,08 & 1 & 0,09 & 0,0\\0,06 & 0,09 & 1 & 0,09\\0,03 & 0,0 & 0,09 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,0\\0,09 & 1 & 0,09\\0,0 & 0,09 & 1\\ \end{bmatrix}$ | 0,007 | 0,011 | 0,069 | -->
<!-- | $\{X_1, X_3, X_4\}$ | $\begin{bmatrix} 1 & 0,08 & 0,08 & 0,07\\0,08 & 1 & 0,06 & 0,04\\0,08 & 0,06 & 1 & 0,07\\0,07 & 0,04 & 0,07 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06 & 0,04\\0,06 & 1 & 0,07\\0,04 & 0,07 & 1\\ \end{bmatrix}$ | 0,071 | 0,050 | 0,034 | -->
<!-- | $\{X_1, X_3, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,08 & 0,03\\0,08 & 1 & 0,06 & 0,0\\0,08 & 0,06 & 1 & 0,01\\0,03 & 0,0 & 0,01 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06 & 0,0\\0,06 & 1 & 0,01\\0,0 & 0,01 & 1\\ \end{bmatrix}$ | 0,040 | 0,089 | 0,070 | -->
<!-- | $\{X_1, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,07 & 0,03\\0,08 & 1 & 0,04 & 0,0\\0,07 & 0,04 & 1 & 0,02\\0,03 & 0,0 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,04 & 0,0\\0,04 & 1 & 0,02\\0,0 & 0,02 & 1\\ \end{bmatrix}$ | 0,013 | 0,075 | 0,077 | -->
<!-- | $\{X_2, X_3, X_4\}$ | $\begin{bmatrix} 1 & 0,06 & 0,08 & 0,07\\0,06 & 1 & 0,03 & 0,06\\0,08 & 0,03 & 1 & 0,07\\0,07 & 0,06 & 0,07 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,03 & 0,06\\0,03 & 1 & 0,07\\0,06 & 0,07 & 1\\ \end{bmatrix}$ | 0,026 | 0,019 | 0,039 | -->
<!-- | $\{X_2, X_3, X_5\}$ | $\begin{bmatrix} 1 & 0,06 & 0,08 & 0,03\\0,06 & 1 & 0,03 & 0,09\\0,08 & 0,03 & 1 & 0,01\\0,03 & 0,09 & 0,01 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,03 & 0,09\\0,03 & 1 & 0,01\\0,09 & 0,01 & 1\\ \end{bmatrix}$ | 0,047 | 0,081 | 0,049 | -->
<!-- | $\{X_2, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,06 & 0,07 & 0,03\\0,06 & 1 & 0,06 & 0,09\\0,07 & 0,06 & 1 & 0,02\\0,03 & 0,09 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06 & 0,09\\0,06 & 1 & 0,02\\0,09 & 0,02 & 1\\ \end{bmatrix}$ | 0,012 | 0,057 | 0,060 | -->
<!-- | $\{X_3, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,07 & 0,03\\0,08 & 1 & 0,07 & 0,01\\0,07 & 0,07 & 1 & 0,02\\0,03 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,07 & 0,01\\0,07 & 1 & 0,02\\0,01 & 0,02 & 1\\ \end{bmatrix}$ | 0,034 | 0,034 | 0,060 | -->
<!-- | $\{X_1, X_2, X_3, X_4\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,08 & 0,07\\0,08 & 1 & 0,09 & 0,06 & 0,04\\0,06 & 0,09 & 1 & 0,03 & 0,06\\0,08 & 0,06 & 0,03 & 1 & 0,07\\0,07 & 0,04 & 0,06 & 0,07 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,06 & 0,04\\0,09 & 1 & 0,03 & 0,06\\0,06 & 0,03 & 1 & 0,07\\0,04 & 0,06 & 0,07 & 1\\ \end{bmatrix}$ | 0,008 | 0,081 | 0,047 | -->
<!-- | $\{X_1, X_2, X_3, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,08 & 0,03\\0,08 & 1 & 0,09 & 0,06 & 0,0\\0,06 & 0,09 & 1 & 0,03 & 0,09\\0,08 & 0,06 & 0,03 & 1 & 0,01\\0,03 & 0,0 & 0,09 & 0,01 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,06 & 0,0\\0,09 & 1 & 0,03 & 0,09\\0,06 & 0,03 & 1 & 0,01\\0,0 & 0,09 & 0,01 & 1\\ \end{bmatrix}$ | 0,004 | 0,062 | 0,071 | -->
<!-- | $\{X_1, X_2, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,07 & 0,03\\0,08 & 1 & 0,09 & 0,04 & 0,0\\0,06 & 0,09 & 1 & 0,06 & 0,09\\0,07 & 0,04 & 0,06 & 1 & 0,02\\0,03 & 0,0 & 0,09 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,04 & 0,0\\0,09 & 1 & 0,06 & 0,09\\0,04 & 0,06 & 1 & 0,02\\0,0 & 0,09 & 0,02 & 1\\ \end{bmatrix}$ | 0,001 | 0,026 | 0,077 | -->
<!-- | $\{X_1, X_3, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,08 & 0,07 & 0,03\\0,08 & 1 & 0,06 & 0,04 & 0,0\\0,08 & 0,06 & 1 & 0,07 & 0,01\\0,07 & 0,04 & 0,07 & 1 & 0,02\\0,03 & 0,0 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,06 & 0,04 & 0,0\\0,06 & 1 & 0,07 & 0,01\\0,04 & 0,07 & 1 & 0,02\\0,0 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | 0,006 | 0,020 | 0,077 | -->
<!-- | $\{X_2, X_3, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,06 & 0,08 & 0,07 & 0,03\\0,06 & 1 & 0,03 & 0,06 & 0,09\\0,08 & 0,03 & 1 & 0,07 & 0,01\\0,07 & 0,06 & 0,07 & 1 & 0,02\\0,03 & 0,09 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,03 & 0,06 & 0,09\\0,03 & 1 & 0,07 & 0,01\\0,06 & 0,07 & 1 & 0,02\\0,09 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | 0,006 | 0,098 | 0,068 | -->
<!-- | $\{X_1, X_2, X_3, X_4, X_5\}$ | $\begin{bmatrix} 1 & 0,08 & 0,06 & 0,08 & 0,07 & 0,03\\0,08 & 1 & 0,09 & 0,06 & 0,04 & 0,0\\0,06 & 0,09 & 1 & 0,03 & 0,06 & 0,09\\0,08 & 0,06 & 0,03 & 1 & 0,07 & 0,01\\0,07 & 0,04 & 0,06 & 0,07 & 1 & 0,02\\0,03 & 0,0 & 0,09 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | $\begin{bmatrix} 1 & 0,09 & 0,06 & 0,04 & 0,0\\0,09 & 1 & 0,03 & 0,06 & 0,09\\0,06 & 0,03 & 1 & 0,07 & 0,01\\0,04 & 0,06 & 0,07 & 1 & 0,02\\0,0 & 0,09 & 0,01 & 0,02 & 1\\ \end{bmatrix}$ | 0,000 | 0,011 | 0,077 | -->

:::

---

# Wyklad (2025-03-12)

## Efekt katalizy w liniowym modelu ekonometrycznym

Efekt katalizy
: w liniowym modelu ekonometrycznym oznacza silne skorelowanie
  zmiennej objaśnianej ze zmiennymi objaśniającymi w sensie wysoka wartość
  współczynnika korelacji wielorakiej spowodowana silnym skorelowaniem zmiennych
  objaśniających między sobą

Zmienne objaśniające, które wywołały efekt katalizy należy wyeliminować z modelu

Jeśli dla każdego $i \in \{1, 2, \ldots, k\}$ współczynniki korelacji $r_i$ w
wektorze $R_0$ są dodatnie oraz uporządkowane niemalejąco, to para $(R, R_0)$
nazywa się regularną parą korelacyjną. Dla takiej pary macierz $Q$ o postaci

$$
  Q = \begin{bmatrix}
    1      & q_{12} & \cdots & q_{1k} \\
    q_{21} & 1      & \cdots & q_{2k} \\
    \vdots & \vdots & \ddots & \vdots \\
    q_{k1} & q_{k2} & \cdots & 1      \\
  \end{bmatrix}
$$

w której $q_{ij} = q_{ji} = \frac{r_i}{r_j}$, gdzie $i < j$ nazywa się macierzą
neutralną. Wielkość $q_{ij}$ jest **wartością neutralną** współczynnika korelacji
$r_{ij} = r(X_i, X_j)$

Jeśli $(R, R_0)$ jest regularną parą korelacyjną oraz dla każdego
$i, j \in \{1, 2, \ldots, k\}$ zachodzi równość $r_{ij} = q_{ij}$, to
współczynnik korelacji wielorakiej $\displaystyle R = r_k = \max_i r_i$

Zmienne objaśniające $X_1, X_2, \ldots, X_{k-1}$ nie wnoszą dodatkowych
informacji o tej zmiennej objaśnianej $Y$ w porównywaniu ze zmienną objaśniającą
$X_k$

Jeśli dla każdych $i \in \{1, 2, \ldots, k - 1\}, j \in \{1, 2, \ldots, k\}$
spełniona jest równość

$$
  r_{ij}^2 < q_{ij}^2
$$

to $R^2 > r_k^2$. W tym wypadku każda ze zmiennych objaśniających dostarcza
pewien zasób informacji, o zmiennej objaśnianej

W wypadku nierówności

$$
  r_{ij}^2 > q_{ij}^2
$$

również następuje wzrost kwadratu współczynnika korelacji wielorakiej w stosunku
do maksymalnej wartości prostego współczynnika korelacji $r_k$ ale wzrost ten
jest spowodowany wystąpieniem efektu katalizy.

Tak więc efekt katalizy wystąpi wówczas gdy istnieje para $(i, j)$ taka, że

$$
   r_{ij} < 0 \quad  \text{lub} \quad r_{ij} > \frac{r_i}{r_j}
$$

Zmienna $X$ nazywana jest zmienną katalityczną lub katalizatorem

Do wykrywania efektu katalizy w modelu ekonometrycznym wykorzystuje się wskaźnik

$$
  U_l = R_l^2 - H_l
$$

gdzie

- $l$ – numer kombinacji zmiennych objaśniających  modelu
- $R_l$ – współczynnik korelacji wielorakiej $l$-tej kombinacji zmiennych
- $H_l$ – wskaźnik integralnej pojemności informacji $l$-tej kombinacji
  zmiennych

$U_l$ należy do przedziału $\left< 0; 1 \right>$. Efekt katalizy nie występuje
gdy $U_l = 0$, natomiast natężenie efektu katalizy osiąga wartość największą,
gdy $U_l = 1$.[^UMCS-Rzeszów-efkat]

[^UMCS-Rzeszów-efkat]: [Elżbieta Maksymiak. Minimalizacja efektu katalizy w metodach doboru zmiennych](https://bazhum.muzhp.pl/media/texts/annales-universitatis-mariae-curie-skodowska-sectio-h-oeconomia/1995-1996-tom-29-30/annales_universitatis_mariae_curie_sklodowska_sectio_h_oeconomia-r1995_1996-t29_30-s355-361.pdf)

::: {.example title="" ref=""}

Zmienną objaśnianą modelu jest $Y$ – wartość sprzedaży usług hoteli.
Potencjalnymi zmiennymi objaśniającymi są:

- $X_1$ – zatrudnienie
- $X_2$ – średnia cena 1 miejsca w hotelu
- $X_3$ – liczba miejsc w hotelach

Wektor współczynników korelacji między zmienną $Y$ i zmiennymi
$X_1, X_2, X_3$ oraz macierz współczynników korelacji między zmiennymi $X_1,
X_2, X_3$ są następujące:

$$
  R_0 = \begin{bmatrix}
    0,43\\
    0,50\\
    0,79\\
  \end{bmatrix} \qquad R = \begin{bmatrix}
    1    & 0,25 & 0,74\\
    0,25 & 1    & 0,4\\
    0,74 & 0,4  & 1\\
  \end{bmatrix}
$$

Zbadaj istnienie efektu katalizy dla kombinacji zmiennych $K_1 = (X_1, X_3)$ oraz
$K_2 = (X_2, X_3)$

$$
  \begin{aligned}
  &q_{12} = \frac{0,43}{0,5}  = 0,86\\
  &q_{13} = \frac{0,43}{0,79} = 0,54\\
  &q_{23} = \frac{0,5}{0,79}  = 0,63\\
\end{aligned}
$$

Kombinacja pierwsza

$$
  r_{ij}^2 > q_{ij}^2
$$

$$
  K_1 = (X_1, X_3)
$$

$$
  0,74^2 > 0,54^2
$$

$$
  U_1 = R_1^2 - H_1
$$

$$
  R_1^* = \begin{bmatrix} 1 & 0,43 & 0,79\\0,43 & 1 & 0,74\\0,79 & 0,74 & 1\\ \end{bmatrix}
  \qquad
  R_1 = \begin{bmatrix} 1 & 0,74\\0,74 & 1\\ \end{bmatrix} \qquad
  R_1 \approx 0,82
$$

$$
  h_{11} = \frac{0,43^2}{1 + 0,24} = 0,149 \qquad
  h_{13} = \frac{0,79^2}{1 + 0,24} = 0,503 \qquad
  H_1 = 0,46
$$

$$
  U_1 = 0,82^2 - 0,46 = 0,21
$$

Kombinacja druga

$$
  0,4^2 < 0,63^2
$$

$$
  U_2 = R_2^2 - H_2
$$

$$
  R_2^* = \begin{bmatrix} 1 & 0,5 & 0,79\\0,5 & 1 & 0,4\\0,79 & 0,4 & 1\\ \end{bmatrix}
  \qquad
  R_2 = \begin{bmatrix} 1 & 0,4\\0,4 & 1\\ \end{bmatrix}
  \qquad
  R_2 = 0,82
$$

$$
  h_{22} = \frac{0,5^2}{1 + 0,4} = 0,179 \qquad
  h_{23} = \frac{0,79^2}{1 + 0,4} = 0,446 \qquad
  H_2 = 0,62
$$

$$
  U_2 = 0,82^2 - 0,62 = 0,0524
$$

:::

::: {.example title="Zadanie do wykładu 1 metoda grafowa" ref=""}

Na podstawie 22 obserwacji dokonanych na zmiennej objaśnianej i 9 zmiennych
objaśniających obliczono współczynniki korelacji które przedstawiono w
następujący sposób

$$
  R_0 = \begin{bmatrix}
    0,81  \\
    -0,54 \\
    0,25  \\
    -0,71 \\
    0,52  \\
    0,48  \\
    0,09  \\
    0,18  \\
    -0,15 \\
  \end{bmatrix} \quad
  R = \begin{bmatrix}
    1     & 0,41  & 0,05  & 0,17  & 0,28 & -0,36 & 0,51  & 0,27  & 0,6   \\
    0,41  & 1     & 0,15  & -0,3  & 0,15 & 0,21  & -0,38 & 0,28  & 0,11  \\
    0,05  & 0,15  & 1     & 0,21  & 0,08 & -0,62 & 0,06  & -0,01 & 0,15  \\
    0,17  & -0,3  & 0,21  & 1     & 0,12 & -0,25 & 0,17  & -0,05 & 0,07  \\
    0,28  & 0,15  & 0,08  & 0,12  & 1    & 0,15  & 0,47  & 0,28  & 0,39  \\
    -0,36 & 0,21  & -0,62 & -0,25 & 0,15 & 1     & 0,31  & 0     & -0,13 \\
    0,51  & -0,38 & 0,06  & 0,17  & 0,47 & 0,31  & 1     & -0,58 & -0,27 \\
    0,27  & 0,28  & -0,01 & -0,05 & 0,28 & 0     & -0,58 & 1     & 0,02  \\
    0,6   & 0,11  & 0,15  & 0,07  & 0,39 & -0,13 & -0,27 & 0,02  & 1     \\
  \end{bmatrix}
$$

Stosując metodę analizy grafów wybrać optymalną kombinację zmiennych
objaśniających do modelu ekonometrycznego. Weryfikacje istotności współczynników
korelacji przeprowadzić na poziomie istotności $\alpha = 0,1$


$$
  t = \underbrace{\text{Rozkład T odw} (0,1; 20)}_
  {\text{Kwantyl rzędu $1 - \frac{0.1}{2}$ rozkładu $T(20)$}}
  \qquad t \approx 1,7341
$$

$$
  r^* = \sqrt{\frac{t^2}{t^2 + n - 2}} \qquad r^* \approx 0,38
$$

$$
  R' = \begin{bmatrix}
    1    & 0,41  & 0     & 0 & 0    & 0     & 0,51  & 0     & 0,6  \\
    0,41 & 1     & 0     & 0 & 0    & 0     & -0,38 & 0     & 0    \\
    0    & 0     & 1     & 0 & 0    & -0,62 & 0     & 0     & 0    \\
    0    & 0     & 0     & 1 & 0    & 0     & 0     & 0     & 0    \\
    0    & 0     & 0     & 0 & 1    & 0     & 0,47  & 0     & 0,39 \\
    0    & 0     & -0,62 & 0 & 0    & 1     & 0     & 0     & 0    \\
    0,51 & -0,38 & 0     & 0 & 0,47 & 0     & 1     & -0,58 & 0    \\
    0    & 0     & 0     & 0 & 0    & 0     & -0,58 & 1     & 0    \\
    0,6  & 0     & 0     & 0 & 0,39 & 0     & 0     & 0     & 1    \\
  \end{bmatrix}
$$

![Graf z macierzy](assets/E-wyk3-rys1.png)

Zatem wybieramy zmienne $X_4, X_6, X_7$

:::

# Wykład (2025-03-19)

## Metoda Najmniejszych Kwadratów

![wykres](assets/e-wyk3-01.png){width=50%}


Za pomocą tej metody szacujemy nieznane parametry modelu. Uzyskujemy w ten
sposób oszacowania dla których model najlepiej opisuje zaobserwowane dane.

Najczęściej stosowanym modelem jest model liniowy. W modelu tym zakłada się że
związek między zmienną objaśnianą i zmiennymi objaśniającymi jest liniowy

$$
  y_i = x_1 \beta_1 + x_1 \beta_2 + \ldots + x_k \beta_k + \varepsilon,
  \quad \text{dla } i = 1, 2, \ldots, N
$$

Przy czym

- $y_i$ jest zmienną objaśnianą (endogeniczną, zależną),
- $x_1, x_2, \ldots, x_k$ są zmiennymi objaśniającymi (egzogenicznymi, niezależnymi)
  Zmiennych tych jest $k$.
- $\varepsilon$ jest błędem losowym
- $i$ jest indeksem obserwacji
- $N$ jest liczbą obserwacji

Znajdowanie estymatora (oszacowania) MNK (Metoda Najmniejszych Kwadratów)
parametrów $\beta_1, \beta_2, \ldots, \beta_k$ określamy mianem regresji
liniowy, $y_i$ na $x_1, x_2, \ldots, x_k$. Zgodnie z przyjętą konwencją
oszacowania nieznanych parametrów $\beta_1, \beta_2, \ldots, \beta_k$ uzyskamy
za pomocą MNK oznaczamy jako $b_1, b_2, \ldots, b_k$. Przewidywane na podstawie
oszacowanego modelu wartości zmiennej zależnej, nazywane **wartością dopasowaną**
(teoretyczną):

$$
  \hat{y}_i = x_{1i} b_1 + x_{2i} b_2 + \ldots + x_{ki} b_k
$$

Wartości dopasowane różnią się od rzeczywistych wartości $y_i$, ponieważ w
modelu oszacowanym zamiast prawdziwych nieznanych parametrów
$\beta_1, \beta_2, \ldots, \beta_k$ używamy ich oszacowań
$b_1, b_2, \ldots, b_k$ i pomijamy błąd losowy.

Reszty definiujemy jako różnicę między wartością zaobserwowaną zmiennej
zależnej, a wartością dopasowaną tej zmiennej:

$$
  e_i = y_i - x_{1i}b_1 - x_{2i}b_2 - \ldots - x_{ki} b_k = y_i - \hat{y}_i
$$

Omówienie MNK zaczniemy od przypadku modelu liniowego ze stałą i jedną zmienną
objaśniającą. W tym przypadku model teoretyczny opisuje równanie:

$$
  y_i = \beta_1 + \beta_2 x_i + \varepsilon_i
$$

Model wyestymowany dany jest równaniem

$$
  \hat{y}_i = b_1 + b_2 x_i + e_i
$$

a reszty dla każdej obserwacji będą dane wzorem

$$
  e_i = y_i - b_1 - b_2 x_i
$$

Oszacowania $b_1, b_2$ powinny być dobrane tak, aby **S**uma
**K**wadratów **R**eszt (SKR) była najmniejsza. Suma ta jest równa

$$
\begin{aligned}
  \operatorname{SKR}(b_1, b_2) &=
  \sum_{i = 1}^{N} e_i^2 \\&=
  \sum_{i = 1}^{N}  (y_i - b_1 - b_2 x_i)^2 \\&=
  \sum_{i = 1}^{N}
    (y_i^2 - 2b_1y_i - 2b_2y_ix_i + 2 b_1b_2x_i + b_1^2 + b_2^2x_i^2)
\end{aligned}
$$


$$
  \frac{\partial \operatorname{SKR} (b_1, b_2)}{\partial b_1} = 0 \quad
  \frac{\partial \operatorname{SKR} (b_1, b_2)}{\partial b_2} = 0
$$

$$
\begin{aligned}
  \frac{\partial \operatorname{SKR} (b_1, b_2)}{\partial b_1} &=
  \sum_{i = 1}^{N} (-2y_i + 2b_2x_i + 2b_1) \\
  \frac{\partial \operatorname{SKR} (b_1, b_2)}{\partial b_2} &=
  \sum_{i = 1}^{N} (-2y_ix_i + 2b_1x_i + 2b_2x_i^2)
\end{aligned}
$$

$$
\begin{aligned}
  &\sum_{i = 1}^{N} (-2y_i + 2b_2 x_i + 2b_1) = 0 \quad \Big| : 2 \\&
  \sum_{i = 1}^{N} b_2 x_i + \sum_{i = 1}^{N} b_1 = \sum_{i = 1}^{N} y_i \\&
  b_2 \sum_{i = 1}^{N} x_i + b_1 \sum_{i = 1}^{N} 1 = \sum_{i = 1}^{N} y_i \\&
  b_2 \sum_{i = 1}^{N} x_i + Nb_1 = \sum_{i = 1}^{N} y_i \\&
  b_1 = \frac{\sum_{i = 1}^{N} y_i - b_2 \sum_{i = 1}^{N} x_i}{N} \\&
  b_1 = \overline{y} - b_2 \overline{x}
\end{aligned}
$$

$$
\begin{aligned}
  &\sum_{i = 1}^{N} (-2y_ix_i) + \sum_{i = 1}^{N} 2b_1x_i +
   \sum_{i = 1}^{N} 2b_2x_i^2 = 0 \quad \Big| : 2\\&
  b_1 \sum_{i = 1}^{N} x_i + b_2 \sum_{i = 1}^{N} x_i^2 =
  \sum_{i = 1}^{N} x_i y_i \quad \Big| : N \\&
  b_1 \cdot \overline{x} + b_2 \cdot \frac{\sum_{i = 1}^{N} x_i^2}{N} =
  \frac{\sum_{i = 1}^{N} x_iy_i}{N} \\&
  (\overline{y} - b_2 \overline{x}) \overline{x} + b_2 \cdot
  \frac{\sum_{i = 1}^{N} x_i^2}{N} = \frac{\sum_{i = 1}^{N} x_iy_i}{N} \\&
  \overline{y}\overline{x} - b_2 (\overline{x})^2 + b_2 \cdot
  \frac{\sum_{i = 1}^{N} x_i^2}{N} = \frac{\sum_{i = 1}^{N} x_iy_i}{N} \\&
  b_2 (\frac{\sum_{i = 1}^{N} x_i^2}{N} - (\overline{x})^2) =
  \frac{\sum_{i = 1}^{N} x_iy_i}{N} - \overline{y}\overline{x}\\&
  b_2 = \frac{\frac{\sum_{i = 1}^{N} x_iy_i}{N} - \overline{y}\overline{x}}
             {\frac{\sum_{i = 1}^{N} x_i^2}{N} - (\overline{x})^2}
\end{aligned}
$$

Ocena wariancji odchyleń losowych modelu liniowego z jedną zmienną objaśniającą
otrzymujemy  ze wzoru

$$
  s_e^2 = \frac{\sum_{i = 1}^{N} e_i^2}{N - 2}
$$

Wielkość $s_e$ jest odchyleniem standardowym reszt modelu które informuje o ile
zaobserwowane wartości zmiennej objaśnianej przeciętnie różnią się od
teoretycznych wartości tej zmiennej wyznaczonych z modelu.

Standardowe błędy $S(b_2), S(b_1)$ szacunku parametrów strukturalnych $\beta_2,
\beta_1$ wyznaczamy ze wzorów
$S(b_2) = \frac{s_e}{\sqrt{\sum_{i = 1}^{N} x_i^2 - N(\overline{x})^2}}$ lub
$S(b_2) = \frac{s_e}{\sqrt{\sum_{i = 1}^{N} (x_i - \overline{x})^2}}$

$$
  S(b_1) = s_e \cdot \sqrt{\frac{\sum_{i = 1}^{N} x_i^2}
      {N (\sum_{i = 1}^{N} x_i^2 - N \overline{x}^2)}}
  \quad \text{lub} \quad
  S(b_1) = s_e \cdot \sqrt{\frac{\sum_{i = 1}^{N} x_i^2}
      {N \sum_{i = 1}^{N} (x_i - \overline{x})^2}}
$$

## Zapis macierzowy modelu liniowego

Model liniowy ze stałą i jedną zmienną objaśniającą to szczególny przypadek
modelu z $k$ zmiennymi objaśniającymi.

Załóżmy, że zmienna zależy w następujący sposób od zmiennych objaśniających

$$
  y_i = x_1 \beta_1 + x_2 \beta_2 + \ldots + x_k \beta_k + \varepsilon_i \quad
  \text{dla } i = 1, 2, \ldots, N
$$

Równanie to dla wszystkich obserwacji można zapisać za pomocą równania
macierzowego

$$
  \underbrace{
  \begin{bmatrix}%4x1, ty: continued, tr: N
      y_{1}\\
      y_{2}\\
      \vdots\\
      y_{N}\\
    \end{bmatrix}
  }_{y_{N \times 1}} = \underbrace{
  \begin{bmatrix}%4x4, ty: continued, tr: N
      x_{11} & x_{12} & \cdots & x_{k1}\\
      x_{21} & x_{22} & \cdots & x_{k2}\\
      \vdots & \vdots & \ddots & \vdots\\
      x_{1N} & x_{2N} & \cdots & x_{kN}\\
    \end{bmatrix}
  }_{X_{N \times k}} \cdot \underbrace{
  \begin{bmatrix}%4x1, ty: continued, tr: N
      \beta_1\\
      \beta_2\\
      \vdots\\
      \beta_k\\
    \end{bmatrix}
  }_{\beta_{k\times 1}} + \underbrace{
  \begin{bmatrix}%4x1, ty: continued, tr: N
      \varepsilon_1\\
      \varepsilon_2\\
      \vdots\\
      \varepsilon_N\\
    \end{bmatrix}
  }_{\varepsilon_{N\times 1}}
$$

gdzie

- $y_{N \times 1}$ jest wektorem obserwacji dla zmiennej zależnej
- $X_{N\times k}$ jest obserwacji zmiennych niezależnych
- $\beta_{k \times 1}$ jest niezależnych parametrów,
- $\varepsilon_{N\times 1}$ jest wektorem zaburzeń losowych

stosując ten zapis można model liniowy zapisać za pomocą następującego równania
macierzowego

$$
  y = X\beta + \varepsilon
$$

Przy takim zapisie wektor kolumnowy $y$ zawiera wszystkie obserwacje dla
zmiennej zależnej, zaś kolejne kolumny macierzy $X$ zawiarają obserwacje dla
kolejnych zmiennych objaśniających modelu

## MNK dla wielu zmiennych objaśniających

Wektor nieznanych parametrów oznaczymy jako
$\beta = [\beta_1, \beta_2, \ldots, \beta_k]^T$ zaś uzyskany dla tych parametrów
wektor oszacowań (estymator) oznaczymy jako
$b = [b_1, b_2, \ldots, b_k]^T$. W tym przypadku wartość dopasowana
(teoretyczna) $y_i$ jest równa

$$
  \hat{y}_i = x_{1i} b_1 + x_{2i} b_2 + \ldots + x_{ki} b_k = x_ib
$$

wektor wartości dopasowanych można zapisać jako

$$
  \hat{y} = X b
$$

Podobnie reszta jest równa:

$$
  e_i = y_i - x_{1i} b_1 - x_{2i} b_2 - \ldots - x_{ki} b_k = y_i - x_b = y_i -
\hat{y}_i \quad \text{dla } i = 1, 2, \ldots, N
$$

zatem wektor reszt można zapisać jako

$$
  e = y - Xb = y - \hat{y}
$$

Model jest dobrze dopasowany do danych, jeśli wartości dopasowane zmiennej
zależnej są bliskie zaobserwowanym wartościom zmiennej zależnej.

Estymator MNK znajdujemy minimalizując sumę kwadratów reszt

$$
  \operatorname{SKR} (b) =
  \sum_{i = 1}^{N} (y_i - \hat{y}_i)^2 =
  \sum_{i = 1}^{N} e_i^2
$$

zatem

$$
  \min_b \operatorname{SKR}(b) = \min_b \sum_{i = 1}^{N} (y_i - \hat{y}_i)^2 =
  \min_b \sum_{i = 1}^{N} e_i^2
$$

$\operatorname{SKR}$ $\sum_{i = 1}^{N} e_i^2$ można zapisać przy użyciu iloczynu
skalarnego $e^Te$:

$$
  e^T e = [e_1, e_2, \ldots, e_N] \circ \begin{bmatrix}%4x1, ty: continued, tr: N
    e_1\\
    e_2\\
    \vdots\\
    e_N\\
  \end{bmatrix} =
  \sum_{i = 1}^{N} e_i^2
$$

$$
\begin{aligned}
  \operatorname{SKR} (b) &=
  e^Te \\&\overset{(x)}{=}
  (y - Xb)^T(y - Xb) \\&=
  (y^T - (Xb)^T)(y - Xb) \\&=
  (y^T - b^T X^T)(y - Xb) = y^T y - y^T Xb - b^T X^T y + b^T X^T X b
\end{aligned}
$$

$$
  \operatorname{SKR} (b) = y^T y - 2y^T Xb + b^T X^T X b
$$

$$
  \frac{\partial \operatorname{SKR} (b)}{\partial b} =
  \frac{\partial (y^Ty - 2y^T Xb + b^T X^T Xb)}{\partial b}
$$

::: {.caution title="Przydatne wzory" ref=""}

$$
  \frac{\partial wx}{\partial x} = w^T
$$

$$
  \frac{\partial x^TAx}{\partial x} = (A + A^T)x
$$

:::

$$
  \begin{aligned}
  \frac{\partial \operatorname{SKR} (b)}{\partial b} &=
  \frac{\partial y^Ty}{\partial b} - 2 \frac{\partial y^TXb}{\partial b} +
  \frac{\partial b^TX^TXb}{\partial b} \\&=
  -2 (y^TX)^T + 2 X^T X b
  \end{aligned}
$$

$$
  \begin{aligned}
  &\operatorname{SKR} (b) = 0 \\&\iff
  -2X^Ty + 2X^T X b = 0 \quad \Big| :2 \\&\iff
  X^TXb = X^Ty\\&\iff
  b = (X^T X)^{-1} X^T y
\end{aligned}
$$

---

# Wykład (2025-03-26)

Wariancja odchyleń losowych szacuje się na podstawie wzoru

$$
  s_e^2 = \frac{\sum_{i = 1}^{N} (Y_i - \hat{Y}_i)^2}{N - k - 1}, \quad
  \text{gdzie $k$ to liczba zmiennych objaśniających}
$$

Macierz wariancji i kowariancji ocen parametrów strukturalnych szacuje się na
podstawie wzoru

$$
  D^2(b) = s_e^2(x^T x)^{-1}
$$

W macierzy tej elementy na głównej przekątnej są wariancjami

$V(b_i) (i = 0, 1, 2, \ldots, k)$ oraz parametrów strukturalnych. Wielkości

$$
  S(b_i) = \sqrt{V(b_i)}, \quad i = 0, 1, 2, \ldots, n
$$

są standardowymi błędami szacunku parametrów strukturalnych.

## Typy modeli

### Model liniowy

Np. $Y = \alpha_0 + \alpha_1 X_1 + \alpha_2 X_2$

### Model potęgowy

Np. $Y = \alpha X^\beta$, $Y = \alpha_0 X_1^{\beta_1} X_2^{\beta_2}$

![wykresy](assets/E-wyk5-rys1.png)


### Model logarytmiczny

Np. $Y = \alpha + \beta \log X$

![wykresy](assets/E-wyk5-rys2.png)


### Model wykładniczy

Np. $Y = \alpha \cdot \beta^X$

![wykresy](assets/E-wyk5-rys3.png)


### Model hiperboliczny

Np. $Y = \alpha + \frac{\beta}{X}$

![wykres](assets/E-wyk5-rys4.png){width=50%}


### Model wielomianowy

Np. $Y = \alpha_0 + \beta_1 X + \beta_2 X^2$

![wykres](assets/E-wyk5-rys5.png){width=50%}


### Model trygonometryczny

Niech zmienna $Y_t$ przyjmuje w kolejnych chwilach czasu $t$ wartości.

| t               | 1               | 2               | $\ldots$        | $N - 1$         | $N$             |
| --------------- | --------------- | --------------- | --------------- | --------------- | --------------- |
| $Y_t$           | $y_1$           | $y_2$           | $\ldots$        | $Y_{N - 1}$     | $Y_N$           |

Modelem trygonometrycznym o okresie $\omega$ rzędu $p_i$ zmiennej $Y_t$ nazywamy
funkcję

$$
  \begin{aligned}
  \hat{Y}_t = \hat{\alpha} &+
  \hat{\alpha}_1 \underbrace{\cos (\frac{2\pi}{\omega}t)}_{C_1i} +
  \hat{\beta}_1  \underbrace{\sin (\frac{2\pi}{\omega}t)}_{S_1i} \\&+
  \hat{\alpha}_2 \cos (2 \cdot \frac{2\pi}{\omega}t) +
  \hat{\beta}_2 \sin (2 \cdot \frac{2\pi}{\omega}t) + \\&+
  \ldots \\&+
  \hat{\alpha}_p \cos (p \cdot \frac{2\pi}{\omega}t) +
  \hat{\beta}_p  \sin (p \cdot \frac{2\pi}{\omega}t)
  \end{aligned}
$$

$$
  C_k = \begin{bmatrix}
    \cos (k \cdot \frac{2\pi}{\omega} \cdot 1)\\
    \cos (k \cdot \frac{2\pi}{\omega} \cdot 2)\\
    \vdots \\
    \cos (k \cdot \frac{2\pi}{\omega} \cdot p)\\
  \end{bmatrix} \qquad
  S_k = \begin{bmatrix}
    \sin (k \cdot \frac{2\pi}{\omega} \cdot 1)\\
    \sin (k \cdot \frac{2\pi}{\omega} \cdot 2)\\
    \vdots \\
    \sin (k \cdot \frac{2\pi}{\omega} \cdot p)\\
  \end{bmatrix}
$$

#### Przypadek $\omega$ parzystej

$$
  \hat{\alpha} = \overline{y} \qquad
  Y = [y_1, y_2, \ldots, y_{\omega}]^T
$$

$$
  \begin{array}{*3{>{\displaystyle}c}l}
  \hat{\alpha}_k = \frac{2}{\omega} \sum_{i = 1}^{\omega} (C_{ki} Y_i)
  &\hat{\beta}_k = \frac{2}{\omega} \sum_{i = 1}^{\omega} (S_{ki} Y_i)
  &\text{dla } k < \frac{\omega}{2}\\
  \hat{\alpha}_k = \frac{1}{\omega} \sum_{i = 1}^{\omega} (C_{ki} Y_i)
  &\hat{\beta}_k = 0
  &\text{dla } k = \frac{\omega}{2}
  \end{array}
$$

#### Przypadek $\omega$ nieparzystej

$$
  \hat{\alpha} = \overline{y} \qquad
  Y = [y_1, y_2, \ldots, y_{\omega}]^T
$$

$$
  \hat{\alpha}_k = \frac{2}{\omega} \sum_{i = 1}^{\omega} (C_{ki} Y_i) \quad
  \hat{\beta}_k = \frac{2}{\omega} \sum_{i = 1}^{\omega} (S_{ki} Y_i) \qquad
  \text{dla } k \le \frac{\omega - 1}{2}
$$

$$
  S = \sqrt{\frac{\sum_{i = 1}^{\omega} (Y_i - \hat{Y}_i)^2}{\omega - 1}}
$$


::: {.example title="" ref=""}

Stosując odpowiednią zamianę zmiennych zamień modele

a. $Y = \alpha + \beta \log X$
b. $Y = \alpha X^{\beta}$
c. $Y = \beta^X$
d. $Y = \alpha + \frac{\beta}{X}$

na modele liniowe

---

a. $X^* = \log X, \quad Y = \alpha + \beta X^*$
b. Obustronnie logarytmujemy.

   $\log Y = \log \alpha + \beta \log X$.

   $Y^* = \log Y, \alpha^* = \log \alpha, X^* = \log X$

   $Y^* = \alpha^* + \beta X^*$
c. Obustronnie logarytmujemy.

   $\log Y = X \log \beta$

   $Y^* = \log Y, \beta^* = \log \beta$

   $Y^* = \beta^* X$
d. $X^* = \frac{1}{X}, \quad Y = \alpha + \beta X^*$

:::

## Przykłady

### Model konsumpcji

Przez $Y_t$ oznaczamy całkowity popyt konsumpcyjny w miesiącu $t$, a przez $X_t$
dochody gospodarstw domowych w tym okresie. Przyjmujemy, że

$$
  Y_t = \alpha_0 + \alpha_1 X_t + \varepsilon_t
$$

gdzie

- $\alpha_0$ – wydatki stałe
- $\alpha_1$ – część dochodów przeznaczona na konsumpcję
- $\varepsilon_t$ – składnik losowy

### Model oszczędności

Przez $Y_t$ oznaczamy stan oszczędności na koniec miesiącu $t$, a przez $X_t$
dochody gospodarstw domowych w tym miesiącu. Przyjmujemy, że

$$
  Y_t = Y_{t-1} - \beta_0 + \beta_1 X_1 - \beta_2 Y_{t - 1} + \varepsilon_t
$$

gdzie

- $\beta_0$ – wydatki stałe
- $\beta_1$ – część dochodów przeznaczona na oszczędności
- $\beta_2$ – część oszczędności przeznaczona na konsumpcje
- $\varepsilon_t$ – składnik losowy

### Model konsumpcji z uwzględnieniem oszczędności

Przez $Y_{1,t}$ oznaczamy całkowity popyt konsumpcyjny w miesiącu $t$,
przez $Y_{2,t}$ oznaczamy stan oszczędności, a przez $X_t$ dochody gospodarstw
domowych w tym okresie.

Przyjmiemy, że

$$
  \begin{aligned}
  & Y_{1,t} = \alpha_0 + \alpha_1 X_t + \alpha_2 Y_{2,t-1} + \varepsilon_{1,t}\\
  & Y_{2,t} = Y_{2,t-1} - \beta_0 + \beta_1 X_t -
    \beta_2 Y_{2,t-1} + \varepsilon_{2,t}
  \end{aligned}
$$

gdzie

- $\beta_0 = \alpha_0$
- $\beta_1 + \alpha_1 = 1$
- $\beta_2 = \alpha_2$

### Model popytu dla dóbr konsumpcyjnych

Przez $Y_t$ oznaczamy popyt dla wybranego dobra konsumpcyjnego przez $X_{1,t}$
jego cenę, a przez $X_{2,t}$ dochody nabywcy

Przyjmujemy, że

$$
  Y_t = c \cdot X_{1,t}^{\alpha} X_{2,t}^{\beta} e^{\varepsilon_t} \quad
  c > 0, \alpha < 0, \beta > 0
$$

### Model stochastyczny kursu walutowego

Niech $Y_t$ oznacza kurs 1 USD w EUR w dniu $t$. Przyjujemy

$$
  Y_t = Y_{t,1} e^{\varepsilon_t}
$$

### Model wydajności pracy

Niech $Y_t$ oznacza wydajność pracy w PLN na pracownika,

a $X_t$ techniczne uzbrojenie miejsce pracy też w PLN na 1 pracownika.

Przyjmujemy, że

$$
  Y_j = \gamma X_t^{\alpha} e^{\delta t + \varepsilon_t}, \quad
  \gamma, \alpha > 0
$$

gdzie

- $\delta$ – współczynnik mierzący skalę postępu technicznego organizacyjnego

## Klasyfikacja modeli ekonometrycznych

### Klasyfikacja ze względu na dynamikę

a) Modele statyczne (jednookresowe) charakteryzujące się brakiem zależności od
   czasu (tzn. wśród zmiennych objaśniających nie ma opóźnionych zmiennych
   objaśnianych). Np. ...
b) Modele dynamiczne – zależne od czasu lub od opóźnionych zmiennych
   objaśnianych. Np. ...

### Klasyfikacja ze względu na postać analityczną modelu

a) Modele liniowe. Np. ...
b) Modele nieliniowe. Np. ...

### Klasyfikacja ze względu na wymiar zmiennej objaśnianej

a) Modele jednorównaniowe. Np. ...
b) Modele wielorównaniowe. Np. ...

---

# Wykład (2025-04-02)

## Modele wielorównaniowe

Wielorównaniowe modele ekonometryczne opisują kształtowanie się wielu zjawisk
ekonomicznych, przy czym każde równanie modelu wielorównaniowego wyjaśnia
zachowanie się jednego zjawiska.

Zmienne endogeniczne
: Zjawiska ekonomiczne wyjaśniane przez model wielorównaniowy nazywają się
zmiennymi endogenicznymi.

Zmienne egzogeniczne
: Zjawiska ekonomiczne, które niosą wyjaśniane przez model i służą do
wyjaśnienia zmiennych endogenicznych nazywają się zmiennymi egzogenicznymi.

Zmienne łącznie współzależne
: Zmienne endogeniczne bez opóźnień czasowych nazywają się łącznie współzależnymi,
  będziemy oznaczać $Y_1, Y_2, \ldots, Y_n$.

Zmienne z góry ustalone
: Zmienne endogeniczne z opóźnieniami czasowymi oraz zmienne egzogeniczne (bez
  opóźnień i z opóźnieniami) nazywają się zmiennymi z góry ustalonymi. Będziemy je
  oznaczać $Z_1, Z_2, \ldots, Z_k$.

Ogólny zapis modelu wielorównaniowego jest następujący:

$$
  \begin{aligned}
  &Y_1 = \sum_{\substack{i = 1 \\ i\ne 1}}^{m} \beta_{1i} Y_i + \sum_{j = 1}^{k} \gamma_{1j} Z_j + \varepsilon_1\\
  &Y_2 = \sum_{\substack{i = 1 \\ i\ne 2}}^{m} \beta_{2i} Y_i + \sum_{j = 1}^{k} \gamma_{2j} Z_j + \varepsilon_2\\
  &Y_3 = \sum_{\substack{i = 1 \\ i\ne 3}}^{m} \beta_{3i} Y_i + \sum_{j = 1}^{k} \gamma_{3j} Z_j + \varepsilon_3\\
  &\vdots\\
  &Y_{m - 1} = \sum_{\substack{i = 1 \\ i\ne m - 1}}^{m} \beta_{m-1\; i} Y_i + \sum_{j = 1}^{k} \gamma_{m-1 \; j} Z_j + \varepsilon_{m-1}\\
  &Y_m = \sum_{\substack{i = 1 \\ i\ne m}}^{m} \beta_{mi} Y_i + \sum_{j = 1}^{k} \gamma_{mj} Z_j + \varepsilon_m\\
  \end{aligned}
$$

### Postać strukturalna modelu

Postać strukturalna
  : Macierzowe przedstawienie modelu wielorównaniowego (\*) nosi nazwę postaci
    strukturalnej.

Aby otrzymać tę postać należy przenieść wszystkie wyrazy modelu na lewą
stronę, a po prawej stronie zostawić jedynie odchylenie losowe.

Postać strukturalna modelu wielorównaniowego jest następująca:

$$
  B \cdot Y + \Gamma \cdot Z = \varepsilon
$$

gdzie

- $Y = \begin{bmatrix}
    Y_1\\ Y_2\\ \vdots\\ Y_m\\
  \end{bmatrix}_{m\times 1}$ – wektor zmiennych endogenicznych bez opóźnień czasowych
- $B = \begin{bmatrix}%4x4, ty: continued, tr: N
  1  & -\beta_{12} & \cdots & -\beta_{1m}\\
  -\beta_{21} & 1 & \cdots & -\beta_{2m}\\
  \vdots & \vdots & \ddots & \vdots\\
  -\beta_{m1} & -\beta_{m2} & \cdots & 1\\
\end{bmatrix}_{m\times m}$ – macierz parametrów przy zmiennych endogenicznych bez opóźnień czasowych
- $Z = \begin{bmatrix}%4x1, ty: continued, tr: N
  Z_1\\ Z_2\\ \vdots\\ Z_k\\
  \end{bmatrix}_{k\times 1}$ – wektor zmiennych z góry ustalonych
- $\Gamma = \begin{bmatrix}%4x4, ty: continued, tr: N
    -\gamma_{11} & -\gamma_{12} & \cdots & -\gamma_{1k}\\
    -\gamma_{21} & -\gamma_{22} & \cdots & -\gamma_{2k}\\
    \vdots       & \vdots       & \ddots & \vdots\\
    -\gamma_{m1} & -\gamma_{m2} & \cdots & -\gamma_{mk}\\
  \end{bmatrix}_{m\times k}$ – macierz parametrów przy zmiennych z góry ustalonych
- $\varepsilon = \begin{bmatrix}%4x1, ty: continued, tr: N
  \varepsilon_1\\ \varepsilon_2\\ \vdots\\ \varepsilon_m\\
  \end{bmatrix}_{m\times 1}$ – wektor odchyleń losowych

Jeśli nieopóźnione w czasie zmienne endogeniczne $Y_1, Y_2, \ldots, Y_m$
wyrazimy jedynie poprzez zmienne z góry ustalone całego modelu
$Z_1, Z_2, \ldots, Z_k$, to otrzymamy postać zredukowaną modelu:

$$
  \begin{aligned}
    &Y_1 = \sum_{j = 1}^{k} \pi_{1j} Z_j + \eta_1\\
    &Y_2 = \sum_{j = 1}^{k} \pi_{2j} Z_j + \eta_2\\
    &\vdots\\
    &Y_m = \sum_{j = 1}^{k} \pi_{mj} Z_j + \eta_m
  \end{aligned}
$$

### Postać zredukowana

Zapis macierzy postaci zredukowanej jest następujący:

$$
  Y = \Pi^T \cdot Z + \eta
$$

gdzie

- $\Pi^T = \begin{bmatrix}%4x4, ty: continued, tr: N
    \pi_{11} & \pi_{12} & \cdots & \pi_{1k}\\
    \pi_{21} & \pi_{22} & \cdots & \pi_{2k}\\
    \vdots & \vdots & \ddots & \vdots\\
    \pi_{m1} & \pi_{m2} & \cdots & \pi_{mk}\\
  \end{bmatrix}_{m\times k}$ – macierz parametrów postaci zredukowanej przy
  zmiennych z góry ustalonych
- $\eta = \begin{bmatrix}%4x1, ty: continued, tr: N
     \eta_1\\
     \eta_2\\
     \vdots\\
     \eta_m\\
   \end{bmatrix}_{m\times 1}$ – wektor odchyleń losowych postaci zredukowanej

Między parametrami postaci zredukowanej i postaci strukturalnej następują
następujące zależności:

$$
  \Pi^T = -B^{-1} \cdot \Gamma \qquad \eta = B^{-1} \varepsilon
$$

::: {.example title="" ref=""}

Rozważmy następujący model:

$$
  \begin{aligned}
  &I_t = \beta_{13} P_t + \gamma_{11} I_{t-1} + \gamma_1 + \varepsilon_1\\
  &Z_t = \beta_{23} P_t + \gamma_{22} K_t + \gamma_2 + \varepsilon_2\\
  &P_t = \beta_{32} Z_t + \gamma_{31} I_{t-1} + \gamma_3 + \varepsilon_3
  \end{aligned}
$$

gdzie

- $I$ – nakłady inwestycyjne
- $Z$ – zatrudnienie
- $P$ – produkcja
- $K$ – wartości produkcyjnego majątku trwałego
- Przez $X_t$ oznaczymy zmienne przyjmujące wartości równe jedności znajdujące
  się przy parametrach  $\gamma_1, \gamma_2, \gamma_3$
  (czyli de facto musimy mieć $\gamma_1 X_t$ w miejscu $\gamma_1$, ale ponieważ
  $X_t = \operatorname{const} = 1$, to piszemy jedynie $\gamma_1$ ale nadal
  pamiętamy o tej zmiennej)

Zadanie:

a) Dokonać klasyfikacji zmiennych na endogeniczne, egzogeniczne, łącznie
   współzależne, z góry ustalone
b) Napisać postać strukturalną modelu
c) Napisać postać zredukowaną modelu
d) Wyrazić parametry i składniki losowe postaci zredukowanej jako funkcje tych
   wielkości z postaci strukturalnej

Rozwiązanie

a) Zmienne endogeniczne to $I_t, Z_t, P_t$.

   Zmienne egzogeniczne to $K_t, X_t$.

   Zmienne łącznie współzależne: $I_t, Z_t, P_t$.

   Zmienne z góry ustalone:

    - endogeniczne z opóźnieniami czasowymi: $I_{t-1}$.
    - egzogeniczne bez opóźnień czasowych: $K_t, X_t$

b) $$
   \begin{aligned}
   &I_t - \beta_{13} P_t - \gamma_{11} I_{t-1} - \gamma_1 = \varepsilon_1\\
   &Z_t - \beta_{23} P_t - \gamma_{22} K_t - \gamma_2 = \varepsilon_2\\
   &P_t - \beta_{32} Z_t - \gamma_{31} I_{t-1} - \gamma_3 = \varepsilon_3
   \end{aligned}
 $$

c) $$
     BY + \Gamma Z = \varepsilon
   $$

   $$
       Y = \begin{bmatrix} I_t\\ Z_t\\ P_t\\ \end{bmatrix} \qquad
       B = \begin{bmatrix}
         1                    & 0                              & -\beta_{13}\\
         0                    & 1                              & -\beta_{23}\\
         \underbrace{0}_{I_t} & \underbrace{-\beta_{32}}_{Z_t} & \underbrace{1}_{P_t}\\
       \end{bmatrix} \qquad
       Z = \begin{bmatrix} I_{t-1}\\ K_t\\ X_t\\ \end{bmatrix} \qquad
   $$ $$
     \Gamma =
     \begin{bmatrix}
     -\gamma_{11}                        & 0                    & -\gamma_1\\
     0                                   & -\gamma_{22}         & -\gamma_2\\
     \underbrace{-\gamma_{31}}_{I_{t-1}} & \underbrace{0}_{K_t} & \underbrace{-\gamma_3}_{X_t}\\
     \end{bmatrix} \qquad
     \varepsilon = \begin{bmatrix}
       \varepsilon_1\\ \varepsilon_2\\ \varepsilon_3\\
     \end{bmatrix}
   $$ $$
     \begin{aligned}
       I_t = \pi_{11} I_{t-1} + \pi_{12} K_t + \pi_{13} X_t + \eta_1\\
       Z_t = \pi_{21} I_{t-1} + \pi_{22} K_t + \pi_{23} X_t + \eta_2\\
       P_t = \pi_{31} I_{t-1} + \pi_{32} K_t + \pi_{33} X_t + \eta_3
     \end{aligned}
   $$ $$
     \begin{bmatrix}%3x1, ty: generic, tr: N
       I_t\\
       Z_t\\
       P_t\\
     \end{bmatrix} = \begin{bmatrix}%3x3, ty: generic, tr: N
       \pi_{11} & \pi_{12} & \pi_{13}\\
       \pi_{21} & \pi_{22} & \pi_{23}\\
       \pi_{31} & \pi_{32} & \pi_{33}\\
     \end{bmatrix} \begin{bmatrix}%3x1, ty: generic, tr: N
       I_{t-1}\\
       K_t\\
       X_t\\
     \end{bmatrix} + \begin{bmatrix}%3x1, ty: generic, tr: N
       \eta_1\\
       \eta_2\\
       \eta_3\\
     \end{bmatrix}
   $$

d) $$
     \begin{aligned}
       &\Pi^T = -B^{-1} \cdot \Gamma\\
       &\eta = B^{-1} \cdot \varepsilon
     \end{aligned}
   $$

   $$
     \begin{aligned}
       \Pi^{T} &= \begin{bmatrix}
         1 & \frac{\beta_{13}\beta_{32}}{1 - \beta_{23}\beta_{32}} & \frac{\beta_{13}}{1 - \beta_{23} \beta_{32}}\\
         0 & \frac{1}{1 - \beta_{23} \beta_{32}}                   & \frac{\beta_{23}}{1-\beta_{23}\beta_{32}}\\
         0 & \frac{\beta_{32}}{1 - \beta_{23}\beta_{32}}           & \frac{1}{1-\beta_{23}\beta_{32}}\\
       \end{bmatrix} \cdot \begin{bmatrix}
         -\gamma_{11} & 0            & -\gamma_1\\
         0            & -\gamma_{22} & -\gamma_2\\
         -\gamma_{31} & 0            & -\gamma_3\\
       \end{bmatrix} \\&=
       \begin{bmatrix}
         \frac{\beta_{23}\beta_{32}\gamma_{11} - \beta_{13} \gamma_{31} - \gamma_{11}}{\beta_{23} \beta_{32} - 1} &
         \frac{-\beta_{13} \beta_{32} \gamma_{22}}{\beta_{23} \beta_{32} - 1}                                     &
         \frac{\beta_{23}\beta_{32}\gamma_1 - \beta_{13}\beta_{32}\gamma_2 - \beta_{13} \gamma_3 - \gamma_1}{\beta_{23} \beta_{32} - 1}\\
         \frac{-\beta_{23} \gamma_{31}}{\beta_{23} \beta_{32} - 1}                                                &
         \frac{-\gamma_{22}}{\beta_{23} \beta_{32} - 1}                                                           &
         \frac{-\beta_{23}\gamma_3 - \gamma_2}{\beta_{23} \beta_{32} - 1}                                         \\
         \frac{-\gamma_{31}}{\beta_{23} \beta_{32} - 1}                                                           &
         \frac{-\beta_{32} \gamma_{22}}{\beta_{23} \beta_{32} - 1}                                                &
         \frac{-\beta_{32} \gamma_2 - \gamma_3}{\beta_{23} \beta_{32} - 1}\\
       \end{bmatrix}
     \end{aligned}
   $$

   $$
     \eta = B^{-1} \varepsilon =
     \frac{1}{\beta_{23} \beta_{32} - 1} \cdot \begin{bmatrix}%3x1, ty: generic, tr: N
       -\beta_{23} \beta_{32}\varepsilon_1 + \beta_{13}\beta_{32}\varepsilon_2 + \beta_{13}\varepsilon_3 + \varepsilon_1\\
       \beta_{23} \varepsilon_3 + \varepsilon_2\\
       \beta_{32} \varepsilon_2 + \varepsilon_3\\
     \end{bmatrix}
   $$

::: {.caution title="" ref=""}

| *Lubię dawać takie coś na egzaminie za 5 punktów*
|  (c) Dr Makarewicz-Trześniewska

:::

:::

---

# Wykład (2025-04-09)

## Klasyfikacja modeli wielorównaniowych

Ze względu na powiązania między nieopóźnionymi w czasie zmiennymi endogenicznymi
modele wielorównaniowe klasyfikuje się na:

- modele proste
- modele rekurencyjne
- modele o równaniach współzależnych.

Klasyfikacja ta jest istotna z punktu widzenia metody szacowania parametrów.
Rozpoznanie klasy modelu wielorównaniowego dokonuje się poprzez badanie
własności macierzy $B$ parametrów strukturalnych znajdujących się przy zmiennych
endogenicznych bez opóźnień czasowych.

- Jeśli macierz $B$ jest macierzą diagonalną lub okaże się taka po prenumerowaniu
  równań modelu, to model nazywamy **prostym**

- Jeśli macierz $B$ jest macierzą trójkątną lub okaże się taką po przenumerowaniu
  równań modelu albo po zamianie miejsca zmiennych w równaniach, to model nazywamy
  **rekurencyjnym**.

- Jeśli w wyniku przenumerowania równań lub zamiany miejsca zmiennych w równaniach
  nie otrzymamy z macierzy $B$ ani macierzy diagonalnej, ani macierzy trójkątnej,
  to model jest modelem **o równaniach współzależnych**

::: {.example title="" ref=""}

W przedsiębiorstwie znajdują się 3 zakłady.

Produkty wytwarzane w poszczególnych zakładach nie są wykorzystywane w
pozostałych zakładach. Oznacza to, że produkcja danego zakładu jest niezależna
od produkcji pozostałych zakładów.

Zbudowano model opisujący zależność produkcji poszczególnych zakładów
$P_1, P_2, P_3$ od zatrudnienia w tych zakładach $Z_1, Z_2, Z_3$ oraz od
wartości produkcyjnego majątku trwałego $K_1, K_2, K_3$

$$
  \begin{aligned}
  P_1 = \alpha_{11} Z_1 + \alpha_{12} K_1 + \alpha_1 + \varepsilon_1\\
  P_2 = \alpha_{21} Z_2 + \alpha_{22} K_2 + \alpha_2 + \varepsilon_2\\
  P_3 = \alpha_{31} Z_3 + \alpha_{32} K_3 + \alpha_3 + \varepsilon_3
  \end{aligned}
$$

Przerzucamy wszystko poza $\varepsilon$ przed znak równości

$$
  \begin{aligned}
  P_1 - \alpha_{11} Z_1 - \alpha_{12} K_1 - \alpha_1 = \varepsilon_1\\
  P_2 - \alpha_{21} Z_2 - \alpha_{22} K_2 - \alpha_2 = \varepsilon_2\\
  P_3 - \alpha_{31} Z_3 - \alpha_{32} K_3 - \alpha_3 = \varepsilon_3
  \end{aligned}
$$

Dokonać klasyfikacje tego modelu

$$
  B = \begin{bmatrix}%3x3, ty: identity, tr: N
    1 & 0 & 0\\
    0 & 1 & 0\\
    0 & 0 & 1\\
  \end{bmatrix}
$$

Ponieważ macierz parametrów jest diagonalna to model jest prosty

:::

::: {.example title="" ref=""}

Przedsiębiorstwo jest przedsiębiorstwem trzyzakładowym. Produkcja pierwszego
zakładu nie zależy od produkcji dwóch pozostałych, natomiast jest przekazywana
do zakładu drugiego. Z kolei produkcja drugiego zakładu jest przekazywana do
trzeciego zakładu.

Zbudować następujący model:

$$
  \begin{aligned}
  P_1 = \gamma_{11}Z_1 + \gamma_{12} K_1 + \gamma_1 + \varepsilon_1\\
  P_2 = \beta_{21} P_1 + \gamma_{23} Z_2 + \gamma_{24} K_2 + \gamma_2 + \varepsilon_2\\
  P_3 = \beta_{32}P_2 + \gamma_{35}Z_3 + \gamma_{36} K_3 + \gamma_3 + \varepsilon_3
  \end{aligned}
$$

gdzie

- $P_1, P_2, P_3$ – produkcja
- $Z_1, Z_2, Z_3$ – zatrudnienie
- $K_1, K_2, K_3$ – majątek trwały

Określ typ tego modelu.

Przekształcamy równania:

$$
  \begin{aligned}
  P_1 - \gamma_{11}Z_1 - \gamma_{12} K_1 - \gamma_1                   = \varepsilon_1\\
  P_2 - \beta_{21} P_1 - \gamma_{23} Z_2 - \gamma_{24} K_2 - \gamma_2 = \varepsilon_2\\
  P_3 - \beta_{32}P_2 - \gamma_{35}Z_3 - \gamma_{36} K_3 - \gamma_3   = \varepsilon_3
  \end{aligned}       -
$$

$$
  B = \begin{bmatrix}%3x3, ty: generic, tr: N
    1           & 0           & 0\\
    -\beta_{21} & 1           & 0\\
    0           & -\beta_{32} & 1\\
  \end{bmatrix}
$$

Macierz jest dolnie trójkątna, zatem to jest model rekurencyjny.

:::

::: {.example title="" ref=""}

Przedsiębiorstwo jest przedsiębiorstwem trzyzakładowym.

- Produkcja pierwszego zakładu jest przekazywana do zakładów drugiego i trzeciego.
- Produkcja drugiego zakładu jest przekazywana częściowo do pierwszego zakładu.
- Produkcja trzeciego zakładu jest przekazywana do drugiego zakładu

Na tej podstawie

$$
  \begin{aligned}
  &P_1 = \beta_{12} P_2 + \gamma_{11} Z_1 + \gamma_{12}K_1 + \gamma_1 + \varepsilon_1\\
  &P_2 = \beta_{21} P_1 + \beta_{23} P_3 + \gamma_{23} Z_2 + \gamma_{24} K_2 + \gamma_{2} + \varepsilon_{2}\\
  &P_3 = \beta_{31} P_1 + \gamma_{35} Z_3 + \gamma_{36} K_3 + \gamma_3 + \varepsilon_3
  \end{aligned}
$$

Zbadaj typ modelu

Przekształcamy równania:

$$
  \begin{aligned}
   P_1 - \beta_{12} P_2 - \gamma_{11} Z_1 - \gamma_{12}K_1 - \gamma_1                     = \varepsilon_1\\
   P_2 - \beta_{21} P_1 - \beta_{23} P_3 - \gamma_{23} Z_2 - \gamma_{24} K_2 - \gamma_{2} = \varepsilon_2\\
   P_3 - \beta_{31} P_1 - \gamma_{35} Z_3 - \gamma_{36} K_3 - \gamma_3                    = \varepsilon_3
  \end{aligned}
$$

$$
  B = \begin{bmatrix}%3x3, ty: generic, tr: N
    1           & -\beta_{12} & 0\\
    -\beta_{21} & 1           & -\beta_{23}\\
    -\beta_{31} & 0           & 1\\
  \end{bmatrix}
$$

Zatem jest to model o równaniach współzależnych

:::

W wielorównaniowych modelach prostych i rekurencyjnych nie występują sprzężenia
zwrotne między nieopóźnionymi w czasie zmiennymi endogenicznymi.

Dlatego każde równanie tych modeli można rozpatrywać osobno i traktować jako
model jednorównaniowy. Parametry każdego równania mogą być szacowane odrębnie za
pomocą klasycznej metody najmniejszych kwadratów.

## Identyfikowalność modeli o równaniach współzależnych

Jeśli równanie jest identyfikowalne, to można oszacować jego parametry. Jeśli
równanie nie jest identyfikowalne to nie można oszacować jego parametrów. Cały
model o równaniach współzależnych jest identyfikowalny jeśli wszystkie jego
równania są identyfikowalne.

::: {.theorem title="" ref=""}

$i$-te równanie wchodzące w skład modelu o $m$ równaniach współzależnych jest
**identyfikowalne** wtw, gdy macierz $A_i$ jest rzędu $m - 1$.

gdzie

- $A_i$ – macierz parametrów znajdujących się przy zmiennych które są
  w modelu a nie występują w $i$-tym równaniu.
- $m$ – liczba równań

---

Niech $k_i$ oznacza liczbę zmiennych, które znajdują się w modelu a nie
występują w równaniu, którego identyfikowalność jest badana.

- Jeśli $k_i = m - 1$, to równanie jest jednoznacznie identyfikowalne.
- Jeśli $k_i > m - 1$, to równanie jest niejednoznacznie identyfikowalne.
- Jeśli $k_i < m - 1$, to równanie nie jest identyfikowalne.

:::

::: {.example title="" ref=""}
Dany jest model

$$
  \begin{aligned}
  &Y_1 = \beta_{12} Y_2 + \beta_{13} Y_3 + \gamma_{11} X_1 + \gamma_1 + \varepsilon_1 \\
  &Y_2 = \beta_{21} Y_1 + \gamma_{22} X_2 + \gamma_2 + \varepsilon_2\\
  &Y_3 = \beta_{32} Y_2 + \gamma_{31}X_1 + \gamma_{33}X_3 + \gamma_3 + \varepsilon_3
  \end{aligned}
$$

gdzie

- $Y_1$ – wielkość produkcji
- $Y_2$ – wartość produkcyjnego majątku trwałego
- $Y_3$ – zatrudnienie
- $X_1$ – dostawy surowców
- $X_2$ – nakłady inwestycyjne
- $X_3$ – zatrudnienie z rocznym opóźnieniem

Dokonać identyfikowalności modelu

$$
  \begin{aligned}
  Y_1 - \beta_{12} Y_2 - \beta_{13} Y_3  - \gamma_{11} X_1 - \gamma_1 = \varepsilon_1 \\
  Y_2 - \beta_{21} Y_1 - \gamma_{22} X_2 - \gamma_2                   = \varepsilon_2\\
  Y_3 - \beta_{32} Y_2 - \gamma_{31}X_1  - \gamma_{33}X_3  - \gamma_3 = \varepsilon_3
  \end{aligned}
$$

$$
  B = \begin{bmatrix}%3x3, ty: generic, tr: N
    1           & -\beta_{12} & -\beta_{13}\\
    -\beta_{21} & 1           & 0\\
    0           & -\beta_{32} & 1\\
  \end{bmatrix}
$$

Równanie I

$$
  A_1 = \begin{bmatrix}%2x2, ty: generic, tr: N
    \overbrace{-\gamma_{22}}^{X_2} & \overbrace{0}^{X_3}\\
    0            & -\gamma_{33}\\
  \end{bmatrix} \qquad
  \operatorname{rz} A_1 = 2 = m - 1 \qquad
  k_1 = 2
$$

Ponieważ $k_1 = \operatorname{rz} A_1 = 2$, to równanie I jest jednoznacznie
identyfikowalne

Równanie II

$$
  A_2 = \begin{bmatrix}%2x3, ty: generic, tr: N
    \overbrace{-\beta_{13}}^{Y_3} & \overbrace{-\gamma_{11}}^{X_1} & \overbrace{0}^{X_3}\\
    1                             & -\gamma_{31}                   & -\gamma_{33}\\
  \end{bmatrix} \qquad
  \operatorname{rz} A_2 = 2 = m - 1
$$

Ponieważ $k_2 = 3 > \operatorname{rz} A_2 = 2$ zatem równanie II jest
niejednoznacznie identyfikowalne

Równanie III

$$
  A_3 = \begin{bmatrix}%2x2, ty: generic, tr: N
    \overbrace{1}^{Y_1} & \overbrace{0}^{X_2}\\
    -\beta_{21}         & -\gamma_{22}\\
  \end{bmatrix} \qquad
  \operatorname{rz} A_3 = 2 = m - 1 \qquad
  k_3 = 2
$$

Ponieważ $k_3 = \operatorname{rz} A_3 = m - 1$, zatem równanie III jest
jednoznacznie identyfikowalne

Wszystkie trzy równania są identyfikowalne, zatem istnieje możliwość oszacowania
jego parametrów.

:::

## Pośrednia metoda najmniejszych kwadratów

Ma ona zastosowanie do szacowania parametrów modeli o równaniach współzależnych
jednoznacznie identyfikowalnych. Metoda ta może być także stosowana do
szacowania parametrów pojedynczych równań jednoznacznie identyfikowalnych
wchodzących w skład modelu o równaniach współzależnych.

### Procedura pośredniej metody najmniejszych kwadratów.

1. Sprowadza się model do postaci zredukowanej

   $$
     Y = \Pi^{T} Z + \eta
   $$

2. Parametry postaci zredukowanej szacuje się klasyczną metodą najmniejszych
   kwadratów korzystając ze wzoru

   $$
     P = (Z^T Z)^{-1} Z^T Y
   $$

   gdzie

   - $P^T = \begin{bmatrix}%4x4, ty: continued, tr: N
     p_{11} & p_{12} & \cdots & p_{1k}\\
     p_{21} & p_{22} & \cdots & p_{2k}\\
     \vdots & \vdots & \ddots & \vdots\\
     p_{m1} & p_{m2} & \cdots & p_{mk}\\
   \end{bmatrix}$ – oceny macierzy $\Pi^T$ parametrów postaci zredukowanej

   - $Z = \begin{bmatrix}%4x4, ty: continued, tr: N
     z_{11} & z_{12} & \cdots & z_{1k}\\
     z_{21} & z_{22} & \cdots & z_{2k}\\
     \vdots & \vdots & \ddots & \vdots\\
     z_{m1} & z_{m2} & \cdots & z_{mk}\\
   \end{bmatrix}$ – macierz obserwacji zmiennych z góry ustalonych występujących
   w modelu

   - $Y = \begin{bmatrix}%4x4, ty: continued, tr: N
     y_{11} & y_{12} & \cdots & y_{1m}\\
     y_{21} & y_{22} & \cdots & y_{2m}\\
     \vdots & \vdots & \ddots & \vdots\\
     y_{n1} & y_{n2} & \cdots & y_{nm}\\
   \end{bmatrix}$ – macierz obserwacji zmiennych łącznie współzależnych
   występujących w modelu.

3. Oceny parametrów postaci strukturalnej uzyskuje się rozwiązując układ równań

   $$
     BP^{T} = -\Gamma
   $$

# Wykład (2025-04-16)

## Weryfikacja modeli

Jedną z podstawowych miar jakości dopasowania modelu do danych empirycznych jest
**współczynnik determinacji**. Ma on postać

$$
  R^2 = \frac{\sum_{i = 1}^{N} (\hat{y}_i - \overline{y})^2}
             {\sum_{i = 1}^{N} (y_i - \overline{y})^2)}
$$

Miarą uzupełniającą miarę $R^2$ jest **współczynnik zbieżności** $\varphi^2$.
Ma on postać

$$
  \varphi^2 = \frac{\sum_{i = 1}^{N} e_i^2}
                   {\sum_{i = 1}^{N} (y_i - \overline{y})^2}
$$

$$
  R^2 + \varphi^2 = 1
$$

::: {.example title="" ref=""}
Na podstawie obserwacji zawartych w tabeli oszacowano model liniowy opisujący
zależność zmiennej $Y$ od zmiennych $X_1$ oraz $X_2$:

$$
  \hat{Y} = 10,45 + 0,75X_1 - X_2
$$

| $y$             | $x_1$           | $x_2$           | $\hat{y}$      |
| --------------- | --------------- | --------------- | -------------- |
| 10              | 0               | 0               | 10,45          |
| 11              | 4               | 2               | 11,45          |
| 12              | 1               | 1               | 10,20          |
| 10              | 0               | 1               | 9,45           |
| 8               | 0               | 1               | 9,45           |

$$
  R^2 = 0,3125 \qquad \varphi^2 = 0,6875
$$

Wniosek: Model w 31% wyjaśnia zmienność zmiennej $Y$

:::

### Istotność parametrów strukturalnych. Test na podstawie statystyki $F$

Współczynnik determinacji – przy dodatkowym założeniu o normalności rozkładu
wektora składnika losowego – może być zbadany z punktu widzenia rozkładu
użytecznego do budowy testu dotyczącego istotności parametrów.
W tym przypadku hipoteza zerowa ma postać

$$
  H_0 : \alpha_1 = \alpha_2 = \ldots = \alpha_n = 0
$$

przeciwko hipotezie alternatywnej

$$
  H_1 = |\alpha_1| + |\alpha_2| + \ldots + |\alpha_n| \ne 0
$$

W razie braku podstaw do odrzucenia hipotezy zerowej należy uznać, że wszystkie
$m$ parametrów (zmiennych objaśniających) należałoby z modelu usunąć, wobec
czego procedurę budowania modelu należy rozpocząć od nowa

Przy prawdziwości hipotezy zerowej statystyka
$F = \frac{n- m - 1}{m} \cdot \frac{R^2}{1-R^2}$ ma rozkład F-Fishera-Snedecora
z $n_1 = m$ oraz $n_2 = n - m - 1$ stopniami swobody.

gdzie

- $m$ – liczba zmiennych
- $n$ – liczba obserwacji

Procedura testowania jest następująca

1. Na podstawie próby obliczamy wartość empiryczną statystyki $F$.
2. Dla zadanego poziomu istotności $\alpha$ znajdujemy wartość krytyczną $F^*$
3. Jeżeli $F > F^*$, to hipotezę $H_0$ odrzucamy.

   W przeciwnym razie stwierdzamy brak podstaw do odrzucenia hipotezy zerowej

::: {.example title="" ref=""}
W celu zbadania zmienności koniunktury giełdowej oszacowano model na podstawie
na dwudziestu danych miesięcznych i model wygląda następująco

$$
  \hat{Y} = -0,02 X_1 - 0,015X_2 - 0,0013 X_3 + 0,014 X_4 + 0,01
$$

gdzie

- $X_1$ – przyrost stopy WIBOR
- $X_2$ – miesięczna stopa inflacji
- $X_3$ – łączna wartość nowych emisji oferowanych publicznie
- $X_4$ – saldo obrotów handlu zagranicznego
- $Y$ – stopa zwrotu obliczona z indeksu giełdowego WIG

Załóżmy, że w modelu tym $R^2 = 0,85$ oraz $\alpha = 0,05$

Zbadaj istotność parametrów w tym modelu, przyjmując że $F^* = 3,06$

$$
  \begin{aligned}
  &H_0 : \alpha_1 = \alpha_2 = \alpha_3 = \alpha_4 = 0\\
  &H_1 : |\alpha_1| + |\alpha_2| + |\alpha_3| + |\alpha_4| \ne 0\\
  \end{aligned}
$$

$$
  F = 21,25 > F^*
$$

Hipotezę zerową w tym przypadku odrzucamy na korzyść hipotezy alternatywnej

:::

### Test na podstawie statystyki $t$

Test istotności na podstawie rozkładu t-Studenta dzięki któremu możliwe jest
testowanie istotności poszczególnych parametrów (a nie tylko ich wektora)

W modelu $Y = \alpha_1 + \alpha_1 X_1 + \alpha_2 X_2 + \ldots + \alpha_n X_n +
\varepsilon$ możliwe jest dla każdego $i = 1, 2, \ldots, m$ testowanie hipotezy

$$
  H_0 : \alpha_i = 0 \qquad
 \text{przeciwko} \qquad
  H_1 : \alpha_i \ne 0
$$

Przy prawdziwości hipotezy $H_0$ (i dodatkowym założeniu o normalności wektora
składników losowych) statystyka

$$
  t = \frac{a_i}{S(a_i)}
$$

ma rozkład t-Studenta o $n - m - 1$ stopniach swobody

Procedura testowania jest następująca:

1) Na podstawie próby obliczamy wartość empiryczną $t_i$ statystyki t-Studenta
2) Dla zadanego poziomu istotności $\alpha$ odnajdujemy wartości krytyczne $t^*$
3) Jeżeli $|t_i| < t^*$, to hipotezę $H_0$ odrzucamy.

   W przeciwnym razie stwierdzamy brak podstaw do odrzucenia hipotezy zerowej

::: {.example title="" ref=""}
Przypuśćmy, że na podstawie 20-miesięcznych oszacowano model (w nawiasach podano
błędy standardowe obliczeń)

$$
  \hat{Y} = -\underset{(0,007)} {0,02 \cdot X_1  } -
             \underset{(0,011)} {0,015 \cdot X_2 } -
             \underset{(0,0001)}{0,0013 \cdot X_3} +
             \underset{(0,012)} {0,014 \cdot X_4 } + 0,01
$$

na poziomie istotności $\alpha = 0,05$ zweryfikować istotność parametrów
strukturalnych przyjmujemy, że $t^* = 2,131$

$$
  \begin{aligned}
    H_0 : \alpha_1 = 0\\
    H_1 : \alpha_1 \ne 0
  \end{aligned} \qquad t_1 = -\frac{0,02}{0,007} = -2,86 \qquad
  |t_1| > t^*
$$

$$
  \begin{aligned}
    H_0 : \alpha_2 = 0\\
    H_1 : \alpha_2 \ne 0
  \end{aligned} \qquad t_2 = -\frac{0,01}{0,011} = -1,36 \qquad
  |t_2| < t^*
$$

$$
  \begin{aligned}
    H_0 : \alpha_3 = 0\\
    H_1 : \alpha_3 \ne 0
  \end{aligned} \qquad t_3 = -\frac{0,0013}{0,0001} = -13 \qquad
  |t_3| > t^*
$$

$$
  \begin{aligned}
    H_0 : \alpha_4 = 0\\
    H_1 : \alpha_4 \ne 0
  \end{aligned} \qquad t_4 = \frac{0,014}{0,012} = 1,17 \qquad
  |t_4| < t^*
$$

Dla parametru $\alpha_2$ i $\alpha_4$ brakuje podstaw do odrzucenia hipotezy
zerowej. Oznacza to, że jedynie zmienne $X_1$ i $X_3$ mają istotny wpływ na
zmienność zmiennej $Y$

:::

### Test na podstawie statystyki $t$ dla kombinacji liniowej parametrów

Pewnym uogólnieniem testu istotności parametrów może być test dotyczący
kombinacji liniowej wektora parametrów

W zastosowaniach test ten stosuje się do stwierdzenia czy parametry modelu
pozostają w pewnej określonej relacji liniowej. Hipoteza zerowa ma w tym
przypadku postać

$$
  H_0 : \omega^T \alpha = w_0 \qquad \text{przeciwko} \qquad
  H_1 : \omega^T \alpha \ne w_0
$$

W zapisie tym $\omega$ jest pewnym wektorem dobranym zgodnie postulowaną
zależnością liniową między parametrami między parametrami $\omega_0$ jest zaś
określoną liczbą.

Przy prawdziwości hipotezy zerowej $H_0$ następująca statystyka ma rozkład
t-Studenta o $n - m - 1$ stopniach swobody

$$
  t_e = \frac{\omega^T \cdot a - \omega_0}
             {\sqrt{\omega^T \cdot s^2 (X^T X)^{-1}\omega}}
$$

gdzie

- $s^2$ – błąd modelu
- $a$ – wektor parametrów oszacowanych w modelu


::: {.example title="" ref=""}
Załóżmy, że oszacowano funkcję charakterystyczną akcji obrazującą zmienność
stopy zwrotu akcji BPH w zależności od stóp zwrotu z indeksu WIG20 i na
podstawie 30 danych miesięcznych stóp zwrotu otrzymano

$$
  \hat{Y} = 0,1 + 0,8 X
$$

Zweryfikować hipotezę, że współczynnik kierunkowy jest o 1 większy od wyrazu
wolnego jeśli oszacowana macierz ma postać

$$
  s^2(X^TX)^{-1} = \begin{bmatrix}
    0,04 & 0,04\\
    0,04 & 0,09\\
  \end{bmatrix}
$$

$$
  \begin{aligned}
    &H_0 : \begin{bmatrix} 1 & -1\\ \end{bmatrix} \cdot
    \begin{bmatrix} \alpha_0\\ \alpha_1\\ \end{bmatrix} = -1\\
    &H_1 : \begin{bmatrix} 1 & -1\\ \end{bmatrix} \cdot
    \begin{bmatrix} \alpha_0\\ \alpha_1\\ \end{bmatrix} \ne -1\\
  \end{aligned}
$$

$$
  \omega^Ta - \omega_0 = \begin{bmatrix}
    1 & -1\\
  \end{bmatrix} \cdot
  \begin{bmatrix} 0,1\\ 0,8\\ \end{bmatrix} + 1 = 0,3
$$

$$
  \omega^T s^2 (X^t X)^{-1} \omega =
  \begin{bmatrix} 1 & -1\\ \end{bmatrix} \cdot \begin{bmatrix}
    0,04 & 0,04\\
    0,04 & 0,09\\
  \end{bmatrix} \cdot
  \begin{bmatrix} 1\\ -1\\ \end{bmatrix} = 0,05
$$

$$
  t_e = \frac{\omega^T a - \omega_0}{\sqrt{\omega^T (X^T X)^{-1} \omega}} =
        \frac{0,3}{\sqrt{0,05}} = 1,34 < t^*
$$

Wnioskujemy, że mamy brak podstaw do odrzucenia hipotezy zerowej

:::

---

# Wykład (2025-04-30)

## Badanie autokorelacji składnika losowego

Przy założeniach standardowego modelu liniowego estymator otrzymany metodą
najmniejszych kwadratów ma najmniejszą macierz wariacji/kowariancji (w sensie
twierdzenia Gaussa-Markowa)

W przypadku, gdy odstąpimy od założenia

$$
  \operatorname{cov} (\varepsilon) = \sigma^2 I
$$

Poza przekątną mogą się pojawić wyrazy różne od zera. Jeśli taka sytuacja ma
miejsce, to mówimy że mamy do czynienia z autokorelacją składnika losowego

Rozpatrzmy uogólnienie autokorelacji rzędu pierwszego

$$
  \varepsilon_{t+1} = \varrho \varepsilon_t + \eta_t \quad (t = 1, 2, \ldots, n - 1)
$$

gdzie zmienne losowe $\eta_t$ są niezależne i mają jednakowy rozkład.

### Procedura testowania hipotezy o dodatniej autokorelacji

Załóżmy, że testujemy hipotezę $H_0 : \varrho = 0$ przeciwko $H_1 : \varrho > 0$

Statystyką testową jest statystyka Durbina-Watsona o postaci

$$
  \operatorname{DW}  = \frac{\sum_{t = 1}^{n-1} (e_{t+1} - e_t)^2}{\sum_{t = 1}^{n} e_t^2}
$$

1. Wyznaczamy dla otrzymanych obserwacji wartość statystyki $\operatorname{DW}$
2. Następnie dla wybranego z góry poziomu istotności odczytujemy lub obliczamy
   wartości krytyczne $d_L$ oraz $d_U$
3. Hipotezę zerową o braku autokorelacji odrzucimy, gdy wartość
   $\operatorname{DW}$ obliczona na podstawie obserwacji będzie mniejsza od $d_L$

   W przypadku, gdy $\operatorname{DW} > d_U$ stwierdzamy brak podstaw do odrzucenia hipotezy
   zerowej

   W przypadku, gdy $d_L < \operatorname{DW}  \le d_U$ nie podejmujemy żadnej decyzji

::: {.example title="" ref=""}

Załóżmy, że w wyniku zastosowania metody najmniejszych kwadratów (20 obserwacji)
zaobserwowano reszty podane niżej:

|       |      |       |       |       |      |      |      |      |       |
| ---   | ---  | ---   | ---   | ---   | ---  | ---  | ---  | ---  | ---   |
| -3.83 | -4.2 | -1.88 | -2.15 | -2.01 | 0.98 | 2.58 | 2.6  | 1.43 | 1.05  |
| 1.46  | 1.23 | -0.1  | -1.09 | -0.12 | 1.2  | 0.29 | 1.53 | 1.09 | -0.06 |

Reszty te obliczono na podstawie modelu z jedną zmienną objaśniającą ($n = 1$)

Zweryfikować hipotezę o dodatniej autokorelacji reszt rozpatrywanej w modelu dla
$\alpha = 0.05$

$$
  d_L = 1,2 \qquad d_U = 1,41 \qquad \operatorname{DW} \approx 0.39
$$

Ponieważ $\operatorname{DW}  < d_L$, odrzucamy hipotezę zerową na korzyść
hipotezy alternatywnej o dodatniej autokorelacji.

:::

### Procedura testowania hipotezy o ujemnej autokorelacji

W przypadku, gdy hipoteza alternatywna jest postaci

$$
  H_1 : \varrho < 0 \qquad H_0 : \varrho = 0
$$

stosujemy procedurę analogiczną jak przy dodatniej autokorelacji.
Zamiast statystyki $\operatorname{DW}$ stosujemy statystykę

$$
  \operatorname{DW}' = 4 - \operatorname{DW}
$$

::: {.example title="" ref=""}

Załóżmy, że w wyniku zastosowania metody najmniejszych kwadratów (20 obserwacji)
zaobserwowano reszty podane niżej:

|       |       |       |       |       |      |       |      |       |      |
| ---   | ---   | ---   | ---   | ---   | ---  | ---   | ---  | ---   | ---  |
| 1.32  | -1.11 | 1.55  | -0.29 | 0.33  | 0.47 | 0.17  | 1.34 | -2.57 | 0.91 |
| -1.31 | 1.45  | -2.85 | 2.29  | -2.25 | 2.01 | -3.15 | 3.83 | -5.53 | 3.39 |

Reszty te obliczono na podstawie modelu z jedną zmienną objaśniającą ($n = 1$)

Polecenie: zweryfikować hipotezę o ujemnej autokorelacji reszt w rozpatrywanym
modelu dla $\alpha = 0.01$

$$
  \operatorname{DW}' \approx 0,44 \qquad d_L = 0,95 \qquad d_U = 1.1
$$

Ponieważ $\operatorname{DW}' < d_L$, odrzucamy hipotezę zerową na korzyść
hipotezy alternatywnej o ujemnej autokorelacji.

:::

---

# Wykład (2025-05-07)

## Heteroscedastyczność

Kolejnym odstępstwem od założeń klasycznej metody najmniejszych kwadratów jest
rezygnacja z postulatu aby wariancje składnika losowego były stałe w czasie.
Przyjmuje się zatem, że

$$
  \operatorname{cov} (\varepsilon) = V, \quad \text{gdzie } V \ne I
$$

W szczególnym przypadku, gdy macierz $V$ jest diagonalna, mamy do czynienia z
brakiem autokorelacji, ale jeśli elementy na przekątnej macierzy $V$ są różne od
siebie, to mamy do czynienia ze zjawiskiem **heteroscedastyczności** (przy braku
autokorelacji).

### Test Goldfelda-Quandta

W celu wykrycia tego zjawiska stosujemy test Goldfelda–Quandta. Procedura jest
następująca:

1) Obserwacje w liczbie $n$ dzielimy na dwie grupy:

   - początkową o liczebności $n_1$
   - końcową o liczebności $n_2$

   W taki sposób, że $n_1 + n_2 = n$

   Podział powyższy ma zwykle charakter arbitralny jednak przesłanki do wyboru
   $n_1$ i $n_2$ powinny mieć przynajmniej podstawy intuicyjne

2) Następnie niezależnie dla obu zbiorów obserwacji wyznaczamy oszacowania
   wektorów parametrów klasyczną metodą najmniejszych kwadratów

3) Następnie szacujemy wariancję w obu grupach według wzorów
   $$
     \begin{aligned}
     S_1^2 = \frac{1}{n_1 - m - 1} \cdot \sum_{i \in A}  e_i^2\\
     S_2^2 = \frac{1}{n_2 - m - 1} \cdot \sum_{i \in B}  e_i^2
     \end{aligned}
   $$

   gdzie

   - $m$ – liczba zmiennych objaśniających
   - $A$ jest zbiorem indeksów odpowiadających pierwszej grupie obserwacji
   - $B$ jest zbiorem indeksów odpowiadających drugiej grupie obserwacji
4) Hipoteza zerowa ma postać
   $$
     H_0 : \sigma_1^2 = \sigma_2^2
   $$

   Statystyka testowa jest ilorazem wielkości $S_1^2$ i $S_2^2$.

5) Testując hipotezę zerową $H_0$ przeciwko hipotezie alternatywnej
   $$
     H_1 : \sigma_1^2 > \sigma_2^2
   $$

   wartość statystyki testowej obliczamy ze wzoru
   $$
     F_e = \frac{S_1^2}{S_2^2}
   $$

   Hipotezę zerową odrzucamy jeśli dla zadanego poziomu istotności $\alpha$
   $$
     F_e > \underbrace{F_{\alpha}(n_1 - m - 1, n_2 - m - 1)
     }_{\text{Kwantyl rzędu $1-\alpha$ rozkładu $F$}}
   $$

6) Jeśli hipoteza alternatywna ma postać
   $$
     H_1 : \sigma_1^2 < \sigma_2^2
   $$

   To wartość statystyki testowej obliczamy ze wzoru
   $$
     F_e = \frac{S_2^2}{S_1^2}
   $$

   Hipotezę odrzucimy, jeśli $F_e > F_{\alpha}(n_2 - m - 1, n_1 - m - 1)$

::: {.example title="" ref=""}

W tabeli przedstawimy dane dotyczące zmienności kursów akcji przedsiębiorstw
przemysłowych w Stanach Zjednoczonych w ostatnich dwunastu latach (zmienna
objaśniana $Y$) oraz dane dotyczące produkcji przemysłowej (zmienna objaśniająca
$X$)

Na poziomie istotności $\alpha = 0,05$ zastosuj procedurę testowania
Goldfelda-Quandta:

| Produkcja przemysłowa $X$ | Kursy akcji $Y$ | $e_i$   | $e_i^2$    |
| :---:                     | :---:           | :---:   | :---:      |
| 96                        | 77              | 14.131  | 199.685161 |
| 100                       | 100             | -2.405  | 5.784025   |
| 107                       | 123             | -14.093 | 198.612649 |
| 86                        | 91              | -16.029 | 256.928841 |
| 73                        | 57              | -3.037  | 9.223369   |
| 58                        | 30              | -0.277  | 0.076729   |
| 68                        | 43              | 2.883   | 8.311689   |
| 72                        | 53              | -0.653  | 0.426409   |
| 81                        | 59              | 7.891   | 62.267881  |
| 94                        | 83              | 4.899   | 24.000201  |
| 99                        | 85              | 10.979  | 120.538441 |
| 77                        | 65              | -4.573  | 20.912329  |

$$
  \hat{y} = -64,005 + 1,616 x
$$

<!--
```r
x = c(96, 100, 107, 86, 73, 58, 68, 72, 81, 94, 99, 77)
y = c(77, 100, 123, 91, 57, 30, 43, 53, 59, 83, 85, 65)
y.hat = -64.005 + 1.616 * x
e = y.hat - y
e^2
```
-->

Kwadraty reszt przyjmują szczególnie dużą wartość dla trzech spośród czterech
pierwszych okresów. Dlatego też zdecydujmy się przyjąć $n_1 = 4$ oraz $n_2 = 8$

Teraz szacujemy parametry modelu liniowego dla pierwszej grupy i dla drugiej:
$$
  \hat{y}_1 = -51,549 + 1,535 x \qquad
  \hat{y}_2 = -45,564 + 1,35 x
$$

<!--
```r
y.hat1 = -51.549 + 1.535 * x[1:4]
y.hat2 = -45.564 + 1.35 * x[5:12]
e1 = y.hat1 - y[1:4]
e2 = y.hat2 - y[5:12]
```
-->

Grupa pierwsza:

| Produkcja przemysłowa $X$ | Kursy akcji $Y$ | $e_i$   | $e_i^2$    |
| :---:                     | :---:           | :---:   | :---:      |
| 96                        | 77              | 18.811  | 353.853721 |
| 100                       | 100             | 1.951   | 3.806401   |
| 107                       | 123             | -10.304 | 106.172416 |
| 86                        | 91              | -10.539 | 111.070521 |

Grupa druga:

| Produkcja przemysłowa $X$ | Kursy akcji $Y$ | $e_i$   | $e_i^2$    |
| :---:                     | :---:           | :---:   | :---:      |
| 73                        | 57              | -4.014  | 16.112196  |
| 58                        | 30              | 2.736   | 7.485696   |
| 68                        | 43              | 3.236   | 10.471696  |
| 72                        | 53              | -1.364  | 1.860496   |
| 81                        | 59              | 4.786   | 22.905796  |
| 94                        | 83              | -1.664  | 2.768896   |
| 99                        | 85              | 3.086   | 9.523396   |
| 77                        | 65              | -6.614  | 43.744996  |

Stawiamy hipotezę:
$$
  H_0 : \sigma_1^2 = \sigma_2^2 \qquad
  H_1 : \sigma_1^2 > \sigma_2^2
$$

$$
  F_e = \frac{S_1^2}{S_2^2} = \frac{287,4515}{19.14553} = 15.01403 \qquad
  F_{\alpha} = 5.14
$$

Zatem $F_e > F_{\alpha}$.

Hipotezę zerową o braku heteroscedastyczności należy odrzucić na rzecz hipotezy
alternatywnej, że w początkowej grupie obserwacji wariancja jest większa niż w
końcowej grupie obserwacji

:::

---

# Wykład (2025-05-21)

::: {.caution title="" ref=""}
Co będzie na kartkówce

1) Metoda usuwania zmiennych (4 szt możliwe) (trzeba opisać)
2) Postać zredukowana, strukturalna oraz klasyfikacja zmiennych (zadanie
   teoretyczne)
3) Weryfikacja modelu (może być zadanie rachunkowe do zrobienia lub opis pewnej
   procedury)

   Chodzi o $R^2, \Phi^2$, istotność parametrów strukturalnych (na 3 sposoby),
   badanie autokorelacji składnika losowego (2 procedury), heteroscedastyczności
4) Pośrednia metoda najmniejszych kwadratów (forma opisowa)

   Czyli: procedura / twierdzenie, np. o identyfikowalności równań
5) Mierniki błędów prognoz ex post

3 zadania na zaliczeniu i 3 zadania na kolosie

:::

## Normalność rozkładu składnika losowego

W testach przedstawionych wcześniej konieczne jest spełnienie założenia o
normalności rozkładu składnika losowego. Nie jest to założenie występujące w
klasycznym standardowym modelu liniowym. Założenie to jest szczególnie ważne w
razie stosowania testów opartych na rozkładzie $F$ ze względu na stosunkowo
niską odporność statystyki $F$ na niespełnienia założenia o normalności rozkładu
składnika losowego.

Wyróżniamy 2 rodzaje testów:

- dla małej próby $n \le 30$
- dla dużej próby

dla małej próby stosujemy test Hellwiga. Jest to test zgodności za pomocą
którego można zweryfikować hipotezę o dowolnym rozkładzie. Test ten opiera się
bowiem na własności:

Jeżeli zmienna losowa $X$ ma rozkład $F$ to zmienna losowa $F_X$ (dystrybuanta
rozkładu normalnego) ma rozkład jednostajny. Dla znanej próby
$x_1, x_2, \ldots, x_n$ z rozkładu $F$ stwierdzimy, że wielkości $F(x_1),
F(x_2), \ldots, F(x_n)$ możemy traktować jako realizację zmiennej losowej o
rozkładzie jednostajnym na odcinku $[0; 1]$. Hipoteza testowana ma w tym
przypadku postać

$$
  H_0 : \text{reszty mają rozkład normalny} \qquad \text{przeciwko} \qquad
  H_1 : \text{reszty mają inny rozkład}
$$

Procedura w teście Hellwiga jest następująca:

1. Dla danego ciągu reszt $e_1, e_2, \ldots, e_n$ szacujemy odchylenie
   standardowe według wzoru
   $$
     s = \sqrt{\frac{1}{n} \sum_{i = 1}^{n} e_i^2}
   $$
2. Przeprowadzamy standaryzację reszt obliczając wielkości

   $$
     e_t' = \frac{e_t}{s}
   $$

3. Po uporządkowaniu reszt od najmniejszej do największej obliczamy wartości
   dystrybuanty rozkładu normalnego dla otrzymanych reszt

4. Odcinek $[0; 1]$ dzielimy na $n$ równych części

   $$
     \left[0; \frac{1}{n}\right) \cup \left[\frac{1}{n}; \frac{2}{n}\right) \cup
     \ldots \cup
     \left[\frac{n-1}{n}; 1\right]
   $$

   Każdą z powstałych części nazywamy celą. Mamy zatem $n$ cel. Następnie
   obliczamy liczbę cel w których nie ma żadnej z wartości dystrybuant z punktu
   (3). Liczbę tę oznaczamy literą $K$

5. Z tablic testu Hellwiga dla zadanego poziomu istotności $\alpha$ odczytujemy
   wartości krytyczne $K_1, K_2$

   Jeżeli $K < K_1$ lub $K > K_2$, to hipotezę zerową należy odrzucić

   Jeżeli $K_1 \le K \le K_2$, to stwierdzamy brak podstaw do odrzucenia hipotezy zerowej

::: {.example title="" ref=""}

Załóżmy, że analizując pewien model liniowy otrzymaliśmy następujące reszty

```
0.257,  0.336, -1.05, -1.983, 0.565,
-0.227, 1.489, 1.873, -1.494, 0.234
```

Zweryfikować hipotezę o normalności rozkładu na poziomie istotności
$\alpha = 0.05$

$$
  H_0 : \text{reszty mają rozkład normalny} \qquad \text{przeciwko} \qquad
  H_1 : \text{reszty mają inny rozkład}
$$

```r
e = c(0.257, 0.336, -1.05, -1.983, 0.565,
      -0.227, 1.489, 1.873, -1.494, 0.234)
s = sd(e) * sqrt((length(e) - 1) / length(e))
e.prime = e / s
e.prime = sort(e.prime)
sort(pnorm(e.prime))
```

$$
  s \approx 1.166042
$$

| $e$    | $e'$   | $e'$ rosnąco | $F(e')$ rosnąco |
| ------ | ------ | ------       | -------         |
| 0.257  | 0.220  | -1.701       | 0.0445          |
| 0.336  | 0.288  | -1.281       | 0.1001          |
| -1.05  | -0.900 | -0.900       | 0.1839          |
| -1.983 | -1.701 | -0.195       | 0.4228          |
| 0.565  | 0.485  | 0.201        | 0.5795          |
| -0.227 | -0.195 | 0.220        | 0.5872          |
| 1.489  | 1.277  | 0.288        | 0.6134          |
| 1.873  | 1.606  | 0.485        | 0.6860          |
| -1.494 | -1.281 | 1.277        | 0.8992          |
| 0.234  | 0.201  | 1.606        | 0.9459          |

$$
  \begin{aligned}
  [0; 0,1) &\cup
  [0,1; 0,2) \cup
  {\color{red} [0,2; 0,3)} \cup
  {\color{red} [0,3; 0,4)} \cup
  [0,4; 0,5) \cup
  [0,5; 0,6) \\&\cup
  [0,6; 0,7) \cup
  {\color{red} [0,7; 0,8)} \cup
  [0,8; 0,9) \cup
  [0,9; 1]
  \end{aligned}
$$

$$
  K = 3
$$

Z testu Hellwiga $K_1 = 1, K_2 = 5$

Ponieważ $1 < 3 < 5$ na poziomie istotności $\alpha = 0.05$ stwierdzamy brak
podstaw do odrzucenia hipotezy zerowej

:::

## Prognozowanie na podstawie szeregów czasowych

### Metody naiwne w prognozowaniu

Najprostszymi metodami wykorzystywanymi do wyznaczania prognoz są metody naiwne.
Ze względu na prostotę są one najczęściej wykorzystywanymi metodami w praktyce.
Obliczenie prognozy polega na skorygowaniu wartości z poprzedniego okresu o
pewną wielkość.

#### Przykłady

1. $y_t^* = y_{t-1}$

   Prognoza równa jest wartości z okresu poprzedniego. Ma ona zastosowanie gdy
   występuje stały poziom zjawiska w czasie i wahanie przypadkowe

2. $y_t^* = y_{t-1} + C$

   Prognoza równa jest wartości z okresu poprzedniego powiększone o pewną stałą
   wielkość $C$ ustaloną z góry. Ma zastosowanie, gdy występuje liniowa
   tendencja rozwojowa i wahania przypadkowe

3. $y_t^* = y_{t-1} \cdot \sqrt[t-2]{\frac{y_{t-1}}{y_{t-2}} \cdot
   \frac{y_{t-2}}{y_{t-3}} \cdot K \cdot \frac{y_2}{y_1}} = y_{t-1} \cdot
   \sqrt[t-2]{\frac{y_{t-1}}{y_1}}$

   Prognoza równa jest wartości z okresu poprzedniego powiększona o średni
   przyrost względny poziomu zjawiska z poprzednich okresów dla których
   zgromadzono materiał empiryczny (średniookresowe tempo zmian poziomu
   zjawiska). Ma zastosowanie gdy występuje nieliniowa tendencja rozwojowa i
   wahania przypadkowe.

4. $y_t^* = y_{t-r} \cdot (1+C)$

   Prognoza równa jest wartości z tego samego podokresu poprzedniego cyklu
   sezonowości powiększona o pewien ustalony z góry procent ($C$). Ma
   zastosowanie gdy występuje nieliniowa tendencja rozwojowa, wahania sezonowe i
   wahania przypadkowe. Kryterium wyboru spośród metod stanowi wielkość błędów
   prognoz *ex post*. Do prognoz wybiera się schemat i parametry dla których
   błędy są najmniejsze.

### Prognostyczny model średniej ruchomej prostej i ważonej

Model ten stosuje się w przypadku gdy w badanym okresie występuje stały poziom
wartości zmiennej prognozowanej zakłócany jedynie odchyleniami przypadkowymi.
Wykorzystanie modelu średniej ruchomej polega na wyznaczeniu prognozy jako
średniej arytmetycznej zwykłej bądź ważonej z k ostatnich wartości zmiennej.

W przypadku gdy będziemy obliczali średnie arytmetyczne zwykłe będziemy mieli do
czynienia z modelem średniej ruchomej prostej, z którego prognozy wyznacza się
na podstawie następującego wzoru:

$$
  y_t^* = \frac{1}{k} \sum_{i = t-k}^{t-1} y_i
$$

gdzie

- $k$ – stała wygładzania, liczba wyrazów średniej ruchomej, która określana
  jest przez prognostę

W przypadku modelu średniej ruchomej ważonej prognozy wyznacza się jako średnie
ważone, a wagi ustala się tak by była realizowana zasada postarzania informacji
(nowsze tendencje silnej oddziaływają na prognozowane zjawisko).

$$
  y_t^* = \sum_{i = t-k}^{t-1} y_i w_{i-1+k+1}
$$

gdzie

- $w$ – waga wartości zmiennej prognozowanej w danym momencie lub okresie.

  Wagi muszą spełniać następujące zależności zgodnie z zasadą postarzania
  informacji:
  $$
    0 < w_1 < w_2 < \ldots < w_k \le 1 \qquad \sum_{i = 1}^{k} w_i = 1
  $$

Kryterium wyboru stałej wygładzania stanowią błędy prognoz *ex post*, a w
szczególności wielkość średniego kwadratowego błędu prognozy *ex post*
(odchylenia standardowego prognoz) lub współczynnika zmienności prognoz oraz
średniego względnego błędu prognoz *ex post*. Do modelu wybiera się tą stałą dla
której błędy są najmniejsze.

### Mierniki błędów prognoz ex post

Bezwzględny błąd prognozy *ex post*:
$$
  q_t = y_t - y_T^*
$$

Względny błąd prognozy *ex post*:
$$
  q_t' = \frac{y_t - y_T^*}{y_t}
$$

Średni kwadratowy błąd prognozy ex post oraz odchylenie standardowe prognoz
oblicza się według poniższych wzorów:

$$
  s_P^2 = \frac{1}{n-k} \sum_{t = k+1}^{n} (y_t - y_t^*)^2 \qquad
  s_P = \sqrt{s_P^2}
$$

W przypadku porównywania $s_P$ obliczonego dla różnej liczby okresów (różne $k$)
należy go odnieść do średniego poziomu zjawiska w przedziale empirycznej
weryfikacji prognoz obliczając współczynnik zmienności prognoz:

$$
  V_P = \frac{s_p}{\overline{y}} \cdot 100\%
$$

Średni względny błąd prognozy *ex post* oblicza się następująco:
$$
  \overline{q} = \frac{1}{n-k} \sum_{t = k+1}^{n}
                 \frac{|y_t - y_t^*|}{y_t} \cdot 100\%
$$

Do modelu wybiera się tą stałą, dla której błędy są najmniejsze.
