//
//  BaseNetManager.h
//  TRProject
//
//  Created by 阳光 on 2017/1/16.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void(^)(id obj, NSError *error))compltionHandler;
@end
