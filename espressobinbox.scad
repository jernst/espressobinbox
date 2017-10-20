use <espressobin/EbBottom.scad>
use <espressobin/EbTop.scad>
use <espressobin/EbBackface.scad>
use <espressobin/EbFrontface.scad>

// use <lib/BoreStandoff.scad>
// use <lib/FanHolder.scad>
use <lib/HalfBox.scad>
// use <lib/Standoff.scad>
// use <lib/VentilationHole.scad>
// use <lib/VentilationHoles.scad>

$fn=20;

ebStandoffHeight = 7;
diskStandoffHeight = 7;

boxWidth_i=120;
boxDepth_i=72;
diskHeight = 15;
ebHeightAboveBoard = 15;
boxHeight_i = ebStandoffHeight + 1.7 + ebHeightAboveBoard + diskHeight;

wallThickness = .7;

showFaces = false ; // 30;
showBottom = true; // false;
showTop    = false; // true;

if( showBottom ) {
    EbBottom(
            boxWidth_i,
            boxDepth_i,
            ebStandoffHeight,
            wallThickness );
}

if( showTop ) {
    if( showBottom ) {
        translate( [ 0, boxDepth_i, boxHeight_i ] )
        rotate( 180, [ 1, 0, 0 ] ) {
            EbTop(
                    boxWidth_i,
                    boxDepth_i,
                    diskStandoffHeight,
                    diskHeight + ebHeightAboveBoard,
                    wallThickness );
        }
    } else {
        EbTop(
                boxWidth_i,
                boxDepth_i,
                diskStandoffHeight,
                diskHeight + ebHeightAboveBoard,
                wallThickness );        
    }
}

if( showFaces > 0 ) {
    translate( [ 0, -showFaces, ebStandoffHeight+1.7 ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbFrontface();
    }

    translate( [ 100, showFaces+boxDepth_i, ebStandoffHeight+1.7 ])
    rotate( 180, [ 0, 0, 1 ])
    rotate( 90, [ 1, 0, 0 ]) {
        EbBackface();
    }
}

//difference() {
//	cube( [230, 120, 5 ]);
//	translate( [ 10, 10, -1 ] ) {
//        VentilationHoles( 100, 100, 7, 3, 16, .5, 70 );
//    }
//	translate( [ 120, 10, -1 ] ) {
//        VentilationHoles( 100, 100, 7, 3, 16, .5, 70 );
//    }
//}


// HalfBox_RoundedEdge( 100, 10 );
// HalfBox_RoundedCorner( 10 );
// XXX( 100, 50, 2 );

// EspressoBINFront();
// translate( [ 0, 0, 10 ] ) {
//     EspressoBINBack();
//  }
