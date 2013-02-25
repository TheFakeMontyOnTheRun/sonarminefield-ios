//
//  GameViewController.h
//  SonarMinefield
//
//  Created by Daniel Monteiro on 2/23/13.
//  Copyright (c) 2013 Daniel Monteiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController {
    IBOutlet UIImageView *drawImage;
    Board *gameBoard;
}

- (void) goOutcome;
- (IBAction)backToMenu:(id)sender;
-(IBAction) getLine:(id) sender;
@end
