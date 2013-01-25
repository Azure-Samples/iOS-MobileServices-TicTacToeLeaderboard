//
//  LeaderboardViewController.h
//  TicTacToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeaderboardViewController : UITableViewController

- (void) refreshData;
@property (weak, nonatomic) IBOutlet UIView *viewHeader;

@end
