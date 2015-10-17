//
//  JokeDetailedViewController.h
//  AreYouJokingSeptOkt2015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
//Чтобы можно было видеть модель
#import "Joke.h"

@interface JokeDetailedViewController : UIViewController

@property (nonatomic, strong) Joke *joke;

@end
