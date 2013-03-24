//
//  FavouriteMem.m
//  ios-mems
//
//  Created by Салахутдинов Данияр on 24.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import "FavouriteMem.h"
#import "MEUtils.h"
#import "MEMem.h"

@implementation FavouriteMem

@dynamic id;
@dynamic fileName;
@dynamic isFavourite;
@dynamic isRecent;

@end

@implementation FavouriteMem (Map)

-(void)removeFromFavourites{
    [self MR_deleteEntity];
    [CurrentContext MR_saveWithOptions:MRSaveSynchronously completion:nil];
}

+(void)createFromMem:(MEMem *)mem withType:(FavouriteMemType)type{
    FavouriteMem *fmem = [FavouriteMem MR_createInContext:CurrentContext];
    fmem.id = @(mem.id);
    fmem.fileName = mem.fileName;
    fmem.isRecent = @(type == FavouriteMemTypeRecent);
    fmem.isFavourite = @(type == FavouriteMemTypeFavourite);
    [CurrentContext MR_saveWithOptions:MRSaveSynchronously completion:nil];
}

+(NSArray *)favouriteMems{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"isFavourite" withValue:@(YES)];
    return mems;
}

+(NSArray *)recentMems{
    NSArray *mems = [FavouriteMem MR_findByAttribute:@"isRecent" withValue:@(YES)];
    return mems;
}

@end