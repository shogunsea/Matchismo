//
//  Deck.h
//  Matchismo
//
//  Created by Xiaokang Xin on 6/26/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end
