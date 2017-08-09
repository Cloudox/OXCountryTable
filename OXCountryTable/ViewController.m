//
//  ViewController.m
//  OXCountryTable
//
//  Created by Cloudox on 2017/8/9.
//  Copyright © 2017年 Tencare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *countryArray;
@property (nonatomic, strong) NSMutableArray *countryCodeArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.countryArray = [[NSMutableArray alloc] init];
    self.countryCodeArray = [[NSMutableArray alloc] init];
    NSLocale *locale = [NSLocale currentLocale];
    NSArray *countryArray = [NSLocale ISOCountryCodes];
    for (NSString *countryCode in countryArray) {
        if ([countryCode isEqualToString:@"CN"]) {
            [self.countryCodeArray insertObject:countryCode atIndex:0];
            NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
            [self.countryArray insertObject:displayNameString atIndex:0];
            continue;
        }
        [self.countryCodeArray addObject:countryCode];
        NSString *displayNameString = [locale displayNameForKey:NSLocaleCountryCode value:countryCode];
        [self.countryArray addObject:displayNameString];
        
    }
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
}

#pragma mark - UITableView Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.countryArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *SimpleCell = @"SimpleCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: SimpleCell];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleCell];
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = self.countryArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.countryCodeArray[indexPath.row]];
    
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
