//
//  NSObject+Parse.m
//  QuanMinLive
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
+ (id)parse:(id)JSON
{
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}
@end