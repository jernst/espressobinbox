// A printable ventilation hole

module VentilationHole(
        partWidth,
        partDepth,
        partHeight,
        angle = 30 )
{
    dycand = partWidth / ( 2 * tan( angle ));
    dy = min( partDepth/2, dycand );

    points = [
            [ partWidth/2, 0              ],
            [ partWidth  , dy             ],
            [ partWidth  , partDepth - dy ],
            [ partWidth/2, partDepth      ],
            [ 0          , partDepth - dy ],
            [ 0          , dy             ]
    ];

    linear_extrude( height = partHeight ) {
        polygon( points );
    }
}
