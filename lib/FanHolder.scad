// Can hold a computer fan. Assuming the open side is a box wall

module FanHolder(
        fanWidth,
        fanHeight,
        fanDepth,
        thickness = 2 )
{
    difference() {
        union() {
            translate( [ 0, -thickness, 0 ] ) {
                cube( size=[ fanDepth+thickness, thickness*2, fanHeight ] );
            }
            translate( [ 0, -thickness+fanWidth, 0 ] ) {
                cube( size=[ fanDepth+thickness, thickness*2, fanHeight ] );
            }
        }
        cube( size=[fanDepth, fanWidth, fanHeight ] );
    }
}
