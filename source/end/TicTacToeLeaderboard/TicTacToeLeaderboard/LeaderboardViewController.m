//
//  LeaderboardViewController.m
//  TicTacToeLeaderboard
//
//  Created by Chris Risner on 1/21/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "LeaderboardViewController.h"
#import "TicTacToeService.h"

@interface LeaderboardViewController ()

@property (strong, nonatomic) TicTacToeService *tttService;

@end

@implementation LeaderboardViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.tttService = [TicTacToeService getInstance];
    [self refreshData];
}

- (void)refreshData {
    [self.tttService refreshPlayerRecordsOnSuccess:^{
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tttService.playerRecords count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *playerRecord = [self.tttService.playerRecords objectAtIndex:indexPath.row];
    UILabel *lblName = (UILabel *)[cell viewWithTag:1];
    lblName.text = [playerRecord objectForKey:@"playerName"];
    UILabel *lblWins = (UILabel *)[cell viewWithTag:2];
    lblWins.text = [NSString stringWithFormat:@"%@",
               [playerRecord objectForKey:@"wins"]];
    UILabel *lblLosses = (UILabel *)[cell viewWithTag:3];
    lblLosses.text = [NSString stringWithFormat:@"%@",
                    [playerRecord objectForKey:@"losses"]];
    UILabel *lblTies = (UILabel *)[cell viewWithTag:4];
    lblTies.text = [NSString stringWithFormat:@"%@",
                    [playerRecord objectForKey:@"ties"]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
