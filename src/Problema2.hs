-- Problema 2: ordenar una lista de diccionarios con respecto a un key,
-- usando funciones lambda.
--
-- Uso:  runghc src/Problema2.hs [key]      (por defecto key = model)

import Data.List (intercalate, sortBy)
import System.Environment (getArgs)

-- Un valor del diccionario puede ser texto o numero
data Valor = Texto String | Numero Int
  deriving (Eq, Ord)

-- Un diccionario es una lista de pares (key, valor); asi se conserva
-- el orden de las llaves igual que en el enunciado
type Diccionario = [(String, Valor)]

-- Ordena comparando el valor de la key indicada en cada diccionario
ordenarPor :: String -> [Diccionario] -> [Diccionario]
ordenarPor key = sortBy (\a b -> compare (lookup key a) (lookup key b))

mostrarValor :: Valor -> String
mostrarValor = \v -> case v of
  Texto s  -> "'" ++ s ++ "'"
  Numero n -> show n

mostrarDic :: Diccionario -> String
mostrarDic d =
  "{" ++ intercalate ", " (map (\(k, v) -> "'" ++ k ++ "': " ++ mostrarValor v) d) ++ "}"

mostrarLista :: [Diccionario] -> String
mostrarLista ds = "[\n" ++ intercalate ",\n" (map (\d -> "    " ++ mostrarDic d) ds) ++ "\n]"

telefonos :: [Diccionario]
telefonos =
  [ [("make", Texto "Nokia"),   ("model", Numero 216), ("color", Texto "Black")]
  , [("make", Texto "Mi Max"),  ("model", Numero 2),   ("color", Texto "Gold")]
  , [("make", Texto "Samsung"), ("model", Numero 7),   ("color", Texto "Blue")]
  ]

main :: IO ()
main = do
  args <- getArgs
  let key = case args of
        (k:_) -> k
        []    -> "model"
  putStrLn "Lista original:"
  putStrLn (mostrarLista telefonos)
  putStrLn ("\nOrdenada con key = '" ++ key ++ "':")
  putStrLn (mostrarLista (ordenarPor key telefonos))
