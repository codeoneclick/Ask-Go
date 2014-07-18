//
//  AGDatabaseFacade.h
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGDatabaseAccessor.h"
#import "AGDatabaseImporter.h"

@interface AGDatabaseFacade : NSObject<AGDatabaseAccessor, AGDatabaseImporter>

+ (instancetype)sharedInstance;

@end
