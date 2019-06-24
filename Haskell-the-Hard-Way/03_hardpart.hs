import Data.List

evenSum :: Integral a => [a] -> a

-- evenSum l = mysum 0 (filter even l)
--     where 
--         mysum n [] = n
--         mysum n (x:xs) = mysum (n+x) xs


-- evenSum l = foldl' mysum 0 (filter even l)
--     where mysum acc value = acc + value

-- evenSum l = foldl' (\x y -> x+y) 0 (filter even l)

-- evenSum l = foldl' (+) 0 (filter even l)

-- evenSum = (foldl' (+) 0) . (filter even)

sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0
evenSum = sum' . (filter even)


main = print(evenSum [1..5])