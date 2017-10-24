use <../lib/FanHolder.scad>
use <../lib/HalfBox.scad>
use <../lib/Standoff.scad>
use <../lib/VentilationHoles.scad>

module EbDiskHalf()
{
    diskStandoffs = [
        [ $diskHole1_x,                 $diskHole1_y ],
        [ $diskHole1_x + $diskHoles_dx, $diskHole1_y ],
        [ $diskHole1_x,                 $diskHole1_y + $diskHoles_dy ],
        [ $diskHole1_x + $diskHoles_dx, $diskHole1_y + $diskHoles_dy ]
    ];

    littleStandoffDz = $box_hi - $littleStandoff_h;

    littleStandoffsNotThrough = [
        [ $standoff_next_d + $bigStandoff_r, $standoff_next_d + $bigStandoff_r, littleStandoffDz ],
        [ $standoff_next_d + $bigStandoff_r, $box_di - ( $standoff_next_d + $bigStandoff_r ), littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $standoff_next_d + $bigStandoff_r, littleStandoffDz ],
        [ $box_wi - ( $standoff_next_d + $bigStandoff_r ), $box_di - ( $standoff_next_d + $bigStandoff_r ), littleStandoffDz ]
    ];
    littleStandoffsThrough = [
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
                for( p = littleStandoffsThrough ) {
                    translate( p ) {
                        circle( ( $littleStandoff_r + $m3ThroughHole_r ) / 2 );
                    }
                }
            }

            // cut out openings in walls for ports


            // ventilation -- fan side

            translate( [ $box_wi - $wall_t,  $box_di/2 - $fan_l/2, $box_hi / 2 - $fan_h / 2 ] )
            rotate( 90, [ 0, 0, 1 ] )
            rotate( 90, [ 1, 0, 0 ] )
            linear_extrude( 3 * $wall_t ) {
                VentilationHoles(
                        partWidth   = $fan_l,
                        partHeight  = $fan_l,
                        nrows       = 3,
                        ncols       = 10,
                        holepercent = .6 );
            }

            // ventilation -- opposite of fan

            translate( [ -2 * $wall_t, ( $box_di - 2*$fan_l ) / 3, $box_hi / 2 - $fan_h / 2 ] )
            rotate( 90, [ 0, 0, 1 ] )
            rotate( 90, [ 1, 0, 0 ] )
            linear_extrude( 3 * $wall_t ) {
                VentilationHoles(
                        partWidth   = $fan_l,
                        partHeight  = $fan_l,
                        nrows       = 3,
                        ncols       = 10,
                        holepercent = .6 );
            }

            translate( [ -2 * $wall_t,  2*$box_di/3 - $fan_l/3, $box_hi / 2 - $fan_h / 2 ] )
            rotate( 90, [ 0, 0, 1 ] )
            rotate( 90, [ 1, 0, 0 ] )
            linear_extrude( 3 * $wall_t ) {
                VentilationHoles(
                        partWidth   = $fan_l,
                        partHeight  = $fan_l,
                        nrows       = 3,
                        ncols       = 10,
                        holepercent = .6 );
            }

        }

        // standoffs
        for( p = diskStandoffs ) {
            translate( [ p[0], p[1], $box_hi + $wall_t - $diskStandoff_h ] ) {
                Standoff(
                        height     = $diskStandoff_h,
                        radius     = $diskStandoff_r,
                        holeDepth  = $diskStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }
        for( p = littleStandoffsNotThrough ) {
            translate( p ) {
                Standoff(
                        height     = $littleStandoff_h,
                        radius     = $littleStandoff_r,
                        holeDepth  = $littleStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }
        for( p = littleStandoffsThrough ) {
            translate( p ) {
                Standoff(
                        height     = $littleStandoff_h + $wall_t,
                        radius     = $littleStandoff_r,
                        holeDepth  = $littleStandoff_h,
                        holeRadius = $m3ThroughHole_r );
            }
        }

        // fan holder

        translate( [ $box_wi - $fanHolder_t - $independent_d , $box_di/2 + $fan_l/2, $box_hi ])
        rotate( 180, [ 1, 0, 0 ] )
        rotate( 90, [ 0, 0, 1 ] ) {
            FanHolder(
                    fanDx     = $fan_l,
                    fanDy     = $fan_w,
                    holder_h  = $box_hi / 2 - $fan_h / 2 - $slidingFit_d + $fan_h / 4,
                    offset_z  = $box_hi / 2 - $fan_h / 2 - $slidingFit_d,
                    thickness = $fanHolder_t );
        }
    }
}
