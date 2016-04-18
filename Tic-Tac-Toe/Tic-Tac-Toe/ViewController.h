//
//  ViewController.h
//  Tic-Tac-Toe
//
//  Created by Luke Clayton on 04/02/2016.
//  Copyright © 2016 Luke Clayton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *turnDisplay;
    
    int gameBoard[9];
    bool playerOneTurn;
    bool end;
    
}

-(void)initialiseGameBoard;
-(bool)checkBoardSpace: (id)sender;
-(int)winCondition;
@end

