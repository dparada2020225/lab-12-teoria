-- Problema 4: eliminar de una lista los elementos indicados en otra
-- lista, usando funciones lambda. Los elementos a borrar que no estan
-- en la lista original simplemente se ignoran.
--
-- Uso:  runghc src/Problema4.hs

import Data.List (intercalate)

-- Se queda solo con los elementos que NO estan en la lista a borrar
eliminar :: Eq a => [a] -> [a] -> [a]
eliminar lista borrar = filter (\x -> not (x `elem` borrar)) lista

mostrar :: [String] -> String
mostrar xs = "[" ++ intercalate ", " (map (\s -> "'" ++ s ++ "'") xs) ++ "]"

main :: IO ()
main = do
  let colores = ["rojo", "verde", "azul", "amarillo", "gris", "blanco", "negro"]
      borrar  = ["amarillo", "cafe", "blanco"]
  putStrLn ("Lista inicial:      " ++ mostrar colores)
  putStrLn ("Elementos a borrar: " ++ mostrar borrar)
  putStrLn ("Salida:             " ++ mostrar (eliminar colores borrar))
  putStrLn "\n('cafe' no estaba en la lista original, por eso se ignora)"
