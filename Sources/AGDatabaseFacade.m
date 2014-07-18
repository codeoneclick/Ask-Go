//
//  AGDatabaseFacade.m
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGDatabaseFacade.h"

@implementation AGDatabaseFacade

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if(self != nil)
    {
        [MagicalRecord setupCoreDataStackWithStoreNamed:@"AGDatabase.sqlite"];
    }
    return self;
}

- (NSDictionary *)retriveUserProfile:(NSDictionary *)parameters;
{
    NSString *fbId = [parameters objectForKey:@"fbId"];
    AGEntityProfile *profile = [AGEntityProfile MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"fbId == %@", fbId]
                                                                inContext:[NSManagedObjectContext MR_defaultContext]];
    return [profile convertToDTO];
}

- (void)updateUserProfile:(NSDictionary *)parameters;
{
    NSString *fbId = [parameters objectForKey:@"fbId"];
    AGEntityProfile *profile = [AGEntityProfile MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"fbId == %@", fbId]
                                                                inContext:[NSManagedObjectContext MR_defaultContext]];
    if(profile == nil)
    {
        profile = [AGEntityProfile MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    [profile convertFromDTO:parameters];
}

@end
