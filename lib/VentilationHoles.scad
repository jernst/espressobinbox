// A bunch of 2D VentilationHole(s). They are arranged between
// [0, 0] and [partWidth, partHeight] in nrows rows, and ncols columns,
// where holes take up about holepercent of the X dimension. The percentage
// of holes in the Y dimension is constructed to the bridges between the
// holes have the same width.


use <VentilationHole.scad>

module VentilationHoles(
        partWidth,
        partHeight,
        nrows,
        ncols,
        holepercent = 0.8,
        angle       = 40 )
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

    deltay      = ( partHeight - displacementy ) / nrows;
    holeHeight  = deltay + displacementy;

    for( row=[0:nrows-1] ) {
        if( row % 2 == 0 ) {
            for( col=[0:ncols-1] ) {

                translate( [ col * deltax, row * deltay, 0 ] ) {
                    VentilationHole(
                            partWidth  = holeWidth,
                            partHeight = holeHeight,
                            angle      = angle );
                }
            }
        } else {
            for( col=[0:ncols-2] ) {
                translate( [ col * deltax + deltax/2, row * deltay, 0 ] ) {
                    VentilationHole(
                            partWidth  = holeWidth,
                            partHeight = holeHeight,
                            angle      = angle );
                }
            }
        }
    }
}
