//
//  Product.m
//  16_09_22_UITableView展示图片
//
//  Created by 姚懿恒 on 2016/9/23.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import "Product.h"

@implementation Product

+(id)productWithName:(NSString *)productName icon:(NSString *)icon productDiscription:(NSString *)productDiscription
{
    Product *product = [[Product alloc] init];
    product.icon = icon;
    product.productName = productName;
    product.productDiscription = productDiscription;

    return product;
}
@end
