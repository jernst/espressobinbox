// Can hold a computer fan in space [0, 0, 0] to [fanDx, fanDy, fanDz],
// where a wall with air slots is assumed to be in the yz-plane
// so a 25x25x10 fan would be FanHolder( 25, 10, 25 )
// Par thickness is the thickness of the holder being generated,
// while width is how much of the fan's sides are being covered

module FanHolder(
        fanDx,
        fanDy,
        fanDz,
        thickness = 1.5,
        width     = 2 )
{
    difference() {
        union() {
            translate( [ -thickness, fanDy - width, 0 ] ) {
                cube( size=[ width + thickness, width + thickness, fanDz ] );
            }
            translate( [ fanDx - width, fanDy - width, 0 ] ) {
                cube( size=[ width + thickness, width + thickness, fanDz ] );
            }
        }
        cube( size=[ fanDx, fanDy, fanDz ] );
    }
}
