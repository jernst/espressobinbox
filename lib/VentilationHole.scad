// A 2D ventilation hole
// It's inside a box from [0,0] to [partWidth, partHeight ] and
// the maximum angle is given so it remains printable if in a wall

module VentilationHole(
        partWidth,
        partHeight,
        angle = 30 )
{
    dycand = partWidth / ( 2 * tan( angle ));
    dy = min( partHeight/2, dycand );

    points = [
            [ partWidth/2, 0               ],
            [ partWidth  , dy              ],
            [ partWidth  , partHeight - dy ],
            [ partWidth/2, partHeight      ],
            [ 0          , partHeight - dy ],
            [ 0          , dy              ]
    ];

    polygon( points );
}

VentilationHole( 10, 100 );
