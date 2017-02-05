//
//  NSObject+Parse.h
//  QuanMinLive
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel>
+ (id)parse:(id)JSON;
@end
