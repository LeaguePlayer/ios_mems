//
//  MEMoveCommand.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 18.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MECommand.h"

@interface MEMoveCommand : MECommand

@property (nonatomic) CGPoint point;

-(id)initWithView:(UIView *)view andPoint:(CGPoint)point;

@end
