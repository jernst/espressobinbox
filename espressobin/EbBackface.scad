// The back of the EspressoBIN board

module EbBackface() {
    extrudeBy = 2;

    difference() {
        translate( [ 0, -5, 0 ] ) { // goes below board
            cube( [ 100, 15+5, extrudeBy ]);
        }

        // from left to right
        // power
        translate( [ 6, 0, 0 ]) {
            cube( [ 9, 11, extrudeBy ] );
        }

        // USB power
        translate( [ 32, 0, 0 ]) {
            cube( [ 9, 3, extrudeBy ] );
        }
        // SDCard
        translate( [ 31, -1 - 1.7 , 0 ]) {
            cube( [ 11, 1, extrudeBy ] );
        }

        // Reset
        translate( [ 87, 1, 0 ]) {
            cube( [ 3, 2, extrudeBy ] );
        }
    }
}
    
    

    
