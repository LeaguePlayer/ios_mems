//
//  UIImage+Blank.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Blank)

typedef enum {
    MGImageResizeCrop,	// analogous to UIViewContentModeScaleAspectFill, i.e. "best fit" with no space around.
    MGImageResizeCropStart,
    MGImageResizeCropEnd,
    MGImageResizeScale	// analogous to UIViewContentModeScaleAspectFit, i.e. scale down to fit, leaving space around if necessary.
} MGImageResizingMethod;

- (UIImage *)imageToFitSize:(CGSize)size method:(MGImageResizingMethod)resizeMethod;
- (UIImage *)imageCroppedToFitSize:(CGSize)size; // uses MGImageResizeCrop
- (UIImage *)imageScaledToFitSize:(CGSize)size; // uses MGImageResizeScale

+ (UIImage*)blankImage:(CGSize)_size;
+ (UIImage*)blankImage:(CGSize)_size withColor:(UIColor*)_color;
<<<<<<< HEAD
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
=======
+ (UIImage*)screenShotView:(UIView*)view;

>>>>>>> 746f7c13dc9742072820ada71a5cb18a7d434c43
@end
