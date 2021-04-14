//
//  GKViewController.m
//  GKSliderView
//
//  Created by 1094887059@qq.com on 08/20/2020.
//  Copyright (c) 2020 1094887059@qq.com. All rights reserved.
//

#import "GKViewController.h"
#import <GKSliderView/GKSliderView.h>

typedef NS_ENUM(NSUInteger, GradientType) {// 渐变方向
    GradientTypeTopToBottom      = 0, // 从上到下
    GradientTypeLeftToRight      = 1, // 从左到右
    GradientTypeUpleftToLowright = 2, // 左上到右下
    GradientTypeUprightToLowleft = 3, // 右上到左下
};

@interface GKViewController ()<GKSliderViewDelegate>

@property (weak, nonatomic) IBOutlet GKSliderView *wySliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *wyImgSliderView;


@property (weak, nonatomic) IBOutlet GKSliderView *pkSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *progressView;

@property (weak, nonatomic) IBOutlet GKSliderView *gradientSliderView;


@end

@implementation GKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self initSlider];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
    
    self.gradientSliderView.maximumTrackTintColor = UIColor.whiteColor;
    self.gradientSliderView.sliderHeight = 6;
    self.gradientSliderView.bgCornerRadius = 3;
    self.gradientSliderView.value = 0.5;
    self.gradientSliderView.delegate = self;
    [self.gradientSliderView setBackgroundImage:[UIImage imageNamed:@"cm2_fm_playbar_btn_dot"] forState:UIControlStateNormal];
    [self.gradientSliderView setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];
    [self sliderValueChanged:0.5];
}

#pragma mark - GKSliderViewDelegate
- (void)sliderTouchBegan:(float)value {
    
}

- (void)sliderTouchEnded:(float)value {
    
}

- (void)sliderValueChanged:(float)value {
    CGFloat width = self.gradientSliderView.frame.size.width * value;
    CGFloat height = self.gradientSliderView.frame.size.height;
    CGSize size = CGSizeMake(width, height);
    
    self.gradientSliderView.minimumTrackTintColor = [self gradientColorImageFromColors:@[UIColor.greenColor, UIColor.blueColor] gradientType:GradientTypeLeftToRight imgSize:size];
}

- (void)sliderTapped:(float)value {
    
}

#pragma mark - Color Extension
- (UIColor *)gradientColorImageFromColors:(NSArray *)colors
                             gradientType:(GradientType)gradientType
                                  imgSize:(CGSize)imgSize {
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(imgSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    
    switch (gradientType) {
        case GradientTypeTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        case GradientTypeLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, 0.0);
            break;
        case GradientTypeUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imgSize.width, imgSize.height);
            break;
        case GradientTypeUprightToLowleft:
            start = CGPointMake(imgSize.width, 0.0);
            end = CGPointMake(0.0, imgSize.height);
            break;
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
