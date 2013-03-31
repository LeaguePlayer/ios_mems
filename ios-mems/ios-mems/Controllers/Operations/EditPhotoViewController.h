//
//  EditPhotoViewController.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 13.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "BaseViewController.h"
#import "DraggableImageView.h"
#import "MECommandReciever.h"
#import "AddTextViewController.h"

@interface EditPhotoViewController : BaseViewController <UIActionSheetDelegate, UIGestureRecognizerDelegate,DraggableDelegate,MEAddTextDelegate,UIPickerViewDataSource,UIPickerViewDelegate>{
    UIActionSheet *actionSheet;
    CGFloat firstX, firstY;
    NSMutableArray *images;
    MECommandReciever *undator;
    CGAffineTransform transform;
    CGPoint point;
    BOOL started;
    MECommand *command;
    NSArray *categories;
    int selectedPickerItem;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic) int selectedCategory;
@property (nonatomic, retain) UIView *currentView;
@property (nonatomic,retain) UIImage *image;
@property (weak, nonatomic) IBOutlet UIView *scroll;
@property (weak, nonatomic) IBOutlet UIView *pickerView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *itemsScroll;
@property (weak, nonatomic) IBOutlet UIPickerView *categoryPicker;
@property (weak, nonatomic) IBOutlet UIImageView *botomView;
@property (weak, nonatomic) IBOutlet UIView *topView;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)deleteControl:(id)sender;
- (IBAction)undo:(id)sender;
- (IBAction)addText:(id)sender;
- (IBAction)selectCategory:(id)sender;
- (IBAction)categorySelected:(UITapGestureRecognizer *)sender;
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@end
