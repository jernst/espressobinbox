module RoundedSquare(
        width_i,
        depth_i,
        radius )
{
    union () {
        translate( [ -radius, 0 ] ) {
            square( [ width_i+2*radius, depth_i ] );
        }

        translate( [ 0, -radius ] ) {
            square( [ width_i, depth_i+2*radius ] );
        }

        circle( r=radius );

        translate( [ width_i, 0 ] ) {
            circle( r=radius );
        }
        translate( [ 0, depth_i ] ) {
            circle( r=radius );
        }
        translate( [ width_i, depth_i ] ) {
            circle( r=radius );
        }
    }
}
