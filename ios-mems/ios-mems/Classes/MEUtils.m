//
//  MEUtils.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 24.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "MEUtils.h"

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

@end
