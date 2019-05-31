//
//  ViewController.m
//  UITableViewTest
//Table：表
//  Created by 千千 on 2019/4/23.
//  Copyright © 2019 千千. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];//Plain简朴的
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    tableView.editing = NO;//允许表格的增删
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}//此方法的返回值用于设置表格视图的分区数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //row:排 section部分
    /*设置每个分区的行数*/
    if(section ==0){
        return 10;
    }else{
        return 20;
    }
    return 20;
}
//下面展示表格数据的核心方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 分区第%ld行,昵称",indexPath.section+1,indexPath.row+1];
    cell.detailTextLabel.text = @"个性签名";
    cell.imageView.image = [UIImage imageNamed:@"a.png"];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}
//按下的响应
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);//section区，row行
}
//每格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0/*在这里写要进入某个模式的条件*/){
        return UITableViewCellEditingStyleDelete;//返回某个模式
    }else{
        return UITableViewCellEditingStyleInsert;//返回某个模式
    }
}
//移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(BOOL)tableView:(UITableView *)tableView moveRowAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath{
    return YES;
}
//自定义删除状态下右侧的文字

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
//表头，表尾
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 150;
}
//表头表尾
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    view.backgroundColor = [UIColor redColor];
    return view;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    view.backgroundColor = [UIColor blueColor];
    return view;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"A",@"B",@"C"];//返回的字符数组个数与分区的个数一一对应
}

@end
