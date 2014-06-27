//
//  PlayingCard.h
//  Matchismo
//
//  Created by Xiaokang Xin on 6/27/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic)NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
