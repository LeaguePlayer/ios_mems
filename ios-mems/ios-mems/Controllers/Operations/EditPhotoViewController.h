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

@interface EditPhotoViewController : BaseViewController <UIActionSheetDelegate, UIGestureRecognizerDelegate,DraggableDelegate>{
    UIActionSheet *actionSheet;
    CGFloat firstX, firstY;
    UIView *currentView;
    MECommandReciever *undator;
    CGAffineTransform transform;
    CGPoint point;
    BOOL started;
    MECommand *command;
}

@property (nonatomic,retain) UIImage *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *itemsScroll;
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer;
- (IBAction)deleteControl:(id)sender;
- (IBAction)undo:(id)sender;
- (IBAction)addText:(id)sender;

- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer;
@end
