//
//  MeaningsTableViewController.m
//  Meanings
//
//  Created by Budumuru, Manoj on 2/8/17.
//  Copyright © 2017 Budumuru, Manoj. All rights reserved.
//

#import "MeaningsTableViewController.h"
#import "MeaningsDataManager.h"

@interface MeaningsTableViewController ()
@property (nonatomic) NSArray* meaningsArray;
@end

@implementation MeaningsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _meaningsArray= [[NSArray alloc]initWithArray:[MeaningsDataManager sharedManager].meanings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _meaningsArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    NSString* headding = [NSString stringWithFormat:@"Meanings of %@", [MeaningsDataManager sharedManager].title];
    return headding;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
    }
    cell.textLabel.text = [_meaningsArray objectAtIndex:indexPath.row];
    return cell;
}

@end
