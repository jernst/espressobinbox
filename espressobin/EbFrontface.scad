// The front of the EspressoBIN board

module EbFrontface() {
    extrudeBy = 2;

    difference() {
        cube( [ 100, 15, extrudeBy ]);

        // from left to right
        // USB
        translate( [ 8, 0, -extrudeBy ]) {
            cube( [ 6, 14, extrudeBy*2 ] );
        }

        // Ethernet
        translate( [ 21, 0, -extrudeBy ]) {
            cube( [ 17, 14, extrudeBy*2 ] );
        }
        translate( [ 40, 0, -extrudeBy ]) {
            cube( [ 17, 14, extrudeBy*2 ] );
        }
        translate( [ 58, 0, -extrudeBy ]) {
            cube( [ 17, 14, extrudeBy*2 ] );
        }

        // USB 3
        translate( [ 85, 0, -extrudeBy ]) {
            cube( [ 6, 14, extrudeBy*2 ] );
        }
    }
}
