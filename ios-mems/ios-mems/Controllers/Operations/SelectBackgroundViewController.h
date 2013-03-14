//
//  SelectBackgroundViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "InfColorPickerController.h"

@interface SelectBackgroundViewController : BaseViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,InfColorPickerControllerDelegate>{
    UIImage *resultImage;
    UIImagePickerControllerSourceType selectedSourceType;
}
- (IBAction)selectFromCamera:(id)sender;
- (IBAction)selectFromGallery:(id)sender;

@end
