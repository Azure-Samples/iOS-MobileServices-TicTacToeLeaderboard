//
//  TicTacToeService.m
//  TicTabToeLeaderboard
//
//  Created by Chris Risner on 1/22/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "TicTacToeService.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface TicTacToeService()
@property (nonatomic, strong) MSTable *playerRecordsTable;
@property (nonatomic)                  NSInteger busyCount;

@end

@implementation TicTacToeService

static TicTacToeService *singletonInstance;

+(TicTacToeService*) getInstance {
    if (singletonInstance == nil) {
        singletonInstance = [[super alloc] init];
    }
    return singletonInstance;
}

-(TicTacToeService *) init {
    // Initialize the Mobile Service client with your URL and key
    MSClient *newClient = [MSClient clientWithApplicationURLString:@"https://tictactoeleaderboard.azure-mobile.net/"
        withApplicationKey:@"KKxeIhnoUWsHXvySIpykYgKgqgVkla70"];
    
    // Add a Mobile Service filter to enable the busy indicator
    self.client = [newClient clientwithFilter:self];
    
    // Create an MSTable instance to allow us to work with the TodoItem table
    self.playerRecordsTable = [_client getTable:@"PlayerRecords"];
    
    self.playerRecords = [[NSMutableArray alloc] init];
    self.busyCount = 0;
    
    return self;
}

- (void) refreshPlayerRecordsOnSuccess:(CompletionBlock) completion {
    [self.playerRecordsTable readWithCompletion:^(NSArray *results, NSInteger totalCount, NSError *error) {
        [self logErrorIfNotNil:error];
        
        self.playerRecords = [results mutableCopy];
        
        completion();
    }];
}
- (void) saveWin:(NSString *)playerName
      completion:(CompletionWithIndexBlock) completion {
    NSDictionary *record =
        @{ @"playerName" : playerName
         , @"status" : @"win"};
    [self saveRecord:record completion:completion];
}
- (void) saveLoss:(NSString *)playerName
       completion:(CompletionWithIndexBlock) completion {
    NSDictionary *record =
        @{ @"playerName" : playerName
         , @"status" : @"loss"};
    [self saveRecord:record completion:completion];
}
- (void) saveTie:(NSString *)playerName
      completion:(CompletionWithIndexBlock) completion{
    NSDictionary *record =
        @{ @"playerName" : playerName
         , @"status" : @"tie"};
    [self saveRecord:record completion:completion];
}

- (void) saveRecord:(NSDictionary *)record
         completion:(CompletionWithIndexBlock) completion {
    [self.playerRecordsTable insert:record completion:^(NSDictionary *result, NSError *error) {
        
        [self logErrorIfNotNil:error];
        
        NSUInteger index = [self.playerRecords count];
        [(NSMutableArray *)self.playerRecords insertObject:result
                                                   atIndex:index];
        if (completion)
            completion(index);
    }];
}



- (void) busy:(BOOL) busy
{
    // assumes always executes on UI thread
    if (busy) {
        if (self.busyCount == 0 && self.busyUpdate != nil) {
            self.busyUpdate(YES);
        }
        self.busyCount ++;
    }
    else
    {
        if (self.busyCount == 1 && self.busyUpdate != nil) {
            self.busyUpdate(FALSE);
        }
        self.busyCount--;
    }
}

- (void) logErrorIfNotNil:(NSError *) error
{
    if (error) {
        NSLog(@"ERROR %@", error);
    }
}

#pragma mark * MSFilter methods


- (void) handleRequest:(NSURLRequest *)request
                onNext:(MSFilterNextBlock)onNext
            onResponse:(MSFilterResponseBlock)onResponse
{
    // A wrapped response block that decrements the busy counter
    MSFilterResponseBlock wrappedResponse = ^(NSHTTPURLResponse *response, NSData *data, NSError *error) {
        [self busy:NO];
        onResponse(response, data, error);
    };
    
    // Increment the busy counter before sending the request
    [self busy:YES];
    onNext(request, wrappedResponse);
}
@end
