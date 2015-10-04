-- Homework 3.

import qualified Numeric.Probability.Distribution as P
import Control.Monad

data Neucleotide = A | T | C | G deriving (Show,Eq,Ord)

-- Type DNA is synonym for list of Neucleotides
type DNA = [ Neucleotide ]

neucleotide_dist :: P.T Double Neucleotide
neucleotide_dist = P.fromFreqs [(A, 0.5), (T, 0.25), (G,1/8), (C,1/8)]

-- Create a distribution of length 8 dna sequence when neucleotide distribution
-- is given.
dna_dist :: P.T Double DNA
dna_dist = replicateM 8 neucleotide_dist

entropy :: P.T Double a -> Double
entropy dist = sum $ map (\(a,x) -> - x * logBase 2 x) $ P.decons dist

main = do
    print $ dna_dist
    putStrLn "Done"
