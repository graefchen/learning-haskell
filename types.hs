--------------------
--    Types:      --
--------------------

-- ghci> :t 'a'
-- 'a' :: Char
-- ghci> :t True
-- True :: Bool
-- ghci> :t "HELLO!"
-- "HELLO!" :: [Char]
-- ghci> :t (True, 'a')
-- (True, 'a') :: (Bool, Char)
-- ghci> :t 4 == 5
-- 4 == 5 :: Bool

-- ********************** --
--        functions       --
-- ********************** --

-- Type "[Char]" is a string
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- Type "Int" is an Integer
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Type "Int" is an Integer, but bigger numbers than Int
factorial :: Integer -> Integer
factorial n = product [1..n]
-- ghci> factorial 50
-- 30414093201713378043612608166064768844377641568960512000000000000

-- Type Float is a floating point with single precision
circumference :: Float -> Float
circumference r = 2 * pi * r
-- ghci> circumference 4.0
-- 25.132742

-- Type double is a floating point with double precision
circumference' :: Double -> Double
circumference' r = 2 * pi + r
-- ghci> circumference' 4.0
-- 25.132741228718345

-- ********************** --
--    type of functions   --
-- ********************** --

-- ghci> :t head
-- head :: [a] -> a

-- ghci> :t fst
-- fst :: (a, b) -> a

-- ghci> :t (==)
-- (==) :: (Eq a) => a -> a -> Bool


-- ********************** --
--    basic typeclasses   --
-- ********************** --

-- Eq is used for equality testing
-- ghci> 5 == 5
-- True
-- ghci> 5 /= 5
-- False
-- ghci> 'a' == 'a'
-- True
-- ghci> "Ho Ho" == "Ho Ho"
-- True
-- ghci> 3.432 == 3.432
-- True

-- Ord is used for odering
-- ghci> :t (>)
-- (>) :: Ord a => a -> a -> Bool
-- ghci> "Abrakadabra" < "Zebra"
-- True
-- ghci> "Abrakadabra" `compare` "Zebra"
-- LT
-- ghci>  5 >= 2
-- True
-- ghci> 5 `compare` 3
-- GT

-- Show represent all strings and return a type which is a member of Show
-- ghci> show 3
-- "3"
-- ghci> show 5.334
-- "5.334"
-- ghci> show True
-- "True"

-- Read takes a string and returns a type which is a member of Read
-- ghci> read "True" || False
-- True
-- ghci> read "8.2" + 3.8
-- 12.0
-- ghci> read "5" - 2
-- 3
-- ghci> read "[1,2,3,4]" ++ [3]
-- [1,2,3,4,3]

-- type of ghci> :t read
-- ghci> :t read
-- read :: Read a => String -> aread:
-- reading with type annotations
-- ghci> read "5" :: Int
-- 5
-- ghci> read "5" :: Float
-- 5.0
-- ghci> (read "5" :: Float) * 4
-- 20.0
-- ghci> read "[1,2,3,4]" :: [Int]
-- [1,2,3,4]
-- ghci> read "(3, 'a')" :: (Int, Char)
-- (3,'a')

-- Enum are sequentially ordered types
-- ghci> ['a'..'e']
-- "abcde"
-- ghci> [LT .. GT]
-- [LT,EQ,GT]
-- ghci> [3 .. 5]
-- [3,4,5]
-- ghci> succ 'B'
-- 'C'  

-- Rounded defines the upper(max) and lower(min) bound of functions
-- ghci> minBound :: Int
-- -9223372036854775808
-- ghci> maxBound :: Char
-- '\1114111'
-- ghci> maxBound :: Bool
-- True  
-- ghci> minBound :: Bool
-- False
-- ghci> maxBound :: (Bool, Int, Char)
-- (True,9223372036854775807,'\1114111')


-- Num numeric typeclass
-- ghci> :t 20
-- 20 :: Num a => a
-- whole numbers can act as mmebers from the Num typeclass
-- ghci> 20 :: Int
-- 20
-- ghci> 20 :: Integer
-- 20
-- ghci> 20 :: Float
-- 20.0
-- ghci> 20 :: Double
-- 20.0
-- Types that are in the typeclass
-- ghci> :t (*)  
-- (*) :: (Num a) => a -> a -> a  

-- Integral -> All whole numbers types in the Num typeclass => (0) (1, 2 ..) (-1, -2 ..)

-- Floating -> All real numbers types in the Num typeclass => (0.1, 0.2, etc)

-- useful function: from Integral
-- Takes in an Intagral and returns a Number
-- ghci> :t fromIntegral
-- fromIntegral :: (Integral a, Num b) => a -> b