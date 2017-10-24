// The front of the EspressoBIN board

module EbFrontface() {
    // from left to right
    // USB
    translate( [ 8, 0 ]) {
        square( [ 6, 14 ] );
    }

    // Ethernet
    translate( [ 21, 0 ]) {
        square( [ 17, 14 ] );
    }
    translate( [ 40, 0 ]) {
        square( [ 17, 14 ] );
    }
    translate( [ 58, 0 ]) {
        square( [ 17, 14 ] );
    }

    // USB 3
    translate( [ 85, 0 ]) {
        square( [ 6, 14 ] );
    }
}
