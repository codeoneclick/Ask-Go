//
//  AGEntityProfile_DTO.h
//  Ask&Go
//
//  Created by sergey.sergeev on 7/18/14.
//  Copyright (c) 2014 sergey.sergeev. All rights reserved.
//

#import "AGEntityProfile.h"

@interface AGEntityProfile (DTO)

- (NSDictionary *)convertToDTO;
- (AGEntityProfile *)convertFromDTO:(NSDictionary *)parameters;

@end
