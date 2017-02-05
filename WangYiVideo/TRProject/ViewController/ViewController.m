//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"
#import "NetManager.h"
#import "VideoCell.h"
#import "NewsVideoItem.h"
#import "PlayerController.h"

#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>

//xcode7之后, 引入系统类库的方式
@import MediaPlayer;

//ios8 之后 推荐的播放器
@import AVFoundation;//提供播放功能
@import AVKit;//提供播放器界面

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *videosList;
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) UITableViewCell *selectCell;
@property (nonatomic, strong) NSIndexPath *indexPath;


@end
@implementation ViewController

static NSString * const ID = @"Cell";


- (void)viewDidLoad{
    [super viewDidLoad];
    self.navigationItem.title = @"网易视频";
    self.pageNum = 1;
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 1)];
    typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [NetManager GETNewsVideoItem:1 completionHandler:^(NewsVideoItem *newsVideos, NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            if (!error) {
                [weakSelf.videosList removeAllObjects];
                [weakSelf.videosList addObjectsFromArray:newsVideos.videoList];
                [weakSelf.tableView reloadData];
                if (newsVideos.videoList.count < 10) {
                    [weakSelf.tableView endRefreshWithNoMoreData];
                }
                else
                {
                    [weakSelf.tableView resetNoMoreData];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView addFooterRefresh:^{
        [NetManager GETNewsVideoItem:self.pageNum + 10 completionHandler:^(NewsVideoItem *newsVideos, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            if (!error) {
                weakSelf.pageNum += 10;
                [weakSelf.videosList addObjectsFromArray:newsVideos.videoList];
                [weakSelf.tableView reloadData];
                if (newsVideos.videoList.count < 10) {
                    [weakSelf.tableView endRefreshWithNoMoreData];
                }
            }
        }];
    }];
    [self.tableView registerClass:[VideoCell class] forCellReuseIdentifier:ID];
    
}


//分享链接地址
- (void)shareVideo:(NSString *)path
{
    //1、创建分享参数
    NSArray* imageArray = @[[UIImage imageNamed:@"html_share_night"]];
    //（注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:imageArray
                                            url:[NSURL URLWithString:path]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];}
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark - UITableViewDatasourse

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.videosList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    NewsVideoVideolistItem *item = self.videosList[indexPath.section];
    [cell.backImageView setImageURL:[NSURL URLWithString:item.cover]];
    cell.titleLB.text = item.topicDesc;
    NSString *timeLb = [NSString stringWithFormat:@"%02ld:%02ld",item.length/60,item.length%60];
    cell.timeAndCountsLB.text = [NSString stringWithFormat:@"%@ / %ld播放",timeLb, item.playCount];
    [cell.headIV setImageURL:[NSURL URLWithString:item.topicImg]];
    cell.nickName.text = item.topicName;
    cell.repeatCount.text = [NSString stringWithFormat:@"%ld", item.playCount];
    
    cell.ip = indexPath;
    cell.btnClickPath = ^(NSIndexPath *ip){
        NewsVideoVideolistItem *item = self.videosList[ip.section];
        [self shareVideo:item.m3u8_url];
    };
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:ID configuration:^(VideoCell *cell) {
        NewsVideoVideolistItem *item = self.videosList[indexPath.section];
        [cell.headIV setImageURL:[NSURL URLWithString:item.topicImg]];
        [cell.backImageView setImageURL:[NSURL URLWithString:item.cover]];
    }];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsVideoVideolistItem *item = self.videosList[indexPath.section];
    NSURL *videoUrl = item.m3u8_url.yx_URL;
    /* MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];*/
    /*
     AVPlayerViewController *vc = [AVPlayerViewController new];
     [vc.player play];
     vc.player = [AVPlayer playerWithURL:videoUrl];
     [self presentViewController:vc animated:YES completion:nil];*/
    PlayerController *vc = [[PlayerController alloc]initWithContentURL:videoUrl];
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

- (NSMutableArray *)videosList {
    if(_videosList == nil) {
        _videosList = [[NSMutableArray alloc] init];
    }
    return _videosList;
}

@end
