//
//  AGDatabaseImporter.h
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "CoreData+MagicalRecord.h"
#import "AGDatabaseEntitiesCommon.h"

@protocol AGDatabaseImporter <NSObject>

- (void)updateUserProfile:(NSDictionary *)parameters;

@end
