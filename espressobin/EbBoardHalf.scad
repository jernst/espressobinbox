use <../lib/FanHolder.scad>
use <../lib/HalfBox.scad>
use <../lib/Standoff.scad>
use <Spacer.scad>

module EbBoardHalf()
{
    boardStandoffs = [
        [ $board_wall_d4 + $boardEdge_hole_d, $board_wall_d3 + $boardEdge_hole_d, 0 ],
        [ $board_wall_d4 + $board_w - $boardEdge_hole_d, $board_wall_d3 + $boardEdge_hole_d, 0 ],
        [ $board_wall_d4 + $boardEdge_hole_d, $board_wall_d3 + $board_d - $boardEdge_hole_d, 0 ],
        [ $board_wall_d4 + $board_w - $boardEdge_hole_d, $board_wall_d3 + $board_d - $boardEdge_hole_d, 0 ]
    ];
    littleStandoffs = [
        [ $standoff_next_d + $bigStandoff_r, $standoff_next_d + $bigStandoff_r ],
        [ $standoff_next_d + $bigStandoff_r, $box_di - ( $standoff_next_d + $bigStandoff_r ) ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $standoff_next_d + $bigStandoff_r ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $box_di - ( $standoff_next_d + $bigStandoff_r ) ]
    ];
    bigStandoffs = [
        [ $standoff_next_d + $bigStandoff_r, 2*$standoff_next_d + 3*$bigStandoff_r ],
        [ $standoff_next_d + $bigStandoff_r, $box_di - ( 2*$standoff_next_d + 3*$bigStandoff_r ) ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), 2*$standoff_next_d + 3*$bigStandoff_r ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $box_di - ( 2*$standoff_next_d + 3*$bigStandoff_r ) ]
    ];

    union() {
        // Half box with cutouts
        difference() {
            HalfBox(
                    p_width_i  = $box_wi,
                    p_depth_i  = $box_di,
                    p_height_i = $boardTop_z,
                    p_radius_i = $box_ri,
                    p_wall_t   = $wall_t );

            translate( [ $board_wall_d4, $box_di + 2* $wall_t, $boardTop_z ] )
            rotate( 90, [ 1, 0, 0 ])
            linear_extrude( 3*$wall_t ) {
                // SD Card
                translate( [ $board_sdcard_dy - $sdCardCutout_w/2, - $board_t - $sdCardCutout_h ]) {
                    square( [ $sdCardCutout_w, $sdCardCutout_h + $board_t] ); // cannot close above
                }

            }
        }

        // standoffs for the board
        for( p = boardStandoffs ) {
            translate( p ) {
                Standoff(
                        height     = $boardStandoff_h,
                        radius     = $boardStandoff_r,
                        holeDepth  = $boardStandoff_h,
                        holeRadius = $m3CutHole_r );
            }
        }

        // fan holder, board half
        translate( [ $box_wi - $fanHolder_t - $independent_d , $box_di/2 - $fan_l/2, 0 ])
        rotate( 90, [ 0, 0, 1 ] ) {
            FanHolder(
                    fanDx     = $fan_l,
                    fanDy     = $fan_w,
                    holder_h  = $box_hi / 2 - $fan_h / 2 - $slidingFit_d + $fan_h / 4,
                    offset_z  = $box_hi / 2 - $fan_h / 2 - $slidingFit_d,
                    thickness = $fanHolder_t );
        }

        // other standoffs
        for( p = littleStandoffs ) {
            translate( p ) {
                Standoff(
                        height     = $littleStandoff_h,
                        radius     = $littleStandoff_r,
                        holeDepth  = $littleStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }
        for( p = bigStandoffs ) {
            translate( p ) {
                Standoff(
                        height     = $bigStandoff_h,
                        radius     = $bigStandoff_r,
                        holeDepth  = $bigStandoff_h,
                        holeRadius = $m3CutHole_r );
            }
        }

        // spacers 
        frontSpacers_x = [ 7, 15, 28, 91, 110, 127, $box_wi - 7 - $spacer_w ];
        backSpacers_x  = [ 7,                  127, $box_wi - 7 - $spacer_w ];
        leftSpacers_y  = [ 7, ($box_di - $spacer_w) / 2, $box_di - 7 - $spacer_w ];
        rightSpacers_y = [ 7, $box_di - 7 - $spacer_w ];

        for( frontSpacer_x = frontSpacers_x ) {
            translate( [ frontSpacer_x, 0, $board_wall_dz ] ) {
                Spacer( w       = $spacer_w,
                        d       = $spacer_d,
                        hAbove  = $spacer_dzabove,
                        hBelow  = $spacer_dzbelow );
            }
        }
        for( backSpacer_x = backSpacers_x ) {        
            translate( [ backSpacer_x + $spacer_w, $box_di, $board_wall_dz ] )
            rotate( 180, [ 0, 0, 1 ] ) {
                Spacer( w       = $spacer_w,
                        d       = $spacer_d,
                        hAbove  = $spacer_dzabove,
                        hBelow  = $spacer_dzbelow );
            }
        }
        for( leftSpacer_y = leftSpacers_y ) {
            translate( [ 0, leftSpacer_y + $spacer_w, $board_wall_dz ] )
            rotate( -90, [ 0, 0, 1 ] ) {
                Spacer( w       = $spacer_w,
                        d       = $spacer_d,
                        hAbove  = $spacer_dzabove,
                        hBelow  = $spacer_dzbelow );
            }
        }
        for( rightSpacer_y = rightSpacers_y ) {
            translate( [ $box_wi, rightSpacer_y, $board_wall_dz ] )
            rotate( 90, [ 0, 0, 1 ] ) {
                Spacer( w       = $spacer_w,
                        d       = $spacer_d,
                        hAbove  = $spacer_dzabove,
                        hBelow  = $spacer_dzbelow );
            }
        }
    }
}
