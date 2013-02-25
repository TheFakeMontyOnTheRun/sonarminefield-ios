//
//  GameViewController.m
//  SonarMinefield
//
//  Created by Daniel Monteiro on 2/23/13.
//  Copyright (c) 2013 Daniel Monteiro. All rights reserved.
//

#import "AppDelegate.h"
#import "Board.h"
#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        gameBoard = [[ Board alloc ] init ];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) getLine:(id) sender{
    
    CGPoint currentPoint;
    CGPoint lastPoint;
    currentPoint.x=45;
    currentPoint.y=458;
    lastPoint.x=445;
    lastPoint.y=534;
    UIGraphicsBeginImageContext( drawImage.frame.size);
    [drawImage.image drawInRect:CGRectMake(0, 0, drawImage.frame.size.width, drawImage.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 5.0);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.5, 0.6, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    
    UIImage *blank =    [UIImage imageNamed:@"blanksvg.png"];
    UIImage *mine =    [UIImage imageNamed:@"minesvg.png"];
    UIImage *img;
//    CGImageRef ref = img.CGImage;
    CGRect rect = CGRectMake( 20, 20, 64, 64 );
//    CGContextDrawImage( UIGraphicsGetCurrentContext(), rect, ref );

    
    for ( int y = 0; y < BOARD_SIZE; ++y ) {

        for ( int x = 0; x < BOARD_SIZE; ++x ) {

            if ( [ gameBoard tileAtX: x andY: y ] == 1 )
                img = mine;
            else
                img = blank;
            
            rect.origin.y = ( y * img.size.height );
            rect.origin.x = ( x * img.size.width  );
            rect.size.width = img.size.width + 2;
            rect.size.height = img.size.width + 2;
            [img drawInRect: rect ];
        }
    }

    
    drawImage.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    [ self performSelector: @selector( goOutcome ) withObject: self afterDelay: 2 ];
    
    


    
}

-(void) goOutcome {
    [ ( ( AppDelegate* )[ [ UIApplication sharedApplication ] delegate ] ) changeScreen: SCREEN_OUTCOME ];    
}

- (IBAction)backToMenu:(id)sender {
    [ ( ( AppDelegate* )[ [ UIApplication sharedApplication ] delegate ] ) changeScreen: SCREEN_TITLE ];
}
@end
