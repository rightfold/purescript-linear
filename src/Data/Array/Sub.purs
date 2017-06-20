module Data.Array.Sub
  ( runSubArray
  , borrowArray
  ) where

import Control.Monad.Eff (Eff)
import Control.Monad.ST (ST)
import Data.Array.ST (STArray)
import Data.Function.Sub (Sub)

-- | Apply a function to the copy of an array.
foreign import runSubArray :: ∀ a b c. Sub c (Array a) b -> Array a -> b

-- | Apply a mutating operation, without copying the array.
foreign import borrowArray
  :: ∀ a c
   . (∀ s. STArray s a -> Eff (st :: ST s) (STArray s a))
  -> Sub c (Array a) (Array a)
