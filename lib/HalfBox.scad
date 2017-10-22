// Half a box, bottom/ceiling at the bottom, [0,0,0] just inside

use <RoundedSquare.scad>

module HalfBox(
    p_width_i,
    p_depth_i,
    p_height_i,
    p_radius_i,
    p_wall_t )
{
    union() {
        // bottom plate
        translate( [ -p_wall_t, -p_wall_t, -p_wall_t ] ) {
            linear_extrude( p_wall_t ) {
                RoundedSquare(
                        p_width  = p_width_i + 2*p_wall_t,
                        p_height = p_depth_i + 2*p_wall_t,
                        p_radius = p_radius_i + p_wall_t );
            }
        }

        // walls -- overlapping the bottom plate
        translate( [ -p_wall_t, -p_wall_t, -p_wall_t ] ) {
            linear_extrude( p_height_i + p_wall_t ) {
                difference() {
                    RoundedSquare(
                            p_width  = p_width_i + 2*p_wall_t,
                            p_height = p_depth_i + 2*p_wall_t,
                            p_radius = p_radius_i + p_wall_t );
                    translate( [ p_wall_t, p_wall_t ] ) {
                        RoundedSquare(
                                p_width  = p_width_i,
                                p_height = p_depth_i,
                                p_radius = p_radius_i );
                    }
                }
            }
        }
    }
}
