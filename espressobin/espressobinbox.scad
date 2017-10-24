use <EbBoardHalf.scad>
use <EbDiskHalf.scad>
use <EbBackface.scad>
use <EbFrontface.scad>


// what to show

showFaces     = -1; // 40; // that's the distance from the box, -1 means "don't show"
showBoardHalf = false;
showDiskHalf  = 50; // that's the distance the top half is raised, -1 means "don't show"
showFan       = 50;

// xxx_l:      length of xxx
// xxx_li:     length of xxx on the inside
// xxx_lo:     length of xxx on the outside
// xxx_w:      width of xxx
// xxx_h:      height of xxx
// xxx_t:      thickness of xxx
// xxx_r:      radius of xxx
// xxx_yyy_d:  distance between xxx and yyy
// xxx_yyy_dy: distance between xxx and yyy along the y axis
//
// Origin is just on the inside of the box bottom-left

// key measurements (we cannot do anyhthing about that)

$board_w          = 100;      // EspressoBIN board width (longer dimension)
$board_d          =  72;      // EspressoBIN board depth (shorter dimension)
$board_t          =   1.8;    // EspressoBIN board thickness (board only, not components)
$board_power_dy   =   3.25;   // how far the power connector sticks out from the edge of the board
$board_ether_dy   =   7.7;    // how far the Ethernet/USB connectors stick out from the edge of the board
$boardEdge_hole_d =   3;      // distance between mounting holes and edge of board, all directions
$board_sdcard_dy  =  64;      // distance from start of board to location of SD card cutout center, along Y

$diskHoles_dx     =  77;      // distance between the screw holes on the disk along X
$diskHoles_dy     =  62;      // distance between the screw holes on the disk along Y

$fan_l            = 25;       // fan
$fan_w            = 10;       // fan
$fan_h            = $fan_l;   // fan

$sdCardCutout_w   = 11+2;     // width of the cutout for the SDCard
$sdCardCutout_h   = 2+2;      // height of the cutout for the SDCard

$powerCutout_w    = 9+2;      // width of the cutout for the power connector
$powerCutout_h    = 11+1;     // height of the cutout for the power connector

$m3ThroughHole_r  = 3.6/2;    // hole radius to fit M3 screws through
$m3CutHole_r      = 3/2*0.8;  // radius of hole into which self-cutting M3 scews cut into
                              // 0.8 comes from http://www.stanleyengineeredfastening.com/sites/www.emhartamericas.com/files/downloads/Threaded_Fasteners_for_Plastics_EN.pdf

// key parameters (we can change those)

$wall_t           = 1;                          // wall thickness
$slidingFit_d     = 0.3;                        // distance between two surfaces so they slide against each other
$independent_d    = 1;                          // distance between two surfaces so printing will not impact each other

$board_wall_dz    = 5;                          // distance between bottom of board and bottom of the board half box
$disk_wall_dz     = 5;                          // distance between bottom of disk and bottom of disk half box
$box_ri           = 2;                          // inside curve radius of the box's corners

$littleStandoff_r = 4;                          // outside radius of the little standoffs
$littleStandoff_h = 2;                          // height of the little standoffs
$bigStandoff_r    = $littleStandoff_r;          // outside radius of the big standoffs
$bigStandoff_h    = 38;                         // height of the big standoffs
$boardStandoff_r  = $littleStandoff_r;          // outside radius of the board standoffs
$boardStandoff_h  = $board_wall_dz;             // height of the board standoffs
$diskStandoff_r   = $littleStandoff_r;          // outside radius of the disk standoffs
$diskStandoff_h   = $disk_wall_dz;              // height of the disk standoffs
$standoff_next_d  = $independent_d;             // distance between a standoff and the next part

$board_wall_d1    = $board_power_dy - $wall_t;  // distance between board and inside of wall on the sdcard side
$board_wall_d2    = 40;                         // distance between board and wall on the fan side
$board_wall_d3    = $board_ether_dy - $wall_t;  // distance between board and inside of wall on the Ethernet/USB side
$board_wall_d4    = max( 2*$bigStandoff_r, 2*$littleStandoff_r ) + 2 * $standoff_next_d;
                                                // distance between board and inside of wall on the side opposite the fan

$diskHole1_x      = 15;                         // x coordinate of the bottom-left disk hole

$fanHolder_t      = 1.5;                        // thickness of the braces that constitute the fan holder

$fn=20;

// derived values (cannot change)

$boardTop_z       = $board_wall_dz + $board_t;  // z coordinate of the top edge of the board  
$box_wi           = $board_w + $board_wall_d2 + $board_wall_d4;
                                                // box length on the inside
$box_di           = $board_d + $board_wall_d1 + $board_wall_d3;
                                                // box width on the inside
$box_hi           = $bigStandoff_h + $littleStandoff_h;
                                                // box height on the inside

$diskHole1_y      = ( $box_di - $diskHoles_dy ) / 2;
                                                // y coordinate of the bottom-left disk hole


// model

if( showBoardHalf ) {
    EbBoardHalf();
}

if( showDiskHalf >=0 ) {
    translate( [ 0, 0, showDiskHalf ] ) {
        EbDiskHalf();
    }
}

if( showFaces > 0 ) {
    translate( [ $board_wall_d4, -showFaces, $boardTop_z ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbFrontface();
    }
    translate( [ $box_wi - $board_wall_d2, $box_di + $wall_t + showFaces, $boardTop_z ])
    rotate( 180, [ 0, 0, 1 ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbBackface();
    }
}

if( showFan > 0 ) {
    translate( [ $box_wi + $wall_t + showFan, $box_di / 2 - $fan_l / 2, $box_hi/2 - $fan_h/2 ] ) {
        cube( [ $fan_w, $fan_l, $fan_h ]);
    }
}
