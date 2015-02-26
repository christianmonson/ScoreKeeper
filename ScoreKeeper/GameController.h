//
//  GameController.h
//  ScoreKeeper
//
//  Created by sombra on 2015-02-13.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic, strong, readonly) NSArray *games;

+ (GameController *)sharedInstance;

- (Game *)addGameWithName:(NSString *)name;
- (void)removeGame:(Game *)game;
- (void)removePlayer:(Player *)player;
- (void)addPlayerToGame:(Game *)game;

-(void)save;

@end
