//
//  MERemoveCommand.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MERemoveCommand.h"

@implementation MERemoveCommand

-(id)initWithView:(UIView *)view andSuperView:(UIView *)superView{
    self = [super initWithView:view];
    if (self){
        self.superView = superView;
    }
    return self;
}

-(void)undo{
    [self.superView addSubview:self.view];
}

@end
