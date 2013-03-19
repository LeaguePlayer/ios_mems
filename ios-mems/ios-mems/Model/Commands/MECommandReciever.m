//
//  MECommandReciever.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 19.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MECommandReciever.h"

@implementation MECommandReciever

-(id)init{
    self = [super init];
    if (self){
        list = [NSMutableArray array];
        current = -1;
    }
    return self;
}

-(void)undo{
    if (list.count == 0) return;
    MECommand *command = [list objectAtIndex:current--];
    [command undo];
    [list removeObject:command];
}

-(void)pushCommand:(MECommand *)command{
    [list addObject:command];
    current++;
}

@end
