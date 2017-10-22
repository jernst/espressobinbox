// these are outside dimensions

module RoundedSquare(
        p_width,
        p_height,
        p_radius )
{
    union () {
        translate( [ 0, p_radius ] ) {
            square( [ p_width, p_height - 2*p_radius ] );
        }

        translate( [ p_radius, 0 ] ) {
            square( [ p_width - 2*p_radius, p_height ] );
        }

        translate( [ p_radius, p_radius ] ) {
            circle( r = p_radius );
        }

        translate( [ p_width - p_radius, p_radius ] ) {
            circle( r = p_radius );
        }
        translate( [ p_radius, p_height - p_radius ] ) {
            circle( r = p_radius );
        }
        translate( [ p_width - p_radius, p_height - p_radius ] ) {
            circle( r = p_radius );
        }
    }
}
