//
//  ViewController.m
//  GKSliderView
//
//  Created by QuintGao on 2017/9/6.
//  Copyright © 2017年 高坤. All rights reserved.
//

#import "ViewController.h"

#import "GKSliderView.h"

@interface ViewController ()<GKSliderViewDelegate>

@property (weak, nonatomic) IBOutlet GKSliderView *slider;

@property (weak, nonatomic) IBOutlet UISlider *bufferSlider;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;
@property (weak, nonatomic) IBOutlet UIButton *loadingBtn;
@property (weak, nonatomic) IBOutlet UIButton *heightBtn;

@property (nonatomic, assign) BOOL isShowLoading;
@property (nonatomic, assign) CGFloat sliderH;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.slider.backgroundColor = [UIColor blackColor];
    
    self.slider.delegate = self;
    
    self.slider.maximumTrackTintColor = [UIColor lightGrayColor];
    
    self.slider.bufferTrackTintColor  = [UIColor whiteColor];
    
    self.slider.minimumTrackTintColor = [UIColor redColor];
    
    // 设置滑块的图片
    [self.slider setBackgroundImage:[UIImage imageNamed:@"cm2_fm_playbar_btn_dot"] forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];
    
    // loading默认显示
    self.isShowLoading = YES;
    self.sliderH = 3;
    
    self.bufferSlider.value = 0;
    self.valueSlider.value  = 0;
}

- (IBAction)bufferValue:(id)sender {
    self.slider.bufferValue = self.bufferSlider.value;
}

- (IBAction)value:(id)sender {
    self.slider.value = self.valueSlider.value;
}

- (IBAction)loadingClick:(id)sender {
    if (self.isShowLoading) {
        [self.slider hideLoading];
        [self.loadingBtn setTitle:@"显示加载" forState:UIControlStateNormal];
    }else{
        [self.slider showLoading];
        [self.loadingBtn setTitle:@"隐藏加载" forState:UIControlStateNormal];
    }
    self.isShowLoading = !self.isShowLoading;
}

- (IBAction)heightClick:(id)sender {
    // 1,2,3
    // 默认滑杆的高度是3
    if (self.sliderH == 3) {
        self.sliderH = 2;
    }else if (self.sliderH == 2) {
        self.sliderH = 1;
    }else {
        self.sliderH = 3;
    }
    self.slider.sliderHeight = self.sliderH;
}

#pragma mark - delegate
- (void)sliderTouchBegin:(float)value {
    NSLog(@"滑杆开始滑动===%f", value);
}

- (void)sliderTouchEnded:(float)value {
    NSLog(@"滑杆结束滑动===%f", value);
}

- (void)sliderValueChanged:(float)value {
    NSLog(@"滑杆滑动中===%f", value);
}

- (void)sliderTapped:(float)value {
    NSLog(@"滑杆点击====%f", value);
}


@end
