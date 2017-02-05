//
//  PlayerController.h
//  TRProject
//
//  Created by 阳光 on 2017/1/18.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerController : UIViewController
- (instancetype)initWithContentURL:(NSURL *)contentURL;
@property (nonatomic, strong) NSURL *contentURL;
@end
