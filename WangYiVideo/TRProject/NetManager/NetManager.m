//
//  NetManager.m
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)GETNewsVideoItem:(NSInteger)page completionHandler:(void (^)(NewsVideoItem *, NSError *))completionHandler
{
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html",page];
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([NewsVideoItem parse:obj], error);
    }];
}
@end
