//
//  ViewController.m
//  NSURLSessionPlayground
//
//  Created by Ethan Hess on 5/26/15.
//  Copyright (c) 2015 Ethan Hess. All rights reserved.
//

#import "ViewController.h"
#import "AppResult.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=apple&media=software"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSError *serializationError;
        
        NSDictionary *serializedResults = [NSJSONSerialization JSONObjectWithData:data options:0 error:&serializationError];
        
        
        NSArray *results = serializedResults[@"results"];
        
        self.searchResults = [NSMutableArray new];
        
        for (NSDictionary *dictionary in results) {
            
            AppResult *result = [[AppResult alloc]initWithDictionary:dictionary];
            [self.searchResults addObject:result];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
            
        }
        
        
//        if (serializationError) {
//            
//            NSLog(@"%@", serializationError);
//        }
//        else {
//            
//
//            NSLog(@"%@", results[0]);
//        }
        
        
    }];
    
    [dataTask resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.searchResults.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    AppResult *result = self.searchResults[indexPath.row];
    
    cell.textLabel.text = result.appName;
    cell.detailTextLabel.text = result.developer;
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
