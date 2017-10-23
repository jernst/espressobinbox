use <../lib/HalfBox.scad>
use <../lib/Standoff.scad>

module EbDiskHalf()
{
    diskStandoffs = [
        [ $diskHole1_x,                 $diskHole1_y ],
        [ $diskHole1_x + $diskHoles_dx, $diskHole1_y ],
        [ $diskHole1_x,                 $diskHole1_y + $diskHoles_dy ],
        [ $diskHole1_x + $diskHoles_dx, $diskHole1_y + $diskHoles_dy ]
    ];

    littleStandoffDz = $box_hi - $littleStandoff_h;

    littleStandoffs = [
        [ $standoff_next_d + $bigStandoff_r, $standoff_next_d + $bigStandoff_r, littleStandoffDz ],
        [ $standoff_next_d + $bigStandoff_r, $box_di - ( $standoff_next_d + $bigStandoff_r ), littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $standoff_next_d + $bigStandoff_r, littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $box_di - ( $standoff_next_d + $bigStandoff_r ), littleStandoffDz ],
        [ $standoff_next_d + $bigStandoff_r, 2*$standoff_next_d + 3*$bigStandoff_r, littleStandoffDz ],
        [ $standoff_next_d + $bigStandoff_r, $box_di - ( 2*$standoff_next_d + 3*$bigStandoff_r ), littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), 2*$standoff_next_d + 3*$bigStandoff_r, littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $box_di - ( 2*$standoff_next_d + 3*$bigStandoff_r ), littleStandoffDz ]
    ];

    union() {
        difference() {
            translate( [ 0, 0, $box_hi ])
            mirror( [ 0, 0, 1 ] ) {
                HalfBox(
                        p_width_i  = $box_wi,
                        p_depth_i  = $box_di,
                        p_height_i = $box_hi - $boardTop_z,
                        p_radius_i = $box_ri,
                        p_wall_t   = $wall_t );
            }

            // make room for the DiskStandoffs that have through-holes
            translate( [ 0, 0, $box_hi-$wall_t ] )
            linear_extrude( 3*$wall_t ) {
                for( p = diskStandoffs ) {
                    translate( p ) {
                        circle( ( $diskStandoff_r + $m3ThroughHole_r ) / 2 );
                    }
                }
            }

            // cut out openings in walls


        }
        
        for( p = diskStandoffs ) {
            translate( [ p[0], p[1], $box_hi + $wall_t - $diskStandoff_h ] ) {
                Standoff(
                        height     = $diskStandoff_h,
                        radius     = $diskStandoff_r,
                        holeDepth  = $diskStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }
        for( p = littleStandoffs ) {
            translate( p ) {
                Standoff(
                        height     = $littleStandoff_h,
                        radius     = $littleStandoff_r,
                        holeDepth  = $littleStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }
    }
}
