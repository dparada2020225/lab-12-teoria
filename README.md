# Laboratorio 12 — Teoría de la Computación

**Denil José Parada Cabrera — 24761**

## Video

- Video en YouTube (no listado): **<https://youtu.be/Zn04b9MovT4>**
- Copia del video en el repositorio: [`video/demo-lab12.mp4`](video/demo-lab12.mp4)

En el video se muestran el código y la ejecución de los problemas 2, 3 y 4.

## Lenguaje

Los programas están escritos en **Haskell** (GHC 9.4.7), un lenguaje funcional puro.
Las funciones lambda se escriben como `\x -> ...`.

## Estructura

```text
lab-12-teoria/
├── problema1/
│   └── Lab 12 teoria Denil Parada.pdf   # Problema 1 (teoría: reducción-β, recursión, ciclos)
├── src/
│   ├── Problema2.hs                     # Ordenar lista de diccionarios por key
│   ├── Problema3.hs                     # Matriz transpuesta
│   └── Problema4.hs                     # Eliminar elementos de una lista
├── video/
│   └── demo-lab12.mp4
└── README.md
```

## Cómo ejecutar

1. Instalar GHC con [GHCup](https://www.haskell.org/ghcup/) (Windows, macOS o Linux)
   o en Ubuntu con `sudo apt install ghc`.
2. Desde la raíz del repositorio:

```bash
runghc src/Problema2.hs          # ordena con key = model (por defecto)
runghc src/Problema2.hs make     # se puede indicar otra key: make, model o color
runghc src/Problema3.hs
runghc src/Problema4.hs
```

También se pueden compilar, por ejemplo: `ghc src/Problema3.hs && ./src/Problema3`.

## Problema 1

Las respuestas están en [`problema1/Lab 12 teoria Denil Parada.pdf`](problema1/Lab%2012%20teoria%20Denil%20Parada.pdf):
reducción-β de NOT con booleanos de Church, recursión con el combinador Y, ciclos como
recursión de cola y cuándo conviene (o no) la programación funcional.

## Problema 2 — Ordenar una lista de diccionarios por un key

Cada diccionario es una lista de pares `(key, valor)` y se ordena con una lambda que
compara el valor de la key indicada:

```haskell
ordenarPor key = sortBy (\a b -> compare (lookup key a) (lookup key b))
```

Salida con `key = 'model'`:

```text
[
    {'make': 'Mi Max', 'model': 2, 'color': 'Gold'},
    {'make': 'Samsung', 'model': 7, 'color': 'Blue'},
    {'make': 'Nokia', 'model': 216, 'color': 'Black'}
]
```

## Problema 3 — Matriz transpuesta

La columna `j` de X se convierte en la fila `j` de Xᵀ:

```haskell
transpuesta x = map (\j -> map (\fila -> fila !! j) x) [0 .. length (head x) - 1]
```

```text
X   = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
X^T = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
```

También funciona con matrices que no son cuadradas (2×3 → 3×2).

## Problema 4 — Eliminar elementos de una lista

Se usa `filter` con una lambda que conserva solo lo que no está en la lista a borrar.
Los elementos que no existen en la lista original (como `'cafe'`) se ignoran.

```haskell
eliminar lista borrar = filter (\x -> not (x `elem` borrar)) lista
```

```text
Lista inicial:      ['rojo', 'verde', 'azul', 'amarillo', 'gris', 'blanco', 'negro']
Elementos a borrar: ['amarillo', 'cafe', 'blanco']
Salida:             ['rojo', 'verde', 'azul', 'gris', 'negro']
```
