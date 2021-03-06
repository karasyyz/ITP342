//
//  Flashcard.m
//  Flashcard
//
//  Created by Yunzhi Yu on 10/16/16.
//  Copyright © 2016 Yunzhi Yu. All rights reserved.
//

#import "Flashcard.h"
 @implementation Flashcard

- (instancetype) initWithQuestion: (NSString *) question answer: (NSString *) ans{
    self = [super init];
    if(self){
    _question = question;
    _answer = ans;
    }
    
    return self;
}

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav{
    
     self = [super init];
    if(self){
    _question = question;
    _answer = ans;
    _isFavorite = isFav;
    }
    
    return self;
}

- (instancetype) initWithDictionary: (NSDictionary *) card {
    self = [super init];
    if (self) {
        BOOL fav = NO;
        NSString* favString = [card valueForKey: kFavKey];
        if ([favString isEqualToString:kFavoriteYes]) {
            fav = YES;
        }
        
        _question = [card valueForKey: kQuestionKey];
        _answer = [card valueForKey: kAnswerKey];
        _isFavorite = fav;
    }
    return self;
}

- (NSDictionary *) dictionary {
    NSString* favorite = kFavoriteNo;
    if (self.isFavorite) {
        favorite = kFavoriteYes;
    }
    NSDictionary *card = [NSDictionary dictionaryWithObjectsAndKeys:
                          self.question, kQuestionKey,
                          self.answer, kAnswerKey,
                          favorite, kFavKey, nil];
    return card;
}

@end



