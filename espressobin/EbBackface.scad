// The back of the EspressoBIN board

module EbBackface() {
    extrudeBy = 2;

    difference() {
        translate( [ 0, -5, 0 ] ) { // goes below board
            cube( [ 100, 15+5, extrudeBy ]);
        }

        // from left to right
        // power
        translate( [ 6, 0, -extrudeBy ]) {
            cube( [ 9, 11, extrudeBy*2 ] );
        }

        // USB power
        translate( [ 32, 0, -extrudeBy ]) {
            cube( [ 9, 3, extrudeBy*2 ] );
        }
        // SDCard
        translate( [ 31, -1 - 1.7, -extrudeBy ]) {
            cube( [ 11, 1, extrudeBy*2 ] );
        }

        // Reset
        translate( [ 87, 1, -extrudeBy ]) {
            cube( [ 3, 2, extrudeBy*2 ] );
        }
    }
}
    
    

    
