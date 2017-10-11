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

boxWidth_i=120;
boxDepth_i=72;
boxHeight_i = 72;
ebStandoffHeight = 7;
diskStandoffHeight = 7;
diskHeight = 15;

wallThickness = 2;

showFaces = 30;

EbBottom(
        boxWidth_i,
        boxDepth_i,
        ebStandoffHeight,
        wallThickness );

translate( [ 0, boxDepth_i, boxHeight_i*1.5 ] )
rotate( 180, [ 1, 0, 0 ] ) {
    EbTop(
            boxWidth_i,
            boxDepth_i,
            diskStandoffHeight,
            diskHeight,
            wallThickness );
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
