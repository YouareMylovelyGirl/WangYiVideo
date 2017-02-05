//
//  NewsVideoItem.h
//  TRProject
//
//  Created by 阳光 on 2017/1/17.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewsVideoVideosidlistItem,NewsVideoVideolistItem,NewsVideoVideolistVideotopicItem;
@interface NewsVideoItem : NSObject

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<NewsVideoVideosidlistItem *> *videoSidList;

@property (nonatomic, strong) NSArray<NewsVideoVideolistItem *> *videoList;

@end
@interface NewsVideoVideosidlistItem : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *imgsrc;

@end

@interface NewsVideoVideolistItem : NSObject

@property (nonatomic, copy) NSString *ptime;

@property (nonatomic, copy) NSString *videosource;

@property (nonatomic, copy) NSString *topicImg;

@property (nonatomic, copy) NSString *topicSid;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *sectiontitle;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *m3u8_url;

@property (nonatomic, assign) NSInteger playersize;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *topicDesc;

@property (nonatomic, copy) NSString *mp4Hd_url;

@property (nonatomic, copy) NSString *replyid;

@property (nonatomic, strong) NewsVideoVideolistVideotopicItem *videoTopic;

@property (nonatomic, copy) NSString *m3u8Hd_url;

@property (nonatomic, copy) NSString *mp4_url;
//description -> des
@property (nonatomic, copy) NSString *des;

@end

@interface NewsVideoVideolistVideotopicItem : NSObject

@property (nonatomic, copy) NSString *tname;

@property (nonatomic, copy) NSString *alias;

@property (nonatomic, copy) NSString *tid;

@property (nonatomic, copy) NSString *ename;

@end

