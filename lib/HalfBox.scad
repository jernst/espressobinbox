// Half a box, bottom/ceiling at the bottom, [0,0,0] just inside

module HalfBox(
    width_i,
    depth_i,
    height_i,
    wall_d )
{
    union() {
// faces
        // bottom
        translate( [0,0,-wall_d] ) {
            cube( [ width_i, depth_i, wall_d ]);
        }

        // front
        translate( [0,-wall_d,0] ) {
            cube( [ width_i, wall_d, height_i ]);
        }

        // back
        translate( [0,depth_i,0] ) {
            cube( [ width_i, wall_d, height_i ]);
        }
        
        // left
        translate( [-wall_d,0,0] ) {
            cube( [ wall_d, depth_i, height_i ]);
        }
        
        // right
        translate( [width_i,0,0] ) {
            cube( [ wall_d, depth_i, height_i ]);
        }

// edges
        // front-left
        rotate( a=180, v=[0,0,1] ) {
            HalfBox_RoundedEdge( height_i, wall_d );
        }

        // back-left
        translate( [ 0, depth_i, 0 ])
        rotate( a=90, v=[0,0,1] ) {
            HalfBox_RoundedEdge( height_i, wall_d );
        }
            
        // front-right
        translate( [ width_i, 0, 0 ])
        rotate( a=-90, v=[0,0,1] ) {
            HalfBox_RoundedEdge( height_i, wall_d );
        }
        
        // back-right
        translate( [ width_i, depth_i, 0 ]) {
            HalfBox_RoundedEdge( height_i, wall_d );
        }
        
        // front-bottom
        rotate( a=-90, v=[1,0,0] )
        rotate( a=90, v=[0,1,0] ) {
            HalfBox_RoundedEdge( width_i, wall_d );
        }
        
        // back-bottom
        translate( [ 0, depth_i, 0 ])
        rotate( a=90, v=[0,1,0] ) {
            HalfBox_RoundedEdge( width_i, wall_d );
        }

        // left-bottom
        rotate( a=90, v=[0,1,0] )
        rotate( a=-90, v=[1,0,0] ) {    
            HalfBox_RoundedEdge( depth_i, wall_d );
        }
           
        // right-bottom
        translate( [ width_i, 0, 0 ])
        rotate( a=-90, v=[1,0,0] ) {    
            HalfBox_RoundedEdge( depth_i, wall_d );
        }

// corners
        // front-bottom-left
        rotate( a=180, v=[0,1,0] )
        rotate( a=90, v=[1,0,0] ) {
            HalfBox_RoundedCorner( wall_d );
        }

        // back-bottom-left
        translate( [ 0, depth_i, 0 ])
        rotate( a=180, v=[0,1,0] ) {
            HalfBox_RoundedCorner( wall_d );
        }

        // front-bottom-right
        translate( [ width_i, 0, 0 ])
        rotate( a=90, v=[0,1,0] )
        rotate( a=90, v=[1,0,0] ) {
            HalfBox_RoundedCorner( wall_d );
        }

        // back-bottom-right
        translate( [ width_i, depth_i, 0 ])
        rotate( a=-90, v=[1,0,0] ) {
            HalfBox_RoundedCorner( wall_d );
        }
    }
}

module HalfBox_RoundedEdge(
        length,
        radius )
{
	intersection() {
		cube( [ radius, radius, length ] );
		cylinder( length, radius, radius );
	}
	
}

module HalfBox_RoundedCorner(
        radius )
{
	intersection() {
    	cube( [ radius, radius, radius ]);
	    sphere( radius );
	}
}
