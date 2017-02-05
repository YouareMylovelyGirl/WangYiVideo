//
//  UIView+HUD.m
//  QuanMinLive
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
- (void)showHUD
{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:10];
}

- (void)hideHUD
{
    [MBProgressHUD hideAllHUDsForView:self animated:YES];
}

- (void)showMessage:(NSString *)message
{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:1];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
}
@end
