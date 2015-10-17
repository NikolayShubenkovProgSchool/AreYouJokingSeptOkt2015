//
//  JokeDetailedViewController.m
//  AreYouJokingSeptOkt2015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "JokeDetailedViewController.h"

@interface JokeDetailedViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation JokeDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = self.joke.html;
}

@end
