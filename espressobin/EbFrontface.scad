// The front of the EspressoBIN board

module EbFrontface() {
    // from left to right
    // USB
    translate( [ 7.5, 0 ]) {
        square( [ 7, 14 ] );
    }

    // Ethernet
    translate( [ 21, 0 ]) {
        square( [ 54, 14 ] );
    }

    // USB 3
    translate( [ 84.5, 0 ]) {
        square( [ 7, 14 ] );
    }
}
