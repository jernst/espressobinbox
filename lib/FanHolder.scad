// Holds a computer fan, enclosed at bottom, and partially left or right,
// against displacement in all directions except up. The air flows in
// y direction.
// The fan will be a [ 0, 0, offset_z ] to [ fanDx, fanDy, offset_z + fanDz ]
// So holding elements will extend into negative x and y territories, but not negative z
//
// Fan dimensions:    fanDx, and fanDy (e.g. 25mm and 10mm )
//                    there is no fanDz, as it does not reach all the way to the top
// Holder dimensions: holder_h : size of the part from the bottom to the top
//                    offset_z : bottom of the fan, with respect to the bottom of the part
//                               (raises the fan from the floor)
//                    width:     distance that the holding elements reach around the fan from the corner
//                    thickness: thickness of the structures being created

module FanHolder(
        fanDx,
        fanDy,
        holder_h,
        offset_z,
        width     = 2,
        thickness = 1.5 )
{
    difference() {
        translate( [ -$slidingFit_d - thickness, -$slidingFit_d - thickness, 0 ] ) {
            cube( size=[ fanDx + 2 * ( $slidingFit_d + thickness ), fanDy + 2 * ( $slidingFit_d + thickness ), holder_h ] );
        }
        translate( [ -$slidingFit_d, -$slidingFit_d, offset_z ] ) {
            cube( size=[ fanDx + 2*$slidingFit_d, fanDy + 2*$slidingFit_d, holder_h ] );
        }
        translate( [ width, -2*thickness, offset_z ] ) {
            cube( size=[ fanDx - 2*width, fanDy + 4*thickness, holder_h ] );
        }
    }
}

