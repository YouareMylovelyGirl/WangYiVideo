//
//  PlayerController.m
//  TRProject
//
//  Created by 阳光 on 2017/1/18.
//  Copyright © 2017年 Tedu. All rights reserved.
//

#import "PlayerController.h"
@import AVFoundation;

@interface PlayerController ()

//执行播放功能
@property (nonatomic, strong) AVPlayer *player;
//把播放的内容显示在页面上
@property (nonatomic, strong) AVPlayerLayer *videoView;
@end

@implementation PlayerController

- (instancetype)initWithContentURL:(NSURL *)contentURL
{
    if (self = [super init]) {
        self.contentURL = contentURL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.player = [AVPlayer playerWithURL:self.contentURL];
    [self.player play];
    
    self.videoView = [AVPlayerLayer playerLayerWithPlayer:self.player];
    [self.view.layer addSublayer:self.videoView];
    self.videoView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 300);
    
    UIButton *pauseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:pauseBtn];
    [pauseBtn setTitle:@"pause" forState:UIControlStateNormal];
    [pauseBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [pauseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.equalTo(10);
    }];
    [pauseBtn bk_addEventHandler:^(id sender) {
        [self.player pause];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:backBtn];
    [backBtn setTitle:@"back" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(pauseBtn.mas_right).offset(10);
    }];
    [backBtn bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *playerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:playerBtn];
    [playerBtn setTitle:@"play" forState:UIControlStateNormal];
    [playerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(backBtn.mas_right).offset(10);
    }];
    [playerBtn bk_addEventHandler:^(id sender) {
        [self.player play];
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UISlider *slider = [UISlider new];
    slider.minimumValue = 0;
    slider.maximumValue = 1;
    [self.view addSubview:slider];
    [slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(40);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [slider bk_addEventHandler:^(id sender) {
        //控制播放的音量
        self.player.volume = slider.visibleAlpha;
    } forControlEvents:UIControlEventValueChanged];
    
    
    UIProgressView *pv = [[UIProgressView alloc]init];
    [self.view addSubview:pv];
    [pv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(slider);
        make.top.mas_equalTo(slider.mas_bottom).offset(20);
    }];
    [NSTimer bk_scheduledTimerWithTimeInterval:0.1 block:^(NSTimer *timer) {
        //当前播放的描述
        Float64 currentS = CMTimeGetSeconds(self.player.currentTime);
        Float64 totalS = CMTimeGetSeconds(self.player.currentItem.duration);
        pv.progress = currentS / totalS;
    } repeats:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //页面消失时,把播放器关掉
    self.player.rate = 0;
    self.player = [AVPlayer playerWithPlayerItem:nil];
    [self.player.currentItem cancelPendingSeeks];
    [self.player.currentItem.asset cancelLoading];
    self.player = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
