//
//  SSViewController.m
//  SSTableViewCell
//
//  Created by Six on 14-9-10.
//  Copyright (c) 2014年 Shingwa Six. All rights reserved.
//

#import "SSViewController.h"
#import "SSUserTableViewCell.h"

@interface SSViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *users;
@end

@implementation SSViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"users" ofType:@"json"];
        NSAssert(path, @"Where is the 'users.json'?");
        
        id json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:0 error:nil];
        NSMutableArray *users = [NSMutableArray array];
        NSAssert([json isKindOfClass:[NSArray class]], @"Json object should be a array.");
        NSMutableString *signature = [NSMutableString stringWithString:@"呵"];
        for (id tmp in json) {
            SSUserInfo *user = [SSUserInfo userWithJSON:tmp];
            if (user) {
                user.signature = signature;
                [users addObject:user];
                [signature appendString:@"呵"];
            }
        }
        self.users = users;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [SSUserTableViewCell height];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SSUserTableViewCell *cell = [SSUserTableViewCell cell:tableView];
    if (indexPath.row < _users.count) {
        cell.user = _users[indexPath.row];
    }
    return cell;
}

@end
