//
//  SelectCatViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 28.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "BaseViewController.h"
#import "MEMemCategory.h"

@protocol SelectCategoryDelegate <NSObject>

@optional

-(void)categorySelected:(MEMemCategory *)category;

@end

@interface SelectCatViewController : BaseViewController <UIPickerViewDataSource,UIPickerViewDelegate>{
    NSArray *categories;
    MEMemCategory *selectedCategory;
}
@property (nonatomic,retain) id delegate;
-(IBAction)tapRecognized:(id)sender;

@end
