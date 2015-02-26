//
//  GameController.m
//  ScoreKeeper
//
//  Created by sombra on 2015-02-13.
//  Copyright (c) 2015 sombra. All rights reserved.
//

#import "GameController.h"
#import "Stack.h"

@interface GameController ()

@end

@implementation GameController

+ (GameController *)sharedInstance {
    static GameController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[GameController alloc] init];
        
    });
    return sharedInstance;
}

- (NSArray *)games {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    
    return [[Stack sharedInstance].managedObjectContext executeFetchRequest:fetchRequest error:NULL];
}

- (Game *)addGameWithName:(NSString *)name {
    
    Game *game = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    game.name = name;
    
    [self save];
    
    return game;
}

- (void)removeGame:(Game *)game {
    
    [[Stack sharedInstance].managedObjectContext deleteObject:game];
    [self save];
    
}

-(void)addPlayerToGame:(Game *)game{
    Player *player = [NSEntityDescription insertNewObjectForEntityForName:@"Player" inManagedObjectContext:[Stack sharedInstance].managedObjectContext];
    
    player.game = game;
}

- (void)removePlayer:(Player *)player {
    [[Stack sharedInstance].managedObjectContext deleteObject:player];
    
    [self save];
}


- (void)save {
    
    [[Stack sharedInstance].managedObjectContext save:NULL];
}
@end
