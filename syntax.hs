----------------------
-- Syntax in Func.: --
----------------------
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal pattern" #-}
{-# HLINT ignore "Use foldr" #-}

lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY NUMEBR SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5!"

-- Using recursion so it would look like when
-- factiorial 3
-- 3 * factorial (3 - 1)
-- 3 * 2 * factorial (2 - 1)
-- 3 * 2 * 1 * factorial (1 - 1)
-- 3 * 2 * 1 * 1
-- factiorial 3 == 3 * 2 * 1 * 0 == 6
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- failign pattern matching
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
-- ghci> charName 'a'
-- "Albert"
-- ghci> charName 'b'
-- "Broseph"
-- ghci> charName 'h'
-- "*** Exception: syntax.hs:(31,1)-(33,22): Non-exhaustive patterns in function charName

-- Usage with touples
-- addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
-- addVectors a b = (fst a + fst b, snd a + snd b)
-- better version
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- functions for triples
first :: (a , b, c) -> a
first (x, _, _) = x

second :: (a , b, c) -> b
second (_, y, _) = y

third :: (a , b, c) -> c
third (_, _, z) = z

-- Pattern match in comprehensions
-- ghci> let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)] 
-- ghci> [a+b | (a,b) <- xs] 
-- [4,7,6,8,11,4]

-- *************************** --
-- implementing the head func. --
-- *************************** --

head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x
-- ghci> head' [4,5,6]
-- 4
-- ghci> head' "Hello"
-- 'H'
-- head with case expression
-- head' :: [a] -> a  
-- head' xs = case xs of [] -> error "No head for empty lists!"  
--                       (x:_) -> x  

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- *************************** --
-- implementing t. length fun. --
-- *************************** --
length' :: (Num b) => [a] -> b
length' [] = 0
length' (x:xs) = 1 + length' xs

-- *************************** --
-- implementing the sum func.  --
-- *************************** --
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

capital :: String -> String
capital "" = "Empty String, whoops!"
capital all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]
-- ghci> capital "Dracula"
-- "The first letter of Dracula is D"


----------------------
--      Guards      --
----------------------

-- bmiTell Version: 1
-- bmiTell :: (RealFloat a) => a -> String
-- bmiTell bmi
--     | bmi <= 18.5 = "You're underweight, you emo, you!"
--     | bmi <= 25.0 = "You're supposedly normal. Pfft, I bet you're ugly!"
--     | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise   = "You're a whale, congratulations!"

-- bmiTell Version: 2
-- bmiTell :: (RealFloat a) => a -> a -> String
-- bmiTell weight height
--     | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
--     | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pfft, I bet you're ugly!"
--     | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise                   = "You're a whale, congratulations!"

-- bmiTell Version: 3
-- bmiTell :: (RealFloat a) => a -> a -> String
-- bmiTell weight height
--     | bmi <= 18.5 = "You're underweight, you emo, you!"
--     | bmi <= 25.0 = "You're supposedly normal. Pfft, I bet you're ugly!"
--     | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
--     | otherwise   = "You're a whale, congratulations!"
--     where bmi = weight / height ^ 2

-- bmiTell Version: 4
-- bmiTell :: (RealFloat a) => a -> a -> String
-- bmiTell weight height
--     | bmi <= skinny = "You're underweight, you emo, you!"
--     | bmi <= normal = "You're supposedly normal. Pfft, I bet you're ugly!"
--     | bmi <= fat    = "You're fat! Lose some weight, fatty!"
--     | otherwise     = "You're a whale, congratulations!"
--     where bmi = weight / height ^ 2
--           skinny = 18.5
--           normal = 25.0
--           fat = 30.0

-- bmiTell Version: 5
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pfft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)

-- *************************** --
-- implementing the max func.  --
-- *************************** --
max' :: (Ord a) => a -> a -> a
max' a b
    | a > b     = a
    | otherwise = b

-- *************************** --
--    impl. t. compare func.   --
-- *************************** --
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT

initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

-- calcBmis Version 1
-- calcBmis :: (RealFloat a) => [(a, a)] -> [a]
-- calcBmis xs = [bmi w h | (w, h) <- xs]
    -- where bmi weight height = weight / height ^ 2

-- calcBmis Version 2
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in sideArea + 2 * topArea


-- *************************** --
--       case expressions      --
-- *************************** --
describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of [] -> "empty."
                                               [xs] -> "a singleton list."
                                               xs -> "a longer list."