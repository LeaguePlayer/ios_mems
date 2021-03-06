//
//  MEUtils.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 24.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "MEUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation MEUtils

//перевод UIIamge в NSData
+(id)transformedValue:(id)value
{
    if (value == nil)
        return nil;
    
    // I pass in raw data when generating the image, save that directly to the database
    if ([value isKindOfClass:[NSData class]])
        return value;
    return UIImagePNGRepresentation((UIImage *)value);
}

//перевод NSData в UIImage
+(id)reverseTransformedValue:(id)value
{
    return [UIImage imageWithData:(NSData *)value];
}

+(void)saveImageToGallery:(UIImage *)image{
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
}

+(UIImage *)imageFromView:(UIView *)view {
    UIView *captureView = view;
    /* Capture the screen shoot at native resolution */
    UIGraphicsBeginImageContextWithOptions(captureView.bounds.size, captureView.opaque, 8.0);
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
//    /* Render the screen shot at custom resolution */
//    CGRect cropRect = CGRectMake(0 ,0 ,captureView.frame.size.width,captureView.frame.size.height);
//    UIGraphicsBeginImageContextWithOptions(cropRect.size, captureView.opaque, 0.0f);
//    [screenshot drawInRect:cropRect];
//    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    return screenshot;
}

+(UIImage *)imageFromView:(UIView *)view inRect:(CGRect)rect{
    UIGraphicsBeginImageContextWithOptions(rect.size, view.opaque, 8.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, -rect.origin.x, -rect.origin.y);
    [view.layer renderInContext:ctx];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}

@end
