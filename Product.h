//
//  Product.h
//  16_09_22_UITableView展示图片
//
//  Created by 姚懿恒 on 2016/9/23.
//  Copyright © 2016年 姚懿恒. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *productName;
@property (nonatomic, copy) NSString *productDiscription;

+(id)productWithName:(NSString *)productName icon:(NSString *)icon productDiscription:(NSString *)productDiscription;

@end
