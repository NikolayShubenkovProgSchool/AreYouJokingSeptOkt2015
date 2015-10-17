//
//  Joke.h
//  AreYouJokingSeptOkt2015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Joke : NSObject

@property (nonatomic, strong) NSString *url;//ссылка на страницу в интернете
@property (nonatomic, strong) NSString *html;//сама шутка
@property (nonatomic, strong) NSString *sourceSite;//Название сайта

+ (Joke *)jokeFromDictionary:(NSDictionary *)info;

@end
