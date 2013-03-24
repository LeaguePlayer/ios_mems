//
//  MEMem.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 10.03.13.
//  Copyright (c) 2013 Салахутдинов Данияр. All rights reserved.
//

#import "MEMem.h"

@implementation MEMem

-(id)init{
    self = [super init];
    if (self){
        self.id = 0;
        self.fileName = @"";
    }
    return self;
}

-(id)initWithName:(NSString *)fileName id:(int)id{
    self = [self init];
    if (self){
        self.id = id;
        self.fileName = fileName;
    }
    return self;
}

+(id)memFromManagedOne:(FavouriteMem *)mem{
    MEMem *item = [[MEMem alloc] initWithName:mem.fileName id:mem.id.intValue];
    return item;
}

@end
