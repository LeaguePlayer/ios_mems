//
//  MERemoveCommand.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MECommand.h"

@interface MERemoveCommand : MECommand

@property (nonatomic,retain) UIView *superView;

-(id)initWithView:(UIView *)view andSuperView:(UIView *)superView;

@end
