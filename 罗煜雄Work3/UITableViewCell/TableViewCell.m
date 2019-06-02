//
//  TableViewCell.m
//  UITableViewCell
//
//  Created by 黄毛鸭 on 2019/6/2.
//  Copyright © 2019 黄毛鸭. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

//自定义cell的自定义控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //自定义控件
       _rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _rightButton.frame = CGRectMake(200, 10, 100, 30);
        [_rightButton setTitle:@"点击" forState:UIControlStateNormal];
        [self.contentView addSubview:_rightButton];
        
        
        _lab = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 100, 50)];
        _lab.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_lab];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
