//
//  ViewController.m
//  TicTacToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.txtName.text = [defaults objectForKey:@"name"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tappedPlay:(id)sender {
    NSString *name = self.txtName.text;
    if ([name length] == 0) {

        self.txtName.backgroundColor = [UIColor colorWithRed:1 green: 0.6 blue:0.8 alpha:0.5];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSString *name = self.txtName.text;
    if ([name length] == 0) {
        
        self.txtName.backgroundColor = [UIColor colorWithRed:1 green: 0.6 blue:0.8 alpha:0.5];
        return NO;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:name forKey:@"name"];
    [defaults synchronize];
    
    return YES;
}

@end
