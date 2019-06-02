//
//  ViewController.m
//  可爱程序
//
//  Created by karen on 2019/6/2.
//  Copyright © 2019 Karen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
}

#pragma mark - UItableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0){
        return 2;
    }else {
        return 3;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0){
        if (indexPath.row == 0){
            cell.textLabel.text = @"企鹅🐧";
            cell.imageView.image = [UIImage imageNamed:@"企鹅"];
            //(打勾） cell.accessoryType = UITableViewCellAccessoryCheckmark;
            // (开关）cell.accessoryType = [[UISwitch alloc] init];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"熊熊🐻";
            cell.imageView.image = [UIImage imageNamed:@"熊熊"];
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0){
            cell.textLabel.text = @"熊猫🐼";
            cell.imageView.image = [UIImage imageNamed:@"熊猫"];
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"蝴蝶🦋";
            cell.imageView.image = [UIImage imageNamed:@"蝴蝶"];
        }else if (indexPath.row == 2){
            cell.textLabel.text = @"狐狸🦊";
            cell.imageView.image = [UIImage imageNamed:@"狐狸"];
        }
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0){
        return @"可爱的嘞";
    }else {
        return @"巨可爱的嘞";
    }
}









@end
