//
//  UIScrollView+Refresh.m
//  QuanMinLive
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
- (void)addHeaderRefresh:(void (^)())block
{
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}

- (void)addFooterRefresh:(void (^)())block
{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

- (void)beginHeaderRefresh
{
    [self.mj_header beginRefreshing];
}

- (void)endHeaderRefresh
{
    [self.mj_header endRefreshing];
}

- (void)beginFooterRefresh
{
    [self.mj_footer beginRefreshing];
}

- (void)endFooterRefresh
{
    [self.mj_footer endRefreshing];
}

- (void)endRefreshWithNoMoreData
{
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (void)resetNoMoreData
{
    [self.mj_footer resetNoMoreData];
}
@end
