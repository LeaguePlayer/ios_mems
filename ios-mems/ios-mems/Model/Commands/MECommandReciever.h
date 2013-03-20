//
//  MECommandReciever.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MECommand.h"
#import "MEMoveCommand.h"
#import "METransformCommand.h"
#import "MEAddCommand.h"
#import "MERemoveCommand.h"

@interface MECommandReciever : NSObject{
    NSMutableArray *list;
    int current;
}

-(void)pushCommand:(MECommand *)command;
-(void)undo;

@end
