// The back of the EspressoBIN board

module EbBackface() {
    // from left to right
    // power
    translate( [ 6, 0 ]) {
        square( [ 9, 11 ] );
    }

    // USB power
    translate( [ 32, 0 ]) {
        square( [ 9, 3 ] );
    }
    // SDCard
    translate( [ 31, -2 - $board_t ]) {
        square( [ 11, 1 ] );
    }

    // Reset
    translate( [ 87, 1 ]) {
        square( [ 3, 2 ] );
    }
}
    
    

    
