//
//  Board.m
//  SonarMinefield
//
//  Created by Daniel Monteiro on 2/24/13.
//  Copyright (c) 2013 Daniel Monteiro. All rights reserved.
//

#import "AppDelegate.h"
#import "Board.h"

@implementation Board

    - ( int ) tileAtX: (int) x andY: (int) y {
        return tileAt[ y ][ x ];
    }

    - (void) pokeAtX: (int) x andY: (int) y {
    
        
    }

    - (id) init {
        
         srand (time(NULL));
    
        tileAt =  ( int ** ) malloc( BOARD_SIZE *  sizeof( int *) );
        
        for ( int c = 0; c < BOARD_SIZE; ++c ) {
            
            tileAt[ c ] = ( int *) malloc( BOARD_SIZE * sizeof( int ) );
            
            for ( int d = 0; d < BOARD_SIZE; ++d ) {
                
                tileAt[ c ][ d ] = rand() % 2;
            }
        }
        
        return self;
    }
@end
