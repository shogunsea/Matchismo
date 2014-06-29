//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Xiaokang Xin on 6/27/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) NSInteger score; // publicly should be set read only, privately should be writable.

@end
