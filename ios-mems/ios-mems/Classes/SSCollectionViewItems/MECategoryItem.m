//
//  MECategoryItem.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 30.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "MECategoryItem.h"

@implementation MECategoryItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)initWithReuseIdentifier:(NSString *)aIdentifier{
    if ((self = [super initWithStyle:SSCollectionViewItemStyleBlank reuseIdentifier:aIdentifier])){
        [self.imageView setBackgroundColor:[UIColor clearColor]];
        [self setBackgroundColor:[UIColor clearColor]];
        self.imageView = nil;
        self.titleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 82, 95, 16)];
        [self.titleLbl setBackgroundColor:[UIColor clearColor]];
        [self.titleLbl setTextAlignment:NSTextAlignmentCenter];
        [self.titleLbl setFont:[UIFont systemFontOfSize:16]];
        [self.titleLbl setAdjustsFontSizeToFitWidth:YES];
        [self addSubview:self.titleLbl];
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 80, 80)];
        [self.iconView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.iconView];
    }
    return self;
}

@end
