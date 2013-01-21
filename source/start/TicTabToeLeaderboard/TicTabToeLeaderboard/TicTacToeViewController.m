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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIView *topHorizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 3)];
    topHorizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:topHorizontalLine];
    
    
    UIView *bottomHorizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 3)];
    bottomHorizontalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:bottomHorizontalLine];

    CGFloat dist = self.view.bounds.size.width / 3;
    UIView *leftVerticalLine = [[UIView alloc] initWithFrame:CGRectMake(dist, 0, 3, self.view.bounds.size.width)];
    leftVerticalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:leftVerticalLine];
    
    UIView *rightVerticalLine = [[UIView alloc] initWithFrame:CGRectMake(dist * 2, 0, 3, self.view.bounds.size.width)];
    rightVerticalLine.backgroundColor = [UIColor blackColor];
    [self.view addSubview:rightVerticalLine];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
