//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Xiaokang Xin on 6/25/14.
//  Copyright (c) 2014 Xiaokang Xin. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deckOfCards;

@end

@implementation CardGameViewController

- (Deck *)deckOfCards
{
    if (!_deckOfCards) {
        _deckOfCards = [[PlayingCardDeck alloc] init];
    }
    
    return _deckOfCards;
}
 
- (void) setFlipCount:(int)flipCount
{
//    NSLog(@"flipCount = %d", self.flipCount);
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips : %d  Cards left : %d", self.flipCount, [self.deckOfCards count]];
}

- (IBAction)touchCardButton:(UIButton *)sender {

    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    } else {
        Card *currentCard = [self.deckOfCards drawRandomCard];
        if (currentCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            [sender setTitle:currentCard.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}

//- (IBAction)touchCardButton:(UIButton *)sender
//{
//    if ([sender.currentTitle length]) {
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"" forState:UIControlStateNormal];
//    } else {
//        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
//    }
//    self.flipCount++;
//    NSLog(@"yoyoyo, flipCount = %d", self.flipCount);
//}

@end
