use <EbStandoff.scad>
use <../lib/FanHolder.scad>
use <../lib/HalfBox.scad>

module EbBoardHalf(
        p_box_wi,
        p_box_di,
        p_box_hi,
        p_box_ri,
        p_boxWall_t,
        p_board_wi,
        p_board_di,
        p_board_wall_d3,
        p_board_wall_d4,
        p_boardEdge_hole_d )
{
    union() {
        // Half box with cutouts
//        difference() {
            HalfBox(
                    p_width_i  = p_box_wi,
                    p_depth_i  = p_box_di,
                    p_height_i = p_box_hi,
                    p_radius_i = p_box_ri,
                    p_wall_t   = p_boxWall_t );


//            // cut out openings in walls
//            // SD Card
//            translate( [ 100, boxDepth_i-wallThickness, standoffHeight ] )
//            rotate( 180, [ 0, 0, 1 ])
//            rotate( 90, [ 1, 0, 0 ])
//            translate( [ 31, -1  , 0 ]) {
//                cube( [ 13, 3, 3*wallThickness ] );
//            }
//        }

        // standoffs for the board

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

        // fan holder
        translate( [boxWidth_i, boxDepth_i/2-25/2, 0 ]) {
            mirror( [1, 0, 0 ] ) {
                FanHolder( 25, 25, 10 );
            }
        }
   }
}
