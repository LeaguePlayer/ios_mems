//
//  EditPhotoViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"

@interface EditPhotoViewController : BaseViewController <UIActionSheetDelegate>{
    UIActionSheet *actionSheet;
}

@property (nonatomic,retain) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *itemsScroll;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *items;

@end
