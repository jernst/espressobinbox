// The front of the EspressoBIN board

module EbFrontface() {
    extrudeBy = 2;

    difference() {
        cube( [ 100, 15, extrudeBy ]);

        // from left to right
        // USB
        translate( [ 8, 0, 0 ]) {
            cube( [ 6, 14, extrudeBy ] );
        }

        // Ethernet
        translate( [ 21, 0, 0 ]) {
            cube( [ 17, 14, extrudeBy ] );
        }
        translate( [ 40, 0, 0 ]) {
            cube( [ 17, 14, extrudeBy ] );
        }
        translate( [ 58, 0, 0 ]) {
            cube( [ 17, 14, extrudeBy ] );
        }

        // USB 3
        translate( [ 85, 0, 0 ]) {
            cube( [ 6, 14, extrudeBy ] );
        }
    }
}
