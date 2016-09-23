//
//  ViewController.m
//  16_09_22_UITableView展示图片
//
//  Created by 姚懿恒 on 2016/9/22.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark 因为采用的是plain格式, 所以只返回1组.
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark 返回的那一组中, 一共包括多少行. 切记不能与之上的方法记反.
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 9;
}

#pragma mark  返回cell, 每一行需要具体显示的内容.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    /*
    系统提供的cell有4种:
     UITableViewCellStyleDefault,	// Simple cell with text label and optional image view (behavior of UITableViewCell in iPhoneOS 2.x)
     UITableViewCellStyleValue1,		// Left aligned label on left and right aligned label on right with blue text (Used in Settings)
     UITableViewCellStyleValue2,		// Right aligned label on left with blue text and left aligned label on right (Used in Phone/Contacts)
     UITableViewCellStyleSubtitle	// Left aligned label on top and left aligned label on bottom with gray text (Used in iPod).
     
     比较常用的为项目中的这种.
     */
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    NSString *imgName = [NSString stringWithFormat:@"m%ld.png", indexPath.row + 1];
    //以下6行设置cell需要显示的图片, 标签, 以及详细标签.
    cell.imageView.image = [UIImage imageNamed:imgName];

    cell.textLabel.text = [NSString stringWithFormat:@"第%ld张图片", indexPath.row +1];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"第%d张是好人",
                                 arc4random_uniform(9) + 1];
    //设置详细标签字体颜色
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];

    //设置cell最右边的东东.
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

#pragma mark 以上为数据源方法.以下为代理方法
#pragma mark 需要通过代理返回每一行的宽高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
@end
