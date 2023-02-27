{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Redundant if" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use max" #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Use product" #-}
{-# HLINT ignore "Use const" #-}
import Prelude hiding (filter, map)
--------------------
-- Higher Order:  --
--------------------

multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z
-- ghci>  let multTwoWithNine = multThree 9
-- ghci> multTwoWithNine 2 3  
-- 54
-- ghci> let multWithEighteen = multTwoWithNine 2
-- ghci> multWithEighteen 10 
-- 180

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)
-- ghci> applyTwice (+3) 10
-- 16
-- ghci> applyTwice (++ " HAHA") "HEY"
-- "HEY HAHA HAHA"
-- ghci> applyTwice ("HAHA " ++) "HEY"
-- "HAHA HAHA HEY"
-- ghci> applyTwice (multThree 2 2) 9
-- 144
-- ghci> applyTwice (3:) [1]
-- [3,3,1]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
-- ghci> zipWith' (+) [4,2,5,6] [2,6,2,3]
-- [6,8,7,9]
-- ghci> zipWith' max [6,3,2,1] [7,3,1,5]
-- [7,3,2,5]
-- ghci> zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
-- ["foo fighters","bar hoppers","baz aldrin"]
-- ghci> zipWith' (*) (replicate 5 2) [1..]
-- [2,4,6,8,10]
-- ghci> zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]
-- [[3,4,6],[9,20,30],[10,12,12]]

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y
-- ghci> flip' zip [1,2,3,4,5] "hello"
-- [('h',1),('e',2),('l',3),('l',4),('o',5)]
-- ghci> zipWith (flip' div) [2,2..] [10,8,6,4,2]
-- [5,4,3,2,1]
-- Lambda Version:
-- flip' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = \x y -> f y x

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs
-- ghci> filter (>3) [1,5,3,2,1,6,4,3,2,1]
-- [5,6,4]
-- ghci> filter (==3) [1,2,3,4,5]
-- [3]
-- ghci> filter even [1..10]
-- [2,4,6,8,10]
-- ghci> let notNull x = not (null x) in filter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]]
-- [[1,2,3],[3,4,5],[2,2]]
-- ghci> filter (`elem` ['a'..'z']) "u LaUgH aT mE BeCaUsE I aM diFfeRent"
-- "uagameasadifeent"
-- ghci> filter (`elem` ['A'..'Z']) "i lauGh At You BecAuse u r aLL the Same"
-- "GAYBALLS"

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
    let smallerSorted = quicksort (filter (<=x) xs)
        biggerSorted = quicksort (filter (>x) xs)
    in  smallerSorted ++ [x] ++ biggerSorted

largestDivisible :: (Integral a) => a
largestDivisible= head(filter p [100000,99999..])
    where p x = x `mod` 3892 == 0

chain :: (Integral a) => a -> [a]
chain 1 = []
chain n
    | even n = n:chain (n `div` 2)
    | odd n  = n:chain (n*3 + 1)
-- ghci> chain 10
-- [10,5,16,8,4,2]
-- ghci> chain 1 
-- []
-- ghci> chain 30
-- [30,15,46,23,70,35,106,53,160,80,40,20,10,5,16,8,4,2]

-- numLongChains :: Int
-- numLongChains = length (filter isLong (map chain [1..100]))
--     where isLong xs = length xs > 15

-- other functionalitys of map
-- ghci> let listOfFuns = map (*) [0..]
-- ghci> (listOfFuns !! 4) 5
-- 20

--------------------
--   Lambdas:     --
--------------------

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..100]))

-- With other parameters
-- ghci> zipWith (\a b -> (a * 30 + 3) / b) [5,4,3,2,1] [1,2,3,4,5]
-- [153.0,61.5,31.0,15.75,6.6]

-- ghci> map (\(a,b) -> a + b) [(1,2),(3,5),(6,3),(2,6),(2,5)]
-- [3,8,9,8,7]

-- sum with lambda
sum' :: (Num a) => [a] -> a
sum' = foldl (+) 0
-- ghci> sum' [3,5,2,1]
-- 11

-- elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

-- ghci> sqrtSums
-- 131
-- ghci> sum (map sqrt [1..131])
-- 1005.0942035344083
-- ghci> sum (map sqrt [1..130])
-- 993.6486803921487

-- The $
-- defined:
-- ($) :: (a -> b) -> a -> b
-- f $ x = f x
-- sum (map sqrt [1..130]) == sum $ map sqrt [1..130]
-- sum (filter (> 10) (map (*2) [2..10])) == sum $ filter (> 10) $ map (*2) [2..10]

-- The . / function composition
-- defined:
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- f . g = \x -> f (g x)
-- map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] == map (negate . abs) [5,-3,-6,7,-3,2,-19,24]
-- or
-- map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]] == map (negate . sum . tail) [[1..5],[3..6],[1..7]]

-- point free style (pointless)
-- her with the function sum
-- sum' :: (Num a) => [a] -> a
-- sum' xs = foldl (+) 0 xs

-- now function fn
-- fn x = ceiling (negate (tan (cos (max 50 x)))) == fn = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer  
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))
-- with function composition
-- oddSquareSum :: Integer
-- oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]
-- When someone else nneds to read the code
-- oddSquareSum :: Integer
-- oddSquareSum =
    -- let oddSquares = filter odd $ map (^2) [1..]
        -- belowLimit = takeWhile (<10000) oddSquares
    -- in  sum belowLimit