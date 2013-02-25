//
//  Board.h
//  SonarMinefield
//
//  Created by Daniel Monteiro on 2/24/13.
//  Copyright (c) 2013 Daniel Monteiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Board : NSObject {
    
    int **tileAt;
    
}
- (id) init;
- (void) pokeAtX: (int) x andY: (int) y;
- (int) tileAtX: (int) x andY: (int) y;
@end
