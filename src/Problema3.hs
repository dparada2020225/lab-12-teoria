-- Problema 3: matriz transpuesta X^T de una matriz definida como
-- lista de listas, usando funciones lambda.
--
-- Uso:  runghc src/Problema3.hs

import Data.List (intercalate)

-- La columna j de X se convierte en la fila j de X^T:
-- para cada indice de columna j se toma el elemento j de cada fila
transpuesta :: [[a]] -> [[a]]
transpuesta [] = []
transpuesta x  = map (\j -> map (\fila -> fila !! j) x) [0 .. length (head x) - 1]

mostrarMatriz :: Show a => [[a]] -> String
mostrarMatriz m = "[" ++ intercalate ", " (map (\fila -> "[" ++ intercalate ", " (map (\e -> show e) fila) ++ "]") m) ++ "]"

-- Imprime la matriz por filas para que se vea como en el enunciado
imprimirFilas :: Show a => [[a]] -> IO ()
imprimirFilas = mapM_ (\fila -> putStrLn ("    " ++ unwords (map (\e -> show e) fila)))

ejemplo :: String -> [[Int]] -> IO ()
ejemplo nombre x = do
  putStrLn (nombre ++ " = " ++ mostrarMatriz x)
  imprimirFilas x
  let xt = transpuesta x
  putStrLn (nombre ++ "^T = " ++ mostrarMatriz xt)
  imprimirFilas xt
  putStrLn ""

main :: IO ()
main = do
  ejemplo "X" [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  -- Tambien funciona con matrices que no son cuadradas (2x3 -> 3x2)
  ejemplo "Y" [[1, 2, 3], [4, 5, 6]]
