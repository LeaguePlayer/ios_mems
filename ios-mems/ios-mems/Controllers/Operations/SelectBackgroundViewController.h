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
<<<<<<< HEAD
    
=======
    UIImagePickerControllerSourceType selectedSourceType;
>>>>>>> c4a8793007d4d2c32adc258acd050fe5dc20cc5a
}
- (IBAction)selectFromCamera:(id)sender;
- (IBAction)selectFromGallery:(id)sender;

@end
