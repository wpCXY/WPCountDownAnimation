//
//  UIView+WPCategory.m
//  NewsPaper
//
//  Created by Michael_Ju on 16/4/5.
//  Copyright © 2016年 ciwong. All rights reserved.
//

#import "UIView+WPCategory.h"

@implementation UIView (WPCategory)

-(void)setX:(CGFloat)x
{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
    
}
-(CGFloat)x
{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y
{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
-(CGFloat)y
{
    return self.frame.origin.y;
}

-(void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

-(CGFloat)width
{
    return self.frame.size.width;
}
-(void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}
-(CGFloat)height
{
    return self.frame.size.height;
}

-(void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY
{
    return self.center.y;
}

-(void)setMaxX:(CGFloat)maxX
{
    CGRect frame = self.frame;
    frame.origin.x = maxX - frame.size.width;
    self.frame = frame;
}
-(CGFloat)maxX
{
    return self.frame.origin.x + self.frame.size.width;
}

-(void)setMaxY:(CGFloat)maxY
{
    CGRect frame = self.frame;
    frame.origin.y = maxY - self.frame.size.height;
    self.frame = frame;
}

-(CGFloat)maxY
{
    return self.frame.origin.y + self.frame.size.height;
}
@end
