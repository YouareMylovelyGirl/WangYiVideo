//
//  VideoCell.h
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *timeAndCountsLB;

@property (nonatomic, strong) UIImageView *headIV;
@property (nonatomic, strong) UILabel *nickName;

@property (nonatomic, strong) UILabel *repeatCount;
@property (nonatomic, strong) UIButton *shareButton;

@property (nonatomic, copy) void(^btnClickPath)(NSIndexPath *ip);
@property (nonatomic, strong) NSIndexPath *ip;

//希望cell中按钮点击之后,执行别人的方法,所以需要公开的一个参数,接受别人的参数.参数类型是 Block类型. Block类型 实际上就是方法体

@end
