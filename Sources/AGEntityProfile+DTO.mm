//
//  AGEntityProfile_DTO.h
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGEntityProfile+DTO.h"

@implementation AGEntityProfile (DTO)

- (NSDictionary *)convertToDTO;
{
    NSArray *keys = [[[self entity] attributesByName] allKeys];
    return [self dictionaryWithValuesForKeys:keys];
}

- (AGEntityProfile *)convertFromDTO:(NSDictionary *)parameters;
{
    self.fbId = [parameters objectForKey:@"fbId"] != nil ? [parameters objectForKey:@"fbId"] : self.fbId;
    self.firstName = [parameters objectForKey:@"firstName"] != nil ? [parameters objectForKey:@"firstName"] : self.firstName;
    self.secondName = [parameters objectForKey:@"secondName"] != nil ? [parameters objectForKey:@"secondName"] : self.secondName;
    self.gender = [parameters objectForKey:@"gender"] != nil ? [parameters objectForKey:@"gender"] : self.gender;
    self.birthday = [parameters objectForKey:@"birthday"] != nil ? [parameters objectForKey:@"birthday"] : self.birthday;
    self.location = [parameters objectForKey:@"location"] != nil ? [parameters objectForKey:@"location"] : self.location;
    return self;
}

@end
