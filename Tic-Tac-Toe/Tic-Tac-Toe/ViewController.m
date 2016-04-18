//
//  ViewController.m
//  Tic-Tac-Toe
//
//  Created by Luke Clayton on 04/02/2016.
//  Copyright © 2016 Luke Clayton. All rights reserved.
//
//
//  User Guide
//  Fundamental Knowledge
//  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  The program is a digital recreation of the classic game tic-tac-toe, also known as naughts and crosses.
//  The general rules of the game are that the two players are assigned a different marker, either a naught(O) or a cross(X).
//  Each player will then take turns to fill one of the sections of the grid with their assigned marker.
//  Once a grid section has been filled it cannot be used again until the game has finished.
//  The game will finish when one of the players has managed to align three of there markers in a line (which results in a win for that player) or if all the grid spaces are filled without a winner being chosen (this results in a draw).
//
//  Rules & Instructions
//  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  The player has to align there markers to form a line of three across the board either vertically, horizontally and diagonally from corner to opposite corner.
//  The players must go in alternating order one after the other.
//  To place a marker the current player should click one of the empty box sections on the grid.
//  After one player wins no actions on the grid can be executed until the grid is cleared/reset.
//
//  FAQ
//  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//  Q: How do you place a marker?
//  A: You click one of the block locations on the application,
//  this should place the marker relevant to the turn in that place.
//
//  Q: The game has come to a draw, what now?
//  A: Click the reset button, this should clear the board to make the game ready to play another game.
//
//  Q: Is this just naughts and crosses?
//  A: Yes...
//
//  Q: 
//  A:
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Variable Declaration
int gameBoard[9];
int playerOneTurn;
bool gameOver;

//Function to Intitialise the game board & clear existing values
-(void)initialiseGameBoard
{
    for(int i=1;i<10;i++)
    {
        UIButton *button = (UIButton*)[self.view viewWithTag:i]; //Don't set the tag to zero when trying to refer to it/ call it in this way
        [button setTitle:@"" forState: UIControlStateNormal];
        gameBoard[i-1]=0;
    }
}

//Sets the Value and title of the Clicked Button
-(IBAction)setSpace: (id)sender
{
    if(!end)
    {
        if([self checkBoardSpace: sender])
        {
            if(playerOneTurn)
            {
                [sender setTitle:@"X" forState:UIControlStateNormal];
                gameBoard[[sender tag]-1] = 1;
                playerOneTurn = false;
                turnDisplay.text = @"O's Turn";
            }
            else
            {
                [sender setTitle:@"O" forState:UIControlStateNormal];
                gameBoard[[sender tag]-1] = 2;
                playerOneTurn = true;
                turnDisplay.text = @"X's Turn";
            }
        }
        if([self winCondition] == 1)
        {
            end = true;
            turnDisplay.text = @"Game Over, X wins";
        }
        if([self winCondition] == 2)
        {
            end = true;
            turnDisplay.text = @"Game Over, O wins";
        }
    }
}

//Makes sure the Board Space doesn't already have a Value
-(bool)checkBoardSpace: (id)sender
{
    if(gameBoard[[sender tag]-1] == 0)
    {
        return true;
    }
    else
    {
        return false;
    }
}

//Checks if anyone has won and returns a value representing who won
-(int)winCondition
{
    int gameWon = 0;
    for(int i=0;i<3;i++)
    {
        if(((gameBoard[0 + (i * 3)] == 1 ) &(gameBoard[1 + (i * 3)] == 1 )&&(gameBoard[2 + (i * 3)] == 1 )) || ((gameBoard[0 + i] == 1 )&&(gameBoard[3 + i] == 1 )&&(gameBoard[6 + i] == 1)))
        {
            gameWon = 1;
        }
        else if(((gameBoard[0 + (i * 3)] == 2 )&&(gameBoard[1 + (i * 3)] == 2 ) && (gameBoard[2 + (i * 3)] == 2 ))||((gameBoard[0 + i] == 2 )&&(gameBoard[3 + i] == 2 )&&(gameBoard[6 + i] == 2 )))
        {
            gameWon = 2;
        }
        else if(((gameBoard[0] == 1) && (gameBoard[4] == 1) && (gameBoard[8] == 1))||((gameBoard[2] == 1) && (gameBoard[4] == 1) && (gameBoard[6] == 1)))
        {
            gameWon = 1;
        }
        else if(((gameBoard[0] == 2) && (gameBoard[4] == 2) && (gameBoard[8] == 2))||((gameBoard[2] == 2) && (gameBoard[4] == 2) && (gameBoard[6] == 2)))
        {
            gameWon = 2;
        }
    }
    return gameWon;
}

//Resets the board and turns on button press
-(IBAction)reset
{
    [self initialiseGameBoard];
    playerOneTurn = true;
    turnDisplay.text = @"X's Turn";
    end = false;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialiseGameBoard];
    playerOneTurn = true;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
