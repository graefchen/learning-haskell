--------------------
--   Starting:    --
--------------------

-- Simple Arithmetric
-- ghci> 2 + 15
-- 17
-- ghci> 49 * 100
-- 4900
-- ghci> 1892 - 1472
-- 420
-- ghci> 5 / 2
-- 2.5

-- Usage of parenthisis
-- ghci> (50 * 100) - 4999
-- 1
-- ghci> 50 * 100 - 4999
-- 1
-- ghci> 50 * (100 - 4999)
-- -244950

-- Boolearn algebra
-- ghci> True && False
-- False
-- ghci> True && True
-- True
-- ghci> False || True
-- True
-- ghci> not False
-- True
-- ghci> not (True && True)
-- False

-- Equality
-- ghci> 5 == 5
-- True
-- ghci> 1 == 0
-- False
-- ghci> 5 /= 5
-- False
-- ghci> 5 /= 4
-- True
-- ghci> "hello" == "hello"
-- True

--------------------
--   FUNCTIONS:   --
--------------------

-- ghci> succ 8
-- 9

-- ghci> min 9 10
-- 9
-- ghci> min 3.4 3.2
-- 3.2
-- ghci> max 100 101
-- 101

-- ghci> succ 9 + max 5 4 + 1
-- 16
-- ghci> (succ 9) + (max 5 4) + 1
-- 16

--------------------
--      BABY:     --
--------------------

-- loading with ghci and the solutions of the function
doubleMe :: Num a => a -> a
doubleMe x = x + x
-- would look like this:
-- ghci> :l baby
-- [1 of 1] Compiling Main             ( baby.hs, interpreted )
-- Ok, one module loaded.
-- ghci> doubleMe 9
-- 18
-- ghci> doubleMe 8.3
-- 16.6

-- Initial Version:
-- doubleUs :: Num a => a -> a -> a
-- doubleUs x y = x*2 + y*2
-- Redifined Version:
doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y

-- ghci> doubleUs 4 9
-- 26
-- ghci> doubleUs 2.3 34.2
-- 73.0
-- ghci> doubleUs 28 88 + doubleMe 123
-- 478

-- function that multiplies by 2 if the number is smalller than 100
doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x > 100
                        then x
                        else x*2
-- one liner of that function (that also adds 1 to the doubled number)
doubleSmallNumber' :: (Num a, Ord a) => a -> a
doubleSmallNumber' x = (if x > 100 then x else x*2) + 1

--------------------
--     LISTS:     --
--------------------

-- Defining lists
-- ghci> let lostNumbers = [4,8,15,16,23,42]
-- ghci> lostNumbers
-- [4,8,15,16,23,42]

-- Adding lists
-- ghci> [1, 2, 3, 4] ++ [9,10,11,12]
-- [1,2,3,4,9,10,11,12]
-- ghci> "hello" ++ " " ++ "world"
-- "hello world"
-- ghci> ['w', 'o'] ++ ['o', 't']
-- "woot"

-- Putting something at the beginning of a list
-- ghci> 'A':" SMALL CAT"
-- "A SMALL CAT"
-- ghci> 5:[1,2,3,4,5]
-- [5,1,2,3,4,5]

-- Getting an element out of a list by index
-- ghci> "Steve Buscemi" !! 6
-- 'B'
-- ghci> [9.4,33.2,96.2,11.2,23.25] !! 1
-- 33.2

-- List that contains lists that contains lists...
-- ghci> let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
-- ghci> b
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
-- ghci> b ++ [[1,1,1,1]]
-- [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3],[1,1,1,1]]
-- ghci> [6,6,6]:b
-- [[6,6,6],[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
-- ghci> b !! 2
-- [1,2,2,3,4]

-- Comparing lists
-- ghci> [3,2,1] > [2,1,0]
-- True
-- ghci> [3,2,1] > [2,10,100]
-- True
-- ghci> [3,4,2] > [3,4]
-- True
-- ghci> [3,4,2] > [2,4]
-- True
-- ghci> [3,4,2] == [3,4,2]
-- True

-- ********************** --
--     list functions     --
-- ********************** --

-- ********************** --
-- basic lists functions  --
-- the all produce an error with an empty list
-- can not be caught at compile time...

-- head -> returns the lists first element
-- ghci> head [5,4,3,2,1]
-- 5

-- tail -> return a list without its fist element
-- ghci> tail [5,4,3,2,1]
-- [4,3,2,1]

-- last -> returns the lists last element
-- ghci> last [5,4,3,2,1]
-- 1

-- init -> return a list without its last element
-- ghci> init [5,4,3,2,1]  
-- [5,4,3,2]
-- ********************** --
--    useful functions    --

-- length -> returns the length of an list
-- ghci> length [5,4,3,2,1]
-- 5

-- null -> checks of an list is empty
-- ghci> null [1,2,3]
-- False
-- ghci> null []
-- True

-- reverse -> returns the reverse of a list
-- ghci> reverse [5,4,3,2,1]
-- [1,2,3,4,5]

-- take -> takes number and a list => extracts number of elemetns form the list
-- ghci> take 3 [5,4,3,2,1]
-- [5,4,3]
-- ghci> take 1 [3,9,1]
-- [3]
-- ghci> take 5 [1,2]
-- [1,2]
-- ghci> take 0 [6,6,6]
-- []

-- drop -> takes number and a list => drops number of elemetns form the list
-- ghci> drop 3 [8,4,3,1,5,6]
-- [1,5,6]
-- ghci> drop 0 [1,2,3,4]
-- [1,2,3,4]
-- ghci> drop 100 [1,2,3,4]
-- []

-- maximum -> returns the biggest element
-- minimum -> returns the smallest element
-- ghci> minimum [8,4,2,1,5,6]
-- 1
-- ghci> maximum [1,9,2,3,4]
-- 9

-- sum -> returns the sum of all numbers of a list
-- product -> returns the product of all numbers of a list
-- ghci> sum [5,2,1,6,3,2,5,7]
-- 31
-- ghci> product [6,2,1,2]
-- 24
-- ghci> product [1,2,5,6,7,9,2,0]
-- 0

-- elem -> check if a thing is in a list of things
-- ghci> elem 4 [3,4,5,6]
-- True
-- ghci> elem 10 [3,4,5,6]
-- False
-- ghci> 4 `elem` [3,4,5,6]
-- True
-- ghci> 10 `elem` [3,4,5,6]
-- False

-- list ranges
-- normal
-- ghci> [1..20]
-- [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
-- ghci> ['a'..'z']
-- "abcdefghijklmnopqrstuvwxyz"
-- ghci> ['K'..'Z']
-- "KLMNOPQRSTUVWXYZ"

-- with special iteration
-- ghci> [2,4..20]
-- [2,4,6,8,10,12,14,16,18,20]
-- ghci> [3,6..20]
-- [3,6,9,12,15,18]

-- descending lists
-- ghci> [20..1]
-- []
-- ghci> [20,19..1]
-- [20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]

-- lists with floating points...
-- ghci> [0.1,0.3 .. 1]
-- [0.1,0.3,0.5,0.7,0.8999999999999999,1.0999999999999999]
-- ... get iffy ... so better do not use ranges with floating points

-- using ranges with infinite lists
-- ghci> take 24 [13,26..]
-- [13,26,39,52,65,78,91,104,117,130,143,156,169,182,195,208,221,234,247,260,273,286,299,312]

-- ********************** --
--   infinite list fun.   --

-- cycle -> cycles through a list and creates an infinite list
-- ghci> take 10 (cycle [1,2,3])
-- [1,2,3,1,2,3,1,2,3,1]
-- ghci> take 12 (cycle "LOL ")
-- "LOL LOL LOL "

-- repeat -> repeats and element indefinitely
-- ghci> take 10 (repeat 5)
-- [5,5,5,5,5,5,5,5,5,5]
-- using replicate instead of repeat to get n numbers of number m
-- replicate 3 10 = [10,10,10] = take 3 (repeat 10)

-- ********************** --
--   list comprehension   --
-- ********************** --

-- ghci> [x*2 | x <- [1..10]]
-- [2,4,6,8,10,12,14,16,18,20]

-- ghci> [x*2 | x <- [1..10], x*2 >= 12]
-- [12,14,16,18,20]

-- [ x | x <- [50..100], x `mod` 7 == 3]
-- [52,59,66,73,80,87,94]

-- comprehension inside of a function
boomBangs :: Integral a => [a] -> [String]
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
-- odd is an predicate that returns True if a number is odd, else False
-- outputs:
-- ghci> boomBangs [7..13]
-- ["BOOM!","BOOM!","BANG!","BANG!"]

-- using multiple predicates
-- ghci> [ x | x <- [10..20], x /= 13, x /= 15, x /= 19]
-- [10,11,12,14,16,17,18,20]
-- ghci> [ x*y | x <- [2,5,10], y <- [8,10,11]]
-- [16,20,22,40,50,55,80,100,110]
-- ghci> [ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]
-- [55,80,100,110]

-- list comprehensions
-- ghci> let nouns = ["hobo","frog","pope"]
-- ghci> let adjectives = ["lazy", "grouchy", "scheming"]
-- ghci> [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
-- ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog","grouchy pope","scheming hobo","scheming frog","scheming pope"]

-- out own version of length
length' :: Num a => [t] -> a
length' xs = sum[1 | _ <- xs]
-- the _ stand for something we do not care about

-- string function to remove all upercase chars...
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
-- output:
-- ghci> removeNonUppercase "Hahaha! Ahahaha!"
-- "HA"
-- ghci> removeNonUppercase "IdontLIKEFROGS"
-- "ILIKEFROGS"

-- ghci> let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
-- ghci> [ [ x | x <- xs, even x ] | xs <- xxs]
-- [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]

--------------------
--    TUPLES:     --
--------------------

-- ********************** --
--    tuple functions     --
-- ********************** --

-- fst -> takes a pair and returns it first component
-- ghci> fst (8,11)
-- 8
-- ghci> fst ("Wow", False)
-- "Wow"

-- snd -> takes a pair and returns it second component
-- ghci> snd (8,11)
-- 11
-- ghci> snd ("Wow", False)
-- False

-- zip -> takes two lists and zips then together to form tuples
-- ghci> zip [1,2,3,4,5] [5,5,5,5,5]
-- [(1,5),(2,5),(3,5),(4,5),(5,5)]
-- ghci> zip [1..5] ["one", "two", "three", "four", "five"]
-- [(1,"one"),(2,"two"),(3,"three"),(4,"four"),(5,"five")]
-- What happends when the length does not match up?
-- ghci> zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]
-- [(5,"im"),(3,"a"),(2,"turtle")]
-- zip [1..] ["apple", "orange", "cherry", "mango"]
-- [(1,"apple"),(2,"orange"),(3,"cherry"),(4,"mango")]

-- triangles
-- let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
-- only right triangles
-- ghci> let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]
-- only right triangle that have a perimeter of 24
-- ghci> let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ]
-- ghci> rightTriangles'
-- [(6,8,10)]