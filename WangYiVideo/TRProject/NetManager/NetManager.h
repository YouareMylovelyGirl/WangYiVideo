//
//  NetManager.h
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "BaseNetManager.h"
#import "NewsVideoItem.h"
@interface NetManager : BaseNetManager

+ (id)GETNewsVideoItem:(NSInteger)page completionHandler:(void(^)(NewsVideoItem *newsVideos, NSError *error))completionHandler;
@end
