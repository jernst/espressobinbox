// A standoff with a bore hole on one side, and drilled all the
// way through

module BoreStandoff(
        height,
        radius,
        boreHoleDepth,
        boreHoleRadius,
        throughHoleRadius )
{
    difference() {
        cylinder( height, radius, radius );
        cylinder( height, throughHoleRadius, throughHoleRadius );
        cylinder( boreHoleDepth, boreHoleRadius, boreHoleRadius );
    }
}
