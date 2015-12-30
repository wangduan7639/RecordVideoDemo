//
//  RecordVideoViewController.m
//  RecordVideoDemo
//
//  Created by wd on 15/12/30.
//  Copyright © 2015年 wd. All rights reserved.
//

#import "RecordVideoViewController.h"
#import "RecordVideoConfig.h"

@interface RecordVideoViewController ()<SCRecorderDelegate, SCAssetExportSessionDelegate, MBProgressHUDDelegate>

@property (nonatomic, assign) BOOL captureValidFlag;//录制的视频是否可用。
@property (nonatomic, strong) SCRecorder    *recorder;//录像机
@property (nonatomic, strong) SCRecordSession   *recordSession;//session
@property (nonatomic, strong) SCPlayer  *player;// Preview
@property (nonatomic, strong) NSTimer   *startTimer;
@property (nonatomic, strong) UIView    *scanPreviewView;
@property (nonatomic, strong) UIView    *operatorView;
@property (nonatomic, strong) UIButton  *captureTipBtn;
@property (nonatomic, strong) UIView    *middleTipView;
@property (nonatomic, strong) UILabel   *middleOperatorTip;
@property (nonatomic, strong) UIButton  *captureRealBtn;
@property (nonatomic, strong) SCRecorderToolsView   *focusView;
@property (nonatomic, strong) UIView    *middleProgressView;
@property (nonatomic, strong) NSLayoutConstraint *middleProgressViewWidthConstraint;
@property (nonatomic, strong) MBProgressHUD  *progressHUD;

@end

@implementation RecordVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.captureValidFlag = NO;
    
    [self configRecorder];
    [self configControlStyle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Config
- (void)configRecorder {
    _recorder = [SCRecorder recorder];
    _recorder.captureSessionPreset = [SCRecorderTools bestCaptureSessionPresetCompatibleWithAllDevices];
    _recorder.maxRecordDuration = CMTimeMake(30 * VIDEO_MAX_TIME, 30);
    _recorder.delegate = self;
    _recorder.videoConfiguration.size = CGSizeMake(640, 640);
    _recorder.autoSetVideoOrientation = NO;
    
    self.scanPreviewView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenWidth)];
    UIView *previewView = self.scanPreviewView;
    _recorder.previewView = previewView;
    
    self.focusView = [[SCRecorderToolsView alloc] initWithFrame:previewView.bounds];
    self.focusView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    self.focusView.recorder = _recorder;
    [previewView addSubview:self.focusView];
    
    //聚焦图片
//    self.focusView.outsideFocusTargetImage = [UIImage imageNamed:@""];
    _recorder.initializeSessionLazily = NO;
    
    NSError *error;
    if (![_recorder prepare:&error]) {
        NSLog(@"Prepare error: %@", error.localizedDescription);
    }
}

- (void)configControlStyle {
    self.middleProgressView.backgroundColor = KColor(42, 200, 0);
    [self.captureTipBtn setTitleColor:KColor(216, 0, 40) forState:UIControlStateNormal];
    self.captureTipBtn.layer.borderColor = [KColor(42, 200, 0) CGColor];
    [self.captureTipBtn setTitle:@"按住拍" forState:UIControlStateNormal];
}


@end
