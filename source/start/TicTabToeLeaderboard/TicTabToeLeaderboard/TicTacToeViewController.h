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
    CGFloat distance;

}
@property (weak, nonatomic) IBOutlet UIButton *btnTopLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnMiddleLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnBottomLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnTopMiddle;
@property (weak, nonatomic) IBOutlet UIButton *btnMiddleMiddle;
@property (weak, nonatomic) IBOutlet UIButton *btnBottomMiddle;
@property (weak, nonatomic) IBOutlet UIButton *btnTopRight;
@property (weak, nonatomic) IBOutlet UIButton *btnMiddleRight;
@property (weak, nonatomic) IBOutlet UIButton *btnBottomRight;

- (IBAction)tappedPlaySquare:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
- (IBAction)tappedGesture:(id)sender;
- (void)computerPicksButton:(UIButton *)pickedButton;
- (void)gameover;
- (BOOL)checkForGameover;
@end
