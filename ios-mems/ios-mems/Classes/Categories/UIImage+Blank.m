//
//  UIImage+Blank.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "UIImage+Blank.h"

@implementation UIImage (Blank)

+ (UIImage*)blankImage:(CGSize)_size {
    return [self blankImage:_size withColor:[UIColor whiteColor]];
}

+ (UIImage*)blankImage:(CGSize)_size withColor:(UIColor*)_color {
    UIGraphicsBeginImageContext(_size);
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, _color.CGColor);
    CGContextFillRect(context, CGRectMake(0.0, 0.0, _size.width, _size.height));
    UIImage* outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return outputImage;
}

@end
