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
        NSString *proName = [NSString stringWithFormat:@"图片%d", i+1];
        NSString *iconName = [NSString stringWithFormat:@"m%d.png", (i%9) + 1];
        NSString *discri = [NSString stringWithFormat:@"%@好", proName];

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
#pragma mark 选中了某一行的cell就会调用该方法.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"第%ld行被点击了", indexPath.row+1);
    Product *item = _allProduct[indexPath.row];

    //preferredStyle中有UIAlertControllerStyleAlert与UIAlertControllerStyleActionSheet
    //若想要警告框中能够有输入框, 则使用前者.
    UIAlertController *alertControl = [UIAlertController
                                       alertControllerWithTitle:@"图片名称"
                                                        message:@"输入新名称, 点击确定修改."
                                                preferredStyle:UIAlertControllerStyleAlert];




    //如果是UIAlertControllerStyleActionSheet 不能使用添加输入框的方法

    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //普通按钮
        NSLog(@"我是普通按钮");

    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //取消按钮
        NSLog(@"我是取消按钮");
    }];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //添加输入框(已经自动add，不需要手动)

    textField.text = item.productName;


        //增加占位符跟密码输入
//        textField.placeholder = @"输入产品名";
//        textField.secureTextEntry = YES;

        //监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listeningTextField:) name:UITextFieldTextDidChangeNotification object:textField];

    }];





    //添加按钮（按钮的排列与添加顺序一样，唯独取消按钮会一直在最下面）
    [alertControl addAction:okAction];//ok
//    [alertControl addAction:aaaAction];//aaa
    [alertControl addAction:cancelAction];//cancel


    //显示警报框
    [self presentViewController:alertControl animated:YES completion:nil];
}

//监听弹框上的输入内容的变化
-(void)listeningTextField:(NSNotification *)notionfication
{

    UITextField *thisTextField = (UITextField*)notionfication.object;

    NSLog(@"%@",thisTextField.text);
}

@end
