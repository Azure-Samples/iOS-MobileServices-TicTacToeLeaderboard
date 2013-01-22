//
//  ViewController.h
//  TicTabToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtName;
- (IBAction)tappedPlay:(id)sender;

@end
