//
//  FavouriteMem.h
//  ios-mems
//
//  Created by Салахутдинов Данияр on 24.03.13.
//  Copyright (c) 2013 –°–∞–ª–∞—Ö—É—Ç–¥–∏–Ω–æ–≤ –î–∞–Ω–∏—è—Ä. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MEMem;

@interface FavouriteMem : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString *fileName;
@property (nonatomic, retain) NSNumber *isFavourite;
@property (nonatomic, retain) NSNumber *isRecent;

@end

typedef enum {
    FavouriteMemTypeFavourite,
    FavouriteMemTypeRecent
}FavouriteMemType;

@interface FavouriteMem (Map)

-(void)removeFromFavourites;
+(void)createFromMem:(MEMem *)mem withType:(FavouriteMemType)type;
+(NSArray *)favouriteMems;
+(NSArray *)recentMems;

@end