use <EbBoardHalf.scad>
use <EbDiskHalf.scad>
use <EbBackface.scad>
use <EbFrontface.scad>


// what to show

showFaces     = 30; // that's the distance from the box, 0 means "don't show"
showBoardHalf = true;
showDiskHalf  = false;

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

board_w        = 100;      // EspressoBIN board width (longer dimension)
board_d        =  72;      // EspressoBIN board depth (shorter dimension)
board_t        =   1.8;    // EspressoBIN board thickness (board only, not components)
board_power_dy =   3.25;   // how far the power connector sticks out from the edge of the board
board_ether_dy =   7.7;    // how far the Ethernet/USB connectors stick out from the edge of the board
boardEdge_hole_d = 3;      // distance between mounting holes and edge of board, all directions

fan_l = 25;
fan_w = 10;
fan_h = fan_l;

// key parameters (we can change those)

wall_t           = 1;                        // wall thickness
slidingFit_d     = 0.3;                      // distance between two surfaces so they slide against each other
independent_d    = 1;                        // distance between two surfaces so printing will not impact each other

littleStandoff_r = 3;                        // outside radius of the little standoff
littleStandoff_h = 2;                        // height of the little standoff
bigStandoff_r    = littleStandoff_r;         // outside radius of the big standoff
bigStandoff_h    = 38;                       // height of the big standoff
standoff_next_d  = independent_d;            // distance between a standoff and the next part

board_wall_d1    = board_power_dy - wall_t;  // distance between board and inside of wall on the sdcard side
board_wall_d2    = 40;                       // distance between board and wall on the fan side
board_wall_d3    = board_ether_dy - wall_t;  // distance between board and inside of wall on the Ethernet/USB side
board_wall_d4    = max( bigStandoff_r, littleStandoff_r ) + 2 * standoff_next_d;
                                             // distance between board and inside of wall on the side opposite the fan
board_wall_dz    = 7;

box_ri           = 2;

$fn=20;

// derived values (cannot change)

boardTop_z       = board_wall_dz + board_t;  // z coordinate of the top edge of the board  
box_wi           = board_w + board_wall_d2 + board_wall_d4;
                                             // box length on the inside
box_di           = board_d + board_wall_d1 + board_wall_d3;
                                             // box width on the inside
box_hi           = bigStandoff_h + littleStandoff_h;
                                             // box height on the inside

// model

if( showBoardHalf ) {
    EbBoardHalf(
            p_box_wi    = box_wi,
            p_box_di    = box_di,
            p_box_hi    = boardTop_z,
            p_box_ri    = box_ri,
            p_boxWall_t = wall_t );
}

if( showDiskHalf ) {
    EbDiskHalf();
}

if( showFaces > 0 ) {
    translate( [ board_wall_d4, -showFaces, boardTop_z ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbFrontface();
    }

    translate( [ box_wi - board_wall_d2, box_di + wall_t + showFaces, boardTop_z ])
    rotate( 180, [ 0, 0, 1 ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbBackface();
    }
}
