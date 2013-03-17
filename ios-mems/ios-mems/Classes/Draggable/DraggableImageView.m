//
//  DraggableImageView.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 17.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "DraggableImageView.h"

@implementation DraggableImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)itemMoved:(UIPanGestureRecognizer *)sender{
    
}

#pragma mark - DRAG AND DROP

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.delegate touchDown];
    self.originalPosition = self.center;
    self.scrollParent.scrollEnabled = NO;
    
    CGPoint newLoc = CGPointZero;
    newLoc = [self.scrollParent convertPoint:self.center toView:self.mainView];
    _originalOutsidePosition = newLoc;
    
    //		[self.superview touchesCancelled:touches withEvent:event];
    [self removeFromSuperview];
    
    self.center = newLoc;
    [self.mainView addSubview:self];
    [self.mainView bringSubviewToFront:self];
    isInScrollview = NO;
    
}


-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
	[UIView beginAnimations:@"stalk" context:nil];
	[UIView setAnimationDuration:.001];
	[UIView setAnimationBeginsFromCurrentState:YES];
    
	UITouch *touch = [touches anyObject];
	self.center = [touch locationInView: self.superview];
    
	[UIView commitAnimations];
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if ([self.delegate isInsideDestinationView:self touching:YES]){
        //тут добавляем на главный скролвью
        [self.delegate touchEndedInRightWay:self];
        [self removeFromSuperview];
        self.center = self.originalPosition;
        [self.scrollParent addSubview:self];
    } else{
        [UIView beginAnimations:@"goback" context:nil];
        [UIView setAnimationDuration:0.4f];
        [UIView setAnimationBeginsFromCurrentState:YES];
        self.center = _originalOutsidePosition;
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector: @selector(animationDidStop:finished:context:)];
        //        loadingView.frame = CGRectMake(rect.origin.x, rect.origin.y - 80, rect.size.width, rect.size.height);
        
        [UIView commitAnimations];
        
    }
    self.scrollParent.scrollEnabled = YES;
    [self.delegate touchUp];
    
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    if ([animationID isEqualToString:@"goback"] && finished) {
        [self removeFromSuperview];
        self.center = _originalPosition;
        [self.scrollParent addSubview:self];
        isInScrollview = YES;
    }
}

@end
