//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Xiaokang Xin on 6/27/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score; // readwrite is the default, only used when we re-declare the methods that firstly defined as readonly.
@property (nonatomic, strong) NSMutableArray *cards; // array of cards

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        if (count < 2  ) {
            return self;
        }
        
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil; // we are dead!
                break;
            }
            
        }
    }
    return self;
}

//#define MISMATCH_PENALTY 2
static const int MISMATCH_PENALTY  = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen  = NO; // getter is renamed while the setter is still the name of the property.
        } else {
            // match against another card.
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore =  [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.Matched = YES;
                        otherCard.Matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                     break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
