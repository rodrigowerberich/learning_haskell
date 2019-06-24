-- type Name = String
-- type Color = String

-- showInfos :: Name -> Color -> String
-- showInfos name color = "Name: " ++ name
--                         ++ ", Color: " ++ color

-- name :: Name
-- name = "Robin"
-- color :: Color
-- color = "Blue"
-- main = putStrLn $ showInfos name color

data Name = NameConstr String
data Color = ColorConstr String

showInfos :: Name -> Color -> String
showInfos (NameConstr name) (ColorConstr color) = 
            "Name: " ++ name ++ ", Color: " ++ color

name = NameConstr "Robin"
color = ColorConstr "Blue"
main = putStrLn $ showInfos name color