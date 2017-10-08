// A bunch of VentilationHole
use <VentilationHole.scad>

module VentilationHoles(
        partWidth,
        partDepth,
        partHeight,
        nrows,
        ncols,
        holepercent = 0.8,
        angle = 40 )
{
    holeWidth   = ( partWidth * holepercent ) / ( ncols -1 + holepercent );
    deltax      = holeWidth / holepercent;
    bridgeWidth = deltax - holeWidth;
    
    dy1 = deltax / ( 2 * tan( angle ));  // y distance from bottom corner of the upper Hole to where
                                         // extension of slide hits the center of the horizontal bridge
                                         // from lower shape hits upper shape's horizontal center
    dy2 = bridgeWidth / ( sin( angle )); // y distance from the previous destination to the top corner
                                         // of the lower Hole, given the desired diagonal bridge width

    displacementy = dy1 - dy2;

    deltay      = ( partDepth - displacementy ) / nrows;
    holeHeight  = deltay + displacementy;

    for( row=[0:nrows-1] ) {
        if( row % 2 == 0 ) {
            for( col=[0:ncols-1] ) {
                translate( [ col * deltax, row * deltay, 0 ] ) {
                    VentilationHole( holeWidth, holeHeight, partHeight, angle );
                }
            }
        } else {
            for( col=[0:ncols-2] ) {
                translate( [ col * deltax + deltax/2, row * deltay, 0 ] ) {
                    VentilationHole( holeWidth, holeHeight, partHeight, angle );
                }
            }
        }
    }
}
