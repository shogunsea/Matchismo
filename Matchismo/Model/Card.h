 //
//  Card.h
//  Matchismo
//
//  Created by Xiaokang Xin on 6/25/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatch) BOOL matched;

- (int) match:(NSArray *) otherCards;

@end
