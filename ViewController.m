//
//  ViewController.m
//  16_09_22_UITableView展示图片
//
//  Created by 姚懿恒 on 2016/9/22.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "ViewController.h"
#import "Product.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    //设置为可变数组
    NSMutableArray *_allProduct;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadProdectList];


}
# pragma mark 加载产品列表
-(NSMutableArray *)loadProdectList{

    _allProduct = [NSMutableArray array];

    for (int i = 0; i < 20; i++) {
        NSString *proName = [NSString stringWithFormat:@"产品%d", i+1];
        NSString *iconName = [NSString stringWithFormat:@"m%d.png", (i%9) + 1];
        NSString *discri = [NSString stringWithFormat:@"%@产品好", proName];

        Product *item = [Product productWithName:proName icon:iconName productDiscription:discri];
        [_allProduct addObject:item];
        
    }

    return _allProduct;
}
//若不实现该方法, 则默认为1组.
//#pragma mark 因为采用的是plain格式, 所以只返回1组.
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
#pragma mark 返回的那一组中, 一共包括多少行. 切记不能与之上的方法记反.
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //数组中有多少个成员就返回多少行.
    return [_allProduct count];
}

#pragma mark  返回cell, 每一行需要具体显示的内容.
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //拿到数组中对于行数的那个产品.
    Product *item = _allProduct[indexPath.row];

    //创建cell, 并将其设置为UITableViewCellStyleSubtitle
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];


    //以下6行设置cell需要显示的图片, 标签, 以及详细标签.
    cell.imageView.image = [UIImage imageNamed:item.icon];

    cell.textLabel.text = item.productName;
    cell.detailTextLabel.text = item.productDiscription;
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
