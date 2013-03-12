//
//  ColorPickerViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "MEGradientView.h"

@interface ColorPickerViewController : BaseViewController
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *colors;
- (IBAction)chooseColor:(id)sender;
@property (weak, nonatomic) IBOutlet MEGradientView *display;

@end
