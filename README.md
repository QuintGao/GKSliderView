# GKSliderView
iOS - 自定义一个滑杆控件

##前言
最近做项目需要用到滑杆，但是用系统的UISlider发现并不能满足需求，于是自定义了一个滑杆。

##说明
本次自定义的滑杆是继承与UIView，里面加了一个自定义带菊花的UIButton作为滑块，用三个UIImageView来作为滑杆的背景、进度及滑过后的视图，可分别设置颜色或图片，另外为滑杆添加了滑动、点击的手势，可分别监听滑杆开始滑动、滑动中、结束滑动、点击的代理。话不多少，直接上图

![gkslider.gif](http://upload-images.jianshu.io/upload_images/1598505-755571d987ee0c5d.gif?imageMogr2/auto-orient/strip)

##主要代码
算了就不贴了，想看的可以到github下载。

##使用方法

```
self.slider = [GKSliderView new];
// 设置代理
self.slider.delegate = self;
// 默认滑杆颜色
self.slider.maximumTrackTintColor = [UIColor lightGrayColor];
// 设置滑杆进度颜色
self.slider.bufferTrackTintColor  = [UIColor whiteColor];
// 设置滑杆滑过颜色
self.slider.minimumTrackTintColor = [UIColor redColor];

// 设置滑块的图片
[self.slider setBackgroundImage:[UIImage imageNamed:@"cm2_fm_playbar_btn_dot"] forState:UIControlStateNormal];
[self.slider setThumbImage:[UIImage imageNamed:@"cm2_fm_playbar_btn"] forState:UIControlStateNormal];

// 显示菊花动画
[self.slider showLoading];
// 设置滑杆高度
self.slider.sliderHeight = 3;
```

简书：[iOS--自定义滑杆GKSliderView](http://www.jianshu.com/p/b0631a206b2a)

