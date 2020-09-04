//
//  GKViewController.m
//  GKSliderView
//
//  Created by 1094887059@qq.com on 08/20/2020.
//  Copyright (c) 2020 1094887059@qq.com. All rights reserved.
//

#import "GKViewController.h"
#import <GKSliderView/GKSliderView.h>

@interface GKViewController ()<GKSliderViewDelegate>

@property (weak, nonatomic) IBOutlet GKSliderView *wySliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *wyImgSliderView;


@property (weak, nonatomic) IBOutlet GKSliderView *pkSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *progressView;

@end

@implementation GKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self initSlider];
}

- (void)initSlider {
    self.wySliderView.delegate = self;
    self.wySliderView.maximumTrackTintColor = [UIColor lightGrayColor];
    self.wySliderView.minimumTrackTintColor = [UIColor redColor];
    self.wySliderView.bufferTrackTintColor = [UIColor grayColor];
    [self.wySliderView setBackgroundImage:[UIImage imageNamed:@"cm2_fm_playbar_btn_dot"] forState:UIControlStateNormal];
    [self.wySliderView setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];
    self.wySliderView.sliderHeight = 3;
    self.wySliderView.bufferValue = 0.6;
    self.wySliderView.value = 0.4;
    
    self.wyImgSliderView.delegate = self;
    [self.wyImgSliderView setThumbImage:[UIImage imageNamed:@"cm2_mv_playbar_btn_ver"] forState:UIControlStateNormal];
    [self.wyImgSliderView setThumbImage:[UIImage imageNamed:@"cm2_mv_playbar_btn_ver"] forState:UIControlStateHighlighted];
    self.wyImgSliderView.maximumTrackImage = [UIImage imageNamed:@"cm2_mv_playbar_bg_ver"];
    self.wyImgSliderView.minimumTrackImage = [UIImage imageNamed:@"cm2_mv_playbar_curr"];
    self.wyImgSliderView.bufferTrackImage  = [UIImage imageNamed:@"cm2_mv_playbar_ready_ver"];
    self.wyImgSliderView.sliderHeight      = 2;
    self.wyImgSliderView.bufferValue = 0.6f;
    self.wyImgSliderView.value = 0.4;
    
    self.pkSliderView.maximumTrackTintColor = [UIColor blueColor];
    self.pkSliderView.minimumTrackTintColor = [UIColor redColor];
    self.pkSliderView.sliderHeight = 20.0f;
    [self.pkSliderView setThumbImage:[UIImage imageNamed:@"live_pk_pro"] forState:UIControlStateNormal];
    self.pkSliderView.isSliderAllowTapped = NO;
    self.pkSliderView.isSliderBlockAllowTapped = NO;
    self.pkSliderView.bgCornerRadius = 10.0f;
    self.pkSliderView.value = 0.5;
    
    self.progressView.maximumTrackTintColor = [UIColor whiteColor];
    self.progressView.bufferTrackTintColor = [UIColor lightGrayColor];
    self.progressView.minimumTrackTintColor = [UIColor redColor];
    self.progressView.sliderHeight = 2;
    self.progressView.isHideSliderBlock = YES;
    self.progressView.isSliderAllowTapped = NO;
    self.progressView.bufferValue = 0.6;
    self.progressView.value = 0.4;
}

#pragma mark - GKSliderViewDelegate
- (void)sliderTouchBegan:(float)value {
    
}

- (void)sliderTouchEnded:(float)value {
    
}

- (void)sliderValueChanged:(float)value {
    
}

- (void)sliderTapped:(float)value {
    
}

@end
