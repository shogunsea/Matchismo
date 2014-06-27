//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Xiaokang Xin on 6/27/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init]; // super class gets initialized. If super class cannot gets initialized,
                         // it will return nil. Makes sense to return nil if super class fails.
    
    if (self) {
        for(NSString *suit in [PlayingCard validSuits]){
            for(NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++){
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
