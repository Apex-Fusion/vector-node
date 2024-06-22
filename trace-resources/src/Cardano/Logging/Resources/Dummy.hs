module Cardano.Logging.Resources.Dummy
    (
      readResourceStatsInternal
    ) where

import           Cardano.Logging.Resources.Types

import           Data.Word
import qualified GHC.Stats as GhcStats
import           System.CPUTime


readResourceStatsInternal :: IO (Maybe ResourceStats)
readResourceStatsInternal = do
  cpu <- getCPUTime
  rts <- GhcStats.getRTSStats
  pure $ Just $
    Resources
    { rCentiCpu   = intToCenti cpu
    , rCentiGC    = nsToCenti $ GhcStats.gc_cpu_ns rts
    , rCentiMut   = nsToCenti $ GhcStats.mutator_cpu_ns rts
    , rGcsMajor   = fromIntegral $ GhcStats.major_gcs rts
    , rGcsMinor   = fromIntegral $ GhcStats.gcs rts - GhcStats.major_gcs rts
    , rAlloc      = GhcStats.allocated_bytes rts
    , rLive       = GhcStats.gcdetails_live_bytes $ GhcStats.gc rts
    , rRSS        = 0
    , rHeap       = 0
    , rCentiBlkIO = 0
    , rNetRd      = 0
    , rNetWr      = 0
    , rFsRd       = 0
    , rFsWr       = 0
    , rThreads    = 0
    }
 where
   nsToCenti :: GhcStats.RtsTime -> Word64
   nsToCenti = fromIntegral . (`div` 10000000)
   intToCenti :: Integer -> Word64
   intToCenti = fromIntegral . (`div` 10000000)
