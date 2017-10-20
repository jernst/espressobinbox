use <EbStandoff.scad>
use <../lib/FanHolder.scad>
use <../lib/HalfBox.scad>

module EbBottom(
        boxWidth_i,
        boxDepth_i,
        standoffHeight,
        wallThickness )
{
    union() {
        difference() {
            HalfBox( boxWidth_i, boxDepth_i, standoffHeight+1.7, wallThickness );

            // cut out openings in walls
            // SD Card
            translate( [ 100, boxDepth_i-wallThickness, standoffHeight ] )
            rotate( 180, [ 0, 0, 1 ])
            rotate( 90, [ 1, 0, 0 ])
            translate( [ 31, -1  , 0 ]) {
                cube( [ 13, 3, 3*wallThickness ] );
            }
        }

        translate( [ 4, 3, 0 ] ) {
            EbStandoff( standoffHeight );
        }
        translate( [ 4+94, 3, 0 ] ) {
            EbStandoff( standoffHeight );
        }
        translate( [ 4, 3+66, 0 ] ) {
            EbStandoff( standoffHeight );
        }
        translate( [ 4+94, 3+66, 0 ] ) {
            EbStandoff( standoffHeight );
        }

        translate( [boxWidth_i, boxDepth_i/2-25/2, 0 ]) {
            mirror( [1, 0, 0 ] ) {
                FanHolder( 25, 25, 10 );
            }
        }
    }
}
