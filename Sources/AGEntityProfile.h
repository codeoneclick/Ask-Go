//
//  AGEntityProfile.h
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AGEntityProfile : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * secondName;
@property (nonatomic, retain) NSString * fbId;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * birthday;
@property (nonatomic, retain) NSString * location;

@end
