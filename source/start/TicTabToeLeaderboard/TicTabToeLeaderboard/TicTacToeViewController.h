//
//  TicTacToeViewController.h
//  TicTabToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicTacToeViewController : UIViewController {
    @private
    BOOL playersTurn;
    BOOL computersTurn;
    NSMutableArray *tableValueArray;
    NSString *currentCharacter;
    int spotsRemaining;
    NSString *winningCharacter;
}
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
- (IBAction)tappedGesture:(id)sender;
- (void)computerPicksRow:(int)row andColumn:(int)column;
- (void)gameover;
- (BOOL)checkForGameover;
@end
