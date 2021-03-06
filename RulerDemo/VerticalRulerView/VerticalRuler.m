//
//  VerticalRuler.m
//  RulerDemo
//
//  Created by gs_sh on 2017/12/18.
//  Copyright © 2017年 Remover. All rights reserved.
//

#import "VerticalRuler.h"

#import "STLoopProgressView.h"

#define degressToRadian(x) (M_PI * (x)/180.0)

@interface VerticalRuler ()
{
    CGFloat initValue;
    CGFloat minValue;
    CGFloat maxValue;
    CGFloat lineWidth;
}
@property (retain, nonatomic) STLoopProgressView *loopProgressView;
@property (retain, nonatomic) UISlider *slider;

@end

@implementation VerticalRuler

- (void)defaultValue {
    minValue = 50;
    maxValue = 100;
    initValue = 0.5*(maxValue-minValue)+minValue;
    lineWidth = 10;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor cyanColor];
        [self defaultValue];
        [self configWithFrame:frame];
    }
    return self;
}

- (void)configWithFrame:(CGRect)frame
{
    self.loopProgressView = [[STLoopProgressView alloc] initWithFrame:(CGRectMake(0, 0, frame.size.width, frame.size.height))];
    [self addSubview:_loopProgressView];
    
    CGFloat sizeW = frame.size.width;
    CGFloat sizeH = frame.size.height;
    CGFloat x = (sizeW-sizeH)/2;
    CGFloat y = (sizeH-lineWidth)/2;
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(x, y, frame.size.height, lineWidth)];
    
    //设置滑块图标图片
    [_slider setThumbImage:[UIImage imageNamed:@"rulerBtn"] forState:UIControlStateNormal];
    //设置点击滑块状态图标
    [_slider setThumbImage:[UIImage imageNamed:@"rulerBtn"] forState:UIControlStateHighlighted];
    
    //设置背景颜色
    [_slider setMinimumTrackTintColor:[UIColor clearColor]];
    [_slider setMaximumTrackTintColor:[UIColor clearColor]];
    
    //设置旋转
    CGAffineTransform rotation = CGAffineTransformMakeRotation(degressToRadian(-90));
    _slider.transform = rotation;
    
    //设置最小数
    _slider.minimumValue = minValue;
    //设置最大数
    _slider.maximumValue = maxValue;
    //设置起始位置
    _slider.value = initValue;
    
    
    //设置委托事件
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self action:@selector(sliderTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加到VIEW
    [self addSubview:_slider];
}

- (void)setRulerMinValue:(CGFloat)rulerMinValue {
    _slider.minimumValue = rulerMinValue;
}

- (void)setRulerMaxValue:(CGFloat)rulerMaxValue {
    _slider.maximumValue = rulerMaxValue;
}

- (void)setRulerInitValue:(CGFloat)rulerInitValue {
    _slider.value = rulerInitValue;
    
    CGFloat persentageValue = (_slider.value - _slider.minimumValue)/(_slider.maximumValue - _slider.minimumValue);
    _loopProgressView.persentage = persentageValue;
}


- (void)sliderValueChanged:(UISlider *)slider {
    CGFloat persentageValue = (slider.value - slider.minimumValue)/(slider.maximumValue - slider.minimumValue);
    _loopProgressView.persentage = persentageValue;
    if (self.valueChanged) {
        self.valueChanged(slider.value, persentageValue);
    }
}

- (void)sliderTouchUpInside:(UISlider *)slider {
    CGFloat persentageValue = (slider.value - slider.minimumValue)/(slider.maximumValue - slider.minimumValue);
    if (self.touchUpInside) {
        self.touchUpInside(slider.value, persentageValue);
    }
}


@end
