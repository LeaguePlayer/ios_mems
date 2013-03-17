//
//  DraggableImageView.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 17.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DraggableImageView;

@protocol DraggableDelegate
-(void) touchDown;
-(void) touchUp;
-(BOOL) isInsideDestinationView:(DraggableImageView *)image touching:(BOOL)finished;
-(void) touchEndedInRightWay:(DraggableImageView *)image;
@end

@interface DraggableImageView : UIImageView{
    CGPoint _originalOutsidePosition;
    BOOL isInScrollview;
}

@property (nonatomic,retain) UIView *mainView;
@property (nonatomic,retain) UIScrollView *scrollParent;
@property (nonatomic,retain) UIScrollView *destView;
@property (nonatomic) CGPoint originalPosition;
@property (nonatomic,retain) id<DraggableDelegate> delegate;

@end