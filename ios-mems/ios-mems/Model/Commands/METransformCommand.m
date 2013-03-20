//
//  MEResizeCommand.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 18.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "METransformCommand.h"

@implementation METransformCommand

-(id)initWithView:(UIView *)view andScale:(CGAffineTransform)transform{
    self = [super initWithView:view];
    if (self){
        self.transform = transform;
    }
    return self;
}

-(void)undo{
    self.view.transform = self.transform;
}

@end
