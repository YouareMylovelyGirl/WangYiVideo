//
//  NSString+YX.m
//  Day07_Hero
//
//  Created by tarena on 2017/1/7.
//  Copyright © 2017年 tarena. All rights reserved.
//

#import "NSString+YX.h"

@implementation NSString (YX)

- (NSURL *)yx_URL{
    return [NSURL URLWithString:self];
}

- (NSString *)yx_dateFormat{

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.doubleValue];

    NSDateFormatter *formatter = [NSDateFormatter new];
    //获取当前日历
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    //把格林威治时间 转为 北京时间
    NSTimeInterval delta = [[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate *dateNow = [[NSDate date] dateByAddingTimeInterval:delta];
    //计算本地时间 和 服务器传递过来的事件的 差额
    NSDateComponents *components = [calendar components:NSCalendarUnitDay fromDate:date toDate:dateNow options:0];
    if (components.day == 0) { //一天内
        //aa: 上下午，AM/PM
        formatter.dateFormat = @"aa hh:mm"; //12进制
        NSString *time = [formatter stringFromDate:date];
        return time;
    }
    if (components.day == 1) { //昨天
        formatter.dateFormat = @"HH:mm";
        return [@"昨天" stringByAppendingString:[formatter stringFromDate:date]];
    }
    if (components.day > 1) { //昨天以前的
        formatter.dateFormat = @"MM-dd";
        return [formatter stringFromDate:date];
    }
    return nil;
}

@end
















