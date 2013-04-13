//
//  MEUtils.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 24.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MEUtils : NSObject

+(id)transformedValue:(id)value;
+(id)reverseTransformedValue:(id)value;
+(void)saveImageToGallery:(UIImage *)image;
+(UIImage *)imageFromView:(UIView *)view;
@end
