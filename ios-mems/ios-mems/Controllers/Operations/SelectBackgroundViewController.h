//
//  SelectBackgroundViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "InfColorPickerController.h"
#import "CropImageViewController.h"

@interface SelectBackgroundViewController : BaseViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate,InfColorPickerControllerDelegate>{
    UIImage *resultImage;
    UIImagePickerControllerSourceType selectedSourceType;
    UIColor *resultColor;
    BOOL crop;
}
- (IBAction)selectFromCamera:(id)sender;
- (IBAction)selectFromGallery:(id)sender;
- (IBAction)cropImage:(id)sender;

@end
