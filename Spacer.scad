// Intends to keep the two halves from moving against each other
// Assumes the wall is in the X-Z plane, extending towards -Y
// so it sits in X>0, Y>0 from Z=-hBelow to Z=hAbove

module Spacer(
    w,
    d,
    hAbove,
    hBelow,
    angleTop = 30,
    angleBottom = 30 )
{
    rotate( 90, [0, 0, 1 ] ) {
    rotate( 90, [1, 0, 0 ] )
        linear_extrude( w ) {
            polygon( [
                [ 0,   hAbove - d/3 / tan( angleTop ) ],
                [ d/3, hAbove ],
                [ d,   hAbove ],
                [ d,   -hBelow + d / tan( angleBottom ) ],
                [ 0,   -hBelow ]
            ] );
        }
    }
}

