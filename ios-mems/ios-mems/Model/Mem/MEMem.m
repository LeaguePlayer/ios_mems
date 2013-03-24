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

-(BOOL)isFavourite{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"id" withValue:@(self.id)];
    BOOL having = NO;
    for (FavouriteMem *mem in mems){
        if (mem.isFavourite.boolValue){
            having = YES;
            break;
        }
    }
    return having;
}

-(BOOL)isRecent{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"id" withValue:@(self.id)];
    BOOL having = NO;
    for (FavouriteMem *mem in mems){
        if (mem.isRecent.boolValue){
            having = YES;
            break;
        }
    }
    return having;
}

-(void)addToFavourites{
    [FavouriteMem createFromMem:self withType:FavouriteMemTypeFavourite];
}

-(void)removeFromFavourites{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"id" withValue:@(self.id)];
    for (FavouriteMem *mem in mems){
        if (mem.isFavourite)
            [mem removeFromFavourites];
    }
}

-(void)addToRecent{
    [FavouriteMem createFromMem:self withType:FavouriteMemTypeRecent];
}

-(void)removeFromRecent{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"id" withValue:@(self.id)];
    for (FavouriteMem *mem in mems){
        if (mem.isRecent)
            [mem removeFromFavourites];
    }
}

@end
