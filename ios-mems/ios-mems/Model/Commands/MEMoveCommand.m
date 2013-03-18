//
//  MEMoveCommand.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 18.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEMoveCommand.h"

@implementation MEMoveCommand

-(id)initWithView:(UIView *)view andPoint:(CGPoint)point{
    self = [self initWithView:view];
    if (self){
        self.point = point;
    }
    return self;
}

-(void)undo{
    self.view.center = self.point;
}

@end
