//
//  CropImageViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 01.04.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "BaseViewController.h"

@interface CropImageViewController : BaseViewController{
    CGPoint startPoint;
    UIView *frame;
    UIImage *resultImage;
}

@property (nonatomic,retain) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
