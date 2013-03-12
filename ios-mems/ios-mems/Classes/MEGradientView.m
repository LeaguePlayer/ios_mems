//
//  MEGradientView.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 12.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEGradientView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MEGradientView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawCircleAtX:(int)xx Y:(int)yy Color:(UIColor *)color{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat red;
    CGFloat blue;
    CGFloat green;
    CGFloat alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    CGFloat rib = self.bounds.size.width;
    CGRect rect = CGRectMake(xx*rib - rib, yy*rib - rib, rib*2, rib*2);
//    CGContextSetRGBFillColor(context, red, green, blue, alpha);
    CGContextFillEllipseInRect(context, rect);
    CGPoint center=CGPointMake(xx*rib,yy*rib);  // Center of gradient
    Float32 colors[8] = {red,green,blue,alpha,red,green,blue,0};
    CGGradientRef gradient=CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), colors, nil, 2);
    
    // Starting image and drawing gradient into it
//    UIGraphicsBeginImageContextWithOptions(CGSizeMake(gradientSize*2, gradientSize*2), NO, 1.f);
    CGContextDrawRadialGradient(context, gradient, center, 0, center, center.x, 0);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    int j = 0;
    for (int i = 0; i <= 1; i++)
        for (int k = 0; k <= 1; k ++){
            UIColor *color = [self.colors objectAtIndex:j];
            [self drawCircleAtX:i Y:k Color:color];
            j++;
        }
}


@end
