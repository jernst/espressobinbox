include <../lib/BoreStandoff.scad>

module DiskStandoff(
        standoffHeight,
        standoffRadius )
{
    BoreStandoff( standoffHeight, standoffRadius, 2, 2, 1 );
}
