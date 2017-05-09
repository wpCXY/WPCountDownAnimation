//
//  UIView+WPCategory.h
//  NewsPaper
//
//  Created by Michael_Ju on 16/4/5.
//  Copyright © 2016年 ciwong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREENBOUNDS ([UIScreen mainScreen].bounds)
///屏幕的高度
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)
///屏幕的宽度
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
///屏幕的scale
#define SCREENSCALE  ([UIScreen mainScreen].scale)

@interface UIView (WPCategory)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat maxX;
@property (nonatomic, assign) CGFloat maxY;

@end
