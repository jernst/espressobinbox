include <../lib/Standoff.scad>

module EbBoardStandoff()
{
    Standoff(
            height     = $boardStandoff_h,
            radius     = $boardStandoff_r,
            holeDepth  = $boardStandoff_h,
            holeRadius = $m3CutHole_r );
}
