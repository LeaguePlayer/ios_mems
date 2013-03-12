//
//  SelectBackgroundViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"

@interface SelectBackgroundViewController : BaseViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)selectFromCamera:(id)sender;
- (IBAction)selectFromGallery:(id)sender;

@end
