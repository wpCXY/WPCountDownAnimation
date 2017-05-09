//
//  ColorUtils.m
//  XIXIN
//
//  Created by mac_ming on 14-4-14.
//  Copyright (c) 2014年 ciwang. All rights reserved.
//

#import "UIColor-Extension.h"
@implementation UIColor (Extension)
+ (UIColor *)colorWithRGBRed:(CGFloat)red green:(CGFloat)green  blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}

+ (UIColor*)colorWithNumber:(NSUInteger)number
{
    NSUInteger red = (number >> 16) & 0xff, green = (number >> 8) & 0xff, blue = number & 0xff;
    return [UIColor colorWithRed:(float)red / 255
                           green:(float)green / 255
                            blue:(float)blue / 255
                           alpha:1];
}

+ (UIColor*)hexColorWithColorString:(NSString*)colorString
{
    if (!colorString || colorString.length <= 0)
    {
        return nil;
    }
    unsigned int r,g,b;
    
    if (colorString.length == 7)
    {
        NSRange rRange = {1,2};
        NSRange gRange = {3,2};
        NSRange bRange = {5,2};
        
        NSString *rString = [colorString substringWithRange:rRange];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        
        NSString *gString = [colorString substringWithRange:gRange];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];

        NSString *bString = [colorString substringWithRange:bRange];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
    }
    return [UIColor colorWithRGBRed:r green:g blue:b];
}
@end
