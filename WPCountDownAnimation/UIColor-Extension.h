//
//  ColorUtils.h
//  XIXIN
//
//  Created by mac_ming on 14-4-14.
//  Copyright (c) 2014年 ciwang. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor *)colorWithRGBRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)colorWithNumber:(NSUInteger)number;
+ (UIColor*)hexColorWithColorString:(NSString*)colorString;
@end