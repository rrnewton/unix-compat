{-|
This exports a subset of the functions from @System.Posix.Unistd@ on all platforms.
-}
module System.PosixCompat.Unistd (
    sleep
  ) where

#ifdef UNIX_IMPL

import System.Posix.Unistd

#else
-- TODO: Is it safe to assume non-unix means windows?  Or should there
-- be another preprocessor variable for Windows?

import qualified System.Win32.Process as Win

sleep :: Int -> IO Int
sleep n = 
 do Win.sleep (fromIntegral n)
    -- Under windows we can't tell if the sleep was interrupted.
    -- (Can it be interrupted?  I have no idea.)
    return 0

#endif
