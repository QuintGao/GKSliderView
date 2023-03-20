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

@interface GKViewController ()<GKSliderViewDelegate, GKSliderViewPreviewDelegate>

@property (weak, nonatomic) IBOutlet GKSliderView *wySliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *wyImgSliderView;


@property (weak, nonatomic) IBOutlet GKSliderView *pkSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *progressView;

@property (weak, nonatomic) IBOutlet GKSliderView *gradientSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *customSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *wxSliderView;

@property (weak, nonatomic) IBOutlet GKSliderView *lineSliderView;

@property (nonatomic, assign) BOOL isShowChange;

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
    [self sliderView:self.gradientSliderView valueChanged:0.5];
    
    self.customSliderView.delegate = self;
    self.customSliderView.previewDelegate = self;
    self.customSliderView.maximumTrackTintColor = UIColor.whiteColor;
    self.customSliderView.minimumTrackTintColor = UIColor.redColor;
    self.customSliderView.sliderHeight = 2;
    self.customSliderView.sliderBtn.backgroundColor = UIColor.whiteColor;
    self.customSliderView.sliderBtn.layer.cornerRadius = 7.0f;
    self.customSliderView.sliderBtn.layer.masksToBounds = YES;
    [self.customSliderView.sliderBtn setTitle:@"00:00/01:00" forState:UIControlStateNormal];
    [self.customSliderView.sliderBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    self.customSliderView.sliderBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    [self.customSliderView.sliderBtn sizeToFit];
    CGRect frame = self.customSliderView.sliderBtn.frame;
    frame.size.width += 4;
    frame.size.height = 14;
    self.customSliderView.sliderBtn.frame = frame;
    self.customSliderView.value = 0;
    
    // 微信播放器
    self.wxSliderView.sliderBtn.backgroundColor = UIColor.whiteColor;
    self.wxSliderView.sliderBtn.layer.masksToBounds = YES;
    self.wxSliderView.delegate = self;
    self.wxSliderView.previewDelegate = self;
    [self showSmallSlider];
    
    self.lineSliderView.maximumTrackTintColor = UIColor.grayColor;
    self.lineSliderView.bufferTrackTintColor = UIColor.lightGrayColor;
    self.lineSliderView.minimumTrackTintColor = UIColor.whiteColor;
    self.lineSliderView.sliderBtn.backgroundColor = UIColor.whiteColor;
    self.lineSliderView.sliderBtn.layer.masksToBounds = YES;
    self.lineSliderView.sliderBtn.layer.cornerRadius = 10;
    self.lineSliderView.bufferValue = 0.7;
    self.lineSliderView.value = 0.4;
    [self showLineLoading];
    
}

- (void)showSmallSlider {
    CGRect frame = self.wxSliderView.sliderBtn.frame;
    frame.size = CGSizeMake(8, 8);
    self.wxSliderView.sliderHeight = 3;
    self.wxSliderView.sliderBtn.frame = frame;
    self.wxSliderView.sliderBtn.layer.cornerRadius = 4;
}

- (void)showLargeSlider {
    CGRect frame = self.wxSliderView.sliderBtn.frame;
    frame.size = CGSizeMake(20, 20);
    self.wxSliderView.sliderHeight = 5;
    self.wxSliderView.sliderBtn.frame = frame;
    self.wxSliderView.sliderBtn.layer.cornerRadius = 10;
}

- (void)showChangeSlider {
    if (self.isShowChange) return;
    self.isShowChange = YES;
    CGRect frame = self.wxSliderView.sliderBtn.frame;
    frame.size = CGSizeMake(10, 30);
    self.wxSliderView.sliderHeight = 10;
    self.wxSliderView.sliderBtn.frame = frame;
    self.wxSliderView.sliderBtn.layer.cornerRadius = 5;
    self.wxSliderView.bgCornerRadius = 5;
}

- (void)showLineLoading {
    [self.lineSliderView showLineLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.lineSliderView hideLineLoading];
        [self performSelector:@selector(showLineLoading) withObject:nil afterDelay:3.0f];
    });
}

#pragma mark - GKSliderViewDelegate
- (void)sliderView:(GKSliderView *)sliderView touchBegan:(float)value {
    if (sliderView == self.wxSliderView) {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showSmallSlider) object:nil];
        [self showLargeSlider];
    }
}

- (void)sliderView:(GKSliderView *)sliderView touchEnded:(float)value {
    if (sliderView == self.wxSliderView) {
        self.isShowChange = NO;
        [self showLargeSlider];
        // 3秒后显示小slider
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(showSmallSlider) object:nil];
        [self performSelector:@selector(showSmallSlider) withObject:nil afterDelay:3.0f];
    }
}

- (void)sliderView:(GKSliderView *)sliderView valueChanged:(float)value {
    if (sliderView == self.gradientSliderView) {
        CGFloat width = self.gradientSliderView.frame.size.width * value;
        CGFloat height = self.gradientSliderView.frame.size.height;
        CGSize size = CGSizeMake(width, height);
        
        self.gradientSliderView.minimumTrackTintColor = [self gradientColorImageFromColors:@[UIColor.greenColor, UIColor.blueColor] gradientType:GradientTypeLeftToRight imgSize:size];
    }else if (sliderView == self.customSliderView) {
        int totalTime = 1 * 60;
        int currentTime = totalTime * value;
        NSString *total = [self timeFormattedMS:totalTime];
        NSString *current = [self timeFormattedMS:currentTime];
        NSString *text = [NSString stringWithFormat:@"%@/%@", current, total];
        [self.customSliderView.sliderBtn setTitle:text forState:UIControlStateNormal];
//        [self.customSliderView.sliderBtn sizeToFit];
//        CGRect frame = self.customSliderView.sliderBtn.frame;
//        frame.size.width += 4;
//        frame.size.height = 14;
//        self.customSliderView.sliderBtn.frame = frame;
    }else if (sliderView == self.wxSliderView) {
        [self showChangeSlider];
    }
}

- (void)sliderView:(GKSliderView *)sliderView tapped:(float)value {
    
}

#pragma mark - GKSliderViewPreviewDelegate
- (UIView *)sliderViewSetupPreview:(GKSliderView *)sliderView {
    if (sliderView == self.customSliderView) {
        GKSliderButton *preview = [GKSliderButton new];
        preview.backgroundColor = UIColor.whiteColor;
        preview.layer.cornerRadius = 10;
        preview.layer.masksToBounds = YES;
        [preview setTitle:@"00:00/01:00" forState:UIControlStateNormal];
        [preview setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        preview.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [preview sizeToFit];
        CGRect frame = preview.frame;
        frame.size.width += 6;
        frame.size.height = 20;
        preview.frame = frame;
        return preview;
    }else if (sliderView == self.wxSliderView) {
        GKSliderButton *preview = [[GKSliderButton alloc] init];
        [preview setTitle:@"00:00 / 01:00" forState:UIControlStateNormal];
        [preview setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        preview.titleLabel.font = [UIFont systemFontOfSize:15];
        [preview sizeToFit];
        CGRect frame = preview.frame;
        frame.size.width += 6;
        frame.size.height += 10;
        preview.frame = frame;
        return preview;
    }
    return nil;
}

- (CGFloat)sliderViewPreviewMargin:(GKSliderView *)sliderView {
    if (sliderView == self.customSliderView) {
        return 20;
    }else if (sliderView == self.wxSliderView) {
        return 80;
    }
    return 0;
}

- (void)sliderView:(GKSliderView *)sliderView preview:(UIView *)preview valueChanged:(float)value {
    if (sliderView == self.customSliderView) {
        GKSliderButton *btn = (GKSliderButton *)preview;
        int totalTime = 1 * 60;
        int currentTime = totalTime * value;
        NSString *total = [self timeFormattedMS:totalTime];
        NSString *current = [self timeFormattedMS:currentTime];
        NSString *text = [NSString stringWithFormat:@"%@/%@", current, total];
        [btn setTitle:text forState:UIControlStateNormal];
    }else if (sliderView == self.wxSliderView) {
        GKSliderButton *btn = (GKSliderButton *)preview;
        int totalTime = 1 * 60;
        int currentTime = totalTime * value;
        NSString *total = [self timeFormattedMS:totalTime];
        NSString *current = [self timeFormattedMS:currentTime];
        NSString *text = [NSString stringWithFormat:@"%@ / %@", current, total];
        [btn setTitle:text forState:UIControlStateNormal];
    }
}

- (NSString *)timeFormattedMS:(int)totalSeconds {
    int hours = totalSeconds / 3600;
    int minutes = (totalSeconds % 3600) / 60;
    int seconds = (totalSeconds % 3600) % 60;
    
    return [NSString stringWithFormat:@"%02d:%02d",hours * 60 + minutes, seconds];
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
