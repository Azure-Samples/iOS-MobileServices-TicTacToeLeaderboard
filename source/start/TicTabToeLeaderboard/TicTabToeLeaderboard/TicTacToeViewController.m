//
//  TicTacToeViewController.m
//  TicTabToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "TicTacToeViewController.h"

@interface TicTacToeViewController ()

@end

@implementation TicTacToeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    playersTurn = YES;
    computersTurn = NO;
    
    currentCharacter = @"X";
    spotsRemaining = 9;
    
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    CGFloat dist = self.view.bounds.size.width / 3;
    
    UIView *topHorizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 140, self.view.bounds.size.width, 3)];
    topHorizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topHorizontalLine];
    
    
    UIView *bottomHorizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 240, self.view.bounds.size.width, 3)];
    bottomHorizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomHorizontalLine];

    
    UIView *leftVerticalLine = [[UIView alloc] initWithFrame:CGRectMake(dist, 40, 3, self.view.bounds.size.width)];
    leftVerticalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:leftVerticalLine];
    
    UIView *rightVerticalLine = [[UIView alloc] initWithFrame:CGRectMake(dist * 2, 40, 3, self.view.bounds.size.width)];
    rightVerticalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:rightVerticalLine];
    
    self.lblInfo.text = @"You go first!";
    
    //Set up labels for plays
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    //First row
    UILabel *labelOne = [[UILabel alloc] initWithFrame:CGRectMake(dist / 2, 40, dist, dist)];
    //labelOne.text = @"X";
    labelOne.font = font;
    labelOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelOne];
    
    UILabel *labelTwo = [[UILabel alloc] initWithFrame:CGRectMake(dist * 1.5, 40, dist, dist)];
    //labelTwo.text = @"X";
    labelTwo.font = font;
    labelTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelTwo];
    
    UILabel *labelThree = [[UILabel alloc] initWithFrame:CGRectMake(dist * 2.5, 40, dist, dist)];
    //labelThree.text = @"X";
    labelThree.font = font;
    labelThree.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelThree];
    
    //Second Row
    UILabel *labelTwoOne = [[UILabel alloc] initWithFrame:CGRectMake(dist / 2, 140, dist, dist)];
    //labelTwoOne.text = @"X";
    labelTwoOne.font = font;
    labelTwoOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelTwoOne];
    
    UILabel *labelTwoTwo = [[UILabel alloc] initWithFrame:CGRectMake(dist * 1.5, 140, dist, dist)];
    //labelTwoTwo.text = @"X";
    labelTwoTwo.font = font;
    labelTwoTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelTwoTwo];
    
    UILabel *labelTwoThree = [[UILabel alloc] initWithFrame:CGRectMake(dist * 2.5, 140, dist, dist)];
    //labelTwoThree.text = @"X";
    labelTwoThree.font = font;
    labelTwoThree.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelTwoThree];
    
    
    //Third Row
    UILabel *labelThreeOne = [[UILabel alloc] initWithFrame:CGRectMake(dist / 2, 240, dist, dist)];
    //labelThreeOne.text = @"X";
    labelThreeOne.font = font;
    labelThreeOne.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelThreeOne];
    
    UILabel *labelThreeTwo = [[UILabel alloc] initWithFrame:CGRectMake(dist * 1.5, 240, dist, dist)];
    //labelThreeTwo.text = @"X";
    labelThreeTwo.font = font;
    labelThreeTwo.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelThreeTwo];
    
    UILabel *labelThreeThree = [[UILabel alloc] initWithFrame:CGRectMake(dist * 2.5, 240, dist, dist)];
    //labelThreeThree.text = @"X";
    labelThreeThree.font = font;
    labelThreeThree.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelThreeThree];
    
    
    tableValueArray = [[NSMutableArray alloc] initWithCapacity: 3];
    
    [tableValueArray insertObject:[NSMutableArray arrayWithObjects:labelOne,labelTwo,labelThree,nil] atIndex:0];
    [tableValueArray insertObject:[NSMutableArray arrayWithObjects:labelTwoOne,labelTwoTwo,labelTwoThree,nil] atIndex:1];
    [tableValueArray insertObject:[NSMutableArray arrayWithObjects:labelThreeOne,labelThreeTwo,labelThreeThree,nil] atIndex:2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedGesture:(id)sender {
    
    if (computersTurn)
        return;
    
    CGPoint tapPoint = [sender locationInView:self.view];
    int tapX = (int) tapPoint.x;
    int tapY = (int) tapPoint.y;
        CGFloat dist = self.view.bounds.size.width / 3;
    
    //NSLog(@"TAPPED X:%d Y:%d", tapX, tapY);

//    if (tapX < dist - 5) {
//        if (tapY < dist - 5) {
//            NSLog(@"1-1");
//        } else if (tapY > dist + 5 && tapY < dist * 2 - 5) {
//            NSLog(@"2-1");
//        } else if (tapY > dist * 2 + 5) {
//            NSLog(@"3-1");
//        }
//    } else if (tapX > dist + 5 && tapX < dist * 2 - 5) {
//        if (tapY < dist - 5) {
//            NSLog(@"1-2");
//        } else if (tapY > dist + 5 && tapY < dist * 2 - 5) {
//            NSLog(@"2-2");
//        } else if (tapY > dist * 2 + 5) {
//            NSLog(@"3-2");
//        }
//    } else if (tapX > dist * 2 + 5){
//        if (tapY < dist - 5) {
//            NSLog(@"1-3");
//        } else if (tapY > dist + 5 && tapY < dist * 2 - 5) {
//            NSLog(@"2-3");
//        } else if (tapY > dist * 2 + 5) {
//            NSLog(@"3-3");
//        }
//    }
    int row = -1;
    int col = -1;
    if (tapX < dist - 5) {
        col = 0;
    } else if (tapX > dist + 5 && tapX < dist * 2 - 5) {
        col = 1;
    } else if (tapX > dist * 2 + 5){
        col = 2;
    }
    if (tapY < dist - 5) {
        row = 0;
    } else if (tapY > dist + 5 && tapY < dist * 2 - 5) {
        row = 1;
    } else if (tapY > dist * 2 + 5) {
        row = 2;
    }
    
    if (row == -1 || col == -1)
        return;
    
    
    NSLog(@"untapped");
    UILabel *tappedLabel = (UILabel *)tableValueArray[row][col];
    if ([tappedLabel.text length] == 0) {
        tappedLabel.text = currentCharacter;
        spotsRemaining--;
        
        if ([self checkForGameover] || spotsRemaining == 0) {
            [self gameover];
            return;
        }
        if ([currentCharacter isEqualToString:@"X"])
            currentCharacter = @"O";
        else
            currentCharacter = @"X";
        
        playersTurn = !playersTurn;
        computersTurn = !computersTurn;
        
        if (computersTurn) {
            //Kick off computers turn in the background
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
                int cRow = -1;
                int cCol = -1;
               
                for (int i = 0; i < 3; i++) {
                    for (int j = 0; j < 3; j++) {
                        UILabel *lab = tableValueArray[i][j];
                        if ([lab.text length] == 0) {
                            cRow = i;
                            cCol = j;
                            break;
                        }
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self computerPicksRow:cRow andColumn:cCol];
                });
            });
        }
    }
}

- (void)computerPicksRow:(int)row andColumn:(int)column{
    UILabel *tappedLabel = (UILabel *)tableValueArray[row][column];
    tappedLabel.text = currentCharacter;
    
    spotsRemaining--;
    
    if ([self checkForGameover] || spotsRemaining == 0) {
        [self gameover];
        return;
    }
    
    if ([currentCharacter isEqualToString:@"X"])
        currentCharacter = @"O";
    else
        currentCharacter = @"X";
    
    playersTurn = !playersTurn;
    computersTurn = !computersTurn;
}

- (BOOL)checkForGameover {
    //If there are over 6 spots, the game can't be over
    if (spotsRemaining > 6)
        return NO;
    UILabel *labOneOne = tableValueArray[0][0];
    UILabel *labOneTwo = tableValueArray[0][1];
    UILabel *labOneThree = tableValueArray[0][2];

    UILabel *labTwoOne = tableValueArray[1][0];
    UILabel *labTwoTwo = tableValueArray[1][1];
    UILabel *labTwoThree = tableValueArray[1][2];
    
    UILabel *labThreeOne = tableValueArray[2][0];
    UILabel *labThreeTwo = tableValueArray[2][1];
    UILabel *labThreeThree = tableValueArray[2][2];
    
    
    //Horizontal Wins
    if ([labOneOne.text isEqualToString:labOneTwo.text] &&
        [labOneOne.text isEqualToString:labOneThree.text]) {
        winningCharacter = labOneOne.text;
        return YES;
    }
    if ([labTwoOne.text isEqualToString:labTwoTwo.text] &&
        [labTwoOne.text isEqualToString:labTwoThree.text]) {
        winningCharacter = labTwoOne.text;
        return YES;
    }
    if ([labThreeOne.text isEqualToString:labThreeTwo.text] &&
        [labThreeOne.text isEqualToString:labThreeThree.text]) {
        winningCharacter = labThreeOne.text;
        return YES;
    }
    
    //Vertical
    if ([labOneOne.text isEqualToString:labTwoOne.text] &&
        [labOneOne.text isEqualToString:labThreeOne.text]) {
        winningCharacter = labOneOne.text;
        return YES;
    }
    if ([labOneTwo.text isEqualToString:labTwoTwo.text] &&
        [labOneTwo.text isEqualToString:labOneThree.text]) {
        winningCharacter = labOneTwo.text;
        return YES;
    }
    if ([labOneThree.text isEqualToString:labTwoThree.text] &&
        [labOneThree.text isEqualToString:labThreeThree.text]) {
        winningCharacter = labOneThree.text;
        return YES;
    }

    //Diagonal top left to bottom right
    if ([labOneOne.text isEqualToString:labTwoTwo.text] &&
        [labOneOne.text isEqualToString:labThreeThree.text]) {
        winningCharacter = labOneOne.text;
        return YES;
    }
    //Diagonal bottom left to top right
    if ([labThreeOne.text isEqualToString:labTwoTwo.text] &&
        [labThreeOne.text isEqualToString:labOneThree.text]) {
        winningCharacter = labThreeOne.text;
        return YES;
    }
    return NO;
}


- (void)gameover {
    if ([winningCharacter length] == 0)
        self.lblInfo.text = @"No winner!";
    else
        self.lblInfo.text = [NSString stringWithFormat:@"%@ wins!", winningCharacter];
}
@end
