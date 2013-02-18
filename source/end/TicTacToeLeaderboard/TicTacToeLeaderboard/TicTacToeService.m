//
//  TicTacToeService.m
//  TicTacToeLeaderboard
//
//  Created by Chris Risner on 1/22/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import "TicTacToeService.h"
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface TicTacToeService()
@property (nonatomic, strong) MSTable *playerRecordsTable;

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
    
    self = [super init];
    // Initialize the Mobile Service client with your URL and key
    MSClient *newClient = [MSClient clientWithApplicationURLString:@"https://<YourMobileServiceUrl>.azure-mobile.net/"
        withApplicationKey:@"<YourApplicationKey>"];
    
    // Add a Mobile Service filter
    self.client = [newClient clientwithFilter:self];
    
    self.playerRecordsTable = [_client getTable:@"PlayerRecords"];    
    self.playerRecords = [[NSMutableArray alloc] init];
    
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
    MSFilterResponseBlock wrappedResponse = ^(NSHTTPURLResponse *response, NSData *data, NSError *error) {
        onResponse(response, data, error);
    };
    onNext(request, wrappedResponse);
}
@end
