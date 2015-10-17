//
//  Joke.m
//  AreYouJokingSeptOkt2015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "Joke.h"

@implementation Joke

+ (Joke *)jokeFromDictionary:(NSDictionary *)info {
    
    //Создали объект класса Joke
    Joke *aJoke = [Joke new];
    
    //Начинаем выдирать данные
    aJoke.url = info[@"link"];
    aJoke.sourceSite = info[@"desc"];
    aJoke.html = info[@"elementPureHtml"];
    
    return aJoke;
}

@end
