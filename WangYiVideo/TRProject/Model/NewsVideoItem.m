//
//  NewsVideoItem.m
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "NewsVideoItem.h"

@implementation NewsVideoItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"videoSidList":@"NewsVideoVideosidlistItem",
             @"videoList":@"NewsVideoVideolistItem"
             };
}
@end
@implementation NewsVideoVideosidlistItem

@end


@implementation NewsVideoVideolistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"des":@"description"
             };
}
@end


@implementation NewsVideoVideolistVideotopicItem

@end


