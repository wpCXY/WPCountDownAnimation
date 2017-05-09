//
//  WPCountDownView.m
//  NewsPaper
//
//  Created by 王鹏 on 2017/3/30.
//  Copyright © 2017年 ciwong. All rights reserved.
//

#import "WPCountDownView.h"
#import "UIView+WPCategory.h"
#import "UIColor-Extension.h"
#define KRadius (125/2-13)
#define Animationduration 0.5

@interface WPCountDownView ()<CAAnimationDelegate>

@property (nonatomic, copy  ) CountDownComplete complete;

@property (nonatomic, assign) NSInteger animationCount;
@property (nonatomic, strong) UIImageView *backImgView;
@property (nonatomic, strong) UIImageView *countDownImgView;

@property (nonatomic, strong) CAShapeLayer *shape1Layer;
@property (nonatomic, strong) CAShapeLayer *shape2Layer;

@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation WPCountDownView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]  removeObserver:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        maskView.backgroundColor = [UIColor blackColor];
        maskView.alpha = 0.7;
        [self addSubview:maskView];
        [self addSubview:self.backImgView];
        [self.layer addSublayer:self.shape1Layer];
        [self.layer addSublayer:self.shape2Layer];
        [self addSubview:self.countDownImgView];
        _animationCount = 3;

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterBackground:)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];

    }
    return self;
}



+ (void)startCountDownAnimationInView:(UIView *)view complete:(CountDownComplete)complete {
    WPCountDownView *countDown = [[WPCountDownView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    [view addSubview:countDown];
    countDown.complete = complete;
    [countDown performSelector:@selector(startAnimation) withObject:nil afterDelay:1];
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        usleep(500000);
        if (_animationCount == 3) {
            [self startAnimation2];
        }
        if (_animationCount == 2) {
            [self Startanimation3];
        }
        if (_animationCount == 1) {
            if (_complete) {
                _complete();
            }
            [self removeFromSuperview];
            [_shape2Layer removeAllAnimations];
            [_shape1Layer removeAllAnimations];
        }
        _animationCount--;
        
    }
}
#pragma mark - 通知事件
-(void)applicationWillEnterBackground:(NSNotification *)notification{
    [self removeCountDownAnimation];
    NSLog(@"-----------程序即将进入后台------------");
}
- (void)removeCountDownAnimation {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [_shape2Layer removeAllAnimations];
    [_shape1Layer removeAllAnimations];
    [self removeFromSuperview];
}
#pragma mark - Animation
- (void)startAnimation {
    
    _countDownImgView.alpha = 0;
    _countDownImgView.image = [UIImage imageNamed:@"countDown3"];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration  = 0.5;
    animation.fromValue = @0.0f;
    animation.toValue   = @0.25f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.removedOnCompletion = NO;
    animation.fillMode=kCAFillModeForwards;
    animation.delegate = self;
    [_shape1Layer addAnimation:animation forKey:@"_shape1Layer_strokeStart_1"];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.duration  = 0.5;
    animation2.fromValue = @0;
    animation2.toValue   = @0.5f;
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation2.removedOnCompletion = NO;
    animation2.fillMode=kCAFillModeForwards;
    
    [_shape1Layer addAnimation:animation2 forKey:@"_shape1Layer_strokeEnd_1"];
    
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation3.duration  = 0.5;
    animation3.fromValue = @0.0f;
    animation3.toValue   = @0.5f;
    animation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation3.removedOnCompletion = NO;
    animation3.fillMode=kCAFillModeForwards;
    
    [_shape2Layer addAnimation:animation3 forKey:@"_shape2Layer_strokeStart_1"];
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation4.duration  = 0.5;
    animation4.fromValue = @0;
    animation4.toValue   = @0.75f;
    animation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation4.removedOnCompletion = NO;
    animation4.fillMode=kCAFillModeForwards;
    
    [_shape2Layer addAnimation:animation4 forKey:@"_shape2Layer_strokeEnd_1"];
    [UIView animateWithDuration:0.5 animations:^{
        _countDownImgView.alpha = 1;
    }];
    
    
}
- (void)startAnimation2 {
    _countDownImgView.alpha = 0;
    _countDownImgView.image = [UIImage imageNamed:@"countDown2"];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration  = Animationduration;
    animation.fromValue = @0.25f;
    animation.toValue   = @0.5f;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.removedOnCompletion = NO;
    animation.fillMode=kCAFillModeForwards;
    [_shape1Layer addAnimation:animation forKey:@"_shape1Layer_strokeStart_2"];
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation4.duration  = Animationduration;
    animation4.fromValue = @0.75;
    animation4.toValue   = @1;
    animation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation4.removedOnCompletion = NO;
    animation4.fillMode=kCAFillModeForwards;
    animation4.delegate = self;
    [_shape2Layer addAnimation:animation4 forKey:@"_shape2Layer_strokeEnd_2"];
    [UIView animateWithDuration:Animationduration animations:^{
        _countDownImgView.alpha = 1;
    }];
    
}

- (void)Startanimation3 {
    _countDownImgView.alpha = 0;
    _countDownImgView.image = [UIImage imageNamed:@"countDown1"];
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation3.duration  = Animationduration;
    animation3.fromValue = @0.5f;
    animation3.toValue   = @1;
    animation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation3.removedOnCompletion = NO;
    animation3.fillMode=kCAFillModeForwards;
    animation3.delegate = self;
    [_shape2Layer addAnimation:animation3 forKey:@"_shape2Layer_strokeStart_3"];
    [UIView animateWithDuration:Animationduration animations:^{
        _countDownImgView.alpha = 1;
    }];
    
}


#pragma mark - Getter
- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [[UIImageView alloc] init];
        _backImgView.frame = CGRectMake(0, 0, 125, 125);
        _backImgView.center = self.center;
        _backImgView.alpha = 1;
        _backImgView.image = [UIImage imageNamed:@"bg"];
    }
    return _backImgView;
}
- (UIImageView *)countDownImgView {
    if (!_countDownImgView) {
        _countDownImgView = [[UIImageView alloc] init];
        _countDownImgView.frame = CGRectMake(0, 0, 30, 55);
        _countDownImgView.center = self.center;
        _countDownImgView.alpha = 0;
        _countDownImgView.image = [UIImage imageNamed:@"countDown3"];
        
    }
    return _countDownImgView;
}
- (CAShapeLayer *)shape1Layer {
    if (!_shape1Layer) {
        _shape1Layer = [[CAShapeLayer alloc] init];
        _shape1Layer.strokeStart = 0.0;
        _shape1Layer.strokeEnd = 0.0;
        _shape1Layer.lineWidth = KRadius;
        _shape1Layer.path = self.path.CGPath;
        _shape1Layer.strokeColor = [UIColor hexColorWithColorString:@"#00a388"].CGColor;
        _shape1Layer.fillColor = [UIColor clearColor].CGColor;
    }
    return _shape1Layer;
}
- (CAShapeLayer *)shape2Layer {
    if (!_shape2Layer) {
        _shape2Layer = [[CAShapeLayer alloc] init];
        _shape2Layer.strokeStart = 0.0;
        _shape2Layer.strokeEnd = 0.0;
        _shape2Layer.lineWidth = KRadius;
        _shape2Layer.path = self.path.CGPath;
        _shape2Layer.strokeColor = [UIColor hexColorWithColorString:@"#79bd8f"].CGColor;
        _shape2Layer.fillColor = [UIColor clearColor].CGColor;
    }
    return _shape2Layer;
}


- (UIBezierPath *)path {
    if (!_path) {
        _path = [UIBezierPath bezierPathWithArcCenter:self.center radius:KRadius/2 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
        
    }
    return _path;
}


@end
