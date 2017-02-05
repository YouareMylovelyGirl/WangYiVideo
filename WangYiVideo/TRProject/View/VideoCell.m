//
//  VideoCell.m
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

+ (id)getIndexNumber:(void (^)(void))indexNumber
{
    return self;
}

- (UIImageView *)backImageView {
    if(_backImageView == nil) {
        _backImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat scale = 27 / 48.0;
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            CGFloat height = width * scale;
            make.top.left.offset(0);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(height);
        }];
    }
    return _backImageView;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:17];
        _titleLB.numberOfLines = 2;
        _titleLB.textColor = [UIColor whiteColor];
        [self.backImageView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(10);
            make.left.offset(5);
            make.right.offset(-5);
        }];
    }
    return _titleLB;
}

- (UILabel *)timeAndCountsLB {
    if(_timeAndCountsLB == nil) {
        _timeAndCountsLB = [[UILabel alloc] init];
        _timeAndCountsLB.font = [UIFont systemFontOfSize:13];
        _timeAndCountsLB.textColor = [UIColor whiteColor];
        [self.backImageView addSubview:_timeAndCountsLB];
        [_timeAndCountsLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-5);
            make.bottom.offset(-10);
        }];
    }
    return _timeAndCountsLB;
}

- (UIImageView *)headIV {
    if(_headIV == nil) {
        _headIV = [[UIImageView alloc] init];
        _headIV.layer.cornerRadius = 5;
        [self.contentView addSubview:_headIV];
        [_headIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.top.mas_equalTo(self.backImageView.mas_bottom).offset(10);
            make.size.offset(30);
            make.bottom.offset(-10);
        }];
    }
    return _headIV;
}

- (UILabel *)nickName {
    if(_nickName == nil) {
        _nickName = [[UILabel alloc] init];
        [self.contentView addSubview:_nickName];
        [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.headIV.mas_right).offset(5);
            make.centerY.mas_equalTo(self.headIV.mas_centerY);
        }];
    }
    return _nickName;
}

- (UILabel *)repeatCount {
    if(_repeatCount == nil) {
        _repeatCount = [[UILabel alloc] init];
        [self.contentView addSubview:_repeatCount];
        [_repeatCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.shareButton.mas_left).offset(-20);
            make.centerY.mas_equalTo(self.shareButton);
        }];
    }
    return _repeatCount;
}

- (UIButton *)shareButton {
    if(_shareButton == nil) {
        _shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"html_share_night"] forState:UIControlStateNormal];
        [_shareButton setBackgroundImage:[UIImage imageNamed:@"html_share"] forState:UIControlStateHighlighted];
        [_shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_shareButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [_shareButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_shareButton];
        [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-10);
            make.centerY.mas_equalTo(self.nickName.mas_centerY);
            make.size.mas_equalTo(20);
        }];
    }
    return _shareButton;
}

- (void)btnClick:(UIButton *)sender
{
    !self.btnClickPath ?: self.btnClickPath(self.ip);
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
