//
//  MECategoryItem.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 30.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import <SSToolkit/SSCollectionViewItem.h>

@interface MECategoryItem : SSCollectionViewItem

@property (nonatomic, retain) UILabel *titleLbl;
@property (nonatomic, retain) UIImageView *iconView;

-(id)initWithReuseIdentifier:(NSString *)aIdentifier;

@end
