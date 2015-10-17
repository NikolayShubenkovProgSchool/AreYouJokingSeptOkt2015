//
//  JokesViewController.m
//  AreYouJokingSeptOkt2015
//
//  Created by Nikolay Shubenkov on 17/10/15.
//  Copyright © 2015 Nikolay Shubenkov. All rights reserved.
//

#import "JokesViewController.h"

#import "JokeDetailedViewController.h"

#import "Joke.h"

@interface JokesViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *jokes;

@end

@implementation JokesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[JokeDetailedViewController class]]){
        JokeDetailedViewController *jvc = segue.destinationViewController;
        //Т.к. Именно от нажатия на ячейку была привязка к переходу, то мы знаем, что sender - это UITableViewCell
        UITableViewCell *acell = sender;
        
        //Запросим индекс ячейки
        NSIndexPath *cellIndex = [self.tableView indexPathForCell:acell];
        
        // Найдем шутку в соответствии с индексов ячейки
        Joke *joke = self.jokes[cellIndex.row];
        
        jvc.joke = joke;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.jokes.count == 0){
        [self updateData];
    }
}
//Загрузим данные из сети
- (void)updateData {
    
    //1
    NSString *urlString = @"http://www.umori.li/api/get?site=bash.im&name=bash&num=5";
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        id parsedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",parsedData);
        [self parseData:parsedData];
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.jokes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Joke *joke = self.jokes[indexPath.row];
    
    cell.textLabel.text = joke.html;
    
    return cell;
}

//Внутри jokes содержится текстовое описание шуток по ключам
- (void)parseData:(NSArray *)jokes {
    //Создайте массив шуток самостоятельно
    NSMutableArray *parsedJokes = [NSMutableArray new];
    
    for (NSDictionary *info in jokes){
        //Сконвертировали данные из словаря в объект класса Joke
        Joke *aJoke = [Joke jokeFromDictionary:info];
        [parsedJokes addObject:aJoke];
    }
    
    self.jokes = parsedJokes;
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.tableView reloadData];
    }];
}

@end