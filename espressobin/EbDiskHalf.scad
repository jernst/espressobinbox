use <../lib/HalfBox.scad>
use <DiskStandoff.scad>

module EbDiskHalf(
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


            // Logo
            translate( [ 10, 10, standoffHeight + diskHeight + 1.75 - 0.5 ])
            linear_extrude( height=0.5 ) {
                text( text="IndieBox Espresso", size=10, font="Liberation Sans" );
            }
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
