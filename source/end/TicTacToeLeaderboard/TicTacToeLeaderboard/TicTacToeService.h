//
//  TicTacToeService.h
//  TicTacToeLeaderboard
//
//  Created by Chris Risner on 1/22/13.
//  Copyright (c) 2013 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

#pragma mark * Block Definitions
typedef void (^CompletionBlock) ();
typedef void (^CompletionWithIndexBlock) (NSUInteger index);
typedef void (^BusyUpdateBlock) (BOOL busy);

@interface TicTacToeService : NSObject<MSFilter>

@property (nonatomic, strong)   NSArray *playerRecords;
@property (nonatomic, strong)   MSClient *client;
@property (nonatomic, copy)     BusyUpdateBlock busyUpdate;

+(TicTacToeService*) getInstance;

- (void) refreshPlayerRecordsOnSuccess:(CompletionBlock) completion;
- (void) saveWin:(NSString *)playerName
      completion:(CompletionWithIndexBlock) completion;
- (void) saveLoss:(NSString *)playerName
       completion:(CompletionWithIndexBlock) completion;
- (void) saveTie:(NSString *)playerName
       completion:(CompletionWithIndexBlock) completion;
- (void) handleRequest:(NSURLRequest *)request
            onNext:(MSFilterNextBlock)onNext
            onResponse:(MSFilterResponseBlock)onResponse;
- (void) saveRecord:(NSDictionary *)record
         completion:(CompletionWithIndexBlock) completion;
@end
