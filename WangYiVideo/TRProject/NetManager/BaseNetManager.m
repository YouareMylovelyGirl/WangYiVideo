//
//  BaseNetManager.m
//  TRProject
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void (^)(id, NSError *))compltionHandler
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", nil];
    return [manager GET:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.response.URL.absoluteString);
        !compltionHandler ?: compltionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"-------%@",error);
        !compltionHandler ?: compltionHandler(nil, error);
    }];
}
@end
