//
//  WPCountDownView.h
//  NewsPaper
//
//  Created by 王鹏 on 2017/3/30.
//  Copyright © 2017年 ciwong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CountDownComplete)();

@interface WPCountDownView : UIView

/**
 开始倒计时动画

 @param view 动画View父视图
 */
+ (void)startCountDownAnimationInView:(UIView *)view complete:(CountDownComplete)complete;

@end
