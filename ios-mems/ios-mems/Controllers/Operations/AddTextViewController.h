//
//  AddTextViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "InfColorPickerController.h"

@class AddTextViewController;

@protocol MEAddTextDelegate <NSObject>

-(void)addTextPropertiesSelectedInController:(AddTextViewController *)controller;

@end

@interface AddTextViewController : BaseViewController <InfColorPickerControllerDelegate,UITextFieldDelegate>

@property (nonatomic,retain) id<MEAddTextDelegate> delegate;
@property (nonatomic,retain) UIColor *color;
@property (nonatomic) CGFloat size;
@property (nonatomic,retain) NSString *text;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *fontSize;
@property (weak, nonatomic) IBOutlet UIButton *selectColorButton;
- (IBAction)selectColor:(id)sender;
- (IBAction)selectProperties:(id)sender;
- (IBAction)discardView:(id)sender;


@end
