use <../lib/HalfBox.scad>
use <DiskStandoff.scad>

module EbTop(
        boxWidth_i,
        boxDepth_i,
        standoffHeight,
        diskHeight,
        wallThickness )
{
    standoffRadius = 3;

    union() {
        difference() {
            HalfBox( boxWidth_i, boxDepth_i, standoffHeight+diskHeight, wallThickness );

            // make room for the DiskStandoffs that have through-holes
            translate( [ 4, 3, -wallThickness ] ) {
                cylinder( standoffHeight+wallThickness, standoffRadius, standoffRadius );
            }
            translate( [ 4+94, 3, -wallThickness ] ) {
                cylinder( standoffHeight+wallThickness, standoffRadius, standoffRadius );
            }
            translate( [ 4, 3+66, -wallThickness ] ) {
                cylinder( standoffHeight+wallThickness, standoffRadius, standoffRadius );
            }
            translate( [ 4+94, 3+66, -wallThickness ] ) {
                cylinder( standoffHeight+wallThickness, standoffRadius, standoffRadius );
            }

            // cut out openings in walls
            
        }
        
        translate( [ 4, 3, 0 ] ) {
            DiskStandoff( standoffHeight, standoffRadius );
        }
        translate( [ 4+94, 3, 0 ] ) {
            DiskStandoff( standoffHeight, standoffRadius );
        }
        translate( [ 4, 3+66, 0 ] ) {
            DiskStandoff( standoffHeight, standoffRadius );
        }
        translate( [ 4+94, 3+66, 0 ] ) {
            DiskStandoff( standoffHeight, standoffRadius );
        }
    }
}
